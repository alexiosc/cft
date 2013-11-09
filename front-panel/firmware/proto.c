// -*- indent-c -*-

#ifdef HOST
#include <stdio.h>
#include <unistd.h>
#endif // HOST

#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

#ifdef AVR
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>
#include <avr/pgmspace.h>

#endif // AVR

#include "proto.h"
#include "input.h"
#include "output.h"
#include "hwcompat.h"
#include "abstract.h"
#include "panel.h"
#include "bus.h"


#ifdef HOST
#define PROGMEM
#endif // HOST


unsigned char buf[BUFSIZE];

uint16_t buflen, bp;

uint16_t volatile flags = FL_BUSY | FL_ECHO | FL_MESG;

static uint16_t addr;


//uint8_t progress[5] = {0, 1, 3, 7, 15};


static void
done()
{
	report_pstr(PSTR(STR_DONE));
}


static void
say_version()
{
	report_pstr(PSTR(BANNER1));
}


static void
say_bufsize()
{
	report_pstr(PSTR(BANNER2));
}


void
proto_init()
{
	say_version();
	say_bufsize();
	report_pstr(PSTR(BANNER3 BANNER4 BANNER5));
	buflen = 0;
	flags = (flags & FL_HALT) | FL_ECHO | FL_MESG;
	addr = 0;
}



/* static void */
/* say_done() */
/* { */
/* 	report_pstr(PSTR(STR_DONE)); */
/* } */


void
cancel()
{
	report_pstr(PSTR("\n\n" STR_ABORT));
}


///////////////////////////////////////////////////////////////////////////////
//
// PFP INFORMATION
//
///////////////////////////////////////////////////////////////////////////////


static void
gs_echo()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) {
		if (v) {
			// Enable echo
			flags |= FL_ECHO;
		} else {
			// Disable echo
			flags &= ~FL_ECHO;
		}
	}
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSECHO), flags & FL_ECHO);
}



static void
gs_mesg()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) {
		if (v) {
			// Enable async messages
			flags |= FL_MESG;
		} else {
			// Disable async messages
			flags &= ~FL_MESG;
		}
	}
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSMESG), flags & FL_MESG);
}



///////////////////////////////////////////////////////////////////////////////
//
// LEFT SWITCH BANK
//
///////////////////////////////////////////////////////////////////////////////

void
go_reset(){
#ifdef HOST
	printf("*** TODO: reset the system the PFP way.\n");
#endif
	// This also changes the GPIO pins to inputs.
//	gpio_hiz();
//	setreset(1);
//	sethalt(0);
//	setreset(0);
	report_pstr(PSTR(STR_RESET));
}


void
go_stop(){
	if (flags & FL_HALT) {
		report_pstr(PSTR(STR_ALRHALT));
		return;
	}
	
#ifdef HOST
	printf("*** TODO: Implement halting sequence\n");
#endif
	// First, enable HALT to tristate the processor. Then, as quickly as
	// possible, force a single microstep to stop the clock at the
	// beginning of a cycle.
	set_halt(1);
	strobe_ustep();

	flags |= FL_HALT;
	report_pstr(PSTR(STR_AHALTED));
}

void
go_run(){
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_ALRRUN));
		return;
	}
	flags &= ~FL_HALT;
	// This also changes the GPIO pins to inputs.
//	sethalt(0);
	report_pstr(PSTR(STR_ARUN));
}

void
go_start()
{
	go_reset();
	go_run();
}


