// -*- indent-c -*-

#ifndef __PROTO_H__
#define __PROTO_H__

#include <stdint.h>

// Sanity check
#ifdef AVR
#ifdef HOST
#error "Both -DAVR and -DHOST have been passed to the compiler."
#endif // HOST
#endif // AVR

#define FL_INPOK  0x0001
#define FL_BUSY   0x0002
#define FL_ERROR  0x0004
#define FL_BREAK  0x0008
#define FL_ECHO   0x0010
#define FL_CLEAR  0x0020
#define FL_HALT   0x0040
#define FL_HOF    0x0080	/* Halt-on-fail */
#define FL_EOL    0x0100	/* End of command line */
#define FL_STOP   0x0200	/* Stop pressed */
#define FL_MESG   0x0400	/* Receive async messages */
#define FL_ASYNC  0x0800	/* Async message printed */
#define FL_PROC   0x1000	/* Processor is installed */

#ifdef DISASSEMBLE
#define BANNER1 "201 Version: " VERSION "+dis\n"
#else
#define BANNER1 "201 Version: " VERSION "\n"
#endif // DUMP_TEXT

#define BANNER2 "201 BufSize: " BUFSIZE_S "\n"
#define BANNER3 "202 (c) 2012 Alexios Chouchoulas <alexios@bedroomlan.org>\n"
#define BANNER4 "202 Licensed under the GNU Public License v.2.\n"
#define BANNER5 "202 http://www.bedroomlan.org/cft\n"

#define report_gs(x) report_char(x ? '3' : '2')

#define STR_READY   "200 Ready\n"
#define STR_ADDR    "203 Address: "
#define STR_GSECHO   "10 Echo: "
#define STR_GSMESG   "11 Async messages: "
#define STR_GSLEDS   "12 LEDs: "
#define STR_GSHOF    "13 On FAIL: "
#define STR_HOF_H        "HALT\n"
#define STR_HOF_I        "Ignore\n"
#define STR_HOF_J        "Jump to: "

#define STR_SR      "220 Switch Register: "
#define STR_GSOR     "21 Output Register: "

#define STR_IN1     "234 IN Address: "
#define STR_IN2          " Value: "

#define STR_STATE   "250 Machine state: "
#define STR_USTATE  "251 Microcode control: "
#define STR_GSAC     "52 AC:"
#define STR_GSPC     "53 PC"
#define STR_GSIR     "54 IR"

#define STR_AC           " AC:"
#define STR_PC           " PC:"
#define STR_IR           " IR:"

#define STR_DUMP    "300 Dumping\n"
#define STR_DONE    "301 Done\n"
#define STR_ABORT   "302 Aborted\n"
#define STR_CKSUM   "303 Checksum: "

//                   310-321 reserved
#define STR_ARUN    "320 Host running\n"
#define STR_AHALTED "321 Host halted\n"
#define STR_RESET   "322 Host reset\n"
#define STR_STEP    "323 Step. "
#define STR_USTEP   "324 Microstep. "
#define STR_TRACE   "325 Tracing.\n"
#define STR_UTRACE  "326 Mictotracing.\n"
#define STR_FAST    "327 Full speed clock.\n"
#define STR_SLOW    "328 Slow clock.\n"
#define STR_CREEP   "329 Very slow clock.\n"

//                   350-354 reserved
#define STR_READ    "356 Read: "
#define STR_OUT1    "357 OUT Address: "
#define STR_OUT2    " Value: "
#define STR_IFR1    "358 IRQ1 signaled\n"
#define STR_IFR6    "359 IRQ6 signaled\n"

#define STR_WRAP    "401 Warning: write will wrap around.\n"

// Errors.
#define STR_BADCMD  "500 Unknown command\n"
#define STR_BADVAL  "501 Bad value\n"
#define STR_COUNT8  "502 Count must be multiple of 8\n"
#define STR_RUNNING "503 Halt host first\n"
#define STR_CHATTER "504 Bus chatter\n"
#define STR_ALRHALT "505 Already halted\n"
#define STR_ALRRUN  "506 Already running\n"
#define STR_NOPROC  "507 No processor\n"
#define STR_SYNTAX  "508 Syntax error\n"

#define STR_PROMPT  "> "
#define STR_PRUN    "[running]" STR_PROMPT
#define STR_PSTOP   "[halted] "
#define STR_ON      "on"
#define STR_OFF     "off"

// The blocksize for block-oriented writes.
#define BLOCKSIZE ((BUFSIZE - 3) / 5)

#define DIVIDER "|"


extern unsigned char buf[BUFSIZE];

extern volatile uint16_t flags;

extern uint16_t bp;

extern uint16_t buflen;


void proto_init();

void proto_loop();

unsigned char proto_input(unsigned char c);

void say_sr();

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

#endif // _PROTO_H__

// End of file.
