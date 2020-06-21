// -*- c -*-
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

#include "types.h"

#include "../microcode/build/microcode.h"

typedef __microcode_conds_t_lsb_1st ustate_t; // microcode state

// The Machine State contains the processor and a bunch of other units.

typedef struct {
    longaddr_t ar;              // 24-bit Address Register
    word       ir;              // Instruction Register
    word       pc;              // Program Counter
    word       dr;              // Data Register
    word       ac;              // Accumulator
    word       sp;              // Stack Pointer

    word       agl_page;        // Pre-increment value of the PC's page

    longaddr_t mbr[8];          // Memory Bank Registers (shifted 16 bits left)
    longaddr_t mbrdis;          // MBRs before MBU is enabled.
    bit        mbuen;           // Is the MBU enabled?

    word       dbus;            // The Data Bus
    word       ibus;            // The IBus

    word       alu_a;           // ALU Port A
    word       alu_b;           // ALU Port B
    word       alu_y;           // ALU Port Y (result)

    bit        fl;              // The Link Register
    bit        fi;              // The Interrupt Register
    bit        fv;              // The Overflow Flag
    bit        fn;              // The Negative Flag
    bit        fz;              // The Zero Flag
        
    bit        irq;             // Interrupt requested (0 = yes, 1 = no)

    ustate_t   ustate;          // Microcode ROM state
    uint32_t   control;         // Last control vector read from Microcode ROM

    bit        resetting;       // Simulated RSTHOLD

    bit        halt;            // Halted?
    bit        pause;           // Paused.
    bit        wait;            // Wait states (not really implemented)
    bit        quit;            // Quit requested

    int        rst_hold;        // Reset pulse (-1 = not resetting)
    uint32_t   tick;            // Emulator tick counter

    // Callbacks

    word (*memr)(longaddr_t);       // Read from memory
    void (*memw)(longaddr_t, word); // Write to memory
    word (*ior)(word);              // Input from I/O
    void (*iow)(word, word);        // Output to I/O

    void (*iotick)();               // I/O tick
    void (*dfptick)();              // DFP tick
} state_t;

extern state_t cpu;

// Get the page of a 16-bit address w. The page is not shifted left to
// make ORring faster later.
#define GET_PAGE(w) ((w) & 0xfc00)

// Make a 16-bit address out of an unshifted page and offset.
#define MAKE_SHORT_ADDRESS(page, ofs) ((page) | ((ofs) & 0x3ff))

// Aliases for the first four MBRs.
#define MBR_MBP 0
#define MBR_MBD 1
#define MBR_MBS 2
#define MBR_MBZ 3


void cpu_init();

void cpu_run();

void cpu_done();

void cpu_start();

void cpu_halt();

void cpu_reset();


#endif

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
