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
	1,   1,  1, 10,		// 0c-0f: AGL
	11, 12, 13, 14,		// 10-13: ALU (ADD, AND, OR, XOR)
	15,  1,  1,  1,		// 14-17: ALU (NOT)
	16, 17,  1, 18,		// 18-1b: ALU (Y, B), MBU
	19, 20, 21, 22		// 1c-1f: MBU, SWAB
};

const microcode_disassembly_t disasm_raddr[] PROGMEM = {
        { /*  0. */ 0,       UNT_NONE,   "",            "idle" },
        { /*  1. */ 0,       UNT_NONE,   "",            "" },
        { /*  2. */ BRD_PB0, UNT_CS,     "&0",          "constant 0" },
        { /*  3. */ BRD_PB0, UNT_CS,     "&1",          "constant 1" },
        { /*  4. */ BRD_PB0, UNT_CS,     "&2",          "constant 2" },
        { /*  5. */ BRD_PB0, UNT_CS,     "&3",          "constant 3" },
        { /*  6. */ BRD_PB0, UNT_PC,     "PC",          "PC" },
        { /*  7. */ BRD_PB0, UNT_DR,     "DR",          "DR" },
        { /*  8. */ BRD_PB1, UNT_AC,     "AC",          "AC" },
        { /*  9. */ BRD_PB1, UNT_SP,     "SP",          "SP" },
        { /* 10. */ BRD_PB0, UNT_AGL,    "AGL",         "AGL" },
        { /* 11. */ BRD_PB1, UNT_ALU,    "ADD",         "ADD" },
        { /* 12. */ BRD_PB1, UNT_ALU,    "AND",         "AND" },
        { /* 13. */ BRD_PB1, UNT_ALU,    "OR",          "OR" },
        { /* 14. */ BRD_PB1, UNT_ALU,    "XOR",         "XOR" },
        { /* 15. */ BRD_PB1, UNT_ALU,    "NO",          "NOT" },
        { /* 16. */ BRD_PB1, UNT_ALU,    "Y",           "ALU Y" },
        { /* 17. */ BRD_PB1, UNT_ALU_B,  "B",           "ALU B" },
        { /* 18. */ BRD_PB0, UNT_MBU,    "MBn",         "MBR[n]" },
        { /* 19. */ BRD_PB0, UNT_MBU,    "MBP",         "MBP" },
        { /* 20. */ BRD_PB0, UNT_MBU,    "CTX",         "CTX" },
        { /* 21. */ BRD_PB0, UNT_MBU_FL, "<flags,CTX>", "<flags, CTX>" },
        { /* 22. */ BRD_PB1, UNT_SWAB,   "SWAB",        "SWAB" },
};

const uint8_t disasm_waddr_ofs[32] PROGMEM = {
	0,   1,  1,  1,		// 00-03: nothing
	2,   3,  4,  5,		// 04-07: [MBx:AR] pairs
	6,   7,  8,  9,		// 08-0b: registers
	1,   1,  1, 15,		// 0c-0f: IR
	1,   1,  1,  1,		// 10-13: nothing
	1,   1,  1,  1,		// 14-17: nothing
	1,  14,  1, 16,		// 18-1b: ALU B
	17, 18, 13, 19		// 1c-1f: nothing
};

const microcode_disassembly_t disasm_waddr[] PROGMEM = {
        { /*  0. */ 0,       UNT_NONE,   "",            "idle" },
        { /*  1. */ 0,       UNT_NONE,   "",            "" },
        { /*  2. */ BRD_PB0, UNT_MBU_AR, "MBP:AR",      "MBP:AR" },
        { /*  3. */ BRD_PB0, UNT_MBU_AR, "MBD:AR",      "MBD:AR" },
        { /*  4. */ BRD_PB0, UNT_MBU_AR, "MBS:AR",      "MBS:AR" },
        { /*  5. */ BRD_PB0, UNT_MBU_AR, "MBZ:AR",      "MBZ:AR" },
        { /*  6. */ BRD_PB0, UNT_PC,     "PC",          "PC" },
        { /*  7. */ BRD_PB0, UNT_DR,     "DR",          "DR" },
        { /*  8. */ BRD_PB1, UNT_AC,     "AC",          "AC" },
        { /*  9. */ BRD_PB1, UNT_SP,     "SP",          "SP" },
        { /* 10. */ BRD_PB0, UNT_MBU,    "MBP",         "MBP" },
        { /* 11. */ BRD_PB0, UNT_MBU_FL, "MBPF",        "MBP+Flags" },
        { /* 12. */ BRD_PB0, UNT_FLAGS,  "Flags",       "Flags" },
        { /* 13. */ BRD_PB0, UNT_MBU_FL, "<flags,CTX>", "<flags, CTX>" },
        { /* 14. */ BRD_PB1, UNT_ALU_B,  "B",           "ALU B" },
        { /* 15. */ BRD_PB0, UNT_IR,     "IR",          "IR" },
        { /* 16. */ BRD_PB0, UNT_MBU,    "MBn",         "MBR[n]" },
        { /* 17. */ BRD_PB0, UNT_MBU,    "MBP",         "MBP" },
        { /* 18. */ BRD_PB0, UNT_MBU,    "CTX",         "CTX" },
        { /* 19. */ BRD_PB0, UNT_FLAGS,  "flags",       "Flags" },
};

const uint8_t disasm_action_ofs[16] PROGMEM = {
	0,   2,  3,  4,		// 00-03
	5,   6,  1,  7,		// 04-07
	8,   1,  9, 10,		// 08-0b
	11, 12, 13, 14		// 0c-0f
};

const microcode_disassembly_t disasm_action[] PROGMEM = {
        { /*  0. */ 0,       UNT_NONE,   "",       "idle" },
        { /*  1. */ 0,       UNT_NONE,   "",       "" },
        { /*  2. */ BRD_PB1, UNT_FL,     "CPL",    "CPL" },
        { /*  3. */ BRD_PB1, UNT_FL,     "CLL",    "CLL" },
        { /*  4. */ BRD_PB0, UNT_ISM,    "STI",    "STI" },
        { /*  5. */ BRD_PB0, UNT_ISM,    "CLI",    "CLI" },
        { /*  6. */ BRD_PB0, UNT_MBU,    "IDX",    "IDX[IR0-2]" },
        { /*  7. */ BRD_PB1, UNT_SRU,    "SRU",    "SRU start" },
        { /*  8. */ BRD_PB0, UNT_PC,     "PC++",   "INCPC" },
        { /*  9. */ BRD_PB0, UNT_DR,     "DR++",   "INCDR" },
        { /* 10. */ BRD_PB0, UNT_DR,     "DR--",   "DECDR" },
        { /* 11. */ BRD_PB1, UNT_AC,     "AC++",   "INCAC" },
        { /* 12. */ BRD_PB1, UNT_AC,     "AC--",   "DECAC" },
        { /* 13. */ BRD_PB1, UNT_SP,     "SP++",   "INCSP" },
        { /* 14. */ BRD_PB1, UNT_SP,     "SP--",   "DECSP" }
};

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
