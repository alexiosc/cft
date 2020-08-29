// -*- c -*-
// 
// proto.c — The DFP 2 protocol (command language etc.)
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL PORT PROTOCOL AND USER INTERFACE
//
///////////////////////////////////////////////////////////////////////////////

#ifdef HOST
#  include <stdio.h>
#  include <unistd.h>
#endif // HOST

#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

#ifdef AVR
#  include <avr/io.h>
#  include <avr/interrupt.h>
#  include <avr/sleep.h>
#  include <avr/wdt.h>
#  include <util/delay.h>
#  include <avr/pgmspace.h>
#endif // AVR

#include "proto.h"
#include "driver.h"
//#include "input.h"
#include "output.h"
//#include "hwcompat.h"
//#include "panel.h"
//#include "bus.h"
//#include "utils.h"

#ifdef AVR
#include <util/atomic.h>
#else
#define ATOMIC_BLOCK(x)
#endif


#ifdef HOST
#define PROGMEM
#endif // HOST

#ifdef CFTEMU
#include <pthread.h>
#include "iface.h"
#endif // CFTEMU


///////////////////////////////////////////////////////////////////////////////
//
// CONVENIENCE
//
///////////////////////////////////////////////////////////////////////////////

#define ECHO_ON (uistate.is_echo)
#define TERM_ON (uistate.is_term)
#define CTRL(c) ((c) - 64)


///////////////////////////////////////////////////////////////////////////////
//
// GLOBALS AND FORWARD DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

volatile uistate_t uistate;	// This holds the protocol state.

unsigned char buf[BUFSIZE];	// The input buffer

uint16_t bp;
uint16_t buflen;		// The current input line length
uint16_t oldbuflen;		// Length of previous input line

// This is the entire (encoded) help string, stored in Flash.

static        void say_help();
static inline void say_bufsize();
static inline void say_version();
static inline void say_proc();
void               say_break();
void proto_prompt();
static inline void say_ibus();
static inline void say_abus();
static inline void say_dbus();

char * get_arg();
uint32_t parse_hex(char *s);


///////////////////////////////////////////////////////////////////////////////
//
// PROTOCOL COMMMANDS
//
///////////////////////////////////////////////////////////////////////////////

static void say_help();
static void say_version();
static void say_bufsize();
static void gs_term();
static void gs_echo();
static void gs_mesg();
static void gs_lock();

static void gs_addr();

static void go_fast();
static void go_slow();
static void go_creep();

static void gs_or();

static void go_fpr();
static void go_fpdump();
static void go_sws();
static void gs_dsr();

static void gs_ir();
static void gs_pc();
static void gs_dr();
static void gs_ac();
static void gs_sp();



// Include the pre-processed list of commands and help.
#include "proto-cmds.h"

// TODO: This is so long it scrolls the CFT's 30-line screen. And of
// course the CFT doesn't have backscroll (yet?—it's possible on the
// VDU card).
static const char _helpstr[] PROGMEM = _HELPSTR;


///////////////////////////////////////////////////////////////////////////////
//
// RECEIVE A CHARACTER
//
///////////////////////////////////////////////////////////////////////////////

// This is the protocol entry point, called directly by the ISR. Keep
// it as brief as can be.

