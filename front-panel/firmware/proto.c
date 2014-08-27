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
#include "abstract.h"
#include "input.h"
#include "output.h"
#include "hwcompat.h"
#include "panel.h"
#include "bus.h"

#ifdef AVR
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif


#ifdef HOST
#define PROGMEM
#endif // HOST


unsigned char buf[BUFSIZE];

uint16_t buflen, bp;

volatile uint32_t flags = FL_BUSY | FL_MESG;

uint16_t addr;

uint16_t bpaddr[NUM_BP];
uint8_t  bpflag = 0;


//uint8_t progress[5] = {0, 1, 3, 7, 15};


static bool_t
assert_proc_present()
{
// #warning "Remove this line."
// 	return 1;

	if (flags & FL_PROC) return 1;
	report_pstr(PSTR(STR_NOPROC));
	return 0;
}


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
	report_hex_value(PSTR(STR_BUFSIZE), BUFSIZE, 3);
}

static void
say_proc()
{
	report_pstr(flags & FL_PROC ? PSTR(STR_PROC1) : PSTR(STR_PROC0));
}


void
proto_init()
{
	flags |= FL_MESG | FL_TERM | FL_ECHO;
	say_version();
	report_pstr(PSTR(BANNER2 BANNER3 BANNER4));
	say_bufsize();
	say_proc();
	buflen = 0;
	//flags = (flags & FL_HALT) | FL_ECHO | FL_MESG;
	flags &= ~FL_BUSY;
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
gs_flag(uint32_t flag, const char *msg)
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) {
		if (v) {
			// Enable echo
			flags |= flag;
		} else {
			// Disable echo
			flags &= ~flag;
		}
	}
	// Report current setting.
	report_gs(res);
	report_bool_value(msg, (flags & flag) != 0);
}



static void
gs_echo()
{
	gs_flag(FL_ECHO, PSTR(STR_GSECHO));
}



static void
gs_mesg()
{
	gs_flag(FL_MESG, PSTR(STR_GSMESG));
}



static void
gs_term()
{
	gs_flag(FL_TERM, PSTR(STR_GSTERM));
}



static void
gs_lock()
{
	gs_flag(FL_SWLOCK, PSTR(STR_GSLOCK));
}



///////////////////////////////////////////////////////////////////////////////
//
// LEFT SWITCH BANK
//
///////////////////////////////////////////////////////////////////////////////

void
go_reset(){
	// This will take care of timings, standalone mode, etc.
	perform_reset();
	report_pstr(PSTR(STR_RESET));
}


// RUN TO STOP STATE TRANSITION
//
//      ___        ________________________________________
// STEP/RUN    ___/
// ____               _____________________________________
// WAIT (*)    ______///////////////////
//                     wait_for_halt()
// ____        ___________________________
// HALT                                   \________________
//             ______________________________
// CLKEN                                     \_____________
//             
// FPUSTEP-IN  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\_________
//                         
// FPCLKEN-IN  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\_________
//
// (*) WAIT# is an input from the run/stop state machine

void
go_stop(){
	if (flags & FL_HALT) {
		report_pstr(PSTR(STR_ALRHALT));
		return;
	}
	flags |= FL_BUSY;

	// First, enable HALT to tristate the processor. Then, set STEP/RUN#
	// high which will take the step/run state machine out of RUN state and
	// into the STEP state. In turn, this will stop the clock at the
	// beginning of the fetch state of the fetch-execute cycle. With the
	// clock stopped, we'll have entered the STOP state.

	set_stopping();		// Set STEP/RUN# to STEP
 	wait_for_halt();	// Wait until the clock has been stopped
	set_halt(1);		// Assert HALT
	set_fprunstop(0);

	// set_steprun waits until the processor is halted.

	// Stop the processor clock source. The source will have already been
	// disconnected from the processor by the external state machine.
	clk_stop();

	flags |= FL_HALT;
	
	// Sample the bus and set the current DEB/PFP address
	virtual_panel_sample(0);
	addr = get_pc();

	// Keep the DEB address linked to the PC, unless we're
	// standalone.
	if (flags & FL_PROC) addr = get_pc();

	// Done.
	report_pstr(PSTR(STR_AHALTED));
}

