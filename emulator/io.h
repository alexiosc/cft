/* 

io.h - The I/O space map.

Copyright (C) 2012 Alexios Chouchoulas

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

#ifndef IO_H
#define IO_H 1

#include "cftemu.h"


// Flags: r = readable register, w = writable register, h = hardware emulation,
// e = emulator only, f = address fully decoded (register mapped to a
// single address)

// The front panel board
#define IO_PANEL_SWITCHES  0x0008 /*      08: r-hef SR0  (front panel switches) */
#define IO_DIP_SWITCHES    0x0009 /*      09: r-hef SR1  (front panel dip-switches) */
#define IO_PANEL_LIGHTS    0x000a /*      0a: -whef OR   (front panel output LEDs) */
#define IO_CLOCK_HALT      0x000f /*      0f: -whef HIR  (HALT instruction) */

// The Interrupt controller
#define IO_INTC_IER        0x0030 /*   30-3F: -whe- IER (Interrupt Enable Register; 16 copies) */
#define IO_INTC_ISR        0x0030 /*   30-3F: r-he- ISR (Interrupt Status Register; 16 copies) */

// The memory banking controller
#define IO_MEMBANK0        0x0040 /*      40: -whef MBR0 (Memory Bank Register 0) */
#define IO_MEMBANK1        0x0041 /*      41: -whef MBR1 (Memory Bank Register 1) */
#define IO_MEMBANK2        0x0042 /*      42: -whef MBR2 (Memory Bank Register 2) */
#define IO_MEMBANK3        0x0043 /*      43: -whef MBR3 (Memory Bank Register 3) */
#define IO_MEMBANK4        0x0044 /*      44: -whef MBR4 (Memory Bank Register 4) */
#define IO_MEMBANK5        0x0045 /*      45: -whef MBR5 (Memory Bank Register 5) */
#define IO_MEMBANK6        0x0046 /*      46: -whef MBR6 (Memory Bank Register 6) */
#define IO_MEMBANK7        0x0047 /*      47: -whef MBR7 (Memory Bank Register 7) */
#define IO_BANKEN	   0x0050 /*   50-53: -whe- BANKEN (enables memory banking) */

// The Dual Dual UART board
#define IO_DUART0_BASE     0x0060 /*   60-6F: rwhef DU0: (DUART 0) */
#define IO_DUART1_BASE     0x0070 /*   70-7F: rwhef DU1: (DUART 1) */

// The NVRAM/RTC/timer board
#define IO_NVRAM_BASE	   0x0080 /*   80-8F: rwhef NVRx (NVRAM aperture, 16 bytes) */
#define IO_NVRAM_WINDOW	   0x0090 /*   90-93: -whe- NVRW (NVRAM window register, 4 copies) */
#define IO_TIMER0_REG0     0x0094 /*      94: rwhef T0R0 (Timer 0, Reg 0) */
#define IO_TIMER0_REG1     0x0095 /*      95: rwhef T0R1 (Timer 0, Reg 1) */
#define IO_TIMER0_REG2     0x0096 /*      96: rwhef T0R2 (Timer 0, Reg 2) */
#define IO_TIMER0_REG3     0x0097 /*      97: rwhef T0R3 (Timer 0, Reg 3) */
#define IO_TIMER1_REG0     0x0098 /*      98: rwhef T1R0 (Timer 1, Reg 0) */
#define IO_TIMER1_REG1     0x0099 /*      99: rwhef T1R1 (Timer 1, Reg 1) */
#define IO_TIMER1_REG2     0x009a /*      9a: rwhef T1R2 (Timer 1, Reg 2) */
#define IO_TIMER1_REG3     0x009b /*      9b: rwhef T1R3 (Timer 1, Reg 3) */

// The IDE Host Adaptor
#define IO_IDEA_CS3	   0x00a0 /*   a0-a7: rwhef HDA3 (IDE A CS3 base) */
#define IO_IDEA_CS1	   0x00b0 /*   b0-b7: rwhef HDA1 (IDE A CS1 base) */
#define IO_IDEB_CS3	   0x00c0 /*   a0-a7: rwhef HDA3 (IDE B CS3 base) */
#define IO_IDEB_CS1	   0x00d0 /*   b0-b7: rwhef HDA1 (IDE B CS1 base) */

// The emulator/debugging board (see testing.asm for details)
#define IO_ENEF            0x03e0 /*     3e0: -w-ef enable emulator features */
#define IO_DISEF           0x03e1 /*     3e1: -w-ef disable emulator features */
#define IO_QEF             0x03e0 /*     3e0: r--e- query emulator features */
#define IO_QEF_ALT         0x03e1 /*     3e1: r--e- (same) */

#define IO_TICKS_LO        0x03e8 /*     3e8: rw-ef TC0  (Tick counter low) */
#define IO_TICKS_HI        0x03e9 /*     3e9: rw-ef TC1  (Tick counter high) */

#define IO_SENTINEL        0x03ef /*     3ef: rw-ef log sentinel execution and halt */

#define IO_PRINTA	   0x03f0 /*     3f0: -w-ef Log AC as address */
#define IO_PRINTC	   0x03f1 /*     3f1: -w-ef Log AC as character */
#define IO_PRINTD	   0x03f2 /*     3f2: -w-ef Log AC as integer */
#define IO_PRINTU	   0x03f3 /*     3f3: -w-ef Log AC as unsigned int */
#define IO_PRINTH	   0x03f4 /*     3f4: -w-ef Log AC in hex */
#define IO_PRINTB	   0x03f5 /*     3f6: -w-ef Log AC in binary */
#define IO_PRINTSP	   0x03f6 /*     3f6: -w-ef Log a space */
#define IO_PRINTNL	   0x03f7 /*     3f7: -w-ef Log a newline */
#define IO_DEBUGON	   0x03f8 /*     3f8: -w-ef Emulator enables assembly tracing */
#define IO_DEBUGOFF	   0x03f9 /*     3f9: -w-ef Emulator disables assembly tracing */
#define IO_DUMP  	   0x03fa /*     3fa: -w-ef Emulator dumps state */
#define IO_PRINTHI	   0x03fb /*     3fb: -w-ef HI:=AC */
#define IO_PRINTLO	   0x03fc /*     3fc: -w-ef Log 32-bit int as HI:AC */
#define IO_RESERVED___	   0x03fd
#define IO_SUCCESS         0x03fe /*     3fe: -w-ef Log test success */
#define IO_FAIL 	   0x03ff /*     3ff: -w-ef Log test failure and HALT */




void io_init();

void io_tick();

void io_done();

word unit_io(int r, int w);


#endif /* IO_H */

/* End of file. */
