// -*- c -*-
// 
// util.h — Various utility functions
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#ifndef UTIL_H
#define UTIL_H 1


#include <stdint.h>
#include <sys/types.h>

#include "types.h"


#define maybe_free(p) if (p != NULL) { free(p); p = NULL; }

#define min(a,b) ((a) < (b) ? (a) : (b))

#define max(a,b) ((a) > (b) ? (a) : (b))

#define get_page(x) ((x) & 0xfc00)

#define get_r(ir) ((ir) & 0x400)

#define get_i(ir) ((ir) & 0x800)

#define get_op(ir) ((ir) & 0xf000)


// Format long address addr. If buf is non-NULL, it will be written to. buf
// must point to at least 8 writerable bytes. Otherwise, return a pointer to an
// internal buffer (which will be overwritten every time the function is
// called).
char * format_longaddr(longaddr_t addr, char *buf);


// Format a binary number up to 32 bits.
char * format_bin(uint32_t x, int numbits);


// Disassemble an instruction into the string buffer buf. If buf is
// NULL, an internal static char buffer is used. Return a pointer to
// the buffer used.
char * disasm(word instr, int full_dis, char *buf);


// char * to_bin(uint32_t n, char *s, int slen);

// void dump_state();

// void dump_ustate();

// void dump_mini(word oldpc);

void dump();

// void dumpmem(word addr, int count);

// void dumpstack(word addr, word sp, int usemap);

// uint32_t parity(uint32_t value);




#if 0
/*
 * Ugly debugging macros
 */

#define sanity_check(cond, ...) if (cond) {				\
	printf(COL_RED "F: " __VA_ARGS__);				\
	printf(COL_NOR);						\
	dump();								\
	if(sanity > 1) exit(2);						\
	}

#define error(...) {					\
		printf(COL_RED "E: " __VA_ARGS__);	\
		printf(COL_NOR);			\
		dump();					\
		exit(1);				\
	}

#define fail(...) {					\
		printf(COL_RED "F: " __VA_ARGS__);	\
		printf(COL_NOR);			\
		dump();					\
		exit(1);				\
	}

#define warning( ...) {					\
		printf(COL_YEL "W: " __VA_ARGS__);	\
		printf(COL_NOR);			\
	}

#define warning2( ...) {					\
		if(verbose > 1) {				\
			printf(COL_YEL "W: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define info( ...)						\
        {							\
		if(verbose > 0) {				\
			printf(COL_GRE "I: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define info2( ...)						\
        {							\
		if(verbose > 1) {				\
			printf(COL_GRE "I: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define memdebug( ...)						\
	{							\
		if(debug_mem) {					\
			printf(COL_CYA "D: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define iodebug( ...)						\
	{							\
		if(debug_io) {					\
			printf(COL_CYA "D: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define ucdebug( ...)						\
	{							\
		if(debug_microcode) {				\
			printf(COL_BLU "D: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define testdebug( ...)						\
	{							\
		if(testing) {				\
			printf(COL_MAG "T: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define mbudebug( ...)						\
	{							\
		if(debug_mbu) {					\
			printf(COL_CYA "D: MBU: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define ircdebug( ...)						\
	{							\
		if(debug_irc) {					\
			printf(COL_CYA "D: IRC: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define duartdebug( ...)						\
	{								\
		if(debug_duart) {					\
			printf(COL_CYA "D: DUART: " __VA_ARGS__);	\
			printf(COL_NOR);				\
		}							\
	}

#define idedebug( ...)						\
	{							\
		if(debug_ide) {					\
			printf(COL_CYA "D: IDE: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define vdebug( ...)						\
	{							\
		if(debug_video) {			\
			printf(COL_CYA "D: Video: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define psgdebug( ...)						\
	{							\
		if(debug_psg) {					\
			printf(COL_CYA "D: PSG: " __VA_ARGS__);	\
			printf(COL_NOR);			\
		}						\
	}

#define ircinfo info2
#define psginfo info
#define mbuinfo info2
#define duartinfo info2

#define meminfo info
#define meminfo2 info2
#define ideinfo info
#define ideinfo2 info2
#define nvraminfo info
#define debugdebug iodebug

#define COL_WHI "\033[0;1m"
#define COL_YEL "\033[0;33;1m"
#define COL_RED "\033[0;31;1m"
#define COL_BLU "\033[0;34;1m"
#define COL_MAG "\033[0;35;1m"
#define COL_CYA "\033[0;36;1m"
#define COL_GRE "\033[0;32;1m"
#define COL_NOR "\033[0m"
#define COL_UND "\033[4m"

#define REG_IP 0x90
#define REG_PFA 0x95


#endif




#endif // UTIL_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
