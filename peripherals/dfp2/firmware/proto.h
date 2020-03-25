// -*- indent-c -*-

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
	uint8_t  is_busy:1;	    // The DFP is busy
	uint8_t  is_hof:1;	    // Halt on FAIL (TODO: Move elsewhere!)
	uint8_t  is_hos:1;	    // Halt on SENTINEL  (TODO: Move elsewhere!)
	uint8_t  is_stopping:1;	    // Computer stopping
	uint8_t  async_received:1;  // Received Async message
	uint8_t  in_console:1;      // Virtual console (TTYD) running
	uint8_t  is_locked:1;       // Software lock of the front panel

	uint8_t  abort_stepping:1; // Stepping has been aborted.

	uint32_t addr;		   // The current UI address.
} uistate_t;

extern volatile uistate_t uistate;


#define AUTHOR "Alexios Chouchoulas <alexios@bedroomlan.org>"
#define URL    "https://www.bedroomlan.org/cft"
#define STR_VERSION \
	"201 Version: " VERSION "+dis\n"

#define BANNER								\
	"202 (c) 2012-" THISYEAR " " AUTHOR "\n"			\
	"202 Licensed under the GNU Public License v.3.\n"		\
	"202 " URL "\n"							\
	"202 All values base 16 unless otherwise noted.\n"

#define STR_BUFSIZE "204 BufSize: "

#define report_gs(x) report_char(x ? '3' : '2')


///////////////////////////////////////////////////////////////////////////////
//
// STRINGS OUTPUT BY THE PROTOCOL (STORED IN FLASH)
//
///////////////////////////////////////////////////////////////////////////////

// 1xx: Boot-time Diagnostics

// 2xx: Information retrieved
#define STR_READY   "200 Ready\n"
#define STR_MACHINE "299 T0sgQ09NUFVURVI=\n"

// 3xx: Actions performed
#define STR_DONE    "301 Done\n"
#define STR_ABORT   "302 Aborted\n"

#define STR_FAST    "327 Full speed clock.\n"
#define STR_SLOW    "328 Slow clock.\n"
#define STR_CREEP   "329 Very slow clock.\n"

// These are get/set variants, and they can be either 2xx (get) or 3xx (set).
#define STR_ADDR     "03 Address: "
#define STR_GSECHO   "10 Echo: "
#define STR_GSMESG   "11 Async messages: "
#define STR_GSTERM   "12 Terminal: "
#define STR_GSLOCK   "15 Front panel lock: "
#define STR_GSOR     "21 Output Register: "

// 5xx: Errors.
#define STR_BADCMD  "500 Unknown command\n"
#define STR_BADVAL  "501 Bad value\n"
#define STR_SYNTAX  "508 Syntax error\n"
#define STR_NIMPL   "509 Not implemented\n"

// 9xx: Diagnostic faults
#define STR_NVMIS   "910 Value mismatch. Wrote "
#define STR_WAS          ", was "

#define STR_PROMPT  "> "
#define STR_PRUN    "[running]" STR_PROMPT
#define STR_PSTOP   "[halted] "
// #define STR_PNOPROC "[no processor]"
#define STR_ON      "on"
#define STR_OFF     "off"

// The blocksize for block-oriented writes.
#define BLOCKSIZE ((BUFSIZE - 3) / 5)

#define DIVIDER "|"

// Warning: any more than 8 and the bpflag data type will have to
// change!
#define NUM_BP 8

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

#if 0
#warning "TODO: Review and potentially change these."

// #define STR_DETPROC "101 Processor: "
// #define STR_DETPROC0     "not found\n"
// #define STR_DETPROC1     "found\n"

// #define STR_D_VPIN  "102 VP Shift Reg chain: "
// #define STR_D_DEBIN "103 DEB Shift Reg chain: "
// #define STR_D_ABDRV "104 ABUS driver: "
// #define STR_D_ABTRI "105 ABUS tristate: "
// #define STR_D_DBDRV "106 DBUS driver: "
// #define STR_D_DBTRI "107 DBUS tristate: "
// #define STR_D_RSTBQ "108 Bus quiet during reset: "
// #define STR_D_ACCHK "109 AC: "
// #define STR_D_PCCHK "110 PC: "
// #define STR_D_IRCHK "111 IR: "

#define STR_D_OK    "OK\n"
#define STR_D_FAIL  "faulty\n"


// #define STR_PROC1   "205 Processor found.\n"
// #define STR_PROC0   "206 No processor.\n"
#define STR_GSHOF    "13 On FAIL: "
#define STR_GSHOS    "14 On SENTINEL: "
#define STR_HOF_H        "HALT\n"
#define STR_HOF_I        "Ignore\n"
#define STR_HOF_J        "Jump to: "

