// -*- indent-c++ -*-

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

volatile uint32_t flags = FL_BUSY | FL_ECHO | FL_MESG;

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
	//flags = (flags & FL_HALT) | FL_ECHO | FL_MESG;
	flags = FL_ECHO | FL_MESG;
	report_nl();
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
	say_break();
	report_pstr(PSTR(STR_ABORT));
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


// RUN TO STOP STATE TRANSITION
//
// ____   _________
// HALT       \\\\\\_______________________________________
//      ___              __________________________________
// STEP/RUN  ___________/
//           ____________________________________
// CLKEN                 \\\\\\\\\\\\\\\\\\\\\\\\\_________
//             
// FPUSTEP-IN  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\_____
//                         
// FPCLKEN-IN  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\__
//
//                       |<---   up to 4 µs  --->|

void
go_stop(){
	if (flags & FL_HALT) {
		report_pstr(PSTR(STR_ALRHALT));
		return;
	}
	
	// First, enable HALT to tristate the processor. Then, set STEP/RUN#
	// high which will take the step/run state machine out of RUN state and
	// into the STEP state. In turn, this will stop the clock at the
	// beginning of the fetch state of the fetch-execute cycle. With the
	// clock stopped, we'll have entered the STOP state.
	set_halt(1);		// Assert HALT
	set_steprun(1);		// Set STEP/RUN# to STEP

	// Wait at least 4µs
	uint8_t i = 15;		// Due to loop overheads
	while (--i) asm("nop");

	set_clk(CLK_STOPPED);	// Stop the processor clock source. The source
				// will have already been disconnected from the
				// processor by the external state machine.

	flags |= FL_HALT | FL_STOP;

	// Donw.
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
	virtual_panel_sample(0);
	
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


static
void
go_sws()
{
	report_pstr(PSTR(STR_SWS));
	uint32_t sw = get_sw();

	report_bin_pad((sw >> 24) & 0xff, 8); // Left switches
	report_c(32);
	report_bin_pad(get_sr(), 16); // Switch register
	report_c(32);
	report_bin_pad(sw & 0xfff, 12); // Right switches
	report_c(32);
	report_bin_pad((sw >> 12) & 0xf, 4); // MS DIP switches
	report_c(32);
	report_bin_pad((sw >> 16) & 0xff, 8); // LS DIP switches
	report_c(32);
	report_nl();
}


static void
go_ustate()
{
	virtual_panel_sample(0);
	report_pstr(PSTR(STR_USTATE));
	_ustate();
	report_nl();
}


static void
go_cons()
{
	unsigned char c = 0;
	uint8_t state = 0;
	//uint8_t n = 0;

	report_pstr(PSTR(STR_CONSBEG));
	
	flags |= (FL_BUSY | FL_CONS);
	while (flags & FL_CONS) {
		while ((flags & FL_INPOK) == 0) {
#ifdef HOST
			// The standalone version doesn't use asynchronous
			// input (via interrupts or an external thread), so we
			// must trigger it ourselves.
			c = read_next_char();
			if (c) flags |= FL_INPOK;
#endif // HOST
		}

#ifdef AVR
		// The read character was placed in buf[0] by proto_input(). It
		// will also have set FL_INPOK, breaking us out of the loop
		// above.
		c = buf[0];
#endif // HOST

		flags &= ~FL_INPOK;

		// TODO: this fails, but not sure why.

		// State machine: exit the console.
		if ((state == 0 || state == 1) && (c == '\n' || c == '\r')) state = 1;
		else if ((state == 1) && c == '#') state = 2;
		else if ((state == 2) && c == '.') break;
		else state = 0;

		// report_hex(state, 1);
		// report_c(32);
		// n++;
		// if ((n % 10) == 0) {
		// 	report_hex(n, 2);
		// 	report_c(32);
		// }

		queue_char(c);
	}
	flags &= ~(FL_BUSY | FL_CONS);
	
	report_pstr(PSTR(STR_CONSEND));
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
_step(bool_t ustep, bool_t endless)
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
	flags &= ~(FL_BREAK | FL_INPOK);
	flags |= FL_BUSY;
	while (endless || i--) {
		report_hex(flags, 4);
		report_c(':');
		report_c(' ');
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

		if (flags & (FL_BREAK | FL_INPOK)) {
			cancel();
			break;
		}

	}
	flags &= ~FL_BUSY;
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
	set_irq1(1);
	report_pstr(PSTR(STR_IFR1));
}


void
go_ifr6()
{
	set_irq6(1);
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

	// Ensure the bus is quiet.
	if (!assert_halted()) return;

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
	if (res > 0) {
		if (v) flags |= FL_HOF;
		else flags &= ~FL_HOF;
	}
	
	report_gs(res);
	report_bool_value(PSTR(STR_GSHOF), flags & FL_HOF);
}


static void
gs_hos()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) {
		if (v) flags |= FL_HOS;
		else flags &= ~FL_HOS;
	}
	report_gs(res);
	report_bool_value(PSTR(STR_GSHOS), (flags & FL_HOS) != 0);
}


