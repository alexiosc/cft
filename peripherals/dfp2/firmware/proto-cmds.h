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
// ofsdata[lock] = (7, 181, 46) 
// ofsdata[fast] = (8, 227, 20) 
// ofsdata[slow] = (9, 247, 20) 
// ofsdata[creep] = (10, 267, 21) 
// ofsdata[a] = (11, 288, 27) 
// ofsdata[or] = (12, 315, 29) 
// Total length of help before: 357
// Total length of help after concat: 344
// Final length of helpstr: 314

#include "hwcompat.h"

#define CMD_SIZE 8

#ifdef AVR
#define helpstring_t static const char
#else
#define helpstring_t char
#endif




#define _HELPSTR "\001Show help\0\001Show help\0\001Show version\0\001Show size of command buffer\0[ BOOL\007terminal bells & whistles.\0[ BOOL\007local echo.\0[ BOOL\007async messages.\0[ BOOL\007software switch lock.\005\0\001CPU at full speed\0\001CPU at slow speed\0\001CPU at creep speed\0[ WORD\007address\0[ WORD\007OR lights";

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
        {"lock", gs_lock},
        {"fast", go_fast},
        {"slow", go_slow},
        {"creep", go_creep},
        {"a", gs_addr},
        {"or", gs_or},
        {"\0", (void*)-1}
};


#endif // __PROTO_CMDS_H