unsigned char
proto_input(unsigned char c)
{
	uistate.async_received = 0;
#ifdef AVR
	// Is the virtual console being used? If so, flag the
	// character and exit. The go_cons() loop will take care of
	// the rest (we've been called by the ISR, so we're running on
	// a separate 'thread').
	if (uistate.in_console) {
		uistate.is_inpok = 1;
		buf[0] = c;
		return c;
	}

#endif // AVR
	
	// Allow breaks at all times.
	if (c == CTRL('C') || c == CTRL('X')) {
		// Cancel input or operation (ASCII 24, Ctrl-X or Ctrl-C)
		if (hwstate.is_busy) {
			uistate.is_break = 1;
		} else {
			style_async();
			report_pstr(PSTR("*** Aborted\n"));
			buflen = 0;
			uistate.is_inpok = 1; // Force a Ready prompt
			return '\n';
		}
	}
	
	// Don't echo characters if we're busy.
	if (hwstate.is_busy) return '\0';

	// Is the buffer full?
	if (buflen >= BUFSIZE) return ECHO_ON ? '<' : '\0';

	// Allow an old buffer to be repeated, but only if the repeat
	// character is the first character received on the new
	// line. Use Control N and Control P.
	if ((c == CTRL('N') || c == CTRL('P')) && oldbuflen) {
		buflen = oldbuflen;

		// Change nulls before the end of the buffer back to spaces.
		for (bp = 0; bp < oldbuflen; bp++) {
			if (buf[bp] == '\0') buf[bp] = 32;
		}

		style_info();
		report_pstr(PSTR("(repeat) "));
		style_input();
		report((char*)buf);

		goto char_enter;
	}

	// End of line? (ignore multiple ones and blank lines)
	if (c == CTRL('J') || c == CTRL('M')) {
	char_enter:
		uistate.is_inpok = 1;
		oldbuflen = buflen;
		if (ECHO_ON) {
			serial_write('\r');
			serial_write('\n');
			return '\n';
		}
		return 0;
	} else if ((c == CTRL('H')) || (c == 127)) {
		if (buflen) {
			buflen--;
			oldbuflen = 0; // Invalidate the previous line.
			if (ECHO_ON) report_pstr(PSTR("\b \b"));
		}
		return 0;

	} else if (c == CTRL('L')) {
                // Resend the pending command line to the terminal (redraw)
		say_break();
		style_normal();
		proto_prompt();
		return 0;
	} else if (c == CTRL('T')) {
		// Toggle the terminal bells and whistles.
		say_break();
		style_normal();
		uistate.is_term = !uistate.is_term;
		report_gs(1);
		report_bool_value(PSTR(STR_GSTERM), uistate.is_term);
		proto_prompt();
		return 0;
	} else if (c == 30) {
		// Controlling entity is a computer: disable human features
		say_break();
		style_normal();
		uistate.is_term = 0;
		uistate.is_echo = 0;
		report_gs(1);
		report_bool_value(PSTR(STR_GSTERM), uistate.is_term);
		report_gs(1);
		report_bool_value(PSTR(STR_GSECHO), uistate.is_echo);
		report_pstr(PSTR(STR_MACHINE));
		proto_prompt();
		return 0;
	}

#ifdef HOST
	else if (c == CTRL('D')) {
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
	oldbuflen = 0;		// Invalidate the previous line.

	// Echo the character
	if (ECHO_ON) {
		report_char(c);
	}
	return c;
}


///////////////////////////////////////////////////////////////////////////////
//
// BASIC PROTOCOL FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////


// Initialise the UI.
void
proto_init()
{
	uistate.is_mesg = 1;
	uistate.is_term = 1;
	uistate.is_echo = 1;

	hwstate.is_busy = 1;

	say_version();
	report_pstr(PSTR(BANNER));
	say_bufsize();
	say_proc();
	buflen = 0;
	hwstate.is_busy = 0;
	uistate.addr = 0;
}


// Print the UI prompt.
void
proto_prompt()
{
	if (uistate.in_console) return; // No need to prompt in the virtual console

	style_normal();
	// report_hex(flags, 4);
	// report_char(32);

	// TODO: Reinstate this.
	// if ((flags & FL_PROC) == 0) report_pstr(PSTR(STR_PNOPROC));
	if (hwstate.is_halted) {
		style_info();
		report_pstr(PSTR(STR_PSTOP));
		style_normal();
		report_hex(uistate.addr, 6);
		report_pstr(PSTR(STR_PROMPT));
	} else {
		report_pstr(PSTR(STR_PRUN));
	}
	style_input();

	// If echo is on, print out the current input buffer. The
	// buffer may have been left intact before the prompt is
	// printed for, e.g. prompt redrawing (Ctrl-L).
	if (ECHO_ON) report_n((char *)buf, buflen);

	// If in ‘machine’ mode (echo off, term off), output a newline
	// here. The front end is line-oriented, but parses
	// prompts. This helps a bit.
	if (uistate.is_echo == 0 && uistate.is_term == 0) report_nl();
}


// The main protocol loop, and essentially the main µCU loop too. This
// receives characters asynchronously from the serial port ISR via the
// proto_input() function.

void proto_loop()
{
	// TODO: examine this on running hardware and reinstate or delete.
	//set_fprunstop((flags & FL_HALT) == 0);
	buf[buflen] = 0;
	oldbuflen = 0;
	buflen = 0;

	for(;;) {
		proto_prompt();

		// Wait for input to be complete.
		while(!uistate.is_inpok) {
			wdt_reset();
#ifdef AVR
			uint8_t c;
			//unsigned char cn = '0' + ringbuf_get(&c);
			//serial_write(cn);
			//continue;
			if (ringbuf_get(&c) == ERR_SUCCESS) {
				//serial_write('<');
				proto_input(c);
				//serial_write('>');
			}
#endif //AVR
			
#ifdef HOST
			// The standalone version can't receive characters
			// asynchronously via interrupts, so we must block and
			// read/process characters synchronously, here.
			unsigned char c = read_next_char();
			if (c) c = proto_input(c);
#endif // HOST
			
#ifdef CFTEMU
			// The AVR sleeps for 35.56ms between samples, so we do
			// the same. Note that this adds a maximum of 35.56ms
			// between sending the DFP a command and it responding,
			// though.
			usleep(35560);
			run_timer_interrupt();
#endif // CFTEMU			
		}

		hwstate.is_busy = 1;
		uistate.is_error = 0;
		uistate.is_eol = 0;
		uistate.is_break = 0;
		bp = 0;

		style_normal();

		// Process the input
		//...
		//report_pstr(PSTR("BUSY...\n"));
		buf[buflen]=0;

		if(uistate.is_error) {
			goto error;
		}

		int i;
		char *s = get_arg();
		if (s == NULL) {
			buflen = 0;
		}
		if (!buflen) {
			report_pstr(PSTR(STR_READY));
			goto done;
		}

#ifdef AVR
		for(i=0; (uint16_t) pgm_read_word(&(cmds[i].handler)) != -1; i++)
#else
		for(i=0; cmds[i].handler != (void *)-1; i++)
#endif // AVR
		{
			if(!strncmp_P(s, cmds[i].cmd, CMD_SIZE)) {
				void (*handler)() = (void *)pgm_read_word(&(cmds[i].handler));
				(*handler)();
				goto done;
			}
		}

		// If we get to this point, it's an unknown command.
		report_pstr(PSTR(STR_BADCMD));
		goto done;
		
	error:
		report_pstr(PSTR("???\n"));
		goto done;
		
	done:
		// Clear the input okay and busy bits.
		buflen = 0;
		uistate.is_inpok = 0;
		hwstate.is_busy = 0;
		uistate.is_break = 0;
		
		// Restore the state of the STOP light (which the ISR blinks
		// while busy, and it may be left in the wrong state).
		// TODO: Restore this.
		// set_fprunstop((flags & FL_HALT) == 0);
	}
}


///////////////////////////////////////////////////////////////////////////////
//
// SOME BASIC STUFF WE PRINT OUT
//
///////////////////////////////////////////////////////////////////////////////


static inline void
say_done()
{
	report_pstr(PSTR(STR_DONE));
}


static inline void
say_version()
{
	report_pstr(PSTR(STR_VERSION));
}


static inline void
say_bufsize()
{
	report_hex_value(PSTR(STR_BUFSIZE), BUFSIZE, 3);
}


// TODO: This differs on the DFP2. Rewrite.
static inline void
say_proc()
{
	report_pstr(PSTR(STR_NIMPL));
	//report_pstr(flags & FL_PROC ? PSTR(STR_PROC1) : PSTR(STR_PROC0));
}


void inline
say_cancel()
{
	say_break();
	report_pstr(PSTR(STR_ABORT));
}


void
say_break()
{
	if (uistate.in_console) return; // It's not asynchronous in the console.
	style_async();
	if (uistate.is_term) {
		report_pstr(PSTR("\033[G\033[K"));
	} else {
		report_pstr(PSTR("***\n"));
	}
	uistate.async_received = 1;
}


// Decode and print out a help string. This is more complex than it
// sounds, since we have to cater to both AVR (where the string is
// stored in Flash and must be retrieved character-by-character) and
// full-blown computers. Special characters in the help string are
// decoded. This is a simple form of compression.
static void
say_help()
{
	int i;
	char * hp = (char *)_helpstr;

#ifdef HOST
	int maxc = 0, maxd = 0;
#endif // HOST
	
	report_pstr(PSTR("201 Available commands:"));
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
	// This is for debugging!
	printf("*** There are %d commands.\n", i);
	printf("*** Longest command name: %d chars\n", maxc);
	printf("*** Longest help test:    %d chars\n", maxd);
	printf("*** Sizeof(cmds):         %lu\n", sizeof(cmds));
#endif
}


///////////////////////////////////////////////////////////////////////////////
//
// BASIC INPUT HANDLING
//	
///////////////////////////////////////////////////////////////////////////////


// This 
	
void
badval()
{
	style_error();
	report_pstr(PSTR(STR_BADVAL));
}


void
badsyntax()
{
	style_error();
	report_pstr(PSTR(STR_SYNTAX));
}


char *
get_arg()
{
	register uint16_t i, j;

	// Is there any input left?
	if (bp >= buflen) {
		uistate.is_eol = 1;
		return NULL;
	}
	
	// Skip blanks.
	for (i=bp ; i < buflen; i++) {
		if (buf[i] != ' ') break;
	}
	if (i >= buflen) {
		uistate.is_eol = 1;
		return NULL;
	}
	// Set the origin to the first non-blank character.
	j = i;

	// Now skip non-blanks.
	for (; i < buflen; i++) {
		if (buf[i] == ' ') break;
	}
	if (i < buflen) {
		buf[i] = '\0';
	}
	
	// Set the buf pointer past the \0.
	bp = i + 1;

#if 0
	report("Got: (");
	report(&buf[j]);
	report("), flags=");
	report_hex(flags, 2);
	report_nl();
#endif
	
	return (char*)&buf[j];
}


int32_t
get_addr()
{
	register char * s = get_arg();
	register uint32_t n;

	if (uistate.is_eol) return -1;

	if (uistate.is_error == 0) {
		n = parse_hex(s);
		if (uistate.is_error == 0) return n;
	}

	// Whoops, there was a parse error.
	uistate.is_error = 1;
	badval();
	return -1;
}


uint32_t
parse_hex(char *s)
{
	register uint32_t x;
	x = 0;
	while (*s) {
		x = x << 4;
		if ((*s) >= '0' && (*s) <= '9') x |= (*s - 48);
		else if ((*s) >= 'a' && (*s) <= 'f') x |= (*s - 87);
		else if ((*s) >= 'A' && (*s) <= 'F') x |= (*s - 55);
		else {
			uistate.is_error = 1;
			return 0;
		}
		s++;
	}
	return x;
}


char
parse_bool(char *s)
{
	// Minimalist parser for (0/1/on/off/true/false)
	if (s[0] == '0') return 0; // 0
	if (s[0] == 'f') return 0; // false
	if (s[0] == 'o' && s[1] == 'f') return 0; // off
	if (s[0] == 'n') return 0; // no
	return 1;
}


int8_t
optional_bool_val(uint8_t * bool)
{
	char * s = get_arg();
	if (s == NULL) return 0;

	*bool = parse_bool(s);
	if (uistate.is_error) {
		badval();
		return -1;
	}
	return 1;
}


int8_t
optional_hex_val(uint16_t * word)
{
	char * s = get_arg();
	if (s == NULL) return 0;

	*word = parse_hex(s);
	if (uistate.is_error) {
		badval();
		return -1;
	}
	return 1;
}


///////////////////////////////////////////////////////////////////////////////
//
// ASSERTIONS AND SANITY CHECKS
//
///////////////////////////////////////////////////////////////////////////////

uint8_t
assert_halted()
{
	report_pstr(PSTR("assert_halted() not implemented"));
	return 1;

// 	// Ensure it's stopped.
// 	if ((flags & FL_HALT) == 0) {
// 		style_error();
// 		report_pstr(PSTR(STR_RUNNING));
// 		flags |= FL_ERROR;
// 		return 0;
// 	} else {
// 		// The ustep command leaves the processor with its clock
// 		// stopped but NOT halted (so the microcode vectors can be
// 		// examined). The FL_HALT flag is still set though, so whenever
// 		// we're in FL_HALT mode and a command needs the processor to
// 		// be halted by calling us, we halt it here. The clock should
// 		// be stopped already, so no need to wait for a full
// 		// halt. We're just tristating the control lines.
// #ifdef AVR
// 		defercb = 0;	// Force NHALT#.
// #endif // AVR
// 		set_halt(1);
// 	}
	
// 	// Check for bus chatter.
// 	if (buschatter()) {
// 		style_error();
// 		report_pstr(PSTR(STR_CHATTER));
// 		flags |= FL_ERROR;
// 		return 0;
// 	}

// 	return 1;
}


static bool_t
_assert_board_present(uint8_t have_board, char * msg)
{
	if (have_board) return 1;
	style_error();
	report_pstr(msg);
	return 0;
}

#define assert_ctl_present() _assert_board_present(hwstate.have_ctl, PSTR(STR_NOCTL))
#define assert_reg_present() _assert_board_present(hwstate.have_reg, PSTR(STR_NOREG))
#define assert_alu_present() _assert_board_present(hwstate.have_alu, PSTR(STR_NOALU))
#define assert_bus_present() _assert_board_present(hwstate.have_bus, PSTR(STR_NOBUS))


uint8_t
check_mismatch(uint16_t should_be, uint16_t was)
{
	if (should_be == was) return 0;
	report_mismatch(PSTR(STR_NVMIS), should_be, was);
	return 1;
}


///////////////////////////////////////////////////////////////////////////////
//
// GET AND SET ON/OFF SETTINGS
//
///////////////////////////////////////////////////////////////////////////////

static void
gs_echo()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) uistate.is_echo = v ? 1 : 0;
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSECHO), uistate.is_echo != 0);
}



