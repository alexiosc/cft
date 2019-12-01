// -*- indent-c -*-

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

#define FL_INPOK    0x0001
#define FL_EOL      0x0002 	/* End of command line */
#define FL_ERROR    0x0004
#define FL_BREAK    0x0008
#define FL_ECHO     0x0010
#define FL_TERM     0x0020	/* Terminal bells and whistles */
#define FL_MESG     0x0040	/* Receive async messages */
#define FL_CLEAR    0x0080
#define FL_BUSY     0x0100	/* DFP Busy */

#define FL_HALT     0x0200	/* Halted */
#define FL_HOF      0x0400	/* Halt-on-fail */
#define FL_HOS      0x0800	/* Halt on sentinel */
#define FL_STOPPING 0x1000	/* ??? Stop pressed */
#define FL_ASYNC    0x2000	/* Async message printed */
#define FL_PROC     0x4000	/* Processor is installed */
#define FL_CONS     0x8000	/* The virtual console is running */

#define FL_SWLOCK   0x10000     /* Software lock of the front panel */

#define in_console() (flags & FL_CONS)

#define AUTHOR "Alexios Chouchoulas <alexios@bedroomlan.org>"
#define URL    "https://www.bedroomlan.org/cft"
#define BANNER								\
	"201 Version: " VERSION "+dis\n"				\
	"202 (c) 2012-" THISYEAR " " AUTHOR "\n"			\
	"202 Licensed under the GNU Public License v.3.\n"		\
	"202 " URL "\n"							\
	"202 All values base 16 unless otherwise noted.\n"

#define STR_BUFSIZE "204 BufSize: "

#define report_gs(x) report_char(x ? '3' : '2')

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


#define STR_READY   "200 Ready\n"
#define STR_ADDR    "203 Address: "
// #define STR_PROC1   "205 Processor found.\n"
// #define STR_PROC0   "206 No processor.\n"
#define STR_GSECHO   "10 Echo: "
#define STR_GSMESG   "11 Async messages: "
#define STR_GSTERM   "12 Terminal: "
#define STR_GSHOF    "13 On FAIL: "
#define STR_GSHOS    "14 On SENTINEL: "
#define STR_GSLOCK   "15 Front panel lock: "
#define STR_HOF_H        "HALT\n"
#define STR_HOF_I        "Ignore\n"
#define STR_HOF_J        "Jump to: "

#define STR_SR      "220 Switch Register: "
#define STR_GSOR     "21 Output Register: "

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

#define STR_MACHINE "299 T0sgQ09NUFVURVI=\n"

#define STR_DUMP    "300 Dumping\n"
#define STR_DONE    "301 Done\n"
#define STR_ABORT   "302 Aborted\n"
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
#define STR_FAST    "327 Full speed clock.\n"
#define STR_SLOW    "328 Slow clock.\n"
#define STR_CREEP   "329 Very slow clock.\n"
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

// Errors.
#define STR_BADCMD  "500 Unknown command\n"
#define STR_BADVAL  "501 Bad value\n"
// #define STR_COUNT8  "502 Count must be multiple of 8\n"
#define STR_RUNNING "503 Halt host first\n"
#define STR_CHATTER "504 Bus chatter\n"
#define STR_ALRHALT "505 Already halted\n"
#define STR_ALRRUN  "506 Already running\n"
#define STR_NOPROC  "507 No processor\n"
#define STR_SYNTAX  "508 Syntax error\n"
#define STR_NIMPL   "509 Not implemented\n"
#define STR_NSELF   "510 You talkin' to me?\n"

// Hardware Faults.
#define STR_DIAGF   "901 Diagnostics failed.\n"
#define STR_NVMIS   "910 Value mismatch. Wrote "
#define STR_WAS          ", was "
#define STR_ABERR   "920 ABUS error. Wrote "
#define STR_DBERR   "921 DBUS error. Wrote "
#define STR_ACERR   "922 AC mismatch. Wrote "
#define STR_PCERR   "923 PC mismatch. Wrote "
#define STR_IRERR   "924 IR mismatch. Wrote "

#define STR_HLTTO   "930 Timeout waiting for processor halt.\n"

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


extern unsigned char buf[BUFSIZE];

extern volatile uint32_t flags;

extern uint16_t bp;

extern uint16_t buflen;

extern uint16_t addr;



void proto_init();

void proto_loop();

unsigned char proto_input(unsigned char c);

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

#endif // _PROTO_H__

// End of file.
