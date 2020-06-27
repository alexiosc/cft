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

#define LOG_MACROS_UNIT ctl_log_unit
#include "log.h"


static log_unit_t ctl_log_unit; // Logging unit for the Control Unit.

// The emulator state
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


//#define ctl_debug(msg, ...) log_msg (LOG_DEBUG, log_ctl, msg, ## __VA_ARGS__)
#define sbu_debug debug // (msg, ...) log_msg (LOG_DEBUG, log_sbu, msg, ## __VA_ARGS__)


///////////////////////////////////////////////////////////////////////////////
//
// FORWARD DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////

static int _dummy_memr(longaddr_t ab, word * db);

static int _dummy_memw(longaddr_t ab, word db);

static int _dummy_ior(longaddr_t ab, word * db);

static int _dummy_iow(longaddr_t ab, word db);


///////////////////////////////////////////////////////////////////////////////
//
// BASICS AND RUN CONTROL
//
///////////////////////////////////////////////////////////////////////////////


// Initialise the CPU (but don't reset it yet!)
void
cpu_init()
{
    // Clear everything in the CPU state.
    memset(&cpu, 0, sizeof(cpu));
        
    // Initialise logging
    ctl_log_unit = log_add_unit("CTL", -1, 0);

    // Register dummy callbacks
    cpu.memr = _dummy_memr;
    cpu.memw = _dummy_memw;
    cpu.ior = _dummy_ior;
    cpu.iow = _dummy_iow;

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
    cpu.mbrdis = 0x800000;
    cpu.mbuen = 0;

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
    cpu.uav.rst = 0;            // 0 = RESET# is ACTIVE */
    cpu.uav.int_ = 1;           // 1 = INT# is not active
    cpu.uav.uaddr = 0;          // The uPC resets to 0 on power on/reset
    cpu.irq = 1;                // Clear IRQ (1 = no IRQ received)
    cpu.rst_hold = 2;           // We don't need to hold reset for long here
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
    cpu.mbrdis = 0x800000;
    cpu.mbuen = 0;
}


// Simulate reset behaviour: the CFT's reset circuitry contains a counter
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
        cpu.uav.rst = 1;
        cpu.rst_hold = -1;
        cpu.resetting = 0;
        debug("*** RST_HOLD cleared ***");
    }
}


void
cpu_halt()
{
    cpu.halt = 1;
    info("Halted");
    // v.dirty++;
    // v.stdirty++;
}


void
cpu_start()
{
    cpu.halt = 0;
    info("Resumed");
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
    //     info("*** QUIT PRESSED ***");
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
        fatal("Undefined SRU op %d", op);
    }
}


/*

        // Step the PC
        if (incpc) {
            cpu.pc = (cpu.pc + 1) & 0xffff;
            debug("pc_inc: PC <- %04x", cpu.pc);
            // Sanity check
            if (sanity && (cpu.pc == 0)) {
                fatal("PC AT 0000, SHOULD NEVER HAPPEN");
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
            debug("inc_a: A <- %04x", cpu.a);
        }

        // Step the DR.
        if (stpdr) {
            cpu.dr = (dec ? cpu.dr - 1 : cpu.dr + 1) & 0xffff;
            debug("step_dr: DR <- %04x", cpu.dr);
        }

        // Set other stuff
        if (cpl) {
            cpu.l = !cpu.l;
        }
        if (cll) {
            cpu.l = 0;
            debug("cpl: L <- %d", cpu.l);
        }
        if (sti) {
            cpu.arm_sti = 1; // Arm STI.
        }
        if (cli) {
            cpu.i = 1;
            debug("CLI: PC=%04x, I <- %d", cpu.pc, cpu.i);
        }

*/