static void
gs_mesg()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) uistate.is_mesg = v ? 1 : 0;
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSMESG), uistate.is_mesg != 0);
}



static void
gs_term()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) uistate.is_term = v ? 1 : 0;
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSTERM), uistate.is_echo != 0);
}



static void
gs_lock()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) uistate.is_locked = v ? 1 : 0;
	// Report current setting.
	report_gs(res);
	report_bool_value(PSTR(STR_GSLOCK), uistate.is_locked != 0);
}


///////////////////////////////////////////////////////////////////////////////
//
// CFT RUN CONTROL
//
///////////////////////////////////////////////////////////////////////////////


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


///////////////////////////////////////////////////////////////////////////////
//
// FRONT PANEL FUNCTIONALITY
//
///////////////////////////////////////////////////////////////////////////////


static void
go_fpr()
{
	// Parse addr
	char * s = get_arg();
	if (s == NULL) {
		badsyntax();
		return;
	}
	
	uint16_t a = parse_hex(s);
	if (uistate.is_error) {
		badval();
		return;
	}

	if (a < 0 || a > 0xff) {
		style_error();
		report_pstr(PSTR(STR_ERANGE));
		return;

	}

	uint16_t v = read_dfp_address((xmem_addr_t) a);

	report_pstr(PSTR(STR_FPR1));
	report_hex(a, 2);
	report_hex_value(PSTR(STR_FPR2), v, 2);
}


