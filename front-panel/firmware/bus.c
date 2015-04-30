#include "hwcompat.h"
#include "input.h"
#include "output.h"
#include "proto.h"
#include "abstract.h"
#include "bus.h"
#include "utils.h"

#ifdef AVR
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif

#define NUM_SAMPLES 128


//bus_state_t bus_state;

static uint16_t _hi = 0;
#ifdef AVR
extern uint8_t _defercb;
#endif // AVR

uint8_t
buschatter()
{
#ifdef HOST
	//printf("*** Host mode, bus chatter test always succeeds.\n");
	return 0;
#endif // HOST

	// Account for bus hold AND pull-ups using an initial sample.
	deb_sample(1);
	uint16_t ab = get_ab();
	uint16_t db = get_db();
	uint8_t i;
	for (i = 0; i < NUM_SAMPLES; i++) {
		deb_sample(1);
		if (get_ab() != ab) return 1;
		if (get_db() != db) return 1;
		short_delay();
	}
	return 0;
}


uint8_t
assert_halted()
{
	// Ensure it's stopped.
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_RUNNING));
		flags |= FL_ERROR;
		return 0;
	} else {
		// The ustep command leaves the processor with its clock
		// stopped but NOT halted (so the microcode vectors can be
		// examined). The FL_HALT flag is still set though, so whenever
		// we're in FL_HALT mode and a command needs the processor to
		// be halted by calling us, we halt it here. The clock should
		// be stopped already, so no need to wait for a full
		// halt. We're just tristating the control lines.
#ifdef AVR
		_defercb = 0;	// Force NHALT#.
#endif // AVR
		set_halt(1);
	}
	
	// Check for bus chatter.
	if (buschatter()) {
		report_pstr(PSTR(STR_CHATTER));
		flags |= FL_ERROR;
		return 0;
	}

	return 1;
}


// Read cycle.
// ____
// HALT   _________________________________ (already driven low)
//
// AB     ZZZ<--------- VALID --------->ZZZ
// ___ __ ______                     ______
// MEM/IO       \___________________/
// _      _________               _________
// R               \_____________/
//
// DB     XXXXXXXXXXXX<---- VALID ---->XXXX
// ___    _________________   _____________
// RAC                     \_/
//
// Sample data here           ^^^
// Read data from shift registers here  ^^^
//
// We do not obey Wait State requests. We read the bus using shift registers at
// 14 MHz, so even if one read took two MCU clocks (it takes a bit longer than
// that), reading the DBUS registers would take around 10 µs (the minimum hold
// time).
//
// Reading into the AC works because asserting either MEM# or IO# and R# causes
// the bus driver on the processor to connect the IBUS and DBUS for
// reading. This combinatorial circuit does not get defeated when the processor
// is halted, which is technically a bug. If we were to do this properly, we'd
// have to drive the IBUS with the appropriate value ourselves after the end of
// the DBUS cycle. For now, we rely on this bug.

uint16_t
perform_read(uint8_t space, uint16_t addr)
{
	uint16_t val = 0;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		
		// Perform a cycle
		write_ab(addr);
		drive_ab();
		space == SPACE_MEM ? set_mem(1) : set_io(1);
		set_r(1);

		// Setup delay
		setup();
		
		// Sample.
		deb_sample(1);
		val = get_db();
		strobe_wac();		// Also put it in the AC.
		
		hold();

		// Release the bus
		set_r(0);
		space == SPACE_MEM ? set_mem(0) : set_io(0);
		tristate_ab();
	}

	return val;
}


// Write cycle.
// ____
// HALT   _________________________________ (already driven low)
//
// AB     ZZZ<--------- VALID --------->ZZZ
//
// DB     ZZZZZZ<------ VALID --------->ZZZ
// ___ __ ______                     ______
// MEM/IO       \___________________/
// _      __________________      _________
// W                        \____/
//
// We do not obey Wait State requests. The pulses are so wide it shouldn't be a
// problem (we're likely the slowest device on the bus, after all).

uint8_t
perform_write(uint8_t space, uint16_t addr, uint16_t word)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// De-assert every control signal just in case.
	release_bus();

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		// Perform a cycle
		write_ab(addr);
		write_db(word);
		drive_ab();
		space == SPACE_MEM ? set_mem(1) : set_io(1);
		drive_db();
		
		// Setup delay
		//setup();
		
		// Strobe.
		strobe_w();
		
		//hold();
		
		// Release the bus
		//space == SPACE_MEM ? set_mem(0) : set_io(0);
		//tristate_db();
		//tristate_ab();

		// De-assert every control signal just in case.
		release_bus();
	}

	return 1;
}