void
go_run(){
	if ((flags & FL_HALT) == 0) {
		report_pstr(PSTR(STR_ALRRUN));
		return;
	}
	flags |= FL_BUSY;
	flags &= ~FL_HALT;
	// This also changes the GPIO pins to inputs.
	clk_start();
	set_halt(0);
	set_steprun(0);		// Jam the run/step FSM to run mode.
	set_fprunstop(1);
	flags &= ~FL_BUSY;
	report_pstr(PSTR(STR_ARUN));
}

void
go_start()
{
	go_reset();
	go_run();
}


#ifdef DISASSEMBLE

//                 1         2         3         4         5
//       0123456789012345678901234567890123456789012345678901234567"
static const char _distext[] PROGMEM = 
	"TRAPIOTLOADSTOREINOUTJMPJSRADDANDORXOROP1OP2POPISZLIAJMPII";
//       0   4  7   11   1618 21 24 27 30 3335 38 41 44 47 50 53                               
#define OFS_TRAP   0
#define OFS_IOT    4
#define OFS_LOAD   7
#define OFS_STORE 11
#define OFS_IN    16
#define OFS_OUT   18
#define OFS_JMP   21
#define OFS_JSR   24
#define OFS_ADD   27
#define OFS_AND   30
#define OFS_OR    33
#define OFS_XOR   35
#define OFS_OP1   38
#define OFS_OP2   41
#define OFS_POP   44
#define OFS_ISZ   47
#define OFS_LIA   50
#define OFS_JMPII 53

//                 1         2         3         4         5
//       012345678901234567890123456789012345678901234567890"
static const char _optext[] PROGMEM = 
	"IFLIFVCLACLLNOTINCCPLRBLRBRRNLRNRNOPSNANZASSLSSVSKIPSNNSNZSCLSCVCLISEI";
//       0  3  6  9  12 15 18 21 24 27 30 33 36 39 42 45 48  52 55 58 61 64 67

static void
_disassemble(uint16_t w)
{
	uint8_t op = w >> 12;
	uint8_t i = w & 0x800 ? 1 : 0;
	uint8_t r = w & 0x400 ? 1 : 0;
	uint8_t ofs = 0;
	uint8_t pad = 9;
	uint8_t len = 3;
	switch (op) {
	case 0:
		len = 4;
		break;
	case 1:
		ofs = OFS_IOT;
		break;
	case 2:
		ofs = OFS_LOAD;
		len = 4;
		break;
	case 3:
		ofs = OFS_STORE;
		len = 5;
		break;
	case 4:
		ofs = OFS_IN;
		len = 2;
		break;
	case 5:
		ofs = OFS_OUT;
		break;
	case 6:
		ofs = OFS_JMP;
		break;
	case 7:
		ofs = OFS_JSR;
		break;
	case 8:
		ofs = OFS_ADD;
		break;
	case 9:
		ofs = OFS_AND;
		break;
	case 10:
		ofs = OFS_OR;
		len = 2;
		break;
	case 11:
		ofs = OFS_XOR;
		break;
	case 12:
		ofs = OFS_OP1;
		break;
	case 13:
		if (i == 0) ofs = OFS_OP2;
		else {
			ofs = OFS_POP;
			i = 0;
		}
		break;
	case 14:
		ofs = OFS_ISZ;
		break;
	case 15:
		if (i == 0) ofs = OFS_LIA;
		else {
			ofs = OFS_JMPII;
			len = 5;
			i = 0;
		}
		break;
	}

	// Output the instruction
	pad -= len;
	while (len--) report_char((unsigned char)pgm_read_byte((char *)&(_distext[ofs++])));
	
	if (i) {
		report_pstr(PSTR(" I"));
		pad -= 2;
	}

	if (r) {
		report_pstr(PSTR(" R"));
		pad -= 2;
	}
	
	while (pad--) report_char(' ');
	report_pstr(PSTR(" &"));
	report_hex(w & 0x3ff, 3);
}

