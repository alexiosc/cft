/* 

emulator.c - Main emulator code

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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>
#include <sys/types.h>
#include <argp.h>

#include "cftemu.h"

#define word unsigned short int
#define bit unsigned char

char * ops[16] = {
	"TRAP",
	"IOT",
	"LOAD",
	"STORE",
	"IN",
	"OUT",
	"JMP",
	"JSR",
	"ADD",
	"AND",
	"OR",
	"XOR",
	"OP1",
	"OP2",
	"ISZ",
	"LI"
};

/* The machine description */
mach_t mach_revisions[] = {
	{
		.code = "v0",
		.name = "Preliminary testing hardware (64KW RAM)",
		.image_start = 0x0000,
		.image_size = 0x10000,
		.have_paging = 0,
		.have_intc = 0,
	},

	{
		.code = "v1",
		.name = "Early turnkey system (56KW RAM, 8KW ROM)",
		.image_start = 0xe000,
		.image_size = 0x2000,
		.have_paging = 0,
		.have_intc = 0,
	},

	{ .code = NULL }
};

mach_t * machp = &mach_revisions[0];

/* The emulator state */
state_t cpu;

char *memimg_name = NULL;
FILE *memimg_file = NULL;

char *log_name = "output";
FILE *log_file = NULL;

int verbose = 0;
int sanity = 1;
int debug_microcode = 0;
int debug_io = 0;
int debug_asm = 0;
int testing = 0;


/* Read the memory image. */
static inline void
read_memory()
{
	uint32_t size;
	size = fread(&cpu.mem[mach.image_start], sizeof(word), mach.image_size, memimg_file);
	if (size != mach.image_size) {
		if(errno == 0) {
			fprintf(stderr,
				"%s: memory image is the wrong size (should be %u 16-bit words or %u bytes)\n",
				PACKAGE, mach.image_size, mach.image_size / sizeof(word));
			exit(1);
		}
		perror(memimg_name);
	}
	
	if (verbose) {
		printf("I: Memory: starting at addr %04x, read %d words from %s.\n", mach.image_start, size, memimg_name);
	}
}


/* Implement the reset sequence (which is quite simple). */
static inline void
reset_cpu()
{
	cpu.pc = 0xdead;	/* Mangle things up; let reset logic work. */
	cpu.ir = 0xbadd;	/* Ditto */
	cpu.irq = 1;		/* Clear IRQ (1 = no IRQ received) */
	cpu.v = 0;
        cpu.ustate.rst = 0;	/* 0 = -RESET is ACTIVE */
        cpu.ustate.int_ = 1;	/* 1 = -INT is not active */
        cpu.ustate.inc = 1; 	/* Just being thorough: the reset vector doesn't autoindex */
	cpu.ustate.uaddr = 0;	/* The uPC resets to 0 on power on/reset */
	cpu.ustate.v = 0;
	cpu.ustate.l = 0;

	cpu.rst_hold = RST_HOLD; /* Set up reset pulse */
}


/* Set the Accumulator, handling flags. */
static inline void
set_a(word x)
{
	cpu.a = x;
	cpu.n = (cpu.a & 0x8000) != 0;
	cpu.z = cpu.a == 0;
}


/* Calculates an address operand using the Address Generation Logic (AGL) */
static inline word
unit_agl() {
	/* ADDRESS GENERATION LOGIC
	 *
	 * If R flag is set, use high bits of PC for the high bits of the
	 * address. Otherwise, use zeroes. Use the IR operand for the low bits.
	 */
	return (get_r(cpu.ir) ? 0 : get_page(cpu.pc)) | (get_offset(cpu.ir));
}