static void
go_fpdump()
{
	for (uint8_t r = 0; r < 16; r++) {
		report_hex(r << 4, 2);
		report_pstr(PSTR("|"));
		for (uint8_t c = 0; c < 16; c++) {
			uint8_t v = read_dfp_address((xmem_addr_t) ((r << 4) | c));
			report_pstr(PSTR(" "));
			report_hex(v, 2);
		}
		report_nl();
	}
	report_pstr(PSTR(STR_DONE));
}


static void
go_sws()
{
	// The AVR driver reads and debounces switches in an ISR that runs at
	// 60Hz. But we also call this synchronous hook in case another drivers
	// needs it.
	sw_read();
	report_pstr(PSTR(STR_SWS));

	for (uint8_t i = 0; i < 8; i++) {
		report_bin_pad(hwstate.switches[i], 8);
		report_c(32);
	}
	report_nl();
}

// Get or set (override) the DIP Switch Register.
void
gs_dsr()
{
	char * s = get_arg();
	if (s != NULL) {
		if (s[0] == '-') {
			// Read the DSR from the physical switches.
			hwstate.dsr = DSR_HIGH | read_dfp_address(XMEM_DSR);
		} else {
			uint16_t x = parse_hex(s);
			if (uistate.is_error == 0) {
				hwstate.dsr = x;
			} else {
				badval();
				return;
			}
		}
		report_gs(1);
	} else {
		report_gs(0);
	}
	report_hex_value(PSTR(STR_DSR), hwstate.dsr, 4);
}


