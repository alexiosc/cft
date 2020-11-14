// -*- c -*-
// 
// microcode_disassembly.c — Disassemblying Microcode Vectors
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdlib.h>
#include <inttypes.h>
#include <string.h>

#ifdef HOST
#  include <stdio.h>
#  include <unistd.h>
#endif // HOST

#ifdef AVR
#  include <avr/io.h>
#  include <avr/interrupt.h>
#  include <avr/sleep.h>
#  include <avr/wdt.h>
#  include <util/delay.h>
#  include <avr/pgmspace.h>
#endif // AVR

#include "hwcompat.h"
#include "microcode_disassembly.h"


///////////////////////////////////////////////////////////////////////////////
//
// MICROCODE CONTROL VECTORS
//
///////////////////////////////////////////////////////////////////////////////

// The address space is underused, so to save bytes in the MCU Flash we use a
// 32-entry offset table to a larger table with fewer entries.

const uint8_t disasm_raddr_ofs[32] PROGMEM = {
	0,   1,  1,  1,		// 00-03: nothing
	2,   3,  4,  5,		// 04-07: constants
	6,   7,  8,  9,		// 08-0b: registers
	1,  10,  1, 11,		// 0c-0f: MBP+flags, AGL
	12, 13, 14, 15,		// 10-13: ALU
	16,  1,  1,  1,		// 14-17: ALU
	17, 18,  1,  1,		// 18-1b: ALU
	1,   1,  1,  1		// 1c-1f: nothing
};

const microcode_disassembly_t disasm_raddr[] PROGMEM = {
        { /*  0. */ 0,       "",       "idle" },
        { /*  1. */ 0,       "",       "" },
        { /*  2. */ BRD_BUS, "&0",     "constant 0" },
        { /*  3. */ BRD_BUS, "&1",     "constant 1" },
        { /*  4. */ BRD_BUS, "&2",     "constant 2" },
        { /*  5. */ BRD_BUS, "&3",     "constant 3" },
        { /*  6. */ BRD_REG, "PC",     "PC" },
        { /*  7. */ BRD_REG, "DR",     "DR" },
        { /*  8. */ BRD_REG, "AC",     "AC" },
        { /*  9. */ BRD_REG, "SP",     "SP" },
        { /* 10. */ BRD_BUS, "MBPF",   "MBP, Flags" },
        { /* 11. */ BRD_CTL, "AGL",    "AGL" },
        { /* 12. */ BRD_ALU, "ADD",    "ADD" },
        { /* 13. */ BRD_ALU, "AND",    "AND" },
        { /* 14. */ BRD_ALU, "OR",     "OR" },
        { /* 15. */ BRD_ALU, "XOR",    "XOR" },
        { /* 16. */ BRD_ALU, "NO",     "NOT" },
        { /* 17. */ BRD_ALU, "Y",      "ALU Y" },
        { /* 18. */ BRD_ALU, "B",      "ALU B" },
};

const uint8_t disasm_waddr_ofs[32] PROGMEM = {
	0,   1,  1,  1,		// 00-03: nothing
	2,   3,  4,  5,		// 04-07: [MBx:AR] pairs
	6,   7,  8,  9,		// 08-0b: registers
	10, 11, 12, 13,		// 0c-0f: MBP, flags, IR
	1,   1,  1,  1,		// 10-13: nothing
	1,   1,  1,  1,		// 14-17: nothing
	1,  14,  1,  1,		// 18-1b: ALU B
	1,   1,  1,  1		// 1c-1f: nothing
};

const microcode_disassembly_t disasm_waddr[] PROGMEM = {
        { /*  0. */ 0,       "",       "idle" },
        { /*  1. */ 0,       "",       "" },
        { /*  2. */ BRD_BUS, "MBP:AR", "MBP:AR" },
        { /*  3. */ BRD_BUS, "MBD:AR", "MBD:AR" },
        { /*  4. */ BRD_BUS, "MBS:AR", "MBS:AR" },
        { /*  5. */ BRD_BUS, "MBZ:AR", "MBZ:AR" },
        { /*  6. */ BRD_REG, "PC",     "PC" },
        { /*  7. */ BRD_REG, "DR",     "DR" },
        { /*  8. */ BRD_REG, "AC",     "AC" },
        { /*  9. */ BRD_REG, "SP",     "SP" },
        { /* 10. */ BRD_BUS, "MBP",    "MBP" },
        { /* 11. */ BRD_BUS, "MBPF",   "MBP+Flags" },
        { /* 12. */ BRD_BUS, "Flags",  "Flags" },
        { /* 13. */ BRD_CTL, "IR",     "IR" },
        { /* 14. */ BRD_ALU, "B",      "ALU B" },
};

const uint8_t disasm_action_ofs[16] PROGMEM = {
	0,   2,  3,  4,		// 00-03
	5,   6,  1,  7,		// 04-07
	6,   7,  8,  1,		// 08-0b
	9,  10, 11, 12		// 0c-0f
};

const microcode_disassembly_t disasm_action[] PROGMEM = {
        { /*  0. */ 0,       "",       "idle" },
        { /*  1. */ 0,       "",       "" },
        { /*  2. */ BRD_ALU, "CPL",    "CPL" },
        { /*  3. */ BRD_ALU, "CLL",    "CLL" },
        { /*  4. */ BRD_BUS, "STI",    "STI" },
        { /*  5. */ BRD_BUS, "CLI",    "CLI" },
        { /*  6. */ BRD_BUS, "IDX",    "IDX[IR0-2]" },
        { /*  7. */ BRD_ALU, "SRU",    "SRU start" },
        { /*  8. */ BRD_REG, "PC++",   "INCPC" },
        { /*  9. */ BRD_REG, "DR++",   "INCDR" },
        { /* 10. */ BRD_REG, "DR--",   "DECDR" },
        { /* 11. */ BRD_BUS, "AC++",   "INCAC" },
        { /* 12. */ BRD_BUS, "AC--",   "DECAC" },
        { /* 13. */ BRD_BUS, "SP++",   "INCSP" },
        { /* 14. */ BRD_CTL, "SP--",   "DECSP" }
};

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