#ifdef DISASSEMBLE
static void
_disassemble(uint16_t w)
{
	uint8_t op = w >> 12;
	uint8_t i = w & 0x800 ? 1 : 0;
	uint8_t r = w & 0x400 ? 1 : 0;
	switch (op) {
	case 0:
		report_pstr(PSTR("TRAP  "));
		break;
	case 1:
		report_pstr(PSTR("IOT   "));
		break;
	case 2:
		report_pstr(PSTR("LOAD  "));
		break;
	case 3:
		report_pstr(PSTR("STORE "));
		break;
	case 4:
		report_pstr(PSTR("IN    "));
		break;
	case 5:
		report_pstr(PSTR("OUT   "));
		break;
	case 6:
		report_pstr(PSTR("JMP   "));
		break;
	case 7:
		report_pstr(PSTR("JSR   "));
		break;
	case 8:
		report_pstr(PSTR("ADD   "));
		break;
	case 9:
		report_pstr(PSTR("AND   "));
		break;
	case 10:
		report_pstr(PSTR("OR    "));
		break;
	case 11:
		report_pstr(PSTR("XOR   "));
		break;
	case 12:
		report_pstr(PSTR("OP1   "));
		break;
	case 13:
		if (i == 0) report_pstr(PSTR("OP2   "));
		else {
			report_pstr(PSTR("POP   "));
			i = 0;
		}
		break;
	case 14:
		report_pstr(PSTR("ISZ   "));
		break;
	case 15:
		if (i == 0) report_pstr(PSTR("LIA   "));
		else {
			report_pstr(PSTR("JMPII "));
			i = 0;
		}
		break;
	}

	report_char(i ? 'I' : ' ');
	report_char(' ');
	report_char(r ? 'R' : ' ');
	report_pstr(PSTR(" &"));
	report_hex(w & 0x3ff, 3);
}

#endif // DISASSEMBLE


static void
_machine_state()
{
	virtual_panel_sample();
	
	report_char(bus_state.vp.b.fn ? 'n' : '-');
	report_char(bus_state.vp.b.fz ? 'z' : '-');
	report_char(bus_state.vp.b.fv ? 'v' : '-');
	report_char(bus_state.vp.b.fi ? 'i' : '-');
	report_char(bus_state.vp.b.fl ? 'l' : '-');

	report_pstr(PSTR(STR_PC));
	report_hex(bus_state.vp.b.pc, 4);

	report_pstr(PSTR(STR_AC));
	report_hex(bus_state.vp.b.ac, 4);

	report_pstr(PSTR(STR_IR));
	report_hex(bus_state.vp.b.ir, 4);

#ifdef DISASSEMBLE
	report_char(' ');
	_disassemble(bus_state.vp.b.ir);
#endif // DISASSEMBLE
}


//static char * _strdis PROGMEM = "memio[ar]ALU.AGLPCDRACaddandorxorrollnotcs1cs2 <- ARIR";