// CAUTION: NO SAFETY MEASURES! ENSURE THE HOST IS HALTED, THE BUS IS
// QUIET AND THE ENTIRE BUS CYCLE IS EXECUTING ATOMICALLY (WITH
// INTERRUPTS DISABLED).

void
start_block_write(uint8_t space)
{
	// De-assert every control signal just in case.
	release_bus();
	
	// Select address space and drive the buses, AB first. This is
	// a slow process (purposefully).
	drive_ab();
	if (space == SPACE_MEM) set_mem(1); else set_io(1);
}

void
perform_block_write(uint16_t addr, uint16_t word)
{
	// One MCU clock is 67 ns. Assuming two clocks between signals (it's
	// far more, we have loops to shift out values to the shift registers),
	// we can satisfy all setup/hold requirements for memory without
	// further delays. Some I/O chips are slower (e.g. the AY-3-8910 needs
	// 1µs bus cycles, but block writes are usually not for that sort of
	// device).

	write_ab(addr);
	write_db(word);

	// Strobe W#
	drive_db();
	strobe_w();
	tristate_db();
}

void
end_block_write(uint8_t space)
{
	// Release the bus
	if (space == SPACE_MEM) {
		set_mem(0);
	} else {
		set_io(0);
	}
	tristate_db();
	tristate_ab();

	// Release the bus (tristate everything, de-assert control signals)
	release_bus();
}


uint16_t
perform_block_read(uint16_t base, int16_t n, uint16_t * buf)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		while (n--) {
			// Perform a cycle
			write_ab(base);
			base++;
			drive_ab();
			set_mem(1);
			set_r(1);
			
			setup();
			
			// Sample.
			deb_sample(1);
			*buf++ = get_db();
			
			// Release the bus
			set_r(0);
			set_mem(0);
			
			// Hold delay
			hold();
			
			tristate_ab();
			
			// Wait a little
			short_delay();
		}
	}
	
	return 1;
}


uint8_t
set_reg(uint8_t reg, uint16_t value)
{
	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	// Stop the clock.
	clk_stop();

	// Even with the processor halted, some control signals are
	// bus-held. Explicitly drive MEM#, IO#, R#, and WEN# high.

	write_ibus(value);
	drive_ibus();
	setup();
	switch (reg) {
	case REG_IR:
		strobe_wir();
		break;
	case REG_AC:
		strobe_wac();
		break;
	case REG_PCAR:
		//strobe_war();
		// Purposefully falling through
	case REG_PC:
		strobe_wpc();
		break;
	}
	hold();
	tristate_ibus();

	// Sample the bus after setting the reg. This can be used to
	// verify a correct write.
	virtual_panel_sample(0);

	return 1;
}


// void
// buscmd_enef(uint16_t val)
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


// void
// buscmd_disef(uint16_t val)
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


// void
// buscmd_qef()
// {
// 	report_pstr(PSTR(STR_NIMPL));
// }


void
buscmd_print(char op, uint16_t val)
{
	// If this is an unprintable character and we're not on the
	// console, print it as a decimal ('c' opcode).
	if (op == 'C' && ((flags & FL_CONS) == 0) && (val < 33 || val > 127)) {
		op = 'c';
	}

	say_break();
	if ((flags & FL_CONS) == 0) {
		report_pstr(PSTR(STR_DEBPRN));
		report_char(op);
		report_char(32);
	}

	switch (op) {
	case 'A':
	case 'H':
		report_hex(val, 4);
		break;
	case 'B':
		report_bin(val);
		break;
	case 'C':
		report_char(val & 255);
		break;
	case 'c':
	case 'D':
		report_int(val);
		break;
	case 'U':
		report_uint(val);
		break;
	case 'L':
		report_hex(_hi, 4);
		report_hex(val, 4);
		break;
	}

	if (flags & FL_CONS) return;
	report_nl();
	proto_prompt();
}


void
buscmd_debugon()
{
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_debugoff()
{
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_dump()
{
	report_pstr(PSTR(STR_NIMPL));
}


void
buscmd_printhi(uint16_t val)
{
	_hi = val;
}


void
buscmd_success()
{
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[ok]"));
	else report_pstr(PSTR(STR_SUCCESS));
	proto_prompt();
}


void
buscmd_halt()
{
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[halt]"));
	//else report_pstr(PSTR(STR_AHALTED));
	proto_prompt();
	go_stop();
}


void
buscmd_fail()
{
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[fail]"));
	else report_pstr(PSTR(STR_FAIL));
	proto_prompt();
	if (flags & FL_HOF) go_stop();
}


void
buscmd_sentinel()
{
	say_break();
	if (flags & FL_CONS) report_pstr_in_console(PSTR("[sentinel]"));
	else report_pstr(PSTR(STR_DEBSENT));
	proto_prompt();
	if (flags & FL_HOS) go_stop();
}

// End of file.