///////////////////////////////////////////////////////////////////////////////
//
// MEMORY AND I/O TOOLSET
//
///////////////////////////////////////////////////////////////////////////////

// Get or set the current address.
void
gs_addr()
{
	char * s = get_arg();
	if (s != NULL) {
		uint16_t x = parse_hex(s);
		if (uistate.is_error == 0) {
			uistate.addr = x;
		} else {
			badval();
			return;
		}
		report_gs(1);
	} else {
		report_gs(0);
	}
	report_hex_value(PSTR(STR_ADDR), uistate.addr, 4);
}


///////////////////////////////////////////////////////////////////////////////
//
// FRONT PANEL AND VIRTUAL FRONT PANEL
//
///////////////////////////////////////////////////////////////////////////////


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


static void
say_abus()
{
	read_full_state();
	report_pstr(PSTR(STR_ABUS));
	report_hex(hwstate.ab_h, 2);
	report_char(':');
	report_hex((hwstate.ab_m << 8) | hwstate.ab_l, 4);
	report_nl();
}


static void
say_dbus()
{
	read_full_state();
	report_pstr(PSTR(STR_DBUS));
	report_hex((hwstate.db_h << 8) | hwstate.db_l, 4);
	report_nl();
}


static void
say_ibus()
{
	read_full_state();
	report_pstr(PSTR(STR_IBUS));
	report_hex((hwstate.ibus_h << 8) | hwstate.ibus_l, 4);
	report_nl();
}


///////////////////////////////////////////////////////////////////////////////
//
// REGISTERS
//
///////////////////////////////////////////////////////////////////////////////