static void
_ustate()
{	
	if (bus_state.vp.b.r) {
		if (bus_state.vp.b.mem) report_pstr(PSTR("mem"));
		else if (bus_state.vp.b.io) report_pstr(PSTR("io"));
		report_pstr(PSTR("[ar]"));
	} else {
		if (bus_state.vp.b.runit & 8) report_pstr(PSTR("ALU."));
		
		switch (bus_state.vp.b.runit) {
		case 2:
			report_pstr(PSTR("AGL"));
			break;
		case 3:
			report_pstr(PSTR("PC"));
			break;
		case 4:
			report_pstr(PSTR("DR"));
			break;
		case 5:
			report_pstr(PSTR("AC"));
			break;
		case 8:
			report_pstr(PSTR("add"));
			break;
		case 9:
			report_pstr(PSTR("and"));
			break;
		case 10:
			report_pstr(PSTR("or"));
			break;
		case 11:
			report_pstr(PSTR("xor"));
			break;
		case 12:
			report_pstr(PSTR("roll"));
			break;
		case 13:
			report_pstr(PSTR("not"));
			break;
		case 14:
			report_pstr(PSTR("cs1"));
			break;
		case 15:
			report_pstr(PSTR("cs2"));
			break;
		}
	}

	report_pstr(PSTR(" <- "));

	if (bus_state.vp.b.wen) {
		if (bus_state.vp.b.mem) report_pstr(PSTR("mem"));
		else if (bus_state.vp.b.mem) report_pstr(PSTR("io"));
		report_pstr(PSTR("[ar]"));
	} else {
		switch (bus_state.vp.b.wunit) {
		case 2:
			report_pstr(PSTR("AR"));
			break;
		case 3:
			report_pstr(PSTR("PC"));
			break;
		case 4:
			report_pstr(PSTR("IR"));
			break;
		case 5:
			report_pstr(PSTR("DR"));
			break;
		case 6:
			report_pstr(PSTR("AC"));
			break;
		case 7:
			report_pstr(PSTR("ALU.b"));
			break;
		}
	}

	if (bus_state.vp.b.opif) report_pstr(PSTR(" if"));

	if (bus_state.vp.b.opif > 0 && bus_state.vp.b.opif <= 7) {
		report_pstr(PSTR("-IR"));
		report_char('2' + bus_state.vp.b.opif);
	} else {
		switch (bus_state.vp.b.opif) {
		case 10:
			report_char('v');
			break;
		case 11:
			report_char('l');
			break;
		case 12:
			report_char('z');
			break;
		case 13:
			report_char('n');
			break;
		case 14:
			report_pstr(PSTR("roll"));
			break;
		case 15:
			report_pstr(PSTR("branch"));
			break;
		default:
			report_char('?');
		}
	}

	if (bus_state.vp.b.cpl == 0) report_pstr(PSTR(" CPL"));
	if (bus_state.vp.b.cll == 0) report_pstr(PSTR(" CLL"));
	if (bus_state.vp.b.sti == 0) report_pstr(PSTR(" STI"));
	if (bus_state.vp.b.cli == 0) report_pstr(PSTR(" CLI"));
	if (bus_state.vp.b.incpc == 0) report_pstr(PSTR(" PC+"));
	if (bus_state.vp.b.stpdr == 0) {
		report_pstr(PSTR(" DR"));
		report_char(bus_state.vp.b.dec ? '-' : '+');
	}
	if (bus_state.vp.b.stpac == 0) {
		report_pstr(PSTR(" AC"));
		report_char(bus_state.vp.b.dec ? '-' : '+');
	}
	if (bus_state.vp.b.end == 0) report_pstr(PSTR(" END"));
}


static void
go_state()
{
	report_pstr(PSTR(STR_STATE));
	_machine_state();
	report_nl();
}


static void
go_ustate()
{
	virtual_panel_sample();
	report_pstr(PSTR(STR_USTATE));
	_ustate();
	report_nl();
}


void
go_fast()
{
	report_pstr(PSTR(STR_FAST));
	// TODO
}


void
go_slow()
{
	report_pstr(PSTR(STR_SLOW));
	// TODO
}


void
go_creep()
{
	report_pstr(PSTR(STR_CREEP));
	// TODO
}


static void
_step(int8_t ustep, int8_t endless)
{
	uint16_t n = 1;

	// Optional argument
	if (optional_hex_val(&n) < 0) return;

	// Ensure the bus is quiet. 
	if (!assert_halted()) return;

	if (endless) report_pstr(ustep ? PSTR(STR_TRACE) : PSTR(STR_UTRACE));

	// Stop the clock (just in case).
	set_clk(0);

	uint16_t i = n;
	flags &= ~(FL_STOP | FL_INPOK);
	while (endless || i--) {
		// Initiate the STEP state machine. This will automatically
		// terminate without MCU control.
		if (ustep) {
			strobe_ustep();
			report_pstr(PSTR(STR_USTEP));
			_machine_state();
			report_char(9);
			_ustate();
		} else {
			strobe_step();
			report_pstr(PSTR(STR_STEP));
			_machine_state();
		}
		report_nl();
			
#ifdef HOST
		if (query_char(10)) {
			flags |= FL_INPOK;
		}
#endif // HOST

		if (flags & (FL_STOP | FL_INPOK)) {
			cancel();
			break;
		}

	}
	if (n > 1) done();
}