static inline word
unit_cs1()
{

/*
// _____ _____ ___ ___
// r_cs1 r_cs2 RST INT  Value  Notes
// --------------------------------------------------------------------------
//   X     X    0   X    FFF0  Reset vector
//   0     0    X   X          Never happens (r_csX are '138 outputs)
//
//   0     1    0   0          Never happens (INTs disabled in RST code)
//   0     1    0   1          Undefined
//   0     1    1   0    0002  r_cs1: ISR return vector
//   0     1    1   1    0000  r_cs1: JSR instruction return vector
//
//   1     0    0   0          Never happens (INTs disabled in RST code)
//   1     0    0   1          Undefined
//   1     0    1   0    FFF8  r_cs2: ISR vector
//   1     0    1   1    0001  r_cs2: TRAP instruction return vector
//
// We use -r_cs1, -r_cs2 and -int to control a '138, enabled by -RST
// being high (the active-high G1 input):
*/
	if (cpu.ustate.rst == 0) return 0xfff0; /* Reset vector */
	else if (cpu.ustate.rst == 1 && cpu.ustate.int_ == 0) return 2; /* ISR return vector */
	else if (cpu.ustate.rst == 1 && cpu.ustate.int_ == 1) return 0; /* JSR return vector */
	sanity_check(1, "CS1: sanity check failed.");
}


static inline word
unit_cs2()
{
	if (cpu.ustate.rst == 1 && cpu.ustate.int_ == 0) return 0xfff8; /* ISR vector */
	else if (cpu.ustate.rst == 1 && cpu.ustate.int_ == 1) return 1; /* TRAP return vector */
	sanity_check(1, "CS2: sanity check failed.");
}


static inline word
unit_roll()
{
	int op = cpu.ir & 7;
	uint32_t val = (cpu.l << 16) | cpu.a;

#if 0
	info("pre-roll: val=%05x\n", val);
	char s[17];
	to_bin(val, s, 17);
	info("pre-roll: val=%s\n", s);
#endif


	/*
	// Decode. This is how signals are derived:
	//
	//                        111 unused
	// L4: RNL = OP1  '-------110		; <L,A> <- <L,A> >> 4
	// R4: RNR = OP1  '-------101		; <L,A> <- <L,A> << 4
	//                        100 unused
	//                        011 unused
	// L1: RBL = OP1  '-------010		; <L,A> <- <L,A> >> 1
	// R1: RBR = OP1  '-------001		; <L,A> <- <L,A> << 1
	//                        000 unused
	// Connections:
	//
	// RBL (roll 1 bit left)
	//
	// Assign: 15 | 14 13 12 11 | 10  9 8 7 | 6 5 4 3 | 2 1 0 16
	// -------------------------------------------------------------------------
	// To:     16 | 15 14 13 12 | 11 10 9 8 | 7 6 5 4 |  3 2  1  0
	//
	// RBR (roll 1 bit right)
	//
	// Assign: 0 | 16 15 14 13 | 12 11 10 9 | 8 7 6 5 | 4 3 2 1 
	// -------------------------------------------------------------------------
	// To:     16 | 15 14 13 12 | 11 10 9 8 | 7 6 5 4 |  3 2  1  0
	//
	// RNL (roll 4 bits left)
	//
	// Assign: 12 | 11 10 9  8  | 7  6  5 4 | 3 2 1 0 | 16 15 14 13
	// ----------------------------------------------------------------------------
	// To:     16 | 15 14 13 12 | 11 10 9 8 | 7 6 5 4 |  3 2  1  0
	//
	// RNR (roll4 bits right)
	//
	// Assign: 3   | 2  1  0  16 | 15 14 13 12 | 11 10 9 8 | 7 6 5 4
	// ----------------------------------------------------------------------------
	// To:     16  | 15 14 13 12 | 11 10  9  8 |  7  6 5 4 | 3 2 1 0

	*/
	
	switch (op) {
	case 6:			/* roll nibble left */
		val = ((val << 4) & 0x1fff0) | ((val >> 13) & 0x000f);
		break;
	case 5:			/* roll nibble right */
		val = ((val >> 4) & 0x01fff) | ((val << 13) & 0x1e000);
		break;
	case 2:			/* roll bit left */
		val = ((val << 1) & 0x1fffe) | ((val & 0x10000) >> 16);
		break;
	case 1:			/* roll bit right */
		val = ((val >> 1) & 0x0ffff) | ((val & 0x00001) << 16);
		break;
	}

	cpu.ibus = (val & 0xffff);
	cpu.l = (val & 0x10000) != 0;

#if 0
	to_bin(val, s, 17);
	info("pst-roll: val=%s\n", s);

        //info("post-roll: val=%05x\n", val);
	info("pst-roll: L=%d, A=%04x\n", cpu.l, cpu.ibus);
#endif

	return cpu.ibus;
}