#endif // DISASSEMBLE


static void
_machine_state()
{
	virtual_panel_sample(0);
	
	uint8_t f = get_flags();
	style_info();
	report_char(f & CFL_FN ? 'n' : '-');
	report_char(f & CFL_FZ ? 'z' : '-');
	report_char(f & CFL_FV ? 'v' : '-');
	report_char(f & CFL_FI ? 'i' : '-');
	report_char(f & CFL_FL ? 'l' : '-');

	style_normal();
	report_pstr(PSTR(STR_PC));
	style_info();
	report_hex(get_pc(), 4);

	style_normal();
	report_pstr(PSTR(STR_AC));
	style_info();
	report_hex(get_ac(), 4);

	style_normal();
	report_pstr(PSTR(STR_IR));
	style_info();
	report_hex(get_ir(), 4);

#ifdef DISASSEMBLE
	report_char(' ');
	_disassemble(get_ir());
#endif // DISASSEMBLE
}


//static char * _strdis PROGMEM = "memio[ar]ALU.AGLPCDRACaddandorxorrollnotcs1cs2 <- ARIR";

#define IS_END(x) (((x) & 0x800000) == 0)
#define IS_WEN(x) (((x) & 0x40000000) == 0)
#define IS_R(x)   (((x) & 0x80000000) == 0)
#define IS_MEM(x) (((x) & 0x100000) == 0)
#define IS_IO(x)  (((x) & 0x80000) == 0)
#define IS_DEC(x)  (((x) & 0x40000) == 0)
#define IS_STPAC(x)  (((x) & 0x20000) == 0)
#define IS_STPDR(x)  (((x) & 0x10000) == 0)
#define IS_INCPC(x)  (((x) & 0x8000) == 0)
#define IS_CLI(x)  (((x) & 0x4000) == 0)
#define IS_STI(x)  (((x) & 0x2000) == 0)
#define IS_CLL(x)  (((x) & 0x1000) == 0)
#define IS_CPL(x)  (((x) & 0x800) == 0)

#define GET_OPIF(x)  (((x) & 0x780) >> 7)
#define GET_WUNIT(x)  (((x) & 0x70) >> 4)
#define GET_RUNIT(x)  ((x) & 0x7)

// The signal map (slightly different to that of the CFT itself) is as
// follows (LSB to MSB):
//
// 0 -  3: .... .... .... .... .... .... .... XXXX        f  0 RUNIT
// 4 -  6: .... .... .... .... .... .... .XXX ....       70  4 WUNIT
// 7 - 10: .... .... .... .... .... .XXX X... ....      780  7 OPIF
//     11: .... .... .... .... .... X... .... ....      800 11 CPL#
//     12: .... .... .... .... ...X .... .... ....     1000 12 CLL#
//     13: .... .... .... .... ..X. .... .... ....     2000 13 STI#
//     14: .... .... .... .... .X.. .... .... ....     4000 14 CLI#
//     15: .... .... .... .... X... .... .... ....     8000 15 INCPC#
//     16: .... .... .... ...X .... .... .... ....    10000 16 STPDR#
//     17: .... .... .... ..X. .... .... .... ....    20000 17 STPAC#
//     18: .... .... .... .X.. .... .... .... ....    40000 18 DEC#
//     19: .... .... .... X... .... .... .... ....    80000 19 IO#
//     20: .... .... ...X .... .... .... .... ....   100000 20 MEM#
//     21: X... .... .... .... .... .... .... .... 80000000 30 R#
//     22: .X.. .... .... .... .... .... .... .... 40000000 31 WEN
//     23: .... .... X... .... .... .... .... ....   800000 23 END