void
go_step()
{
	_step(0, 0);
}


void
go_ustep()
{
	_step(1, 0);
}


static void
go_trace()
{
	_step(0, 1);
}


static void
go_utrace()
{
	_step(1, 1);
}



///////////////////////////////////////////////////////////////////////////////
//
// RIGHT SWITCH BANK AND BUS TRANSACTIONS
//
///////////////////////////////////////////////////////////////////////////////


static void
_reg(uint8_t reg)
{
	uint16_t w;
	int8_t r;

	r = optional_hex_val(&w);
	if (r < 0) return;
	else if (r > 0) {
		// Ensure the bus is quiet. 
		if (!assert_halted()) return;
		if (set_reg(reg, w) == 0) return;
	}
	report_gs(r);
	switch(reg) {
	case REG_AC:
		report_hex_value(PSTR(STR_GSAC), bus_state.vp.b.ir, 4);
		return;
	case REG_PC:
		report_hex_value(PSTR(STR_GSPC), bus_state.vp.b.pc, 4);
		return;
	case REG_IR:
		report_hex_value(PSTR(STR_GSIR), bus_state.vp.b.ir, 4);
		return;
	}
}


static void
gs_ac()
{
	_reg(REG_AC);
}


static void
gs_pc()
{
	_reg(REG_PC);
}


static void
gs_ir()
{
	_reg(REG_IR);
}


static void
say_addr()
{
	// Report current setting.
	report_hex_value(PSTR(STR_ADDR), addr, 4);
}


static void
gs_addr()
{
	char * s = get_arg();
	if (s != NULL) {
		uint16_t x = parse_hex(s);
		if ((flags & FL_ERROR) == 0) {
			addr = x;
		} else {
			badval();
			return;
		}
			
	}
	say_addr();
}


static void
go_out()
{
	// Parse addr

	char * s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t a = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}

	// Parse word

	s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t v = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}


	_perform_write(SPACE_IO, a, v);
	
	report_pstr(PSTR(STR_OUT1));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_OUT2), v, 4);
}


static void
go_in()
{
	// Parse addr

	char * s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t a = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}

	uint16_t v = _perform_read(SPACE_IO, a);
	
	report_pstr(PSTR(STR_IN1));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_IN2), v, 4);
}


/* static void */
/* say_count() */
/* { */
/* 	// Report current setting. */
/* 	report_hex_value(PSTR(STR_COUNT), count, 4); */
/* } */


/* static void */
/* gs_count() */
/* { */
/* 	char * s = get_arg(); */
/* 	if (s != NULL) { */
/* 		uint16_t x = parse_hex(s); */
/* 		if ((flags & FL_ERROR) == 0) { */
/* 			count = x; */
/* 		} else { */
/* 			report_pstr(PSTR(STR_BADVAL)); */
/* 			return; */
/* 		} */
			
/* 	} */
/* 	say_count(); */
/* } */


void
go_ifr1()
{
	panel_out.ifr1 = 1;
	report_pstr(PSTR(STR_IFR1));
}


void
go_ifr6()
{
	panel_out.ifr6 = 1;
	report_pstr(PSTR(STR_IFR6));
}





/* static void */
/* warn_wrap() */
/* { */
/* 	if (count && ((addr + count) & 0xffff) < addr) { */
/* 		report_pstr(PSTR(STR_WRAP)); */
/* 	} */
/* } */


static void
go_read()
{
	uint16_t val = _perform_read(SPACE_MEM, addr);
	if (flags & (FL_ERROR|FL_EOL)) return;

	report_hex_value(PSTR(STR_READ), val, 4);
	addr++;
}


