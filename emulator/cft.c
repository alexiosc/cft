// -*- c -*-
// 
// cft.c — CFT processor emulation
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <argp.h>

#include "cft.h"
#include "util.h"


/* The emulator state */
state_t cpu;

char *log_name = "output";
FILE *log_file = NULL;

int verbose = 0;
int sanity = 1;
int debug_microcode = 0;
int debug_mem = 0;
int debug_io = 0;
int debug_asm = 0;
int testing = 0;
int sentinel = 0;
int nvram = 0;


///////////////////////////////////////////////////////////////////////////////
//
// BASICS AND RUN CONTROL
//
///////////////////////////////////////////////////////////////////////////////


// Initialise the CPU (but don't reset it yet!)
void
cpu_init()
{
    // CTL: Control Unit
    cpu.ir = rand() & 0xffff;

    // REG: register file
    cpu.pc = rand() & 0xffff;
    cpu.dr = rand() & 0xffff;
    cpu.ac = rand() & 0xffff;
    cpu.sp = rand() & 0xffff;

    // BUS: Bus control
    cpu.ar = rand() & 0xffffff;
    for (int i = 0; i < 8; i++) cpu.mbr[i] = (rand() & 0xff) << 16;
    cpu.mbrdis = 0x80;
    cpu.mbuen = rand() & 1;

    // ALU: Arithmetic & Logic
    cpu.alu_a = rand() & 0xffff;
    cpu.alu_b = rand() & 0xffff;

    // Flags
    cpu.fl = rand() & 1;
    cpu.fi = rand() & 1;
    cpu.fv = rand() & 1;
    cpu.fz = cpu.ac == 0;
    cpu.fn = (cpu.ac >> 15) & 1;
    
    cpu.irq = rand() & 1;

    cpu.rst_hold = -1;
    cpu.tick = 0;

    cpu.memr = NULL;
    cpu.memw = NULL;
}


void
cpu_done()
{
    // Nothing to deallocate yet.
}



// Implement the reset sequence (which is quite simple).
void
cpu_reset()
{
    // CTL
    cpu.ustate.rst = 0;     // 0 = RESET# is ACTIVE */
    cpu.ustate.int_ = 1;    // 1 = INT# is not active
    cpu.ustate.uaddr = 0;   // The uPC resets to 0 on power on/reset
    cpu.irq = 1;            // Clear IRQ (1 = no IRQ received)
    cpu.rst_hold = 128;
    cpu.ir = 0xdead;
    cpu.agl_page = GET_PAGE(cpu.pc);

    // REG
    cpu.pc = 0;
    cpu.dr = 0;
    cpu.ac = 0;
    cpu.sp = 0;

    // ALU
    cpu.fl = 0;
    cpu.fv = 0;

    // MBU
    cpu.mbrdis = 0x80;
    cpu.mbuen = 0;
}


// Simulates reset behaviour: the CFT's reset circuitry contains a counter
// which, when triggered using /RESET, holds the internal reset signal
// (/RST-HOLD) active for a number of cycles. The rising edge of /RST-HOLD, at
// the end of the count, has side effects in the hardware (e.g. AR reads its
// value from the IBUS, so both PC and AR are initialised to 0xfff0.)

static inline void
cpu_handle_reset()
{
    if (cpu.rst_hold > 0) {
        cpu.rst_hold--;
        cpu.resetting = 1;
    } else if (cpu.rst_hold == 0) {
        // When the counter runs out, de-assert the RST signal in the
        // microcode engine.
        cpu.ustate.rst = 1;
        cpu.rst_hold = -1;
        cpu.resetting = 0;
        ucdebug("*** RST_HOLD cleared ***\n");
    }
}


void
cpu_halt()
{
    cpu.halt = 1;
    info("Halted\n");
    // v.dirty++;
    // v.stdirty++;
}


void
cpu_start()
{
    cpu.halt = 0;
    info("Resumed\n");
    // v.dirty++;
    // v.stdirty++;
}


void
quit(int quiet)
{
    cpu.quit = 1;
    // if (!quiet) {
    //     dump_state();
    //     dump_ustate();
    //     info("*** QUIT PRESSED ***\n");
    // }
}


