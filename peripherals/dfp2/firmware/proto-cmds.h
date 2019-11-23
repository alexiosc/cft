// -*- c -*-
#warning "TODO: Review this file for DFP2"
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
// ofsdata[s] = (7, 181, 27) 
// ofsdata[us] = (8, 208, 26) 
// ofsdata[sws] = (9, 234, 20) 
// ofsdata[abus] = (10, 254, 19) 
// ofsdata[dbus] = (11, 273, 16) 
// ofsdata[swtest] = (12, 289, 30) 
// ofsdata[dfps] = (13, 319, 17) 
// ofsdata[cons] = (14, 336, 41) 
// ofsdata[lock] = (15, 377, 46) 
// ofsdata[reset] = (16, 423, 38) 
// ofsdata[start] = (17, 461, 14) 
// ofsdata[stop] = (18, 475, 7) 
// ofsdata[halt] = (19, 482, 39) 
// ofsdata[run] = (20, 521, 6) 
// ofsdata[step] = (21, 527, 40) 
// ofsdata[ustep] = (22, 567, 39) 
// ofsdata[trace] = (23, 606, 15) 
// ofsdata[utrace] = (24, 621, 25) 
// ofsdata[bp] = (25, 646, 51) 
// ofsdata[hof] = (26, 697, 32) 
// ofsdata[hos] = (27, 729, 36) 
// ofsdata[fast] = (28, 765, 20) 
// ofsdata[slow] = (29, 785, 20) 
// ofsdata[creep] = (30, 805, 21) 
// ofsdata[clk] = (31, 826, 48) 
// ofsdata[ir] = (32, 874, 22) 
// ofsdata[pc] = (33, 896, 22) 
// ofsdata[ac] = (34, 918, 28) 
// ofsdata[a] = (35, 946, 27) 
// ofsdata[r] = (36, 973, 16) 
// ofsdata[d] = (37, 989, 35) 
// ofsdata[dis] = (38, 1024, 42) 
// ofsdata[db] = (39, 1066, 42) 
// ofsdata[w] = (40, 1108, 45) 
// ofsdata[fill] = (41, 1153, 26) 
// ofsdata[in] = (42, 1179, 29) 
// ofsdata[out] = (43, 1208, 46) 
// ofsdata[i1] = (44, 1254, 14) 
// ofsdata[i6] = (45, 1268, 14) 
// ofsdata[sr] = (46, 1282, 28) 
// ofsdata[or] = (47, 1310, 29) 
// Total length of help before: 1387
// Total length of help after concat: 1339
// Final length of helpstr: 1321

#include "hwcompat.h"

#define CMD_SIZE 8

#ifdef AVR
#define helpstring_t static const char
#else
#define helpstring_t char
#endif




#define _HELPSTR "\001Show help\0\001Show help\0\001Show version\0\001Show size of command buffer\0[ BOOL\007terminal bells & whistles.\0[ BOOL\007local echo.\0[ BOOL\007async messages.\0\001Current processor status\0\001Microcode control state\0\001Show Switch state\0\001Read Address bus\0\001Read Data bus\0\001Test switch assembly and OR\0\001Show DFP state\0\001Virtual console (<Enter> # . to exit).\0[ BOOL\007software switch lock.\005\0[ BOOL ] \001Reset (if TRUE, cold boot)\0\001Reset & run\0\001Stop\0\001Stop (same as stop, for versatility)\0\001Run\0[ N ] \001Step to next fetch\0061)\0[ N ] \001Microstep the CPU\0061)\0\001Status trace\0\001Microcode status trace\0[ NUM [ off | ADDR ] ] \001Set breakpoint (see docs)\0[ BOOL\007halt on FAIL\0[ BOOL\007halt on SENTINEL\0\001CPU at full speed\0\001CPU at slow speed\0\001CPU at creep speed\0PS DIV \001Arbitrary clock speed (see docs).\005\0[ WORD\007IR\0[ WORD\007PC\0[ WORD\007AC.\005\0[ WORD\007address\0\001Read mem[a++]\0[ C ] \001Dump C words\00680)\0[ C ] \001Disassemble C words\00610)\0[ C ] \001Binary dump C words\00680)\0WORD [ WORD... ] \001Write c words to mem[a++]\0COUNT VALUE \001Fill memory\0ADDR \001Read I/O address ADDR\0ADDR WORD \001Write WORD to I/O addr ADDR.\005\0\001Signal IRQ1\0\001Signal IRQ6\0\001Read front panel switches\0[ WORD\007OR lights";

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
        {"s", go_state},
        {"us", go_ustate},
        {"sws", go_sws},
        {"abus", say_abus},
        {"dbus", say_dbus},
        {"swtest", go_swtest},
        {"dfps", go_dfps},
        {"cons", go_cons},
        {"lock", gs_lock},
        {"reset", go_reset},
        {"start", go_start},
        {"stop", go_stop},
        {"halt", go_stop},
        {"run", go_run},
        {"step", go_step},
        {"ustep", go_ustep},
        {"trace", go_trace},
        {"utrace", go_utrace},
        {"bp", go_bp},
        {"hof", gs_hof},
        {"hos", gs_hos},
        {"fast", go_fast},
        {"slow", go_slow},
        {"creep", go_creep},
        {"clk", go_clk},
        {"ir", gs_ir},
        {"pc", gs_pc},
        {"ac", gs_ac},
        {"a", gs_addr},
        {"r", go_read},
        {"d", go_dump_text},
        {"dis", go_disassemble},
        {"db", go_dump_bin},
        {"w", go_write},
        {"fill", go_fill},
        {"in", go_in},
        {"out", go_out},
        {"i1", go_ifr1},
        {"i6", go_ifr6},
        {"sr", say_sr},
        {"or", gs_or},
        {"\0", (void*)-1}
};

#endif // __PROTO_CMDS_H