static void
go_write()
{
	int8_t res;
	uint16_t v;
	uint32_t cksum = 0;
	uint8_t first = 1;

	while ((res = optional_hex_val(&v)) > 0) {
		first = 0;
		if (_perform_write(SPACE_MEM, addr, v) == 0) return;
		addr++;
		cksum += v;
	}
	if (res < 0) return;
	if (first) {
		badsyntax();
		return;
	}
	report_hex_value(PSTR(STR_CKSUM), cksum, 4);
	addr++;
}


static void
go_fill()
{
	// Parse addr

	char * s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t count = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}

	// Parse word

	s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t val = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}

	while (count--) {
		if (_perform_write(SPACE_MEM, addr, val) == 0) return;
		addr++;
		if (query_char(10)) {
			cancel();
			return;
		}
	}
	done();
}


static void
go_dump_text()
{
	uint32_t i, sum = 0;
	uint16_t count = 0x80;
	uint16_t buf[8];
	uint8_t j;

	if (optional_hex_val(&count) < 0) return;

	for (i = 0; i < count; i += 8, addr += 8) {
		if (!_perform_block_read(addr, 8, buf)) break;
		
		// Break requested?
		if (flags & FL_BREAK) {
			cancel();
			return;
		}

		// Address
		report_hex(addr, 4);
		report_char(':');
		report_char(' ');

		// Hex display
		for (j = 0; j < 8; j++) {
			report_hex(buf[j], 4);
			report_char(' ');
			sum += buf[j];
		}

		// ASCII display, word-oriented
		for (j = 0; j < 8; j++) {
			if((buf[j] >= 32) && (buf[j] < 127)) report_char(buf[j]);
			else report_char('.');
		}
		report_char(' ');

		// ASCII display, byte-oriented
		for (j = 0; j < 8; j++) {
			uint16_t x = buf[j] & 0x7f;
			if(x >= 32 && x < 127) report_char(x);
			else report_char('.');

			x = (buf[j] >> 8) & 0x7f;
			if(x >= 32 && x < 127) report_char(x);
			else report_char('.');
		}
		report_char(' ');

		// Checksum
		report_hex(sum, 8);
		report_nl();
#ifdef HOST
		if (query_char(10)) {
			cancel();
			break;
		}
#endif // HOST
	}
	
	done();
}


///////////////////////////////////////////////////////////////////////////////
//
// DEBUGGING
//
///////////////////////////////////////////////////////////////////////////////


static void
gs_hof()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) panel_out.hof = v;
	
	report_gs(res);
	report_bool_value(PSTR(STR_GSHOF), panel_out.hof);
}


static void
gs_leds(){
	uint16_t v;
	int8_t res;
	res = optional_hex_val(&v);
	if (res < 0) return;
	if (res > 0) {
		write_leds(panel_out.leds = (v & 0xf));
	}
	report_gs(res);
	report_hex_value(PSTR(STR_GSLEDS), panel_out.leds, 1);
}








#if 0

static int
_ctrlchatter()
{
	gpio_input();
	uint8_t i;
	uint8_t a;

	// Configure PCR..PCIO (R#, W#, MEM#, IO#) as inputs.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	a = PORTC & (_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));

	for (i = 0; i < NUM_SAMPLES; i++)
		if ((PORTC & (_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO))) != a)
			return 0;
	return 1;
}


#ifdef DUMP_TEXT
static void
set_text()
{
	flags &= ~FL_BIN;
	report_pstr(PSTR(STR_TEXT));
}

static void
set_bin(){
	flags |= FL_BIN;
	report_pstr(PSTR(STR_BIN));
}
#endif // DUMP_TEXT


static void
go_clear()
{
	flags |= FL_CLEAR;
}



static void
_write_init()
{
	// Prepare the control signals. Drive the pins (signals de-asserted),
	// then set to output. This will glitch momentarily, turning on
	// Pull-Ups on all the ports (first line), but there's no adverse
	// effect.
	PORTC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);
	DDRC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);

	// Drive GPIO pins
	gpio_output();
}