static inline word
unit_mem(int r, int w)
{
	if (r) {
		cpu.dbus = cpu.mem[cpu.ar];
		iodebug("Read mem[%04x] == %04x\n", cpu.ar, cpu.dbus);
	} else if (w) {
		/*
		if ((cpu.ar >= 0x100 && cpu.ar <= 0x110) && (cpu.dbus == 0)) {
			dump();
			exit();
		}
		*/
		/* Report attempts to write to the ROM */
		if (sanity && (cpu.ar >= 0xe000)) {
			fail("Attempt to write %04x to ROM at address %04x.\n", cpu.dbus, cpu.ar);
		}
		cpu.mem[cpu.ar] = cpu.dbus;
		iodebug("Wrote mem[%04x] <- %04x\n", cpu.ar, cpu.dbus);
	}
	return cpu.dbus;
}


/*
 * Simulates reset behaviour: CFT's reset circuitry contains a counter which,
 * when triggered using /RESET, holds the internal reset signal (/RST-HOLD)
 * active for a number of cycles. The rising edge of /RST-HOLD, at the end of
 * the count, has side effects in the hardware (e.g. AR reads its value from
 * the IBUS, so both PC and AR are initialised to 0xfff0.)
 */
static inline void
handle_reset()
{
	if (cpu.rst_hold > 0) {
		cpu.rst_hold--;
	} else if(cpu.rst_hold == 0) {
		/* When the counter runs out, de-assert the RST signal. */
		cpu.rst_hold = -1;
		cpu.ustate.rst = 1;

		/* In the hardware, the AR assumes the value of the
		 * IBUS the moment RST_HOLD is cleared. */
		cpu.ar = cpu.ibus;
		
		ucdebug("*** RST_HOLD cleared ***\n");
	}
}


/*
 * Decode IFx signals, and update the SKIP flag in the uROM vector now
 * (late). The skip flag will take effect i nthe next microinstruction. This
 * mirrors the behaviour of the hardware.
 */
#define skipdebug(name) \
	ucdebug("SKIP: " name ": %d (%s)\n",	\
		cpu.ustate.skip, \
		cpu.ustate.skip == 0 ? "SKIP" : "don't skip")