// static void
// gs_leds(){
// 	uint16_t v;
// 	int8_t res;
// 	res = optional_hex_val(&v);
// 	if (res < 0) return;
// 	if (res > 0) {
// #warn "TODO: decide if the LEDS stay or go. Code write_leds()"
// 		//write_leds(panel_out.leds = (v & 0xf));
// 	}
// 	report_gs(res);
// 	//report_hex_value(PSTR(STR_GSLEDS), panel_out.leds, 1);
// }



///////////////////////////////////////////////////////////////////////////////
//
// Diagnostic I/O
//
///////////////////////////////////////////////////////////////////////////////

void
say_sr()
{
	uint16_t sr = get_sr();
	report_pstr(PSTR(STR_SR));
	report_bin(sr);
	report_char(9);
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
		set_or(v);
	} else v = get_or();
	report_gs(res);
	report_hex_value(PSTR(STR_GSOR), v, 4);
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

static const char _helpstr[] PROGMEM = _HELPSTR;

static void
say_help()
{
	int i;
	char * hp = (char *)_helpstr;
	
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
		hp = report_pstr(hp);

#ifdef HOST
		if (strlen(cmds[i].cmd) > maxc) maxc = strlen(cmds[i].cmd);
		//if (strlen(cmds[i].help) > maxd) maxd = strlen(cmds[i].help);
#endif // HOST
	}
	report_pstr(PSTR("\n201 Consult documentation for details.\n"));
	//report_pstr(_helpstr);
	
#ifdef HOST
	printf("*** There are %d commands.\n", i);
	printf("*** Longest command name: %d chars\n", maxc);
	printf("*** Longest help test:    %d chars\n", maxd);
	printf("*** Sizeof(cmds):         %lu\n", sizeof(cmds));
#endif
}
	
	
void
say_break()
{
	if (flags & FL_CONS) return; // It's not asynchronous in the console.
	report_pstr(PSTR("***\n"));
	flags |= FL_ASYNC;
}


void
proto_prompt()
{
	if (flags & FL_CONS) return; // No need to prompt in the virtual console
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
		flags &= ~(FL_ERROR | FL_EOL | FL_STOP | FL_BREAK);
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

#ifdef AVR
	// Is the virtual console being used? If so, flag the
	// character and exit. The go_cons() loop will take care of
	// the rest (we've been called by the ISR, so we're running on
	// a separate 'thread').
	if (flags & FL_CONS) {
		flags |= FL_INPOK;
		buf[0] = c;
		return c;
	}
	
#endif // AVR

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
			serial_write('\n');
			return '\n';
		}
		return 0;
	} else if ((c == 8) || (c == 127)) {
		if (buflen) {
			buflen--;
			if (flags & FL_ECHO) report_pstr(PSTR("\b \b"));
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