static void
_reg(reg_t reg)
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
	case reg_ir:
		report_hex_value(PSTR(STR_GSIR), get_ir(), 4);
		if (r) check_mismatch(w, get_ir());
		return;
	case reg_pc:
		report_hex_value(PSTR(STR_GSPC), get_pc(), 4);
		if (r) check_mismatch(w, get_pc());
		return;
	case reg_dr:
		report_hex_value(PSTR(STR_GSDR), get_dr(), 4);
		if (r) check_mismatch(w, get_dr());
		return;
	case reg_ac:
		report_hex_value(PSTR(STR_GSAC), get_ac(), 4);
		if (r) check_mismatch(w, get_ac());
		return;
	case reg_sp:
		report_hex_value(PSTR(STR_GSSP), get_sp(), 4);
		if (r) check_mismatch(w, get_sp());
		return;
	}
}


static void
gs_ir()
{
	// The IR is on the CTL board.
	if (!assert_ctl_present()) return;
	_reg(reg_ir);
}


static void
gs_pc()
{
	// Need the REG board
	if (!assert_reg_present()) return;
	_reg(reg_pc);
}


static void
gs_dr()
{
	// Need the REG board
	if (!assert_reg_present()) return;
	_reg(reg_dr);
}


static void
gs_ac()
{
	// Need the REG board
	if (!assert_reg_present()) return;
	_reg(reg_ac);
}


static void
gs_sp()
{
	// Need the REG board
	if (!assert_reg_present()) return;
	_reg(reg_sp);
}







///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


#if 0

///////////////////////////////////////////////////////////////////////////////
//
// STILL TO CHECK AND ADAPT!
//
///////////////////////////////////////////////////////////////////////////////

uint16_t bpaddr[NUM_BP];
uint8_t  bpflag = 0;



//uint8_t progress[5] = {0, 1, 3, 7, 15};

// TODO: This has gone away, replace with something that makes more sense. 

// static bool_t
// assert_proc_present()
// {
// // #warning "Remove this line."
// // 	return 1;
//
// 	if (flags & FL_PROC) return 1;
// 	style_error();
// 	report_pstr(PSTR(STR_NOPROC));
// 	return 0;
// }


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#if 0





///////////////////////////////////////////////////////////////////////////////
//
// LEFT SWITCH BANK
//
///////////////////////////////////////////////////////////////////////////////

void
go_reset()
{
	uint8_t v;
	int8_t res;
	res = optional_bool_val(&v);
	if (res < 0) return;
	if (res > 0) {
		if (v) {
#ifdef AVR
			// The optional argument has been specified. Perform a
			// cold boot using the AVR watchdog.
			report_pstr(PSTR(STR_COLD));
			wdt_enable(0);
			cli();
			for(;;)hold();
#else
			printf("*** COLD RESET NOT IMPLEMENTED ***\n");
#endif
		}
	}

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
		set_halt(1);
		if (flags & FL_MESG) {
			style_error();
			report_pstr(PSTR(STR_ALRHALT));
		}
		return;
	}
	flags |= FL_BUSY;

	// First, enable HALT to tristate the processor. Then, set STEP/RUN#
	// high which will take the step/run state machine out of RUN state and
	// into the STEP state. In turn, this will stop the clock at the
	// beginning of the fetch state of the fetch-execute cycle. With the
	// clock stopped, we'll have entered the STOP state.

	set_stopping();		// Set STEP/RUN# to STEP
 	wait_for_halt(0);	// Wait until the clock has been stopped
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
	if (flags & FL_MESG) {
		//say_break();
		report_pstr(PSTR(STR_AHALTED));
		if (uistate.async_received) {
			style_normal();
			proto_prompt();
		}
	}

	// Also cancel stepping or tracing.
	abort_stepping = 1;
}