static void
_write_done()
{
	// Tri-state the GPIO pins.
	gpio_hiz();

	// Tri-state the control signals.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	PORTC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
}


static void
_perform_write(uint8_t space, uint16_t addr, uint16_t val)
{
	uint8_t sig = space == SPACE_MEM ? PCMEM : PCIO;

	// Ensure the bus is quiet. 
	if (!assert_halted()) return;

	_write_init();

	// Set buses
	setab(addr);
	setdb(val);
	
	clearbit(PORTC, sig);	// Assert MEM#/IO# (low).
	_delay_us(1);		// Wait a little bit.
	clearbit(PORTC, PCW);	// Assert W# (low).
	_delay_us(1);		// Wait a little bit.
	setbit(PORTC, PCW);	// De-assert W# (high).
	_delay_us(1);		// Wait a little bit.
	setbit(PORTC, sig);	// De-assert MEM/IO# (high).

	_write_done();
}


static void
_read_init()
{
	// Prepare the control signals. Drive the pins (signals de-asserted),
	// then set to output. This will glitch momentarily, turning on
	// Pull-Ups on all the ports (first line), but there's no adverse
	// effect.
	PORTC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);
	DDRC |= _BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO);

	// Drive GPIO pins
	gpio_busread();
}


static void
_read_done()
{
	// Tri-state the GPIO pins.
	gpio_hiz();

	// Tri-state the control signals.
	DDRC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
	PORTC &= ~(_BV(PCR) | _BV(PCW) | _BV(PCMEM) | _BV(PCIO));
}


static uint32_t
go_dump_bin()
{
	register uint32_t i, sum = 0, x;

	// Ensure the bus is quiet.
	if (!assert_halted()) return 0;

	_read_init();

        // How simple is THIS?
	for (i = 0; i < count; i++) {
		if (flags & FL_BREAK) {
			cancel();
			goto dump_bin_done;
		}

		// Set address
		setab(addr);
	
		// Perform a read cycle
		clearbit(PORTC, PCMEM);	// Assert MEM# (low).
		clearbit(PORTC, PCR);	// Assert R# (low).
		x = getdb();
		setbit(PORTC, PCR);	// De-assert R# (high).
		setbit(PORTC, PCMEM);	// De-assert MEM# (high).

		sum += x;
		serial_send((x >> 8) & 0xff);
		serial_send(x & 0xff);
		
#if SERIAL_BPS > 57600
		// On fast links, stop for 200ms every 32k and blink
		// the LED to provide feedback.
		//if ((i & 32767) == 0) blink_led(0xffffff, 100);
#endif // SERIAL_BPS > 57600
	}

dump_bin_done:
	_read_done();

	return sum;
}


static void
go_dump() {
	uint32_t addr0 = addr, sum;

	// Sanity check
#ifdef DUMP_TEXT
	if (!(flags & FL_BIN) && (count & 0xf)) {
		report_pstr(PSTR(STR_COUNT));
		flags |= FL_ERROR;
		return;
	}
#endif // DUMP_TEXT

	say_addr();
	say_count();
	report_pstr(PSTR(STR_DUMP));
	
	// Dump, depending on mode.
	//hw_read_init();

#ifdef DUMP_TEXT
	if (flags & FL_BIN) sum = go_dump_bin();
	else sum = go_dump_text();
#else
	sum = go_dump_bin();
#endif // DUMP_TEXT
	
	//hw_read_done();
	
	if (flags & (FL_BREAK|FL_ERROR)) {
		// Restore the previous addring address.
		addr = addr0;
		return;
	}

	say_done();
	report_pstr(PSTR(STR_CKSUM));
	report_hex(sum, 8);
	report_nl();
	//say_addr();
}


static void
go_out()
{
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;

	register uint16_t val = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;

	_perform_write(SPACE_IO, a, val);
	if (flags & (FL_ERROR|FL_EOL)) return;

	say_done();
}


