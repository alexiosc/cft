/* 

cftemu.h - Interface file for CFT Emulator

Copyright (C) 2011 Alexios Chouchoulas

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  

*/

#ifndef CFTEMU_H
#define CFTEMU_H 1


#include <stdio.h>
#include <stdint.h>

#include "../microcode/microcode.h"


#define PACKAGE "cftemu"
#define VERSION "0.1"


#define MEM_SIZE 65536
#define RST_HOLD 2

/*
 * CPU STATE
 */

typedef unsigned short int word;
typedef unsigned char bit;

/* This is arbitrary, but it doesn't matter, as we don't use it to *interpret*
 * the uROM. */
#define microstate_t __microcode_conds_t_lsb_1st

typedef struct {
	word mem[MEM_SIZE];	/* the memory */

	word mar;
	word pc;
	word ir;
	word dr;
	
	word dbus;
	word ibus;

	word a;
	word b;			/* The ALU register */

	bit l;			/* A single bit for the L register */
	bit i;			/* A single bit for the I register */
	
	bit n;			/* N flag */
	bit z;			/* Z flag */
	
	bit irq;		/* Interrupt Requested (0 = yes, 1 = no) */

	microstate_t ustate;	/* Microcode ROM state */
	uint32_t     upc;       /* Last microcode conditional vector */
	uint32_t     control;   /* Last microcode signal vector retrieved */

	int halt;		/* Halted? */
	int wait;               /* A wait state has been asserted (not used) */
	int rst_hold;		/* Reset pulse */
	unsigned long int tick; /* Timer tick counter (emulator use only) */
} state_t;

extern state_t cpu;

/* An array of the 16 names of the opcodes */
char * ops[16];

/*
// Instruction format:
//
// 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
// **OP CODE**
//              I
//                 R
//                   ********** OPERAND **********
*/

#define get_op(x) (((x) >> 12) & 0xf)
#define get_i(x) (((x) & 0x800) != 0)
#define get_r(x) (((x) & 0x400) == 0)
#define get_lo(x) ((x) & 0x3ff)
#define get_hi(x) ((x) & 0xfc00)

// Implement the hardware's autoindex condition.
#define is_autoindex(x) (((x) & 0xff80) == 0x0080)

// Opcodes
#define OP_TRAP  0x0
#define OP_IOT   0x1
#define OP_LOAD  0x2
#define OP_STORE 0x3
#define OP_IN    0x4
#define OP_OUT   0x5
#define OP_JMP   0x6
#define OP_JSR   0x7
#define OP_ADD   0x8
#define OP_AND   0x9
#define OP_OR    0xa
#define OP_XOR   0xb
#define OP_OP1   0xc
#define OP_OP2   0xd
/*#define OP_XXX 0xe*/
#define OP_LI    0xf


/*
 * Command line parsing
 */

void cmdline_parse(int argc, char **argv);

/*
 * PASM debugging
 */

extern char *pasm_name;
extern FILE *pasm_file;

void pasm_load();
const char * pasm_get(word addr);


/*
 * MAP debugging
 */

extern char *map_name;
extern FILE *map_file;

void map_load();
const char * map_get(word addr);

/*
 * Emulation
 */

extern char *memimg_name;
extern FILE *memimg_file;

extern char *log_name;
extern FILE *log_file;

extern int verbose;
extern int debug_microcode;
extern int debug_io;
extern int debug_asm;
extern int testing;

void emulate();

/*
 * I/O
 */

void io_init();
void io_tick();
word unit_io(int r, int w);


/*
 * Utilities
 */

char * to_bin(uint32_t n, char *s, int slen);
void dump_mini(word oldpc);
void dump_state();
void dump_ustate();
void dump();


/*
 * Ugly debugging macros
 */

#define sanity_check(cond, ...) if (cond) { \
		printf("F: " COL_RED __VA_ARGS__); printf(COL_NOR); dump(); exit(2); \
}
#define error(...) { \
		printf(COL_RED "E: " __VA_ARGS__); \
		printf(COL_NOR); \
		dump(); \
		exit(1); \
}
#define fail(...) { \
		printf(COL_RED "F: " __VA_ARGS__); \
		printf(COL_NOR); \
		dump(); \
		exit(1); \
}
#define warning( ...) { \
		printf(COL_YEL "W: " __VA_ARGS__); \
		printf(COL_NOR); \
}
#define info( ...) { \
		printf(COL_GRE "I: " __VA_ARGS__); \
		printf(COL_NOR); \
}
#define iodebug( ...) \
	{					   \
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

#define COL_WHI "\033[0;1m"
#define COL_YEL "\033[0;33;1m"
#define COL_RED "\033[0;31;1m"
#define COL_BLU "\033[0;34;1m"
#define COL_MAG "\033[0;35;1m"
#define COL_CYA "\033[0;36;1m"
#define COL_GRE "\033[0;32;1m"
#define COL_NOR "\033[0m"
#define COL_UND "\033[4m"



#endif /* CFTEMU_H */

/* End of file. */
