// -*- c -*-
// AUTOMATICALLY GENERATED, DO NOT EDIT.

#ifndef __PROTO_CMDS_H
#define __PROTO_CMDS_H

// ofsdata[?] = (0, 0, 12) 
// ofsdata[help] = (1, 12, 12) 
// ofsdata[ver] = (2, 24, 15) 
// ofsdata[buf] = (3, 39, 30) 
// ofsdata[term] = (4, 69, 46) 
// ofsdata[echo] = (5, 115, 31) 
// ofsdata[mesg] = (6, 146, 35) 
// ofsdata[fpr] = (7, 181, 36) 
// ofsdata[fpdump] = (8, 217, 29) 
// ofsdata[dsr] = (9, 246, 55) 
// ofsdata[ibus] = (10, 301, 12) 
// ofsdata[abus] = (11, 313, 19) 
// ofsdata[ir] = (12, 332, 22) 
// ofsdata[pc] = (13, 354, 35) 
// ofsdata[dr] = (14, 389, 34) 
// ofsdata[ac] = (15, 423, 32) 
// ofsdata[fast] = (16, 455, 20) 
// ofsdata[slow] = (17, 475, 20) 
// ofsdata[creep] = (18, 495, 21) 
// ofsdata[a] = (19, 516, 27) 
// ofsdata[or] = (20, 543, 29) 
// Total length of help before: 593
// Total length of help after concat: 572
// Final length of helpstr: 534

#include "hwcompat.h"

#define CMD_SIZE 8

#ifdef AVR
#define helpstring_t static const char
#else
#define helpstring_t char
#endif




#define _HELPSTR "\001Show help\0\001Show help\0\001Show version\0\001Show size of command buffer\0[ BOOL\007terminal bells & whistles.\0[ BOOL\007local echo.\0[ BOOL\007async messages.\0[ BYTE ] \001Read from FP Bus Address\0\001Dump full FP address space\0[ WORD | - ] \001Get, read, or override the DIP Switches\0\001Read IBus\0\001Read Address bus\0[ WORD\007IR\0[ WORD\007Program Counter\0[ WORD\007Data Register.\0[ WORD\007Accumulator.\0\001CPU at full speed\0\001CPU at slow speed\0\001CPU at creep speed\0[ WORD\007address\0[ WORD\007OR lights";

const static const struct {
	char cmd[CMD_SIZE];
	void (*handler)();
//#ifdef AVR
//	PGM_P help;
//#else
//      char * help;
//#endif
} cmds[] PROGMEM = {
        {"?", say_help},
        {"help", say_help},
        {"ver", say_version},
        {"buf", say_bufsize},
        {"term", gs_term},
        {"echo", gs_echo},
        {"mesg", gs_mesg},
        {"fpr", go_fpr},
        {"fpdump", go_fpdump},
        {"dsr", gs_dsr},
        {"ibus", say_ibus},
        {"abus", say_abus},
        {"ir", gs_ir},
        {"pc", gs_pc},
        {"dr", gs_dr},
        {"ac", gs_ac},
        {"fast", go_fast},
        {"slow", go_slow},
        {"creep", go_creep},
        {"a", gs_addr},
        {"or", gs_or},
        {"\0", (void*)-1}
};


#endif // __PROTO_CMDS_H
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