static void
go_write()
{
	uint32_t sum = 0;
	register uint8_t i = BLOCKSIZE + 1, j = 0;
	
	//if (flags & FL_ERROR) return;
	
	// Ensure the bus is quiet. 
	if (!assert_halted()) return;
	
	_write_init();
	
	while (--i) {
		// Get a word from the command line.
		register uint16_t data = get_addr() & 0xffff;
		if (flags & (FL_EOL | FL_ERROR)) goto go_write_done;

		// Set buses
		setab(addr);
		setdb(data);
		
		clearbit(PORTC, PCMEM);	// Assert MEM#/IO# (low).
		_delay_us(1);		// Wait a little bit.
		clearbit(PORTC, PCW);	// Assert W# (low).
		_delay_us(1);		// Wait a little bit.
		setbit(PORTC, PCW);	// De-assert W# (high).
		_delay_us(1);		// Wait a little bit.
		setbit(PORTC, PCMEM);	// De-assert MEM/IO# (high).
		
		sum += (uint32_t)data;
		addr++;
		j = 1;
	}
	
go_write_done:
	_write_done();
	
	say_done();
	if (j) {
		report_pstr(PSTR(STR_CKSUM));
		report_hex(sum, 8);
		report_nl();
	}
	//say_addr();
}


static void
go_in()
{
	register uint16_t a = get_addr();
	if (flags & (FL_ERROR|FL_EOL)) return;
	
	uint16_t val = _perform_read(SPACE_IO, a);
	if (flags & (FL_ERROR|FL_EOL)) return;
	
	report_pstr(PSTR(STR_VALUE));
	report_hex(val, 4);
	report_nl();
}


#endif // 0



///////////////////////////////////////////////////////////////////////////////
//
// Diagnostic I/O
//
///////////////////////////////////////////////////////////////////////////////

void
say_sr()
{
	uint16_t sr = panel_in.b.sr;
	report_pstr(PSTR(STR_SR));
	report_hex(sr, 4);
	report_char(9);
	report_uint(sr);
#ifdef DISASSEMBLE
	report_char(9);
	_disassemble(sr);
#endif // DISASSEMBLE
	report_nl();
}

static void
gs_or()
{
	int8_t res;
	uint16_t v;
	
	res = optional_hex_val(&v);
	if (res < 0) return;
	if (res > 0) {
		write_or(panel_out.or = v);
	}
	report_gs(res);
	report_hex_value(PSTR(STR_GSOR), panel_out.or, 4);
}




///////////////////////////////////////////////////////////////////////////////
//
// COMMAND HANDLING
//
///////////////////////////////////////////////////////////////////////////////


static void
go_nop()
{
#ifdef HOST
	printf("*** TODO: Implement this command.\n");
#endif // HOST
}
#define gs_nop go_nop


static void say_help();


#include "proto-cmds.h"