static inline void
decode_ifx()
{
	cpu.ustate.skip = 0;
	if (IS_IF9(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x200) != 0;
		skipdebug("IF9");
	} else if (IS_IF8(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x100) != 0;
		skipdebug("IF8");
	} else if (IS_IF7(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x80) != 0;
		skipdebug("IF7");
	} else if (IS_IF6(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x40) != 0;
		skipdebug("IF6");
	} else if (IS_IF5(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x20) != 0;
		skipdebug("IF5");
	} else if (IS_IF4(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x10) != 0;
		skipdebug("IF4");
	} else if (IS_IF3(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0x8) != 0;
		skipdebug("IF3");
	} else if (IS_IFBRANCH(cpu.control)) {
		/*
		 * For branches, instead of having a separate mechanism, the
		 * branch decision is put in the SKIP flag. This way, the same
		 * code can be used for conditional execution of the OPx
		 * instructions AND for branching (which is handled in OP2
		 * after all).
		 */

		/* Simulate the hardware exactly. */
		word data[5] = {
			cpu.ir & 1,
			(cpu.ir & 2) >> 1,
			(cpu.ir & 4) >> 2,
			(cpu.ir & 8) >> 3,
			(cpu.ir & 16) >> 4
		};

		/* This looks like a waste of space, but gcc optimises it to
		 * the same assembly code as if we used one long, hard to read
		 * expression. */
		register int sn = cpu.n & data[3];
		register int sz = cpu.z & data[2];
		register int sl = cpu.l & data[1];
		register int sv = cpu.v & data[0];

		register int sx = sn || sz || sl || sv;
		
		cpu.ustate.skip = sx ^ data[4];

		ucdebug("BRANCH: A=%04x, DATA=%d%d%d%d%d\n", cpu.a, data[4], data[3], data[2], data[1], data[0]);
		ucdebug("BRANCH: A=%04x, SV=%d, SL=%d, SZ=%d, SN=%d\n", cpu.a, sv, sl, sz, sn);
		ucdebug("BRANCH: A=%04x,  V=%d,  L=%d,  Z=%d,  N=%d\n", cpu.a, cpu.v, cpu.l, cpu.z, cpu.n);
		skipdebug("IFBRANCH");
	} else if (IS_IFROLL(cpu.control)) {
		cpu.ustate.skip = (cpu.ir & 0xb) != 0;
		skipdebug("IFROLL");
	} else if (IS_IFZERO(cpu.control)) {
		cpu.ustate.skip = cpu.z != 0;
	} else if (IS_IFL(cpu.control)) {
		cpu.ustate.skip = cpu.l != 0;
	} else if (IS_IFV(cpu.control)) {
		cpu.ustate.skip = cpu.v != 0;
	} else if (GET_OP_IF(cpu.control) == 0) {
		// Idle branch unit.
	} else {
		fail("Emulator failure: OPIF value 0x%1x not implemented.\n",
		     GET_OP_IF(cpu.control))
	}

	// Microcode version 4 assumes active-low semantics for SKIP. Invert here.
	cpu.ustate.skip = !cpu.ustate.skip;
}

/*
 * Decode the read unit: the selected unit puts its value on the IBUS. Only one
 * unit may be active at any one time (this is enforced by the microcode
 * format: 4 bits identify the read unit).
 *
 */

static inline void
decode_read_unit()
{
	if (IS_R_DBUS(cpu.control)) {
		cpu.ibus = cpu.dbus;
		ucdebug("IBUS <- DBUS (%04x)\n", cpu.ibus);
	}
	else if (IS_R_AGL(cpu.control)) {
		cpu.ibus = unit_agl();
		ucdebug("IBUS <- AGL (%04x)\n", cpu.ibus);
	}
	else if (IS_R_PC(cpu.control)) {
		cpu.ibus = cpu.pc;
		ucdebug("IBUS <- PC (%04x)\n", cpu.ibus);
	}
	else if (IS_R_DR(cpu.control)) {
		cpu.ibus = cpu.dr;
		ucdebug("IBUS <- DR (%04x)\n", cpu.ibus);
	}
	else if (IS_R_A(cpu.control)) {
		cpu.ibus = cpu.a;
		ucdebug("IBUS <- A (%04x)\n", cpu.ibus);
	}
	else if (IS_R_CS1(cpu.control)) {
		cpu.ibus = unit_cs1();
		ucdebug("IBUS <- CS1 (%04x)\n", cpu.ibus);
	}
	else if (IS_R_CS2(cpu.control)) {
		cpu.ibus = unit_cs2();
		ucdebug("IBUS <- CS2 (%04x)\n", cpu.ibus);
	}
	else if (IS_ALU_ADD(cpu.control)) {
		uint32_t sum = (uint32_t) cpu.a + (uint32_t) cpu.b;
		cpu.ibus = (word)(sum & 0xffff);
		if (sum & 0x10000) cpu.l = !cpu.l;

		//printf("*** %04x + %04x = %04x (%d %d %d)\n", cpu.a, cpu.b, cpu.ibus, BIT(cpu.a, 15), BIT(cpu.b, 15), BIT(cpu.ibus, 15));
		cpu.v = BIT(cpu.a, 15) == BIT(cpu.b, 15) && \
			BIT(cpu.a, 15) != BIT(cpu.ibus, 15);
		//cpu.l = sum & 0x10000 ? 1 : 0;
		ucdebug("IBUS <- A + B (%04x), L <- %d\n", cpu.b, cpu.l);
	}
	else if (IS_ALU_AND(cpu.control)) {
		cpu.ibus = cpu.a & cpu.b;
		ucdebug("IBUS <- A AND B (%04x)\n", cpu.b);
	}
	else if (IS_ALU_OR(cpu.control)) { 
		cpu.ibus = cpu.a | cpu.b;
		ucdebug("IBUS <- A OR B (%04x)\n", cpu.b);
	}
	else if (IS_ALU_XOR(cpu.control)) {
		cpu.ibus = cpu.a ^ cpu.b;
		ucdebug("IBUS <- A (%04x) XOR B (%04x)\n", cpu.a, cpu.b);
	}
	else if (IS_ALU_NOT(cpu.control)) {
		cpu.ibus = ~cpu.a;
		ucdebug("IBUS <- NOT A (%04x)\n", cpu.a);
	}
	else if (IS_ALU_ROLL(cpu.control)) {
		cpu.ibus = unit_roll();
		// ucdebug handled inside unit for clarity.
	} else {
		sanity_check(0, "Read unit decoder: should never happen.\n");
	}
}


