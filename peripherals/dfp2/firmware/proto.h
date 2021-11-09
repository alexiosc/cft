// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// THE SERIAL PORT PROTOCOL AND USER INTERFACE
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __PROTO_H__
#define __PROTO_H__

#include <stdint.h>

// Sanity check
#ifdef AVR
#  ifdef HOST
#    error "Both -DAVR and -DHOST have been passed to the compiler."
#  endif // HOST
#endif // AVR


///////////////////////////////////////////////////////////////////////////////
//
// USER INTERFACE STATE
//
///////////////////////////////////////////////////////////////////////////////

// Use bitfields rather than explicit flag values, and let the compiler
// optimise it.
typedef struct uistate {
	uint8_t  is_inpok:1;	    // No errors, print out a READY prompt.
	uint8_t  is_eol:1;	    // Entire input line has been parsed.
	uint8_t  is_error:1;	    // 
	uint8_t  is_break:1;	    //
	uint8_t  is_echo:1;	    // Echo is on
	uint8_t  is_term:1;	    // Terminal bells and whistles are on
	uint8_t  is_mesg:1;	    // Allow async messages
	uint8_t  is_hof:1;	    // Halt on FAIL (TODO: Move elsewhere!)
	uint8_t  is_hos:1;	    // Halt on SENTINEL  (TODO: Move elsewhere!)
	uint8_t  is_stopping:1;	    // Computer stopping
	uint8_t  async_received:1;  // Received Async message
	uint8_t  in_console:1;      // Virtual console (TTYD) running
	uint8_t  is_locked:1;       // Software lock of the front panel

	uint8_t  abort_stepping:1; // Stepping has been aborted.

        uint8_t  output_state:1;    // Expecting a style character.

	uint32_t addr;		   // The current UI address.
} uistate_t;

extern volatile uistate_t uistate;


#define BANNER0                                       \
        "202 \n"                                      \
        "202     #########.      ,################\n" \
        "202   #############,   #                #\n" \
        "202  #####'   '#####  #   ,######   #####\n" \
        "202 #####'      #######   ####  #   #\n"     \
        "202 #####                    #  #   #\n"     \
        "202 #####,      #######   ####  #   #\n"     \
        "202  #####,   ,#####  #   #     #   #\n"     \
        "202   #############   #   #     #   #\n"     \
        "202    '#########'    #####     #####\n"     \
        "202 \n"                                      \
        "202  16 BIT SOLID STATE MINI COMPUTER\n"     \
        "202 \n"                                      \
        "202  DEBUGGING FRONT PANEL CONTROLLER\n"     \
        "202 \n"                                      \

#define AUTHOR "Alexios Chouchoulas <alexios@bedroomlan.org>"
#define URL    "https://www.bedroomlan.org/cft"
#define STR_VERSION \
	"201 Version: " VERSION "+dis [" TS "]\n"

#define BANNER								\
	"202 © 2012–" THISYEAR " " AUTHOR "\n"			\
	"202 Licensed under the GNU Public License v.3.\n"		\
	"202 " URL "\n"							\
	"202 All values base 16 unless otherwise noted.\n"

#define STR_BUFSIZE "204 BufSize: "

#define report_gs(x) report_char(x ? '3' : '2')


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



// The command line buffer (also used for computer-to-computer input, so needs
// to be relatively big. Depending on MCU RAM size we usually use 512 bytes.
extern unsigned char buf[BUFSIZE];

extern uint16_t bp;

extern uint16_t buflen;

// TODO: Move this to a state struct?
//extern uint16_t addr;



void proto_init();

void proto_loop();

unsigned char proto_input(unsigned char c);

#if 0

#warning "TODO: Review and re-add these."

void say_sr();

void say_break();

void proto_prompt();

void go_reset();

void go_start();

void go_stop();

void go_run();

void go_step();

void go_ustep();

void go_fast();

void go_slow();

void go_creep();

void go_state();

void gs_lts();

uint8_t check_mismatch(uint16_t, uint16_t);

#endif // 0

#endif // _PROTO_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
