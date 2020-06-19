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
// ofsdata[fpr] = (7, 181, 37) 
// ofsdata[fpdump] = (8, 218, 29) 
// ofsdata[dsr] = (9, 247, 47) 
// ofsdata[sws] = (10, 294, 20) 
// ofsdata[ibus] = (11, 314, 12) 
// ofsdata[abus] = (12, 326, 19) 
// ofsdata[dbus] = (13, 345, 16) 
// ofsdata[lock] = (14, 361, 46) 
// ofsdata[fast] = (15, 407, 20) 
// ofsdata[slow] = (16, 427, 20) 
// ofsdata[creep] = (17, 447, 21) 
// ofsdata[a] = (18, 468, 27) 
// ofsdata[or] = (19, 495, 29) 
// Total length of help before: 544
// Total length of help after concat: 524
// Final length of helpstr: 515

#include "hwcompat.h"

#define CMD_SIZE 8

#ifdef AVR
#define helpstring_t static const char
#else
#define helpstring_t char
#endif




#define _HELPSTR "\001Show help\0\001Show help\0\001Show version\0\001Show size of command buffer\0[ BOOL\007terminal bells & whistles.\0[ BOOL\007local echo.\0[ BOOL\007async messages.\0[ 00-FF ] \001Read from FP Bus Address\0\001Dump full FP address space\0[ 00-FF ] \001Get (or override) the DIP Switches\0\001Show Switch state\0\001Read IBus\0\001Read Address bus\0\001Read Data bus\0[ BOOL\007software switch lock.\005\0\001CPU at full speed\0\001CPU at slow speed\0\001CPU at creep speed\0[ WORD\007address\0[ WORD\007OR lights";

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
        {"sws", go_sws},
        {"ibus", say_ibus},
        {"abus", say_abus},
        {"dbus", say_dbus},
        {"lock", gs_lock},
        {"fast", go_fast},
        {"slow", go_slow},
        {"creep", go_creep},
        {"a", gs_addr},
        {"or", gs_or},
        {"\0", (void*)-1}
};


#endif // __PROTO_CMDS_H