static void
say_help()
{
	int i;
	
#ifdef HOST
	int maxc = 0, maxd = 0;
#endif // HOST
	
	report_pstr(PSTR("\n201 Available commands:"));
#ifdef AVR
	for(i=0; (uint16_t) pgm_read_word(&(cmds[i].handler)) != -1; i++) {
#else
	for(i=0; cmds[i].handler != (void*)-1; i++) {
#endif
		report_pstr(PSTR("\n201\t"));
		report_npstr((char *)cmds[i].cmd, CMD_SIZE);
		report_c(32);
		report_pstr((char *)cmds[i].help);
#ifdef HOST
		if (strlen(cmds[i].cmd) > maxc) maxc = strlen(cmds[i].cmd);
		if (strlen(cmds[i].help) > maxd) maxd = strlen(cmds[i].help);
#endif // HOST
	}
	report_pstr(PSTR("\n201 Consult documentation for details.\n"));
	
#ifdef HOST
	printf("*** There are %d commands.\n", i);
	printf("*** Longest command name: %d chars\n", maxc);
	printf("*** Longest help test:    %d chars\n", maxd);
	printf("*** Sizeof(cmds):         %lu\n", sizeof(cmds));
#endif
}
	
	
void
proto_prompt()
{
		if (flags & FL_HALT) {
			report_pstr(PSTR(STR_PSTOP));
			report_hex(addr, 4);
			report_pstr(PSTR(STR_PROMPT));
		} else {
			report_pstr(PSTR(STR_PRUN));
		}
		report_n((char *)buf, buflen);
}

	
void proto_loop()
{
	buf[buflen] = 0;
	for(; (flags & FL_CLEAR) == 0;) {
		proto_prompt();

		// Wait for input to be complete.
		while((flags & FL_INPOK) == 0)
		{
#ifdef HOST
			// The standalone version doesn't use assynchronous
			// input (via interrupts or an external thread), so we
			// must trigger it ourselves.
			unsigned char c = read_next_char();
			if (c) c = proto_input(c);
#endif // HOST
		}

		/* if (flags & FL_ECHO) blink_led(0, 10); */

		flags |= FL_BUSY;
		flags &= ~(FL_ERROR | FL_EOL);
		bp = 0;

		// Process the input
		//...
		//report_pstr(PSTR("BUSY...\n"));
		buf[buflen]=0;

		if (!buflen) {
			report_pstr(PSTR(STR_READY));
			goto done;
		}

		// All valid commands are between 1 and 4 characters long.
		if (buflen < 1) goto unknown_command;

		if(flags & FL_ERROR) {
			goto error;
		}

		int i;
		char *s = get_arg();

#ifdef AVR
		for(i=0; (uint16_t) pgm_read_word(&(cmds[i].handler)) != -1; i++) {
#else
			for(i=0; cmds[i].handler != (void *)-1; i++) {
#endif // AVR
			if(!strncmp_P(s, cmds[i].cmd, CMD_SIZE)) {
				void (*handler)() = (void *)pgm_read_word(&(cmds[i].handler));
				(*handler)();
				goto done;
			}
		}

	unknown_command:
		report_pstr(PSTR(STR_BADCMD));
		goto done;

	error:
		report_pstr(PSTR("???\n"));
		goto done;

	done:
		// Clear the input okay and busy bits.
		buflen = 0;
		flags &= ~(FL_INPOK | FL_BUSY | FL_BREAK);
	}
}


unsigned char
proto_input(unsigned char c)
{
	flags &= ~FL_ASYNC;

	// Allow breaks at all times.
	if (c == 3 || c == 24) {
		// Cancel input or operation (ASCII 24, Ctrl-X or Ctrl-C)
		if (flags & FL_BUSY) {
			flags |= FL_BREAK;
		} else {
			if (flags & FL_ECHO) report_pstr(PSTR("\\\n"));
			buflen = 0;
			return 0;
		}
	}
	
	// Don't echo characters if we're busy.
	if (flags & FL_BUSY) return '\0';

	// Is the buffer full?
	if (buflen >= BUFSIZE) return flags & FL_ECHO ? '*' : '\0';

	// End of line? (ignore multiple ones and blank lines)
	if (c == 10 || c== 13) {
		flags |= FL_INPOK;
		if (flags & FL_ECHO) {
			serial_write('\r');
#ifdef HOST
			serial_write('\n');
#endif // HOST
			return '\n';
		}
		return 0;
	} else if ((c == 8) || (c == 127)) {
		if (buflen) {
			buflen--;
			if (flags & FL_ECHO) report("\b \b");
		}
		return 0;
	}

#ifdef HOST
	else if (c == 4) {
		printf("\n\nQuitting (only on host).\n");
		exit(0);
	}
#endif // HOST

	// Store the character.
	buf[buflen++] = c;

	if (flags & FL_ECHO) {
		report_char(c);
	}
	return c;
}

// End of file.