static inline void
handle_actions(int action)
{
    cpu.uav.cond = 1;        // COND=1 means ‘do not skip’

    switch (action) {
    case FIELD_ACTION_CPL:
        cpu.fl ^= 1;
        debug("action_cpl: L <- %d", cpu.fl);
        return;

    case FIELD_ACTION_CLL:
        cpu.fl = 0;
        debug("action_cll: L <- %d", cpu.fl);
        return;

    case FIELD_ACTION_STI:
        cpu.fi = 1;
        debug("action_sti: I <- %d", cpu.fi);
        return;

    case FIELD_ACTION_CLI:
        cpu.fi = 0;
        debug("action_cli: I <- %d", cpu.fi);
        return;

    case FIELD_ACTION_IDX:
        // This is decoded when write_ar_mbz is handled.
        return;

    case FIELD_ACTION_SRU:
        action_sru();
        return;

    case FIELD_ACTION_INCPC:
        cpu.pc = (cpu.pc + 1) & 0xffff;
        debug("action_incpc: PC <- %04x", cpu.pc);
        // Sanity check
        if (cpu.pc == 0) {
            fatal("PC wrapped around to 0000. This is software bug.");
        }
        return;

    case FIELD_ACTION_INCDR:
        cpu.dr = (cpu.dr + 1) & 0xffff;
        debug("action_incdr: DR <- %04x", cpu.dr);
        return;
        
    case FIELD_ACTION_DECDR:
        cpu.dr = (cpu.dr - 1) & 0xffff;
        debug("action_decdr: DR <- %04x", cpu.dr);
        return;

    case FIELD_ACTION_INCAC:
        if (cpu.ac == 0xffff) cpu.fl ^= 1;
        cpu.ac = (cpu.ac + 1) & 0xffff;
        debug("action_incac: AC <- %04x [L=%d]", cpu.ac, cpu.fl);
        return;

    case FIELD_ACTION_DECAC:
        if (cpu.ac == 0) cpu.fl ^= 1;
        cpu.ac = (cpu.ac - 1) & 0xffff;
        debug("action_decac: AC <- %04x [L=%d]", cpu.ac, cpu.fl);

    case FIELD_ACTION_INCSP:
        cpu.sp = (cpu.sp + 1) & 0xffff;
        debug("action_incsp: SP <- %04x", cpu.sp);
        return;
        
    case FIELD_ACTION_DECSP:
        cpu.sp = (cpu.sp - 1) & 0xffff;
        debug("action_decsp: SP <- %04x", cpu.sp);
        return;

    default:
        fatal("Unknown ACTION %x", action);
    }
}


///////////////////////////////////////////////////////////////////////////////
//
// THE BUS INTERFACE & MEMORY MANAGEMENT
//
///////////////////////////////////////////////////////////////////////////////

// Load the Data Bus with data from a memory or I/O space device.
inline void
bus_reads(int mem, int io)
{
    if (mem && io) {
        fatal("MEM and IO asserted simultaneously during read. Microcode bug!");
    }

    if (mem) {
        if ((*cpu.memr)(cpu.ar, &cpu.dbus) < 0) {
            warning("Bus error: read from undecoded address %s",
                    format_longaddr(cpu.ar, NULL));
        }
    }

    if (io) {
        if ((*cpu.ior)(cpu.ar, &cpu.dbus) < 0) {
            warning("Bus error: read from undecoded I/O port %03x",
                    format_longaddr(cpu.ar & 0xffff, NULL));
        }
    }
}


// Write the value on the Data Bus to a memory or I/O space device.
inline void
bus_writes(int mem, int io)
{
    if (mem && io) {
        fatal("MEM and IO asserted simultaneously during write. Microcode bug!");
    }

    if (mem) {
        if ((*cpu.memw)(cpu.ar, cpu.dbus) < 0) {
            warning("Bus error: write to undecoded address %s",
                    format_longaddr(cpu.ar, NULL));
        }
    }

    if (io) {
        if ((*cpu.iow)(cpu.ar, cpu.dbus) < 0) {
            warning("Bus error: write to undecoded I/O port %03x",
                    format_longaddr(cpu.ar & 0xffff, NULL));
        }
    }
}


// These allow the CPU to run, but not very well.
int
_dummy_memr(longaddr_t ab, word * db)
{
    warning("dummy callback %s called", __func__);
    return -1;
}
    

int
_dummy_memw(longaddr_t ab, word db)
{
    warning("dummy callback %s called", __func__);
    return -1;
}
    

int
_dummy_ior(longaddr_t ab, word * db)
{
    warning("dummy callback %s called", __func__);
    return -1;
}
    