///////////////////////////////////////////////////////////////////////////////
//
// READING FROM UNITS
//
///////////////////////////////////////////////////////////////////////////////


// The new Constant store is incredibly simple.
static inline word
read_cs(int raddr)
{
    return raddr & 3;
}


///////////////////////////////////////////////////////////////////////////////
//
// ACTIONS
//
///////////////////////////////////////////////////////////////////////////////
        

// The new Shift and Roll Unit. The calculation itself isn't cycle-accurate,
// but the microcode still waits for the correct number of cycles before
// reading the result, so we end up with a cycle-accurate behaviour anyway.
static inline void
action_sru()
{
    //            OP   I R 987 654 3210
    // SHL = SRU  0111'1'0'000'000'dddd    ; Bitwise shift left by d bits
    // SHR = SRU  0111'1'0'000'001'dddd    ; Bitwise shift right by d bits
    // ASR = SRU  0111'1'0'000'011'dddd    ; Arithmetic shift right by d bits
    // ROL = SRU  0111'1'0'000'100'dddd    ; Rotate <L,AC> left by d bits
    // ROR = SRU  0111'1'0'000'101'dddd    ; Rotate <L,AC> right by d bits

    int dist = cpu.ir & 15;
    if (dist == 0) return;

    int op = (cpu.ir >> 4) & 7;
    int l_ac;

    switch (op) {
    case 0:                     // SHL
        cpu.alu_b = (cpu.alu_b << dist) & 0xffff;
        break;
                
    case 1:                     // SHR
        cpu.alu_b = (cpu.alu_b >> dist) & 0xffff;
        break;
                
    case 3:                     // ASR
                                // Casting to a signed int makes C use the host platform's
                                // arithmetic/sign-extending shift instruction.
        cpu.alu_b = (word)((int16_t)cpu.alu_b >> dist) & 0xffff;
        break;
                
    case 4:                     // ROL
        l_ac = (cpu.alu_b & (1 << (16-dist)));
        l_ac = ((l_ac << dist) | (l_ac >> (17 - dist))) & 0x1ffff;
        cpu.fl = (l_ac & 0x10000) != 0;
        cpu.alu_b = l_ac & 0xffff;
        break;
                
    case 5:                     // ROR
        l_ac = (cpu.alu_b & (1 << (16-dist)));
        l_ac = ((l_ac >> dist) | (l_ac << (17 - dist))) & 0x1ffff;
        cpu.fl = (l_ac & 0x10000) != 0;
        cpu.alu_b = l_ac & 0xffff;
        break;

    default:
        fail("Undefined SRU op %d", op);
    }
}


///////////////////////////////////////////////////////////////////////////////
//
// THE BUS INTERFACE & MEMORY MANAGEMENT
//
///////////////////////////////////////////////////////////////////////////////

word
unit_mem(int r, int w)
{
    if (r && !w) cpu.dbus = (*cpu.memr)(cpu.ar);
    else if (w && !r) (*cpu.memw)(cpu.ar, cpu.dbus);
    else fail("Invalid memory access r=%d, w=%d\n", r, w);
    return cpu.dbus;
}


void
mbu_set_ram_rom(int have_rom)
{
    cpu.mbrdis = have_rom ? 0x80 : 0x00;
}


inline longaddr_t
get_mbr(int mbr)
{
    return cpu.mbuen ? cpu.mbr[mbr & 7] : cpu.mbrdis;
}


///////////////////////////////////////////////////////////////////////////////
//
// CONDITIONALS
//
///////////////////////////////////////////////////////////////////////////////

// Decode IFx signals, and update the SKIP flag in the uROM vector for the next
// microinstruction.

#define skipdebug(name)                                         \
    ucdebug("SKIP: " name ": %d (%s)\n",                        \
            cpu.ustate.cond,                                    \
            cpu.ustate.cond == 0 ? "SKIP" : "don't skip")

