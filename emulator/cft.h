// -*- mode: c; tab-width: 4; -*-
// 
// cft.h — Definitions for the CFT virtual mchine
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef CFT_H
#define CFT_H 1

#include <stdio.h>
#include <stdint.h>

#include "../microcode/build/microcode.h"

typedef uint16_t word;		// We'll be using this a lot.
typedef unsigned char bit;	// Faster than using bit fields.
typedef __microcode_conds_t_lsb_1st ustate_t; // microcode state

// The Machine State contains the processor and a bunch of other units.

typedef struct {
	uint32_t ar;		// 24-bit Address Register (also value of Address Bus)
	word     ir;		// Instruction Register
	word     pc;		// Program Counter
	word     dr;		// Data Register
	word     ac;		// Accumulator
	word     sp;		// Stack Pointer

	word     agl_page;      // Pre-increment value of the PC's page

	uint32_t mbr[8];	// Memory Bank Registers (shifted 16 bits left)
	uint32_t mbrdis[8];	// MBRs before MBU is enabled.
	bit      mbuen;		// Is the MBU enabled?
	word     ar;		// Address register, also value of ABUS

	word     dbus;		// The Data Bus
	word     ibus;		// The IBus

	word     a;		// ALU Port A
	word     b;		// ALU Port B

	bit      fl;		// The Link Register
	bit      fi;		// The Interrupt Register
	bit      fv;		// The Overflow Flag
	bit      fn;		// The Negative Flag
	bit      fz;		// The Zero Flag
	
	bit      irq;		// Interrupt requested (0 = yes, 1 = no)

	ustate_t ustate;	// Microcode ROM state
	uint32_t control;       // Last control vector read from Microcode ROM

	bit      resetting;	// Simulated RSTHOLD

	// int quit;               /* Quit? */
	// int pause;              /* Paused? */
	// int halt;		/* Halted? */
	// int wait;               /* A wait state has been asserted (not used) */
	// int rst_hold;		/* Reset pulse */
	uint32_t tick;		// Emulator tick counter
} state_t;

extern state_t cpu;

#endif

// End of file.
