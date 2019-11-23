// -*- indent-c -*-

#ifndef __STATE_H__
#define __STATE_H__

#include <stdint.h>


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


#endif // _STATE_H__

// End of file.