static inline void
decode_ifx()
{
    cpu.ustate.cond = 1;        // COND=1 means ‘do not skip’
    
    int cond = GET_IF(cpu.control);
    
    switch (cond) {
    case FIELD_IF_IR0:
        cpu.ustate.cond = (cpu.ir & 0x1) ? 0 : 1;
        skipdebug("IF0");
        break;
        
    case FIELD_IF_IR1:
        cpu.ustate.cond = (cpu.ir & 0x2) ? 0 : 1;
        skipdebug("IF1");
        break;

    case FIELD_IF_IR2:
        cpu.ustate.cond = (cpu.ir & 0x4) ? 0 : 1;
        skipdebug("IF2");
        break;

    case FIELD_IF_IR3:
        cpu.ustate.cond = (cpu.ir & 0x8) ? 0 : 1;
        skipdebug("IF3");
        break;

    case FIELD_IF_IR4:
        cpu.ustate.cond = (cpu.ir & 0x10) ? 0 : 1;
        skipdebug("IF4");
        break;

    case FIELD_IF_IR5:
        cpu.ustate.cond = (cpu.ir & 0x20) ? 0 : 1;
        skipdebug("IF5");
        break;

    case FIELD_IF_IR6:
        cpu.ustate.cond = (cpu.ir & 0x40) ? 0 : 1;
        skipdebug("IF6");
        break;

    case FIELD_IF_V:
        cpu.ustate.cond = cpu.fv ? 0 : 1;
        skipdebug("IFV");
        break;

    case FIELD_IF_L:
        cpu.ustate.cond = cpu.fl ? 0 : 1;
        skipdebug("IFL");
        break;

    case FIELD_IF_Z:
        cpu.ustate.cond = cpu.fz ? 0 : 1;
        skipdebug("IFZ");
        break;

    case FIELD_IF_N:
        cpu.ustate.cond = cpu.fn ? 0 : 1;
        skipdebug("IFN");
        break;

    case FIELD_IF_BRANCH:
    {
        // Simulate the hardware exactly.
        word data[5] = {
            cpu.ir & 1,
            (cpu.ir & 2) >> 1,
            (cpu.ir & 4) >> 2,
            (cpu.ir & 8) >> 3,
            (cpu.ir & 16) >> 4
        };

        // This looks like a waste of space, but gcc optimises it to
        // the same assembly code as if we used one long, hard to read
        // expression.
        register int sn = cpu.fn & data[3];
        register int sz = cpu.fz & data[2];
        register int sl = cpu.fl & data[1];
        register int sv = cpu.fv & data[0];

        register int sx = sn || sz || sl || sv;

        // µCode signal COND is active low, so reverse it here.
        cpu.ustate.cond = (sx ^ data[4]) ? 0 : 1;

        ucdebug("BRANCH: A=%04x, DATA=%d%d%d%d%d\n", cpu.ac, data[4], data[3], data[2], data[1], data[0]);
        ucdebug("BRANCH: A=%04x, SV=%d, SL=%d, SZ=%d, SN=%d\n", cpu.ac, sv, sl, sz, sn);
        ucdebug("BRANCH: A=%04x,  V=%d,  L=%d,  Z=%d,  N=%d\n", cpu.ac, cpu.fv, cpu.fl, cpu.fz, cpu.fn);
        skipdebug("IFBRANCH");
    }
    break;
    
    default:
        fail("Unknown microcode conditional %x", cond);
    }
}


///////////////////////////////////////////////////////////////////////////////
//
// READING FROM IBUS UNITS
//
///////////////////////////////////////////////////////////////////////////////


// Decode the read unit: the selected unit puts its value on the IBUS. Only one
// unit may be active at any one time (this is enforced by the microcode
// format: 4 bits identify the read unit).