/*
 * Decode the write unit and handle side effects: the selected unit gets its
 * value from the IBUS. This must run after a value has been put on the IBUS,
 * which simulates the hardware behaviour too (write unit control pulses are
 * delayed to allow the unit outputting a value to settle). Only one unit may
 * be active at any one time (this is enforced by the microcode format: 4 bits
 * identify the read unit).
 *
 */

static inline void
decode_write_unit()
{
	if (!GET_W_UNIT(cpu.control)) return;

	if (IS_W_AR(cpu.control)) {
		cpu.ar = cpu.ibus;
		ucdebug("AR <- IBUS (%04x)\n", cpu.ibus);
	}
	else if (IS_W_PC(cpu.control)) {
		cpu.pc = cpu.ibus;
		ucdebug("PC <- IBUS (%04x)\n", cpu.ibus);
		// Sanity check
		if (sanity && (cpu.pc == 0)) {
			fail("PC at 0000. This is probably a CFT software error.\n");
		}
	}
	else if (IS_W_IR(cpu.control)) {
		cpu.ir = cpu.ibus;
		ucdebug("IR <- IBUS (%04x)\n", cpu.ibus);
		// Also set the autoincrement bit.
		cpu.ustate.inc = ~is_autoindex(unit_agl());
	}
	else if (IS_W_DR(cpu.control)) {
		cpu.dr = cpu.ibus;
		ucdebug("DR <- IBUS (%04x)\n", cpu.ibus);
	}
	else if (IS_W_A(cpu.control)) {
		set_a (cpu.ibus);
		ucdebug("A <- IBUS (%04x)\n", cpu.ibus);
	}
	else if (IS_W_ALU(cpu.control)) {
		cpu.b = cpu.ibus;
		ucdebug("ALU_B <- IBUS (%04x)\n", cpu.ibus);
	}
	else {
		sanity_check(0, "Write unit decoder: should never happen.\n");
	}
}