#define STR_SR      "220 Switch Register: "

#define STR_IN1     "234 IN Address: "
#define STR_IN2          " Value: "

#define STR_STATE   "250 Machine state: "
#define STR_SWS     "251 Switch state: "
#define STR_USTATE  "252 Microcode control: "
#define STR_GSAC     "53 AC: "
#define STR_GSPC     "54 PC: "
#define STR_GSIR     "55 IR: "
#define STR_GSBPT    "59 Breakpoint "

#define STR_AC           " AC:"
#define STR_PC           " PC:"
#define STR_IR           " IR:"

#define STR_ABUS    "260 ABUS: "
#define STR_DBUS    "261 DBUS: "


#define STR_DUMP    "300 Dumping\n"

#define STR_CKSUM   "303 Checksum: "

//                   310-321 reserved
#define STR_ARUN    "304 Host running\n"
#define STR_AHALTED "305 Host halted\n"
#define STR_RESET   "306 Host reset\n"
#define STR_COLD    "307 Cold reset.\n"
#define STR_BPOINT  "322 Breakpoint "
#define STR_STEP    "323 Step. "
#define STR_USTEP   "324 Microstep. "
#define STR_TRACE   "325 Tracing.\n"
#define STR_UTRACE  "326 Microtracing.\n"
// #ifdef AVR
// #define STR_CLKSET  "330 Clock set to " F_CPU_S " Hz / ("
// #else
// #define STR_CLKSET  "330 Clock set to 14745600 Hz / ("
// #endif // VAR
// #define STR_CLKSET2      "*(1+"
#define STR_CONSBEG "331 Virtual console (press Enter # . to exit).\n"
#define STR_CONSEND "332 Left virtual console.\n"
#define STR_FPRAM   "333 ROM/RAM# switch: "
#define STR_FPRAM0       "RAM\n"
#define STR_FPRAM1       "ROM\n"
#define STR_SWTEST  "334 Operate toggles/DIP switches. Ctrl-C ends.\n"

#define STR_DEBPRN  "340 PRINT"
#define STR_DEBSENT "341 SENTINEL\n"
#define STR_DEBON   "342 DEBUGON\n"
#define STR_DEBOFF  "343 DEBUGOFF\n"
//#define STR_FAIL    "344 HAL\n"
#define STR_SUCCESS "345 SUCCESS\n"
#define STR_FAIL    "346 FAIL\n"

//                   350-355 reserved
#define STR_READ    "356 Read: "
#define STR_OUT1    "357 OUT Address: "
#define STR_OUT2    " Value: "
// #define STR_IFR1    "358 IRQ1 signaled\n"
// #define STR_IFR6    "359 IRQ6 signaled\n"

// #define STR_IFR1M   "458 IRQ1 masked by CFT\n"
// #define STR_IFR6M   "459 IRQ6 masked by CFT\n"

#define STR_WMEM    "370 Write mem["
#define STR_RMEM    "371 Read mem["
#define STR_WIO     "372 Write I/O["
#define STR_RIO     "373 Read I/O["

#define STR_WDATA        "] <- "
#define STR_RDATA        "] -> "
#define STR_PLOCK   "374 Panel lock: "

#define STR_WRAP    "401 Warning: write will wrap around.\n"
#define STR_CLKWRN  "430 Warning: stopping/stepping will be REALLY slow.\n"

// #define STR_COUNT8  "502 Count must be multiple of 8\n"
#define STR_RUNNING "503 Halt host first\n"
#define STR_CHATTER "504 Bus chatter\n"
#define STR_ALRHALT "505 Already halted\n"
#define STR_ALRRUN  "506 Already running\n"
#define STR_NOPROC  "507 No processor\n"

#define STR_NSELF   "510 You talkin' to me?\n"

// Hardware Faults.
#define STR_DIAGF   "901 Diagnostics failed.\n"
#define STR_ABERR   "920 ABUS error. Wrote "
#define STR_DBERR   "921 DBUS error. Wrote "
#define STR_ACERR   "922 AC mismatch. Wrote "
#define STR_PCERR   "923 PC mismatch. Wrote "
#define STR_IRERR   "924 IR mismatch. Wrote "

#define STR_HLTTO   "930 Timeout waiting for processor halt.\n"
#define STR_TIMEOUT "931 Timeout.\n" // This is currenly only used for Verilog testing

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

#endif // 0


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

uint8_t check_mismatch(uint16_t, uint16_t);

#endif // 0

#endif // _PROTO_H__

// End of file.