static inline word
read_from_ibus_unit(int raddr)
{
    word tmp;

    switch (raddr) {
    case FIELD_READ_CS0:
        ucdebug("IBUS <- CS0 (0000)\n");
        return 0;

    case FIELD_READ_CS1:
        ucdebug("IBUS <- CS1 (0001)\n");
        return 1;

    case FIELD_READ_CS2:
        ucdebug("IBUS <- CS2 (0002)\n");
        return 2;

    case FIELD_READ_CS3:
        ucdebug("IBUS <- CS2 (0002)\n");
        return 3;

    case FIELD_READ_PC:
        ucdebug("IBUS <- PC (%04x)\n", cpu.pc);
        return cpu.pc;

    case FIELD_READ_DR:
        ucdebug("IBUS <- DR (%04x)\n", cpu.dr);
        return cpu.dr;

    case FIELD_READ_AC:
        ucdebug("IBUS <- AC (%04x)\n", cpu.ac);
        return cpu.ac;
        
    case FIELD_READ_SP:
        ucdebug("IBUS <- SP (%04x)\n", cpu.sp);
        return cpu.sp;

    case FIELD_READ_MBP_FLAGS:
        tmp = get_mbr(MBR_MBP) | cpu.fn << 10 | cpu.fz << 11 |
            cpu.fl << 12 | cpu.fv << 13 | cpu.fi << 15;
        ucdebug("IBUS <- BMP+FLAGS (%04x)\n", tmp);
        return tmp;

    case FIELD_READ_AGL:
        tmp = MAKE_SHORT_ADDRESS(get_r(cpu.ir) ? 0 : cpu.agl_page, cpu.ir);
        ucdebug("IBUS <- AGL (%04x)\n", tmp);
        return tmp;

    case FIELD_READ_ALU_ADD:
    {
        uint32_t sum = (uint32_t) cpu.alu_a + (uint32_t) cpu.alu_b;
        cpu.alu_y = sum & 0xffff;
        if (sum & 0x10000) cpu.fl = !cpu.fl;
        cpu.fv = (cpu.alu_a & 0x8000) == (cpu.alu_b & 0x8000) && \
            (cpu.alu_a & 0x8000) != (cpu.ibus & 0x8000);
        ucdebug("IBUS <- A + B (%04x), L <- %d, V <- %d\n", cpu.alu_y, cpu.fl, cpu.fl);
        return 0;               // Pretend we need extra time for the addition
    }
        
    case FIELD_READ_ALU_AND:
        cpu.alu_y = cpu.alu_a & cpu.alu_b;
        ucdebug("IBUS <- A AND B (%04x)\n", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_OR:
        cpu.alu_y = cpu.alu_a | cpu.alu_b;
        ucdebug("IBUS <- A OR B (%04x)\n", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_XOR:
        cpu.alu_y = cpu.alu_a ^ cpu.alu_b;
        ucdebug("IBUS <- A XOR B (%04x)\n", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_NOT:
        cpu.alu_y = cpu.alu_a ^ 0xffff;
        ucdebug("IBUS <- NOT A (%04x)\n", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_Y:
        ucdebug("IBUS <- ALU Y (%04x)\n", cpu.alu_y);
        return cpu.alu_y;

    case FIELD_READ_ALU_B:
        ucdebug("IBUS <- ALU B (%04x)\n", cpu.alu_b);
        return cpu.alu_b;
        
    default:
        fail("Unknown RADDR %x.", raddr)
    }

    // We should never get here
    return cpu.ibus;
}


///////////////////////////////////////////////////////////////////////////////
//
// WRITING TO IBUS UNIT
//
///////////////////////////////////////////////////////////////////////////////

// Decode the write unit and handle side effects: the selected unit gets its
// value from the IBUS. This must run after a value has been put on the IBUS,
// which simulates the hardware behaviour too (write unit control pulses are
// delayed to allow the unit outputting a value to settle). Only one unit may
// be active at any one time (this is enforced by the microcode format: 4 bits
// identify the read unit).

static inline void
write_to_ibus_unit(int waddr)
{
    switch(waddr){
    case FIELD_WRITE_AR_MBP:
        cpu.ar = get_mbr(MBR_MBP) | cpu.ibus;
        ucdebug("AR <- MBP:IBUS (%s)\n", format_longaddr(cpu.ar, NULL));
        return;

    case FIELD_WRITE_AR_MBD:
        cpu.ar = get_mbr(MBR_MBD) | cpu.ibus;
        ucdebug("AR <- MBD:IBUS (%s)\n", format_longaddr(cpu.ar, NULL));
        return;

    case FIELD_WRITE_AR_MBS:
        cpu.ar = get_mbr(MBR_MBS) | cpu.ibus;
        ucdebug("AR <- MBS:IBUS (%s)\n", format_longaddr(cpu.ar, NULL));
        return;

    case FIELD_WRITE_AR_MBZ:
    {
        // MBZ-relative addressing as a more complicated special case for
        // auto-index MBR-relative addressing modes.
        word mbr = MBR_MBZ;

        // If the microcode is requesting an MBR-relative indexing mode, and
        // the instruction has I=1 and R=1 and an operand >= 0x300, then we
        // select an MBR based on the least significant bits of the IR. It's
        // very simple in C, but this little fucker of a feature added several
        // ICs to the Memory Banking Unit!
        if ((GET_ACTION(cpu.ir) == FIELD_ACTION_IDX) && 
            (cpu.ir & 0x0f00) == 0x0f00) {
            mbr = cpu.ir & 7;
        }

        cpu.ar = get_mbr(mbr) | cpu.ibus;
        ucdebug("AR <- MB%d:IBUS (%s)\n", format_longaddr(cpu.ar, NULL));
        return;
    }

    case FIELD_WRITE_PC:
        cpu.pc = cpu.ibus;
        ucdebug("PC <- IBUS (%04x)\n", cpu.ibus);
        // // Sanity check
        // if (sanity && (cpu.pc == 0)) {
        //     fail("PC at 0000. This is probably a CFT software error.\n");
        // }
        return;

    case FIELD_WRITE_DR:
        cpu.dr = cpu.ibus;
        ucdebug("DR <- IBUS (%04x)\n", cpu.ibus);
        return;

    case FIELD_WRITE_AC:
        cpu.ac = cpu.ibus;
        cpu.fn = (cpu.ac & 0x8000) != 0;
        cpu.fz = cpu.ac == 0;
        ucdebug("AC <- IBUS (%04x)\n", cpu.ibus);
        return;

    case FIELD_WRITE_SP:
        cpu.sp = cpu.ibus;
        ucdebug("SP <- IBUS (%04x)\n", cpu.ibus);
        return;

    case FIELD_WRITE_MBP:
        cpu.mbr[MBR_MBP] = (cpu.ibus & 0xff) << 16;
        ucdebug("MBP <- IBUS (%02x)\n", cpu.ibus & 0xff);
        return;

    case FIELD_WRITE_MBP_FLAGS:
        cpu.mbr[MBR_MBP] = (cpu.ibus & 0xff) << 16;
        cpu.fl = cpu.ibus && 0x1000 ? 1 : 0;
        cpu.fv = cpu.ibus && 0x2000 ? 1 : 0;
        cpu.fi = cpu.ibus && 0x8000 ? 1 : 0;
        ucdebug("MBP+FLAGS <- IBUS (%04x) [L=%d V=%d I=%d]", cpu.ibus, cpu.fl, cpu.fv, cpu.fi);
        return;
        
    case FIELD_WRITE_FLAGS:
        cpu.fl = cpu.ibus && 0x1000 ? 1 : 0;
        cpu.fv = cpu.ibus && 0x2000 ? 1 : 0;
        cpu.fi = cpu.ibus && 0x8000 ? 1 : 0;
        ucdebug("FLAGS <- IBUS (%04x) [L=%d V=%d I=%d]", cpu.ibus, cpu.fl, cpu.fv, cpu.fi);
        return;

    case FIELD_WRITE_IR:
        cpu.ir = cpu.ibus;
        // 15  14  13  12  11  10   9   8   7   6   5   4   3   2   1   0
        // OP------------  I   R    SUB------
        //                 800 400 200 100  80  40  20  10  4   3   2   1
        cpu.ustate.op = (cpu.ir >> 12) & 15;
        cpu.ustate.i = cpu.ir & 0x800 ? 1 : 0;
        cpu.ustate.r = cpu.ir & 0x400 ? 1 : 0;
        cpu.ustate.subop = (cpu.ir >> 7) & 7;
        ucdebug("IR <- IBUS (%04x): %s\n", cpu.ibus, disasm(cpu.ir, 1, NULL));
        
    case FIELD_WRITE_ALU_B:
        cpu.alu_b = cpu.ibus;
        ucdebug("ALU B <- IBUS (%04x)\n", cpu.ibus);
        
    default:
        fail("Unknown WADDR %x.", waddr)
    }
}


///////////////////////////////////////////////////////////////////////////////
//
// MAIN LOOP
//
///////////////////////////////////////////////////////////////////////////////

void
cpu_run()
{
    // Reset the emulation and CPU 
    cpu.tick = 0;
    cpu.wait = 0;
    cpu.halt = 0;
    // extern int dfp_enabled;
    // cpu.pause = dfp_enabled ? 1 : 0;
    cpu_reset();

    time_t t0 = time(NULL);
    word oldpc = 0xbeef;
    void dfp_tick();
        
    //word addr;
    //static struct timespec ts;
    cpu.quit = 0;
    while(!cpu.quit) {
        volatile int p;
        for (p = 0; p < 50; p++);
                

        // Do nothing if the emulation is paused. 
        if (cpu.pause || cpu.halt) {
            ui_tick();
            dfp_tick(); // the DFP always runs
            usleep(1000);
            continue;
        }

        // Link the CPU state to the microcode ROM.
        cpu.ustate.op = get_op(cpu.ir);
        //ucdebug("VECTOR I = %x (%x, %x)\n", cpu.ustate.i, cpu.ir, get_i(cpu.ir));
        //ucdebug("VECTOR R = (%x, %x)\n", cpu.ir, get_r(cpu.ir));
        cpu.ustate.i = get_i(cpu.ir);
        //cpu.ustate.skip = 1; // Active low: 1 == no skip 

        //
        // WARNING: HARDWARE BUG FOUND. (this has since been fixed)
        //
        // The (active hgh) INC flag in the microcode vector must not
        // be de-asserted (cleared, 0) until the /end signal is
        // encountered. If this is NOT done, depending on the value of
        // AR (which is modified during the execution of an autoindex
        // instruction), the INC signal can go low, and the microcode
        // will jump to an undefined (/end) instruction mid-execution.
        //
        // On real hardware, a J-K flip-flop would be SET on autoindex,
        // and RESET (cleared) by /end.
        //
        // FIX REVISION 2:
        //
        // To make sure the autoincrement isn't changed, it should only
        // be set when IR is set.
         
        if (cpu.ustate.uaddr == 0) {
            cpu.ustate.inc = 1;
        } else {
            //cpu.ustate.inc |= is_autoindex(cpu.ar);
            // Moved to IR latching code.
        }

        //
        // Likewise, buffer the IRQ requests. The hardware already does
        // this (the internal IRQ line sets a flip-flop that stays
        // active for the entire microprogram 
        if (cpu.irq == 0) {
            if ((cpu.ustate.uaddr == 0) && (cpu.i == 0)) {
                //dump();
                //info("Going to IRQ\n");
                //exit(0);
                cpu.irq = 1;         // Clear the IRQ signal 
                cpu.ustate.int_ = 0; // Set the INT microcode condition 
            }
        }
                
        // Handle the reset pulse
        handle_reset();

        // Print out current address and instruction.
        if(debug_asm) {
            if (cpu.ustate.uaddr == 0) {
                oldpc = cpu.pc;
            } else if (cpu.ustate.uaddr == 2) {
                dump_mini(oldpc);
            }
        }

        // Update the uPC and read the microcode ROM.
        cpu.upc = MAKE_ADDR(0, // UCB extension offset: not implemented 
                            cpu.ustate.rst,
                            cpu.ustate.int_,
                            cpu.v,
                            cpu.l,
                            cpu.ustate.op,
                            cpu.ustate.i,
                            cpu.ustate.skip,
                            cpu.ustate.inc,
                            cpu.ustate.uaddr);
        cpu.control = microcode[cpu.upc];

        // Decode the control vector from the uROM.
        uint32_t cpl = IS_CPL(cpu.control);
        uint32_t cll = IS_CLL(cpu.control);
        uint32_t sti = IS_STI(cpu.control);
        uint32_t cli = IS_CLI(cpu.control);
        uint32_t incpc = IS_INCPC(cpu.control);
        uint32_t stpac = IS_STPAC(cpu.control);
        uint32_t stpdr = IS_STPDR(cpu.control);
        uint32_t dec = IS_DEC(cpu.control);
        uint32_t mem = IS_MEM(cpu.control);
        uint32_t io = IS_IO(cpu.control);
        uint32_t r = IS_R(cpu.control);
        uint32_t w = IS_W(cpu.control);
        uint32_t end = IS_END(cpu.control);

        // Print CPU state.
        if(debug_microcode) {
            printf("\n\n");
            info("PC: %04x/%d\n", cpu.pc, cpu.ustate.uaddr);
            dump_state();
            dump_ustate();
        }

        // Act on the signals of the control vector. All actions are
        // essentially level comparisons, edge-sensitive signals are
        // dealt with as if they too were level-sensitive. This could
        // give rise to a few bugs, which we'll kludge here.

        // IFx flags are decoded late in the cycle and acted on in the
        // next clock tick. This mirrors the behaviour of the hardware.
        decode_ifx();

        // Handle memory and I/O *READS*
        sanity_check (mem && io, "MEM and IO selected at once. Microcode bug.\n");
        sanity_check (r && w, "R and W selected at once. Microcode bug.\n");
        if (r && mem) cpu.dbus = unit_mem(r, w);
        else if (r && io) cpu.dbus = unit_io(r, w);

        // Read from a unit.
        decode_read_unit();

        // Write to a unit.
        decode_write_unit();

        // Drive the data bus if needed
        if (IS_W(cpu.control)) {
            cpu.dbus = cpu.ibus;
            ucdebug("*** DBUS <- IBUS (%04x)\n", cpu.ibus);
        }

        // Handle memory and I/O *WRITES*
        if (w && mem) cpu.dbus = unit_mem(r, w);
        else if (w && io) cpu.dbus = unit_io(r, w);

        // Step the PC
        if (incpc) {
            cpu.pc = (cpu.pc + 1) & 0xffff;
            ucdebug("pc_inc: PC <- %04x\n", cpu.pc);
            // Sanity check
            if (sanity && (cpu.pc == 0)) {
                fail("PC AT 0000, SHOULD NEVER HAPPEN\n");
            }
        }
                
        // Increment A, if requested by an OPx instruction.
        if (stpac) {
            if (dec) {
                set_a((cpu.a - 1) & 0xffff);
                if (cpu.a == 0xffff) cpu.l = !cpu.l;
            } else {
                set_a((cpu.a + 1) & 0xffff);
                if (cpu.a == 0) cpu.l = !cpu.l;
            }
            ucdebug("inc_a: A <- %04x\n", cpu.a);
        }

        // Step the DR.
        if (stpdr) {
            cpu.dr = (dec ? cpu.dr - 1 : cpu.dr + 1) & 0xffff;
            ucdebug("step_dr: DR <- %04x\n", cpu.dr);
        }

        // Set other stuff
        if (cpl) {
            cpu.l = !cpu.l;
            ucdebug("cpl: L <- %d\n", cpu.l);
        }
        if (cll) {
            cpu.l = 0;
            ucdebug("cpl: L <- %d\n", cpu.l);
        }
        if (sti) {
            cpu.arm_sti = 1; // Arm STI.
        }
        if (cli) {
            cpu.i = 1;
            ucdebug("CLI: PC=%04x, I <- %d\n", cpu.pc, cpu.i);
        }

        // Update the CPU microcode state
        cpu.ustate.l = cpu.l;
        cpu.ustate.v = cpu.v;

        // Next!
        cpu.tick++;

        // End of the instruction?
        if (end) {
            //dump_state();
            cpu.agl_page = get_page(cpu.pc);
            cpu.ustate.uaddr = 0;
            cpu.ustate.int_ = 1; // Clear the INT microcode condition 
            ucdebug("*** GO FETCH ***\n\n\n\n\n\n\n");
        } else if (!cpu.wait) {
            cpu.ustate.uaddr++;
            sanity_check(cpu.ustate.uaddr == 0,
                         "uADDR wrapped around! Microcode bug?\n");
        }

        // Perform 'background' 'hardware' tasks.
        if (cpu.iotick != NULL) (*cft.iotick)();
    }

    time_t t1 = time(NULL);
    if (t1 != t0) {
        info("Time: %s%lu%s s. Speed: %s%lu%s kHz\n",
             COL_WHI, t1 - t0, COL_GRE,
             COL_WHI, cpu.tick / (t1 - t0) / 1000, COL_GRE);
    }
}


















































































// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