void
go_run(){
	if ((flags & FL_HALT) == 0) {
		style_error();
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
_disassemble(uint16_t w, uint8_t brief)
{
	uint8_t op = w >> 12;
	uint8_t i = w & 0x800 ? 1 : 0;
	uint8_t r = w & 0x400 ? 1 : 0;
	uint8_t ofs = 0;
	uint8_t pad = 9;
	uint8_t len = 3;
	uint8_t mem_access = 1;

	switch (op) {
	case 0:
		len = 4;
		break;
	case 1:
		ofs = OFS_IOT;
		mem_access = 0;
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
		mem_access = 0;
		break;
	case 5:
		ofs = OFS_OUT;
		mem_access = 0;
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
		mem_access = 0;
		break;
	case 13:
		if (i == 0) {
			ofs = OFS_OP2;
			mem_access = 0;
		} else {
			ofs = OFS_POP;
			i = 0;
		}
		break;
	case 14:
		ofs = OFS_ISZ;
		break;
	case 15:
		if (i == 0) {
			ofs = OFS_LIA;
			mem_access = 0;
		} else {
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
	
	if (brief) return;

	// If it's a page-local memory access, show the actual address too.
	if (mem_access) {
		report_pstr(PSTR("\t; [&"));
		report_hex((addr & 0xfc00) | (w & 0x3ff), 4);
		report_pstr(PSTR("] &"));
	} else {
		report_pstr(PSTR("\t;         &"));
	}
	report_hex(w, 4);

}

#endif // DISASSEMBLE


static void
_machine_state()
{
	//virtual_panel_sample(0);
	
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
	_disassemble(get_ir(), 1);
#endif // DISASSEMBLE
}


//static char * _strdis PROGMEM = "memio[ar]ALU.AGLPCDRACaddandorxorrollnotcs1cs2 <- ARIR";

// Note: all of these are normally active low on the processor, but
// the signals buffered for the front panel are inverted to simplify
// the display, and the DFP reads these (now active high) signals.

#define IS_END(x)   ((x) & 0x800000)
#define IS_WEN(x)   ((x) & 0x400000)
#define IS_R(x)     ((x) & 0x200000)
#define IS_MEM(x)   ((x) & 0x100000)
#define IS_IO(x)    ((x) & 0x080000)
#define IS_DEC(x)   ((x) & 0x040000)
#define IS_STPAC(x) ((x) & 0x020000)
#define IS_STPDR(x) ((x) & 0x010000)
#define IS_INCPC(x) ((x) & 0x008000)
#define IS_CLI(x)   ((x) & 0x004000)
#define IS_STI(x)   ((x) & 0x002000)
#define IS_CLL(x)   ((x) & 0x001000)
#define IS_CPL(x)   ((x) & 0x000800)

#define GET_OPIF(x)  (((x) & 0x780) >> 7)
#define GET_WUNIT(x)  (((x) & 0x70) >> 4)
#define GET_RUNIT(x)  ((x) & 0xf)

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
	uint8_t have_dest = 0;

	{
		uint16_t x = (u >> 16) & 0xffff;
		report_bin_pad(x, 8);
		x = u & 0xffff;
		report_bin_pad(x, 16);
		report_pstr(PSTR(" "));
	}
	
	if(IS_MEM(u) && !IS_WEN(u) && !IS_R(u)) {
		report_pstr(PSTR("mem?? "));
	}
	if(IS_IO(u) && !IS_WEN(u) && !IS_R(u)) {
		report_pstr(PSTR("io?? "));
	}

	if (IS_WEN(u)) {
		if (IS_MEM(u)) {
			report_pstr(PSTR("mem[ar] <- "));
			have_dest = 1;
		} else if (IS_IO(u)) {
			report_pstr(PSTR("io[ar] <- "));
			have_dest = 1;
		}
	} else {
		have_dest = 1;
		switch (GET_WUNIT(u)) {
		case 0:
			// Idle
			have_dest = 0;
			break;
		case 2:
			report_pstr(PSTR("AR <- "));
			break;
		case 3:
			report_pstr(PSTR("PC <- "));
			break;
		case 4:
			report_pstr(PSTR("IR <- "));
			break;
		case 5:
			report_pstr(PSTR("DR <- "));
			break;
		case 6:
			report_pstr(PSTR("AC <- "));
			break;
		case 7:
			report_pstr(PSTR("ALU.b <- "));
			break;
		default:
			report_pstr(PSTR("?? <- "));
			break;
		}
	}

	if (IS_R(u)) {
		if (IS_MEM(u)) {
			report_pstr(PSTR("mem[ar] "));
			have_dest = 0;
		} else if (IS_IO(u)) {
			report_pstr(PSTR("io[ar] "));
			have_dest = 0;
		} else if (have_dest) {
			report_pstr(PSTR("?? "));
		}
	} else {
		if (GET_RUNIT(u) & 8) report_pstr(PSTR("ALU."));
		uint8_t ru = GET_RUNIT(u);
		switch (ru) {
		case 0:
			// Idle.
			break;
		case 2:
			report_pstr(PSTR("AGL "));
			break;
		case 3:
			report_pstr(PSTR("PC "));
			break;
		case 4:
			report_pstr(PSTR("DR "));
			break;
		case 5:
			report_pstr(PSTR("AC "));
			break;
		case 8:
			report_pstr(PSTR("add "));
			break;
		case 9:
			report_pstr(PSTR("and "));
			break;
		case 10:
			report_pstr(PSTR("or "));
			break;
		case 11:
			report_pstr(PSTR("xor "));
			break;
		case 12:
			report_pstr(PSTR("roll "));
			break;
		case 13:
			report_pstr(PSTR("not "));
			break;
		case 14:
			report_pstr(PSTR("cs1 "));
			break;
		case 15:
			report_pstr(PSTR("cs2 "));
			break;
		default:
			report_pstr(PSTR("?? "));
			break;
		}
		if (ru) have_dest = 0;
	}

	// Unknown source?
	if (have_dest) report_pstr(PSTR("?? "));

	if (GET_OPIF(u)) report_pstr(PSTR("if"));

	if (GET_OPIF(u) > 0 && GET_OPIF(u) <= 7) {
		report_pstr(PSTR("-IR"));
		report_char('2' + GET_OPIF(u));
		report_char(' ');
	} else {
		switch (GET_OPIF(u)) {
		case 0:
			// Idle.
			break;
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
		report_char(' ');
	}

	if (IS_CPL(u)) report_pstr(PSTR("CPL "));
	if (IS_CLL(u)) report_pstr(PSTR("CLL "));
	if (IS_STI(u)) report_pstr(PSTR("STI "));
	if (IS_CLI(u)) report_pstr(PSTR("CLI "));
	if (IS_INCPC(u)) report_pstr(PSTR("PC+ "));
	if (IS_STPDR(u)) {
		report_pstr(IS_DEC(u) ? PSTR("DR- ") : PSTR("DR+ "));
	}
	if (IS_STPAC(u)) {
		report_pstr(IS_DEC(u) ? PSTR("AC- ") : PSTR("AC+ "));
	}
	if (IS_END(u)) report_pstr(PSTR("END"));
}


static void
go_state()
{
	if (!assert_proc_present()) return;
	virtual_panel_sample(0);
	report_pstr(PSTR(STR_STATE));
	_machine_state();
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
	hwstate.is_busy = 1;
	uistate.in_console_busy = 1;
	uistate.is_inpok = 0;
	uistate.is_break = 0;

	while ((flags & (FL_INPOK | FL_BREAK)) == 0) {
		wdt_reset();
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
		wdt_reset();
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
	abort_stepping = 0;
	while (endless || i--) {
		wdt_reset();

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
	
		// Allow the user to interrupt. Also allow panel or bus
		// operations that halt the computer to abort multi-stepping.
#ifdef HOST
		if (query_char(10)) flags |= FL_INPOK;
#endif // HOST
		if (abort_stepping || (flags & (FL_BREAK | FL_INPOK))) {
			cancel();
			break;
		}
		
		// Front panel or bus operations that halt the computer also
		// abort multi-stepping.

		if (abort_stepping) {
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
		style_error();
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

	if (a >= 0x0100 && a < 0x120) {
		style_error();
		report_pstr(PSTR(STR_NSELF));
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

		//start_block_write(SPACE_MEM);
		while ((res = optional_hex_val(&v)) > 0) {
			wdt_reset();
			first = 0;
			perform_write(SPACE_MEM, addr, v);
			//perform_block_write(addr, v);
			addr++;
			cksum += v;
		}
		//end_block_write(SPACE_MEM);
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
	//start_block_write(SPACE_MEM);

	//drive_ab();
	//write_db(val);
	//drive_db();
	//set_mem(1);

	while (count--) {
		wdt_reset();
		//perform_block_write(addr, val);
		if (perform_write(SPACE_MEM, addr, val) == 0) return;
		
		// write_ab(addr);
		// setup();
		// setup();
		// write_db(val);
		// setup();
		// setup();
		// drive_db();
		// setup();
		// setup();
		// strobe_w();
		// tristate_db();
		
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
			//end_block_write(SPACE_MEM);
			cancel();
			goto fill_done;
		}
	}
	//end_block_write(SPACE_MEM);
	done();

fill_done:
	release_bus();
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

	// Release the bus (tristate everything, de-assert control signals)
	release_bus();

	flags |= FL_BUSY;
	for (i = 0; i < count; i += 8, addr += 8) {
		wdt_reset();
		if (!perform_block_read(addr, 8, buf)) break;
		
		// Break requested?
		if (flags & FL_BREAK) {
			release_bus();
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
	
	// Release the bus (tristate everything, de-assert control signals)
	release_bus();

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
	for (i = 0; i < count; i++, addr++) {
		wdt_reset();
		uint16_t w = perform_read(SPACE_MEM, addr);

		// Break requested?
		if (flags & FL_BREAK) {
			cancel();
			return;
		}

		// Address
		report_hex(addr, 4);
		report_pstr(PSTR(":\t"));

		// Disassemble code
		_disassemble(w, 0);
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
	for (i = 0; i < count; ) {
		wdt_reset();
		if (!perform_block_read(addr + i, 8, buf)) break;
		for (j = 0; i < count && j < 8; i++, j++) {
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
	addr += count;

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
	_disassemble(sr, 1);
#endif // DISASSEMBLE
	report_nl();
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


#endif


#endif // 0

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