static void
_ustate()
{	
	uint32_t u = get_uvec();

	{
		uint16_t x = (u >> 16) & 0xffff;
		report_bin_pad(x, 16);
		x = u & 0xffff;
		report_bin_pad(x, 16);
		report_pstr(PSTR(" "));
	}

	if (IS_R(u)) {
		if (IS_MEM(u)) report_pstr(PSTR("mem"));
		else if (IS_IO(u)) report_pstr(PSTR("io"));
		report_pstr(PSTR("[ar]"));
	} else {
		if (GET_RUNIT(u) & 8) report_pstr(PSTR("ALU."));
		
		switch (GET_RUNIT(u)) {
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

	if (IS_WEN(u)) {
		if (IS_MEM(u)) report_pstr(PSTR("mem"));
		else if (IS_IO(u)) report_pstr(PSTR("io"));
		report_pstr(PSTR("[ar]"));
	} else {
		switch (GET_WUNIT(u)) {
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

	if (GET_OPIF(u)) report_pstr(PSTR(" if"));

	if (GET_OPIF(u) > 0 && GET_OPIF(u) <= 7) {
		report_pstr(PSTR("-IR"));
		report_char('2' + GET_OPIF(u));
	} else {
		switch (GET_OPIF(u)) {
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

	if (IS_CPL(u)) report_pstr(PSTR(" CPL"));
	if (IS_CLL(u)) report_pstr(PSTR(" CLL"));
	if (IS_STI(u)) report_pstr(PSTR(" STI"));
	if (IS_CLI(u)) report_pstr(PSTR(" CLI"));
	if (IS_INCPC(u)) report_pstr(PSTR(" PC+"));
	if (IS_STPDR(u)) {
		report_pstr(PSTR(" DR"));
		report_char(IS_DEC(u) ? '-' : '+');
	}
	if (IS_STPAC(u)) {
		report_pstr(PSTR(" AC"));
		report_char(IS_DEC(u) ? '-' : '+');
	}
	if (IS_END(u)) report_pstr(PSTR(" END"));
}


static void
go_state()
{
	if (!assert_proc_present()) return;
	report_pstr(PSTR(STR_STATE));
	_machine_state();
	report_nl();
}


static
void
go_sws()
{
	report_pstr(PSTR(STR_SWS));
	uint16_t lsw = get_lsw();
	uint16_t rsw = get_rsw();

	report_bin_pad((lsw >> 8) & 0xff, 8); // Left switches
	report_c(32);
	report_bin_pad(get_sr(), 16); // Switch register
	report_c(32);
	report_bin_pad(rsw & 0xfff, 12); // Right switches
	report_c(32);
	report_bin_pad((rsw >> 12) & 0xf, 4); // MS DIP switches
	report_c(32);
	report_bin_pad(lsw & 0xff, 8); // LS DIP switches
	report_c(32);
	report_nl();
}


static
void
go_swtest()
{
	report_pstr(PSTR(STR_SWTEST));

	uint16_t sr0 = get_sr();
	uint16_t or0 = get_or();
	uint16_t lsw0 = get_lsw();
	uint16_t rsw0 = get_rsw();
	go_sws();

	// Setting the busy flag will cause all switches to be ignored
	// by the interrupt handler, effectively disabling the switch
	// assembly. The in-console flag disables line buffering (but
	// also normal output).
	flags |= FL_BUSY | FL_CONS;
	flags &= ~(FL_INPOK | FL_BREAK);

	while ((flags & (FL_INPOK | FL_BREAK)) == 0) {
		_delay_ms(100);
		deb_sample(0);	// Read the switches

		// Set the OR from the SR
		set_or(get_sr());

		if (sr0 != get_sr() || lsw0 != get_lsw() || rsw0 != get_rsw()) {
			sr0 = get_sr();
			lsw0 = get_lsw();
			rsw0 = get_rsw();
			// Console mode suppresses normal debugging
			// output, so disable it temporarily.
			flags &= ~FL_CONS;
			go_sws();
			flags |= FL_CONS;
		}
	}
	flags &= ~(FL_BUSY | FL_CONS | FL_INPOK | FL_BREAK);
	set_or(or0);
	report_pstr(PSTR(STR_DONE));
}
static void
go_ustate()
{
	if (!assert_proc_present()) return;
	virtual_panel_sample(0);
	report_pstr(PSTR(STR_USTATE));
	style_info();
	_ustate();
	report_nl();
}


static void
go_cons()
{
	unsigned char c = 0;
	uint8_t state = 0;
	//uint8_t n = 0;

	// Need a processor
	if (!assert_proc_present()) return;

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
	report_nl();
	report_pstr(PSTR(STR_CONSEND));
}


void
go_fast()
{
	report_pstr(PSTR(STR_FAST));
	clk_fast();
}


void
go_slow()
{
	report_pstr(PSTR(STR_SLOW));
	clk_slow();
}


void
go_creep()
{
	report_pstr(PSTR(STR_CREEP));
	clk_creep();
}


static uint16_t _divs [5] = { 2, 16, 128, 512, 2048 };


static void
go_clk()
{
	// Parse PS (Prescaler value)

	char * s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint8_t prescaler = parse_hex(s);
	if ((flags & FL_ERROR) || (prescaler < 1) || (prescaler > 5)) {
		badval();
		return;
	}

	// Parse word

	s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t div = parse_hex(s);
	if (flags & FL_ERROR) {
		badval();
		return;
	}

	if (prescaler == 5 && div >= 0x1000) {
		report_pstr(PSTR(STR_CLKWRN));
	}

	set_clkfreq(prescaler, div);

	report_pstr(PSTR(STR_CLKSET));
	report_int(_divs[prescaler - 1]);
	report_pstr(PSTR(" * (1 + "));
	report_uint(div);
	report_pstr(PSTR(")) (base 10)\n"));
}


static void
_step(bool_t ustep, bool_t endless)
{
	uint16_t n = 1;
	uint8_t j;

	// Need a processor
	if (!assert_proc_present()) return;

	// Ensure the bus is quiet. 
	if (!assert_halted()) return;

	// Optional argument
	if (optional_hex_val(&n) < 0) return;

	if (endless) report_pstr(ustep ? PSTR(STR_UTRACE) : PSTR(STR_TRACE));

	// Stop the clock (just in case).
	clk_stop();

	uint16_t i = n;
	flags &= ~(FL_BREAK | FL_INPOK);
	flags |= FL_BUSY;
	while (endless || i--) {
		// Initiate the STEP state machine. This will automatically
		// terminate without MCU control, but we need to wait for it.

		if (ustep) {
			perform_ustep();

			if (!in_console()) {
				report_pstr(PSTR(STR_USTEP));
				_machine_state();
				report_char(9);
				_ustate();
				report_nl();
			}
		} else {
			perform_step();

			if (!in_console()) {
				report_pstr(PSTR(STR_STEP));
				_machine_state();
				report_nl();
			}
		}

		// Check breakpoints
		for (j = 0; j < NUM_BP; j++) {
			if ((bpflag & (1 << j)) && bpaddr[j] == get_pc()) {
				report_hex_value(PSTR(STR_BPOINT), (uint32_t)j, 1);
				endless = i = 0;
				break;
			}
		}
	
		// Allow the user to interrupt.
#ifdef HOST
		if (query_char(10)) flags |= FL_INPOK;
#endif // HOST
		if (flags & (FL_BREAK | FL_INPOK)) {
			cancel();
			break;
		}

	}
	flags &= ~FL_BUSY;
	if (n > 1) done();

	// Keep the DEB address linked to the PC, unless we're
	// standalone.
	if (flags & FL_PROC) addr = get_pc();
}


static void
_printbp(uint8_t i)
{
	report_char('2');
	report_pstr(PSTR(STR_GSBPT));
	report_hex((uint32_t)i, 1);
	report_pstr(PSTR(": "));
	if (bpflag & (1 << i)) report_hex((uint32_t)bpaddr[i], 4);
	else report_pstr(PSTR(STR_OFF));
	report_nl();
}

void
go_bp()
{
	uint16_t reg;
	int8_t r;

	// Parse the breakpoint register number
	r = optional_hex_val(&reg);
	if (r < 0) return;
	else if (r > 0) {
		if (r < 0 || r >= NUM_BP) {
			badval();
			return;
		}
		
		char * s = get_arg();
		if (s != NULL) {
			// If an address has been provided, set the breakpoint
			if (s[0] == 'o' && s[1] == 'f' && s[2] == 'f') {
				bpflag &= ~(1 << reg);
			} else {
				uint16_t addr = parse_hex(s);
				if ((flags & FL_ERROR) == 0) {
					bpflag |= (1 << reg);
					bpaddr[reg] = addr;
				} else {
					badval();
					return;
				}
			}
		}
		_printbp(reg);
		return;
	}

	// With no arguments, print out all the breakpoints.
	uint8_t i;
	for (i = 0; i < NUM_BP; i++) {
		_printbp(i);
	}
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
say_abus()
{
	deb_sample(0);
	report_hex_value(PSTR(STR_ABUS), get_ab(), 4);
}


static void
say_dbus()
{
	deb_sample(0);
	report_hex_value(PSTR(STR_DBUS), get_db(), 4);
}


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
		report_hex_value(PSTR(STR_GSAC), get_ac(), 4);
		if (r) check_mismatch(w, get_ac());
		return;
	case REG_PC:
		report_hex_value(PSTR(STR_GSPC), get_pc(), 4);
		if (r) check_mismatch(w, get_pc());
		return;
	case REG_IR:
		report_hex_value(PSTR(STR_GSIR), get_ir(), 4);
		if (r) check_mismatch(w, get_ir());
		return;
	}
}


static void
gs_ac()
{
	// Need a processor
	if (!assert_proc_present()) return;
	_reg(REG_AC);
}


static void
gs_pc()
{
	// Need a processor
	if (!assert_proc_present()) return;
	_reg(REG_PC);
}


static void
gs_ir()
{
	// Need a processor
	if (!assert_proc_present()) return;
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
	if (!assert_halted()) return;

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

	if (a >= 0x0100 && a < 0x120) {
		report_pstr(PSTR(STR_NSELF));
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

	perform_write(SPACE_IO, a, v);
	
	report_pstr(PSTR(STR_OUT1));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_OUT2), v, 4);
}


static void
go_in()
{
	if (!assert_halted()) return;

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

	uint16_t v = perform_read(SPACE_IO, a);
	
	report_pstr(PSTR(STR_IN1));
	report_hex(a, 4);
	report_hex_value(PSTR(STR_IN2), v, 4);
}


void
go_ifr1()
{
	set_irq1(1);
	report_pstr(PSTR(STR_IFR1));
}


void
go_ifr6()
{
	set_irq6(1, 1);
	report_pstr(PSTR(STR_IFR6));
}


static void
go_read()
{
	if (!assert_halted()) return;

	uint16_t val = perform_read(SPACE_MEM, addr);
	if (flags & (FL_ERROR|FL_EOL)) return;

	report_hex_value(PSTR(STR_READ), (uint32_t)val, 4);
	addr++;
}


static void
go_write()
{
	if (!assert_halted()) return;

	int8_t res;
	uint16_t v;
	uint32_t cksum = 0;
	uint8_t first = 1;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		// Ensure the bus is quiet. 
		if (!assert_halted()) return;

		start_block_write(SPACE_MEM);
		while ((res = optional_hex_val(&v)) > 0) {
			first = 0;
			perform_block_write(addr, v);
			addr++;
			cksum += v;
		}
		end_block_write();
	}
	
	if (res < 0) return;
	if (first) {
		badsyntax();
		return;
	}
	report_hex_value(PSTR(STR_CKSUM), cksum, 4);
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

	flags |= FL_BUSY;
	while (count--) {
		if (perform_write(SPACE_MEM, addr, val) == 0) return;
		addr++;

		if ((addr & 0xff) == 0) {
			report_hex_value(PSTR(STR_ADDR), addr, 4);
		}
#ifdef HOST
		if (query_char(10)) {
			cancel();
			return;
		}
#endif // HOST
		
		if (flags & FL_BREAK) {
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

	flags |= FL_BUSY;
	for (i = 0; i < count; i += 8, addr += 8) {
		if (!perform_block_read(addr, 8, buf)) break;
		
		// Break requested?
		if (flags & FL_BREAK) {
			cancel();
			return;
		}

		// Address
		report_hex(addr, 4);
		report_pstr(PSTR(": "));

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
			if (buf[j] & 0x80) style_hibit();
			if(x >= 32 && x < 127) report_char(x);
			else report_char('.');
			style_normal();

			if ((buf[j] >> 8) & 0x80) style_hibit();
			x = (buf[j] >> 8) & 0x7f;
			if(x >= 32 && x < 127) report_char(x);
			else report_char('.');
			style_normal();
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



static void
go_disassemble()
{
	uint32_t i;
	uint16_t count = 0x10;

	// Ensure the bus is quiet.
	if (!assert_halted()) return;

	if (optional_hex_val(&count) < 0) return;

	flags |= FL_BUSY;
	for (i = 0; i < count; i++) {
		uint16_t w = perform_read(SPACE_MEM, addr++);

		// Break requested?
		if (flags & FL_BREAK) {
			cancel();
			return;
		}

		// Address
		report_hex(addr, 4);
		report_pstr(PSTR(":\t"));

		// Disassemble code
		_disassemble(w);
		report_pstr(PSTR("\t; &"));
		report_hex(w, 4);
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



static void
go_dump_bin()
{
	uint32_t i, sum = 0;
	uint16_t count = 0x80;
	uint16_t buf[8];
	uint8_t j;

	// Ensure the bus is quiet.
	if (!assert_halted()) return;

	if (optional_hex_val(&count) < 0) return;

	report_pstr(PSTR(STR_DUMP));
	flags |= FL_BUSY;
	for (i = 0; i < count; i += 8, addr += 8) {
		if (!perform_block_read(addr, 8, buf)) break;
		for (j = 0; j < 8; j++) {
			report_char(buf[j] & 0xff);
			report_char((buf[j] >> 8) & 0xff);
			sum += buf[j];
		}

		// Break requested?
#ifdef HOST
		if (query_char(10)) {
			cancel();
			break;
		}
#else // if AVR
		if (flags & FL_BREAK) {
			cancel();
			return;
		}
#endif // AVR
	}

	done();
	report_hex_value(PSTR(STR_CKSUM), sum, 4);
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
	report_bool_value(PSTR(STR_GSHOF), (flags & FL_HOF) != 0);
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
	style_info();
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


static
void
go_dfps()
{
	// Report as much of the DFP status as we know.

	// We'll be calling some of the getters/setters which check for
	// optional arguments. Force getting (not setting) by clearing the
	// buffer.
	
	buf[buflen = 0] = '\0';

	say_version();
	say_bufsize();
	say_proc();
	gs_term();
	gs_echo();
	gs_mesg();
	gs_lock();
	
	gs_hof();
	gs_hos();
	gs_addr();
	gs_or();
	say_sr();
	say_abus();
	say_dbus();
	go_sws();
}



///////////////////////////////////////////////////////////////////////////////
//
// COMMAND HANDLING
//
///////////////////////////////////////////////////////////////////////////////


// static void
// go_nop()
// {
// #ifdef HOST
// 	printf("*** Implement this command.\n");
// #endif // HOST
// }
// #define gs_nop go_nop


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
	report_pstr(PSTR("\n201 \n"
			 "201 Ctrl-C Ignore command line, stop output, abort command.\n"
			 "201 Ctrl-X Ignore command line.\n"
			 "201 Ctrl-T Toggle terminal mode.\n"
			 "201 Consult documentation for more details.\n"));
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
	style_async();
	if (flags & FL_TERM) {
		report_pstr(PSTR("\033[G\033[K"));
	} else {
		report_pstr(PSTR("***\n"));
	}
	flags |= FL_ASYNC;
}


void
proto_prompt()
{
	if (flags & FL_CONS) return; // No need to prompt in the virtual console

	style_normal();
	// report_hex(flags, 4);
	// report_char(32);
	if ((flags & FL_PROC) == 0) report_pstr(PSTR(STR_PNOPROC));
	if (flags & FL_HALT) {
		style_info();
		report_pstr(PSTR(STR_PSTOP));
		style_normal();
		report_hex(addr, 4);
		report_pstr(PSTR(STR_PROMPT));
	} else {
		report_pstr(PSTR(STR_PRUN));
	}
	style_input();
	
	// If echo is on, print out the current input buffer. The
	// buffer may have been left intact before the prompt is
	// printed for, e.g. prompt redrawing (Ctrl-L).
	if (flags & FL_ECHO) report_n((char *)buf, buflen);

	// If in ‘machine’ mode (echo off, term off), output a newline
	// here. The front end is line-oriented, but parses
	// prompts. This helps a bit.
	if ((flags & (FL_TERM | FL_ECHO)) == 0) report_char('\n');
}

	
void proto_loop()
{
	set_fprunstop((flags & FL_HALT) == 0);
	buf[buflen] = 0;
	for(; (flags & FL_CLEAR) == 0;) {
		proto_prompt();

		// Wait for input to be complete.
		while((flags & FL_INPOK) == 0)
		{
#ifdef HOST
			// The standalone version doesn't use asynchronous
			// input (via interrupts or an external thread), so we
			// must trigger it ourselves.
			unsigned char c = read_next_char();
			if (c) c = proto_input(c);
#endif // HOST
		}

		flags |= FL_BUSY;
		flags &= ~(FL_ERROR | FL_EOL | FL_BREAK);
		bp = 0;

		style_normal();

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
		// Restore the state of the STOP light (which the ISR blinks
		// while busy, and it may be left in the wrong state).
		set_fprunstop((flags & FL_HALT) == 0);
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
			style_async();
			report_pstr(PSTR("*** Aborted\n"));
			buflen = 0;
			flags |= FL_INPOK; // Force a Ready prompt
			return '\n';
		}
	}
	
	// Don't echo characters if we're busy.
	if (flags & FL_BUSY) return '\0';

	// Is the buffer full?
	if (buflen >= BUFSIZE) return flags & FL_ECHO ? '<' : '\0';

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

	} else if (c == ('L' - '@')) {
                // Resend the pending command line to the terminal (redraw)
		say_break();
		style_normal();
		proto_prompt();
		return 0;
	} else if (c == ('T' - '@')) {
		// Toggle the terminal bells and whistles.
		say_break();
		style_normal();
		flags ^= FL_TERM;
		report_gs(1);
		report_bool_value(PSTR(STR_GSTERM), (flags & FL_TERM) != 0);
		proto_prompt();
		return 0;
	} else if (c == 30) {
		// Controlling entity is a computer: disable human features
		say_break();
		style_normal();
		flags &= ~(FL_TERM | FL_ECHO);
		report_gs(1);
		report_bool_value(PSTR(STR_GSTERM), (flags & FL_TERM) != 0);
		report_gs(1);
		report_bool_value(PSTR(STR_GSECHO), (flags & FL_ECHO) != 0);
		report_pstr(PSTR(STR_MACHINE));
		proto_prompt();
		return 0;
	}

#ifdef HOST
	else if (c == 4) {
		printf("\n\nQuitting (only on host).\n");
		exit(0);
	}
#endif // HOST
	
	else if (c < 32 || c > 127) {
		// Ignore unprintable/control characters
		return 0;
	}

	// Store the character.
	buf[buflen++] = c;

	if (flags & FL_ECHO) {
		report_char(c);
	}
	return c;
}

uint8_t
check_mismatch(uint16_t should_be, uint16_t was)
{
	if (should_be == was) return 0;
	report_mismatch(PSTR(STR_NVMIS), should_be, was);
	return 1;
}

// End of file.
