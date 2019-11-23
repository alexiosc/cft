// -*- indent-c -*-

#ifndef __PROTO_H__
#define __PROTO_H__


#define FL_INPOK   1
#define FL_BUSY    2
#ifdef DUMP_TEXT
#define FL_BIN     4
#endif // DUMP_TEXT
#define FL_ERROR   8
#define FL_BREAK   16
#define FL_ECHO    32
#define FL_CLEAR   64
#define FL_HALT    128
#define FL_HOF     256		/* Halt-on-fail */
#define FL_EOL     512		/* End of command line */

extern volatile uint16_t flags;


void proto_init();

void proto_loop();

char proto_input(char c);


#endif // _PROTO_H__

// End of file.