int
_dummy_iow(longaddr_t ab, word db)
{
    warning("dummy callback %s called", __func__);
    return -1;
}


///////////////////////////////////////////////////////////////////////////////
//
// MEMORY BANKING UNIT
//
///////////////////////////////////////////////////////////////////////////////

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


int
mbu_read(longaddr_t a, word *d)
{
    assert(d != NULL);
    a = a & 0x3ff;
    if (a >= 0x008 && a <= 0x00f) {
        cpu.mbuen = 1;
        *d = cpu.mbr[a & 7];
        return 1;
    }
    return 0;
}


int
mbu_write(longaddr_t a, word d)
{
    a = a & 0x3ff;
    if (a >= 0x008 && a <= 0x00f) {
        cpu.mbuen = 1;
        cpu.mbr[a & 7] = d & 0xff;
        return 1;
    }
    return 0;
}








///////////////////////////////////////////////////////////////////////////////
//
// CONDITIONALS
//
///////////////////////////////////////////////////////////////////////////////

// Decode IFx signals, and update the SKIP flag in the uROM vector for the next
// microinstruction.

static inline void
decode_cond(int cond)
{
    cpu.uav.cond = 1;        // COND=1 means ‘do not skip’
    
    switch (cond) {
    case 0:
        // Idle, always true
        cpu.uav.cond = 1;
        break;
        
    case FIELD_IF_IR0:
        cpu.uav.cond = (cpu.ir & 0x1) ? 0 : 1;
        sbu_debug("IF0");
        break;
        
    case FIELD_IF_IR1:
        cpu.uav.cond = (cpu.ir & 0x2) ? 0 : 1;
        sbu_debug("IF1");
        break;

    case FIELD_IF_IR2:
        cpu.uav.cond = (cpu.ir & 0x4) ? 0 : 1;
        sbu_debug("IF2");
        break;

    case FIELD_IF_IR3:
        cpu.uav.cond = (cpu.ir & 0x8) ? 0 : 1;
        sbu_debug("IF3");
        break;

    case FIELD_IF_IR4:
        cpu.uav.cond = (cpu.ir & 0x10) ? 0 : 1;
        sbu_debug("IF4");
        break;

    case FIELD_IF_IR5:
        cpu.uav.cond = (cpu.ir & 0x20) ? 0 : 1;
        sbu_debug("IF5");
        break;

    case FIELD_IF_IR6:
        cpu.uav.cond = (cpu.ir & 0x40) ? 0 : 1;
        sbu_debug("IF6");
        break;

    case FIELD_IF_V:
        cpu.uav.cond = cpu.fv ? 0 : 1;
        sbu_debug("IFV");
        break;

    case FIELD_IF_L:
        cpu.uav.cond = cpu.fl ? 0 : 1;
        sbu_debug("IFL");
        break;

    case FIELD_IF_Z:
        cpu.uav.cond = cpu.fz ? 0 : 1;
        sbu_debug("IFZ");
        break;

    case FIELD_IF_N:
        cpu.uav.cond = cpu.fn ? 0 : 1;
        sbu_debug("IFN");
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
        cpu.uav.cond = (sx ^ data[4]) ? 0 : 1;

        sbu_debug("BRANCH: A=%04x, DATA=%d%d%d%d%d", cpu.ac, data[4], data[3], data[2], data[1], data[0]);
        sbu_debug("BRANCH: A=%04x, SV=%d, SL=%d, SZ=%d, SN=%d", cpu.ac, sv, sl, sz, sn);
        sbu_debug("BRANCH: A=%04x,  V=%d,  L=%d,  Z=%d,  N=%d", cpu.ac, cpu.fv, cpu.fl, cpu.fz, cpu.fn);
        sbu_debug("IFBRANCH");
    }
    break;
    
    default:
        fatal("Unknown microcode conditional %x", cond);
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
        debug("IBUS <- CS0 (0000)");
        return 0;

    case FIELD_READ_CS1:
        debug("IBUS <- CS1 (0001)");
        return 1;

    case FIELD_READ_CS2:
        debug("IBUS <- CS2 (0002)");
        return 2;

    case FIELD_READ_CS3:
        debug("IBUS <- CS2 (0002)");
        return 3;

    case FIELD_READ_PC:
        debug("IBUS <- PC (%04x)", cpu.pc);
        return cpu.pc;

    case FIELD_READ_DR:
        debug("IBUS <- DR (%04x)", cpu.dr);
        return cpu.dr;

    case FIELD_READ_AC:
        debug("IBUS <- AC (%04x)", cpu.ac);
        return cpu.ac;
        
    case FIELD_READ_SP:
        debug("IBUS <- SP (%04x)", cpu.sp);
        return cpu.sp;

    case FIELD_READ_MBP_FLAGS:
        tmp = get_mbr(MBR_MBP) | cpu.fn << 10 | cpu.fz << 11 |
            cpu.fl << 12 | cpu.fv << 13 | cpu.fi << 15;
        debug("IBUS <- BMP+FLAGS (%04x)", tmp);
        return tmp;

    case FIELD_READ_AGL:
        tmp = MAKE_SHORT_ADDRESS(get_r(cpu.ir) ? 0 : cpu.agl_page, cpu.ir);
        debug("IBUS <- AGL (%04x)", tmp);
        return tmp;

    case FIELD_READ_ALU_ADD:
    {
        uint32_t sum = (uint32_t) cpu.alu_a + (uint32_t) cpu.alu_b;
        cpu.alu_y = sum & 0xffff;
        if (sum & 0x10000) cpu.fl = !cpu.fl;
        cpu.fv = (cpu.alu_a & 0x8000) == (cpu.alu_b & 0x8000) && \
            (cpu.alu_a & 0x8000) != (cpu.ibus & 0x8000);
        debug("IBUS <- A + B (%04x), L <- %d, V <- %d", cpu.alu_y, cpu.fl, cpu.fl);
        return 0;               // Pretend we need extra time for the addition
    }
        
    case FIELD_READ_ALU_AND:
        cpu.alu_y = cpu.alu_a & cpu.alu_b;
        debug("IBUS <- A AND B (%04x)", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_OR:
        cpu.alu_y = cpu.alu_a | cpu.alu_b;
        debug("IBUS <- A OR B (%04x)", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_XOR:
        cpu.alu_y = cpu.alu_a ^ cpu.alu_b;
        debug("IBUS <- A XOR B (%04x)", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_NOT:
        cpu.alu_y = cpu.alu_a ^ 0xffff;
        debug("IBUS <- NOT A (%04x)", cpu.alu_y);
        return cpu.alu_y;
        
    case FIELD_READ_ALU_Y:
        debug("IBUS <- ALU Y (%04x)", cpu.alu_y);
        return cpu.alu_y;

    case FIELD_READ_ALU_B:
        debug("IBUS <- ALU B (%04x)", cpu.alu_b);
        return cpu.alu_b;
        
    default:
        fatal("Unknown RADDR %x.", raddr)
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
        debug("AR <- MBP:IBUS (%s)", format_longaddr(cpu.ar, NULL));
        return;

    case FIELD_WRITE_AR_MBD:
        cpu.ar = get_mbr(MBR_MBD) | cpu.ibus;
        debug("AR <- MBD:IBUS (%s)", format_longaddr(cpu.ar, NULL));
        return;

    case FIELD_WRITE_AR_MBS:
        cpu.ar = get_mbr(MBR_MBS) | cpu.ibus;
        debug("AR <- MBS:IBUS (%s)", format_longaddr(cpu.ar, NULL));
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
        debug("AR <- MB%d:IBUS (%s)", mbr, format_longaddr(cpu.ar, NULL));
        return;
    }

    case FIELD_WRITE_PC:
        cpu.pc = cpu.ibus;
        debug("PC <- IBUS (%04x)", cpu.ibus);
        // // Sanity check
        // if (sanity && (cpu.pc == 0)) {
        //     fatal("PC at 0000. This is probably a CFT software error.");
        // }
        return;

    case FIELD_WRITE_DR:
        cpu.dr = cpu.ibus;
        debug("DR <- IBUS (%04x)", cpu.ibus);
        return;

    case FIELD_WRITE_AC:
        cpu.ac = cpu.ibus;
        cpu.fn = (cpu.ac & 0x8000) != 0;
        cpu.fz = cpu.ac == 0;
        debug("AC <- IBUS (%04x)", cpu.ibus);
        return;

    case FIELD_WRITE_SP:
        cpu.sp = cpu.ibus;
        debug("SP <- IBUS (%04x)", cpu.ibus);
        return;

    case FIELD_WRITE_MBP:
        cpu.mbr[MBR_MBP] = (cpu.ibus & 0xff) << 16;
        debug("MBP <- IBUS (%02x)", cpu.ibus & 0xff);
        return;

    case FIELD_WRITE_MBP_FLAGS:
        cpu.mbr[MBR_MBP] = (cpu.ibus & 0xff) << 16;
        cpu.fl = cpu.ibus && 0x1000 ? 1 : 0;
        cpu.fv = cpu.ibus && 0x2000 ? 1 : 0;
        cpu.fi = cpu.ibus && 0x8000 ? 1 : 0;
        debug("MBP+FLAGS <- IBUS (%04x) [L=%d V=%d I=%d]", cpu.ibus, cpu.fl, cpu.fv, cpu.fi);
        return;
        
    case FIELD_WRITE_FLAGS:
        cpu.fl = cpu.ibus && 0x1000 ? 1 : 0;
        cpu.fv = cpu.ibus && 0x2000 ? 1 : 0;
        cpu.fi = cpu.ibus && 0x8000 ? 1 : 0;
        debug("FLAGS <- IBUS (%04x) [L=%d V=%d I=%d]", cpu.ibus, cpu.fl, cpu.fv, cpu.fi);
        return;

    case FIELD_WRITE_IR:
        cpu.ir = cpu.ibus;
        debug("IR <- IBUS (%04x): %s", cpu.ibus, disasm(cpu.ir, 1, NULL));
        return;
        
    case FIELD_WRITE_ALU_B:
        cpu.alu_b = cpu.ibus;
        debug("ALU B <- IBUS (%04x)", cpu.ibus);
        return;
        
    default:
        fatal("Unknown WADDR %x.", waddr)
    }
}


///////////////////////////////////////////////////////////////////////////////
//
// MAIN LOOP
//
///////////////////////////////////////////////////////////////////////////////

// Implement the control store.
static void
cpu_control_store()
{
    // 15  14  13  12  11  10   9   8   7   6   5   4   3   2   1   0
    // OP------------  I   R    SUB------
    //                 800 400 200 100  80  40  20  10  4   3   2   1


    // Much of the UAV comes from the IR, but it's split in four fields.
    cpu.uav.op = (cpu.ir >> 12) & 15;
    cpu.uav.i = (cpu.ir >> 11) & 1;
    cpu.uav.r = (cpu.ir >> 10) & 1;
    cpu.uav.subop = (cpu.ir >> 7) & 7;

    // If an interrupt has been requested and interrupts are allowed, we jump
    // to the IRQ microprogram when the previous instruction ends.
    if (cpu.irq == 0 && cpu.fi == 0 && cpu.uav.uaddr == 0) {
        cpu.uav.int_ = 0;       // Set the INT microcode condition 
    }

    // Update the uPC and read the microcode ROM.
    cpu.uaddr = MAKE_ADDR(cpu.uav.rst,
                          cpu.uav.int_,
                          cpu.uav.op,
                          cpu.uav.i,
                          cpu.uav.r,
                          cpu.uav.subop,
                          cpu.uav.cond,
                          cpu.uav.idx,
                          cpu.uav.uaddr);
    cpu.ucv = microcode[cpu.uaddr];
}


void
cpu_run()
{
    assert (cpu.memr != NULL);
    
    // Reset the emulation and CPU 
    cpu.tick = 0;
    cpu.wait = 0;
    cpu.halt = 0;
    // extern int dfp_enabled;
    // cpu.pause = dfp_enabled ? 1 : 0;
    cpu_reset();

    // time_t t0 = time(NULL);
    // word oldpc = 0xbeef;
        
    //word addr;
    //static struct timespec ts;
    cpu.quit = 0;
    while(!cpu.quit) {
        volatile int p;
        for (p = 0; p < 50; p++);

        // Do nothing if the emulation is paused. 
        if (cpu.pause || cpu.halt) {
            // ui_tick();
            // dfp_tick(); // the DFP always runs
            usleep(1000);
            continue;
        }

        // Handle the reset pulse
        cpu_handle_reset();

        // Let the control store run.
        cpu_control_store();

        // Print out current address and instruction.
        // if(debug_asm) {
        //     if (cpu.uav.uaddr == 0) {
        //         oldpc = cpu.pc;
        //     } else if (cpu.uav.uaddr == 2) {
        //         dump_mini(oldpc);
        //     }
        // }

        // Decode the control vector from the uROM.

        int raddr = GET_READ(cpu.ucv);
        int waddr = GET_WRITE(cpu.ucv);
        int cond = GET_IF(cpu.ucv);
        int action = GET_ACTION(cpu.ucv);

        int mem = IS_MEM(cpu.ucv);
        int io = IS_IO(cpu.ucv);
        int r = IS_R(cpu.ucv);
        int w = IS_WEN(cpu.ucv);
        int end = IS_END(cpu.ucv);

        // Print CPU state.
        // if (debug_microcode) {
        //     printf("");
        //     info("PC: %04x/%d", cpu.pc, cpu.uav.uaddr);
        //     dump_state();
        //     dump_ustate();
        // }
        debug("IR=%04x %-14.14s PC=%04x  AC=%04x  DR=%04x  SP=%04x  MBP{P=%02x D=%02x S=%02x Z=%02x} uAV=%06x uCV=%06x",
              cpu.ir, disasm(cpu.ir, 1, NULL),
              cpu.pc, cpu.ac, cpu.dr, cpu.sp,
              cpu.mbrdis >> 16,
              get_mbr(0) >> 16, get_mbr(1) >> 16, get_mbr(2) >> 16, get_mbr(3) >> 16,
              cpu.uaddr, cpu.ucv);

        // Act on the signals of the control vector. All actions are
        // essentially level comparisons, edge-sensitive signals are
        // dealt with as if they too were level-sensitive. This could
        // give rise to a few bugs, which we'll kludge here.

        // Decode conditionals and set the SKIP signal for the next
        // microinstruction.
        decode_cond(cond);
        
        // Handle memory and I/O *READS*
        if (r) bus_reads(mem, io);

        // Read from a unit.
        if (raddr) {
            cpu.ibus = read_from_ibus_unit(raddr);
        }

        // Write to a unit.
        if (waddr) {
            write_to_ibus_unit(waddr);
        }

        // Drive the data bus if needed
        if (w) {
            cpu.dbus = cpu.ibus;
            debug("*** DBUS <- IBUS (%04x)", cpu.ibus);
        }

        // Handle memory and I/O *WRITES*
        if (w) bus_writes(mem, io);

        // Perform any decoded action.
        if (action) handle_actions(action);

        // Next processor cycle!
        cpu.tick++;

        // End of the instruction?
        if (end) {
            //dump_state();
            cpu.agl_page = get_page(cpu.pc);
            cpu.uav.uaddr = 0;
            cpu.uav.int_ = 1; // Clear the INT microcode condition 
            debug("End of microprogram.");
        } else if (!cpu.wait) {
            // Support for wait states is present at this level, but nothing
            // uses them (yet). All our emulated devices are super-fast.
            cpu.uav.uaddr++;
            if (cpu.uav.uaddr == 0) {
                fatal("uPC wrapped around! Microcode bug?");
            }
        }

        // Perform 'background' 'hardware' tasks.
        if (cpu.iotick != NULL) (*cpu.iotick)(&cpu);
    }

    // time_t t1 = time(NULL);
    // if (t1 != t0) {
    //     info("Time: %s%lu%s s. Speed: %s%lu%s kHz",
    //          COL_WHI, t1 - t0, COL_GRE,
    //          COL_WHI, cpu.tick / (t1 - t0) / 1000, COL_GRE);
    // }
}


















































































// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
