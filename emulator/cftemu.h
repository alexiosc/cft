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

#include "memory.h"


#define PACKAGE "cftemu"
#define VERSION "0.7"


#define RST_HOLD 2



#define min(a,b) ((a) < (b) ? (a) : (b))
#define max(a,b) ((a) > (b) ? (a) : (b))


/*
 * CPU REVISIONS
 */

typedef struct {
	uint32_t ramsize;	/* In Words */
	uint32_t romsize;	/* In Words */
	uint32_t banks[NBANKS]; /* Bank setup */

	char * name;
	char * code;

	int32_t image_start;
	int32_t image_size;

	uint32_t have_mbu:1;
	uint32_t have_irc:1;
	uint32_t have_ide:1;
	uint32_t have_nvram:1;
	uint32_t have_video:1;
	uint32_t have_ether:1;
	uint32_t have_psg:1;
} mach_t;

extern mach_t mach_revisions[];
extern mach_t * machp;

void mach_set(mach_t * m);

#define mach (*machp)


/*
 * CPU STATE
 */

#define word uint16_t
typedef unsigned char bit;

/* This is arbitrary, but it doesn't matter, as we don't use it to *interpret*
 * the uROM. */
#define microstate_t __microcode_conds_t_lsb_1st

typedef struct {
	word *ram;		/* RAM */
	word *rom;		/* ROM */

	uint32_t mbusm[NBANKS];	/* MBU soft map: 8 8KW banks map to a 21-bit physical address space */
	uint32_t mbuhm[NBANKS]; /* MBU hard map: memory map at reset */ 
	uint8_t  mbuen;		/* MBU enable: is the MBU soft map selected? */
	uint8_t  aext;		/* The output of the MBU */

	word ar;
	word pc;
	word ir;
	word dr;
	
	word dbus;
	word ibus;

	word a;
	word b;			/* The ALU register */

	bit l;			/* A single bit for the L register */
	bit i;			/* A single bit for the I register */
	
	bit v;                  /* V flag */
	bit n;			/* N flag */
	bit z;			/* Z flag */
	
	bit irq;		/* Interrupt Requested (0 = yes, 1 = no) */

	microstate_t ustate;	/* Microcode ROM state */
	uint32_t     upc;       /* Last microcode conditional vector */
	uint32_t     control;   /* Last microcode signal vector retrieved */

	int quit;               /* Quit? */
	int pause;              /* Paused? */
	int halt;		/* Halted? */
	int wait;               /* A wait state has been asserted (not used) */
	int rst_hold;		/* Reset pulse */
	unsigned long int tick; /* Timer tick counter (emulator use only) */
} state_t;

extern state_t cpu;

/* An array of the 16 names of the opcodes */
char * ops[32];

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
/*
 * Alexios (2012-01-23) the R flag has reversed semantics in microcode
 * version 4, so we no longer need to toggle it. Code will work as
 * expected now.
 */
#define get_r(x) (((x) & 0x400) != 0)
#define get_offset(x) ((x) & 0x3ff)
#define get_page(x) ((x) & 0xfc00)

/* Convenience macros for memory access */
#define IS_R_DBUS(x) (IS_R(x) && (IS_MEM(x) || IS_IO(x)))
#define IS_W_DBUS(x) (IS_WEN(x) && (IS_MEM(x) || IS_IO(x)))

// Implement the hardware's autoindex condition.
#define is_autoindex(x) (((x) & 0xff80) == 0x0080)

// An alias
#define IS_W IS_WEN

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

// Convenience
#define BIT(x,n) ((x) & (1 << (n)))


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
extern int debug_mem;
extern int debug_io;
extern int debug_asm;
extern int testing;
extern int sanity;
extern int sentinel;
extern int nvram;

void emulate();


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


void quit(int quiet);



#endif /* CFTEMU_H */

/* End of file. */