void
emulate()
{
	/* Make stdout unbuffered. */
	setvbuf(stdout, (char *)NULL, _IONBF, 0);

	/* Read the source code, if available */
	pasm_load();

	/* Read the map file, if available */
	map_load();

	/* Read the memory image */
	read_memory();

	/* Open the log file */
	if ((log_file = fopen(log_name, "w")) == NULL) {
		perror("Opening log file");
		exit(1);
	}
	
	/* Initialise I/O */
	io_init();
	
	/* Reset the emulation and CPU */
	cpu.tick = 0;
	cpu.wait = 0;
	cpu.halt = 0;
	reset_cpu();

	time_t t0 = time(NULL);
	word oldpc = 0xbeef;
	
	//word addr;
	while(!cpu.halt) {
		// Link the CPU state to the microcode ROM.
		cpu.ustate.op = get_op(cpu.ir);
		//ucdebug("VECTOR I = %x (%x, %x)\n", cpu.ustate.i, cpu.ir, get_i(cpu.ir));
		//ucdebug("VECTOR R = (%x, %x)\n", cpu.ir, get_r(cpu.ir));
		cpu.ustate.i = get_i(cpu.ir);
		//cpu.ustate.skip = 1; /* Active low: 1 == no skip */

		/*
		 * WARNING: HARDWARE BUG FOUND.
		 *
		 * The (active hgh) INC flag in the microcode vector must not
		 * be de-asserted (cleared, 0) until the /end signal is
		 * encountered. If this is NOT done, depending on the value of
		 * AR (which is modified during the execution of an autoindex
		 * instruction), the INC signal can go low, and the microcode
		 * will jump to an undefined (/end) instruction mid-execution.
		 *
		 * On real hardware, a J-K flip-flop would be SET on autoindex,
		 * and RESET (cleared) by /end.
		 *
		 * FIX REVISION 2:
		 *
		 * To make sure the autoincrement isn't changed, it should only
		 * be set when IR is set.
		 *
		 */
		if (cpu.ustate.uaddr == 0) {
			cpu.ustate.inc = 1;
		} else {
			//cpu.ustate.inc |= is_autoindex(cpu.ar);
			// Moved to IR latching code.
		}

		/*
		 * Likewise, buffer the IRQ requests. The hardware already does
		 * this (the internal IRQ line sets a flip-flop that stays
		 * active for the entire microprogram */
		if (cpu.irq == 0) {
			if ((cpu.ustate.uaddr == 0) && (cpu.i == 0)) {
				//dump();
				//info("Going to IRQ\n");
				//exit(0);
				cpu.irq = 1;	     /* Clear the IRQ signal */
				cpu.ustate.int_ = 0; /* Set the INT microcode condition */
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
		cpu.upc = MAKE_ADDR(cpu.ustate.rst,
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
		uint32_t inc_a = IS_INCAC(cpu.control);
		uint32_t cpl = IS_CPL(cpu.control);
		uint32_t cll = IS_CLL(cpu.control);
		uint32_t sti = IS_STI(cpu.control);
		uint32_t cli = IS_CLI(cpu.control);
		uint32_t pc_inc = IS_INCPC(cpu.control);
		uint32_t step_dr = IS_INCDR(cpu.control);
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
		if (pc_inc) {
			cpu.pc = (cpu.pc + 1) & 0xffff;
			ucdebug("pc_inc: PC <- %04x\n", cpu.pc);
			// Sanity check
			if (sanity && (cpu.pc == 0)) {
				fail("PC AT 0000, SHOULD NEVER HAPPEN\n");
			}
		}
		
		// Increment A, if requested by an OPx instruction.
		if (inc_a) {
			int new_a = cpu.a + 1;
			if (new_a & 0x10000) cpu.l = !cpu.l;
			set_a(new_a);
			ucdebug("inc_a: A <- %04x\n", cpu.a);
		}

		// Step the DR.
		if (step_dr) {
			cpu.dr = (cpu.dr + 1) & 0xffff;
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
			cpu.i = 0; /* The /I flag is Active low */
			ucdebug("STI: PC=%04x, I <- %d\n", cpu.pc, cpu.i);
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
			cpu.ustate.uaddr = 0;
			cpu.ustate.int_ = 1; /* Clear the INT microcode condition */
			ucdebug("*** GO FETCH ***\n\n\n\n\n\n\n");
		} else if (!cpu.wait) {
			cpu.ustate.uaddr++;
			sanity_check(cpu.ustate.uaddr == 0,
				     "uADDR wrapped around! Microcode bug?\n");
		}

		// Perform 'background' 'hardware' tasks.
		io_tick();
	}

	time_t t1 = time(NULL);
	if (t1 != t0) {
		info("Time: %s%lu%s s. Speed: %s%lu%s kHz\n",
		     COL_WHI, t1 - t0, COL_GRE,
		     COL_WHI, cpu.tick / (t1 - t0) / 1000, COL_GRE);
	}
}
