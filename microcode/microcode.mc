// -*- mode: mcasm -*-
//
// This is the CFT Microcode.
//
// Author: Alexios Chouchoulas
//
// Changelog:
//
//   Version 1: initial microcode with discrete ALU.
//
//   Version 2: ROM ALU without overflow.
//
//   Version 3: ROM ALU, overflow and flag conditions.
//
//   Version 4: Minor bug fixes. First beta version.
//
//   Version 5: DR/AC decrement support, vertical decrement field. Made use of
//   the spare UCODE18 signal. Reordered strobes to put register stepping signals
//   together.
//
//   Version 6: Added JMPII (OP=1111, I=1) instruction (doubly indirect jump,
//   used as Forth's ENTER instruction). Various minor bug fixes and
//   simplifications in autoindex modes.
//
//   Version 6a: Added UCB 4-bit conditional field to allow for 4 Mbit
//   ROMs. These work with the UCB extension, but also standalone. There's
//   currently no special microcode in the other banks, we just do this to
//   allow for compatibility with the hardware design.
//
//   Version 6b: (2013-06-30) The SBL has changed very slightly, causing some
//   flags to be inverted. Dealing with this in microcode. There are no changes
//   to the instruction set.
//
//   Version 6c: (2014-07-17) Changed the IOT instruction so it
//   also listens to the EXTSKIP# signal.
//
//   Version 6d: (2016-07-23) Fixed an IOT bug where IOT in literal bug would
//   always skip regardless of the state of EXTSKIP#. Took a very long time to
//   find this since there's currently no CFT hardware that uses this
//   instruction.
//
//   Version 7: (2019-05-05) Major revision of the microcode, complete
//   break with hardware compatibility. The µCB has gone away, the MBU
//   has gone away, and we have eight bank registers and 24-bit of
//   memory space along with different microcode address and control
//   vectors, a new AGL, AIL and an all new Constant Store that's no
//   longer in the ALU (freeing up space for better things!)

//   Version 7b: (2019-09-21) moved instructions around a bit to ease
//   memorisation.

//   Version 7c: (2019-10-05) added ISR instruction to call the interrupt
//   handler programmatically for traps etc. WAIT also transfers its (7-bit
//   operand) to the DR for software interrupt support.


// ADDRESSING MODES
//
// It's time to standardise the names of the addressing modes. They've
// been through too many names, and too many synonyms. Here are the
// standard ones for memory-accessing instructions.
//
//  I   R   Operand   Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any       (1) Page-Local
//  0   1   Any       (2) Register
//  1   0   Any       (3) Indirect
//  1   1   000–2FF   (4) Register Indirect
//  1   1   300–33F   (5) Memory Bank-Relative Indirect
//  1   1   340–37F   (6) Auto-Increment
//  1   1   380–3BF   (7) Auto-Decrement
//  1   1   3C0–3FF   (8) Stack
//
// TODO: Go through all instructions, re-annotate them with the correct number
// and name of addressing modes. For non-standard instrucitons, copy the table
// above there and change it as necessary.


///////////////////////////////////////////////////////////////////////////////
//
// Conditions: fields embedded in the MicroROM address.
//
///////////////////////////////////////////////////////////////////////////////

cond RST:1;                   // When low, machine is resetting.
cond INT:1;                   // When low, servicing an interrupt request
cond OP:4;                    // The opcode field of the IR.
cond I:1;                     // The indirection field of the IR.
cond R:1;                     // The register field of the IR.
cond SUBOP:3;		      // Used to implement instructions without operands. (IR[9..7])
cond IN_RESERVED:1;           // Reserved.
cond COND:1;                  // When low: SBL returned TRUE. (registered, reset on END)
cond IDX:2;		      // Auto-index type (IR[7..6] if IR[9..8] == 01, otherwise 00)

#define IDX_REG  00           // Ordinary register
#define IDX_INC  01	      // Autoincrement register
#define IDX_DEC  10	      // Autodecrement register
#define IDX_SP   11	      // Stack register

// The uaddr field of the address is mandatory. This just sets its
// width. It was 4 bits wide before Version 7.
cond uaddr:4;

// Big differences: all six bits of the IR that select an instruction are now
// made available to us. This simplifies the (now overcomplicated AGL) and lets
// us stick more instructions in there.

///////////////////////////////////////////////////////////////////////////////
//
// Signals: outputs of the MicroROM
//
///////////////////////////////////////////////////////////////////////////////

// The new Microcode Control vector is mostly vertical:
//
// RADDR    5 bits     IBUS address to read from
// WADDR    5 bits     (maybe reduce it to 4 bits?) IBUS address to write to
// COND     5 bits     Opcode of conditional to evaluate for next cycle
// ACTION   4 bits     Opcode of action to perform
// MEM      1 bit      Perform a memory transaction
// IO       1 bit      Perform an I/O transaction
// R        1 bit      Perform a read transaction
// WEN      1 bit      Perform a write transaction
// END      1 bit      End this microprogram
//
// The bus transaction signals (MEM, IO, R, WEN) are horizontal (rather than
// included in the vertical ACTION field) for speed reasons, and also because
// they often need to be performed in parallel with other actions. They're also
// easier to read on the front panel.

// IBUS address map:
//
// Address   Read from   Write to     Notes
// -------------------------------------------------------------------------------
// 00000     Idle        Idle         Needed to disable reading/writing
// -------------------------------------------------------------------------------
// 00001     MBP + flags MBP + flags  This is used in interrupt handlers for speed.
// 00010     flags                    Just the flags.
// 00011     MBn         MBn          IR[0..2] selects the register to read/write
// 00100                 AR:MBP       Write to the Address Register, use Program MBR.
// 00101                 AR:MBD       Write to the AR, use Data MBR.
// 00110                 AR:MBS       Write to the AR, use Stack MBR.
// 00111                 AR:MBZ       Write to the AR, use Zero Page MBR/addressing.
// -------------------------------------------------------------------------------
// 01000     PC          PC
// 01001     DR          DR
// 01010     AC          AC
// 01011     SP          SP           The CFT is a big boy now, it has a Stack Pointer!
// -------------------------------------------------------------------------------
// 11100
// 11101
// 11110
// 11111
// -------------------------------------------------------------------------------
// 10000     ALU:ADD
// 10001     ALU:AND
// 10010     ALU:OR
// 10011     ALU:XOR
// 10100     ALU:NOT
// 10101     ALU:B       ALU:B        The ALU B port is treated as a major reg without increments.
// 10110
// 10111
// -------------------------------------------------------------------------------
// 11000     CS0                      Read from constant store (0000)
// 11001     CS1                      Read from constant store (0001)
// 11010     CS2                      Read from constant store (0002)
// 11011     CS3                      Read from constant store (0003)
// -------------------------------------------------------------------------------
// 11100
// 11101
// 11110     AGL                      The AGL is read-only
// 11111                 IR           The IR is write-only

// RADDR FIELD
field  READ            = ___________________XXXXX; // Read unit field
signal read_agl        = ...................00010; // Read from address generation logic
signal read_pc         = ...................01000; // Read from PC
signal read_dr         = ...................01001; // Read from DR
signal read_ac         = ...................01010; // Read from AC
signal read_sp         = ...................01011; // Read from AC
signal read_mbp        = ...................01100; // Read MBP (MB0)
signal read_mbp_flags  = ...................01101; // Read combination MBP+flags
signal read_flags      = ...................01110; // Read flags
signal read_mbn        = ...................01111; // Read an MBn register (IR0..2 select reg)
signal read_alu_add    = ...................10000; // ALU: Read from ALU: AC + B + L
signal read_alu_and    = ...................10001; // ALU: Read from ALU: AC AND B
signal read_alu_or     = ...................10010; // ALU: Read from ALU: AC OR B
signal read_alu_xor    = ...................10011; // ALU: Read from ALU: AC XOR B
signal read_alu_not    = ...................10100; // ALU: Read from ALU: NOT AC
signal read_alu_b      = ...................10101; // ALU: Read B register from ALU
signal read_cs_rstvec  = ...................11000; // Constant Store: Reset Vector (0000)
signal read_cs_rsvd1   = ...................11001; // Constant Store: Unused (0001)
signal read_cs_isrvec0 = ...................11010; // Constant Store: ISR Vector (0002)
signal read_cs_isrvec1 = ...................11011; // Constant Store: ISR Vector (0003)
// No longer used, there's a dedicated 1b6-bit stack pointer now.
//signal read_cs_sp      = ...................11001; // Constant Store: Stack Pointer

// WADDR FIELD

// TODO: FIX THESE ADDRESSES ACCORDING TO THE COMMENTS ABOVE!!!


field  WRITE           = ______________XXXXX_____; // Write unit field
signal write_ir        = ..............00010.....; // Write to the Instruction Register
signal write_ar_mbp    = ..............00100.....; // Write MBP:AR (program area, extend with MBP)
signal write_ar_mbd    = ..............00101.....; // Write MBD:AR (data area, extend with MBD)
signal write_ar_mbs    = ..............00110.....; // Write MBS:AR (stack area, extend with MBS)
signal write_ar_mbz    = ..............00111.....; // Write MBZ:AR (page zero with index registers)
signal write_pc        = ..............01000.....; // Write to PC
signal write_dr        = ..............01001.....; // Write to DR
signal write_ac        = ..............01010.....; // Write to AC
signal write_sp        = ..............01011.....; // Write to AC
signal write_alu_b     = ..............10101.....; // Write to ALU's B Port
signal write_mbp       = ..............01100.....; // Read MBP
signal write_mbp_flags = ..............01101.....; // Read combination MBP+flags
signal write_flags     = ..............01110.....; // Write flags (not all are written!)
signal write_mbn       = ..............01111.....; // Write an MBn register (IR0..2 select reg)

// COND FIELD (UNDER REDESIGN)
field  IF              = _________XXXXX__________; // OPx IF field
signal if_ir0          = .........00001..........; // SKIP = IR[0]
signal if_ir1          = .........00010..........; // SKIP = IR[1]
signal if_ir2          = .........00011..........; // SKIP = IR[2]
signal if_ir3          = .........00100..........; // SKIP = IR[3]
signal if_ir4          = .........00101..........; // SKIP = IR[4]
signal if_ir5          = .........00110..........; // SKIP = IR[5]
signal if_ir6          = .........00111..........; // SKIP = IR[6] (Currently unused)
//signal if_xxx        = .........01000..........; // Not used
//signal if_xxx        = .........01001..........; // Not used
signal if_v            = .........01010..........; // SKIP = V
signal if_l            = .........01011..........; // SKIP = L
signal if_z            = .........01100..........; // SKIP = Z
signal if_n            = .........01101..........; // SKIP = N (currently unused)
//signal if_xxx        = .........01110..........; // Not used
signal if_branch       = .........01111..........; // SKIP = skip_logic(IR[3:0])

// ACTION FIELD (UNDER REDESIGN)
//                      76543210FEDCBA9876543210
field  ACTION          = _____XXXX_______________;
signal /action_cpl     = .....0001...............; // Complement L
signal /action_cll     = .....0010...............; // Clear L flag
signal /action_sti     = .....0011...............; // Set I flag
signal /action_cli     = .....0100...............; // Clear I flag
signal /action_cla     = .....0101...............; // Clear the AC
//signal /action_???   = .....0110...............; //
signal /action_sru     = .....0111...............; // Start the shift/roll engine

// ACTION 1XXX is decoded by the REG board and is just increments and
// decrements of each major register (except the PC which isn't wired
// for decrementation).

signal /action_incpc   = .....1000...............; // Step the PC
//signal /action_???   = .....1001...............; //
signal /action_incdr   = .....1010...............; // Increment DR
signal /action_decdr   = .....1011...............; // Decrement DR
signal /action_incac   = .....1100...............; // Increment AC
signal /action_decac   = .....1101...............; // Increment AC
signal /action_incsp   = .....1110...............; // Increment SP
signal /action_decsp   = .....1111...............; // Increment SP

// HORIZONTAL SIGNALS
signal /MEM            = ....1...................; // Memory access
signal /IO             = ...1....................; // Input/Output enable
signal /R              = ..1.....................; // Memory read
signal /WEN            = .1......................; // Memory write
signal /END            = 1.......................; // Reset uaddr, go to fetch state.


///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO READ FROM MEMORY AND I/O SPACE
//
///////////////////////////////////////////////////////////////////////////////

// Note: the final ‘;’ is purposefully left out in the second cycle,
// so these macros can be combined with other microinstructions.

// This macros uses cpp's symbol concatenation, which is why it's extra ugly.
#define MEMREAD(mbr, addr, data)             \
    write_ar_##mbr, read_##addr;             \
    /MEM, /R, write_##data

// I/O space is 16 bits wide and ignores AB[16..23], so we can use any
// old MBR to write to the AR, it doesn't matter.
#define IOREAD(addr, data)                   \
    write_ar_mbp, read_##addr;               \
    /IO, /R, write_##data


///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO WRITE TO MEMORY AND I/O SPACE
//
///////////////////////////////////////////////////////////////////////////////

#define MEMWRITE(mbr, addr, data)  \
    write_ar_##mbr, read_##addr;   \
    /MEM, /WEN, read_##data

// I/O space is 16 bits wide and ignores AB[16..23], so we can use any
// old MBR to write to the AR, it doesn't matter.
#define IOWRITE(addr, data)        \
    write_ar_mbp, read_##addr;     \
/MEM, /WEN, read_##data


///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO USE THE HARWDARE STACK
//
///////////////////////////////////////////////////////////////////////////////

#define STACK_PUSH(data)                         \
        MEMWRITE(mbs, sp, data), /action_incsp

#define STACK_POP(data)           \
        /action_decsp;            \
        MEMREAD(mbs, sp, data)


///////////////////////////////////////////////////////////////////////////////
//
// INSTRUCTION FETCH
//
///////////////////////////////////////////////////////////////////////////////

// The fetch cycle is very simple, and is a trivial way to demonstrate the
// MEMREAD macro.
//
// 1. Read mem[PC] and write to IR.
// 2. Increment the PC so it points to the next instruction to execute.

#define FETCH_IR MEMREAD(mbp, pc, ir), /action_incpc


///////////////////////////////////////////////////////////////////////////////
//
// UTILITY MACROS
//
///////////////////////////////////////////////////////////////////////////////

#define END /END

#define IFBIT(x) /if##x, /action_end;


// Set a register to another register. E.g. SET(pc,dr) will write the value of
// DR to the PC.
#define SET(tgt, src) write_##tgt, read_##src


///////////////////////////////////////////////////////////////////////////////
//
// Fill the entire microcode ROM with /end signals (and jumps to µPC 0000).
//
// This removes a glitch with Autoincrement modes: at the end of autoincrement
// microinstructions, control briefly jumps to the non-autoincrement variety,
// so we need to fill with /end.
//
// This microprogram doesn't clobber others because the microcode assembler
// assembles microprograms in order of increasing specificity (decreasing
// number of don't-care [X] values.)
//
///////////////////////////////////////////////////////////////////////////////

start RST=X, INT=X, IN_RESERVED=X, COND=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;
      END;


///////////////////////////////////////////////////////////////////////////////
//
// The Microcode itself.
//
///////////////////////////////////////////////////////////////////////////////

// We'll be adding fetch cycles with no execution cycles to all available
// microprogram positions in the microcode ROM. This way, no matter what its
// state, the CPU will always be able to fetch an instruction. Upon fetching,
// the microcode ROM address (fed from the IR, which the fetch cycle modifies),
// will jump to the right microcode program. We don't NEED to use separate
// microprograms for direct and indirect modes, since, at the time of the fetch
// cycle, the I flag (which is about to be fetched along with the rest of the
// IR) is invalid anyway.
//
// Assumption: the steps that fetch the IR from memory are identical for both
// direct (I=0) and indirect mode (I=1).

start RST=X, INT=X, IN_RESERVED=X, COND=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      FETCH_IR;                // Just fetch an instruction.


///////////////////////////////////////////////////////////////////////////////
//
// Reset code
//
///////////////////////////////////////////////////////////////////////////////

// The reset sequence is little more than a fetch sequence, but we pad
// it with a few NOPs.

start RST=0, INT=X, IN_RESERVED=X, COND=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      SET(pc,cs_rstvec), /action_cli, END; // 00
      hold;				   // 01
      hold;				   // 02
      hold;				   // 03
      hold;				   // 04
      hold;				   // 05
      hold;				   // 06
      hold;				   // 07
      hold;				   // 08
      hold;				   // 09
      hold;				   // 10
      hold;				   // 11
      hold;				   // 12
      hold;				   // 13
      hold;				   // 14
      hold;				   // 15


///////////////////////////////////////////////////////////////////////////////
//
// Interrupt service code
//
///////////////////////////////////////////////////////////////////////////////

// Interrupt handling algorithm:
//
// Push MBP+flags onto stack.
// Mask interrupts as early as possible after saving flags.
// Push PC onto stack.
// Push AC onto stack.
// Load MBP from interrupt vector address.
// Load PC from interrupt vector address+1.
//
// The Interrupt handled is currently 10 cycles long, which gives 2.5µs
// latency. The Return process will probably be identical.

start RST=1, INT=0, IN_RESERVED=X, COND=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      /action_cli, STACK_PUSH(mbp_flags);       // 00 mem[MBS:SP++] ← flags:MBP; CLI
      STACK_PUSH(pc);			        // 02 mem[MBS:SP++] ← PC
      STACK_PUSH(ac);		                // 04 mem[MBS:SP++] ← AC
      SET(pc, cs_isrvec0);			// 06 PC ← 0002
      SET(mbp, cs_isrvec1), END;		// 07 MBP ← 0003

// TODO: This jumps to [03:0002] which is a little inelegant. Rework
// the constant source and jump to [00:0008] or something.


///////////////////////////////////////////////////////////////////////////////
//
// THE INSTRUCTION SET
//
///////////////////////////////////////////////////////////////////////////////

//                                     (1)  (2)  (3)  (4)  (5)  (6)  (7)
//                    I                 0    0    1    1    1    1    1	
//                    R                 0    1    0    1    1    1    1	
//             REG TYPE                     REG       REG  INC  DEC  SP   BIT
//             INSTR  OP    I R SUB     :    :    :    :    :    :    :    :
// --------------------------------------------------------------------------------------
// DONE:       LIA    0000  0           X    X
// DONE:       LI     0000  0                X
// --------------------------------------------------------------------------------------
// DONE:       LJSR   0000  1           1    1              2    2    2
// DONE:       LJMP   0001  1                     X    X    2    2    2
// DONE:       JSR    0010              X    X    X    X    2    2    2
// DONE:       JMP    0011              X    X    X    X    2    2    2
// --------------------------------------------------------------------------------------
// DONE:       IOT    0100              .    X    .    X    ?    ?    ?
// DONE:       IN     0101              .    X    .    X    ?    ?    ?
// DONE:       OUT    0110              .    X    .    X    ?    ?    ?
// --------------------------------------------------------------------------------------
// DONE:       LOAD   1000              X    X    X    X    X    X    X
// DONE:       STORE  1001              X    X    X    X    X    X    X
// DONE:       DSZ    1010              X    X    X    3    3    3    3
// --------------------------------------------------------------------------------------
// DONE:       ADD    1100              X    X    X    X    X    X    X
// DONE:       AND    1101              X    X    X    X    X    X    X
// DONE:       OR     1110              X    X    X    X    X    X    X
// DONE:       XOR    1111              X    X    X    X    X    X    X
// --------------------------------------------------------------------------------------
// DONE:       IRET   0111  0 0 000
// DONE:       LRET   0111  0 0 001
// DONE:       RET    0111  0 0 010
// DONE:       TAS    0111  0 0 011
// DONE:       TSA    0111  0 0 100
// DONE:       TAD    0111  0 0 101
// DONE:       TDA    0111  0 0 110
// DONE:       PHA    0111  0 0 111
// DONE:       PPA    0111  0 1 000
// DONE:       PHF    0111  0 1 001
// DONE:       PPF    0111  0 1 010
// DONE:       STI    0111  0 1 011
// DONE:       CLI    0111  0 1 100
// DONE:       IFL    0111  0 1 101
// DONE:       IFV    0111  0 1 110
// DONE:       UOP    0111  0 1 111
// DONE:       SRU    0111  1 0 000
// DONE:       SKP    0111  1 0 001
// DONE:       TAB    0111  1 0 010 *REMOVED*
// DONE:       TBA    0111  1 0 011 *REMOVED*
// DONE:       RMB    0111  1 0 100
// DONE:       SMB    0111  1 0 101
// DONE:       IND    0111  1   111
// --------------------------------------------------------------------------------------
// X = Addressing mode implemented
// . = Addressing mode makes no sense, TBD
// i = Double indirection mode
// 1 = Despite I=0, these are indirect modes
// 2 = (To be replaced with) Double Indirection
// 3 = Autoindex behaviour is non-standard. (decrements AC for DEC & SP regs)


// IFL = OP1  '1---------               ; if9: END if L=0
// IFV = OP1  '-1--------               ; if8: END if V=0
// CLA = OP1  '--1-------               ; if7: A <- 0
// CLL = OP1  '---1------               ; if6: L <- 0
// NOT = OP1  '----1-----               ; if5: A <- NOT A
// INC = OP1  '-----1----               ; if4: <L,A> <- <L,A> + 1
// CPL = OP1  '------1---               ; if3: L <- NOT L
// RBL = OP1  '-------010               ; ifroll: <L,A> <- <L,A> << 1
// RBR = OP1  '-------001               ; <L,A> <- <L,A> >> 1
// RNL = OP1  '-------110               ; <L,A> <- <L,A> << 4
// RNR = OP1  '-------101               ; <L,A> <- <L,A> >> 4

// ROLLS/SHIFTS
//
// * Arithmetic/Logic
// * Left/Right
// * 1
// * 2

// Needs 4 bits, 3 bits left, 3 bits right + 4 bits

// Define the opcodes for convenience.

#define _INSTR(x) RST=1, INT=1, IN_RESERVED=X, OP=x

#define IRET   _INSTR(0000), I=0, R=0, SUBOP=000, COND=X, IDX=XX
#define LRET   _INSTR(0000), I=0, R=0, SUBOP=001, COND=X, IDX=XX
#define RET    _INSTR(0000), I=0, R=0, SUBOP=010, COND=X, IDX=XX
#define TAS    _INSTR(0000), I=0, R=0, SUBOP=011, COND=X, IDX=XX
#define TSA    _INSTR(0000), I=0, R=0, SUBOP=100, COND=X, IDX=XX
#define TAD    _INSTR(0000), I=0, R=0, SUBOP=101, COND=X, IDX=XX
#define TDA    _INSTR(0000), I=0, R=0, SUBOP=110, COND=X, IDX=XX
//#define      _INSTR(0000), I=0, R=0, SUBOP=111, COND=X, IDX=XX // This is available

#define ISR   _INSTR(0000), I=0, R=1, SUBOP=000, COND=X, IDX=XX // ** SUBOP AND R are not arbitrary!
#define PHA    _INSTR(0000), I=0, R=1, SUBOP=001, COND=X, IDX=XX
#define PPA    _INSTR(0000), I=0, R=1, SUBOP=010, COND=X, IDX=XX
#define PHF    _INSTR(0000), I=0, R=1, SUBOP=011, COND=X, IDX=XX
#define PPF    _INSTR(0000), I=0, R=1, SUBOP=100, COND=X, IDX=XX
#define STI    _INSTR(0000), I=0, R=1, SUBOP=101, COND=X, IDX=XX
#define CLI    _INSTR(0000), I=0, R=1, SUBOP=110, COND=X, IDX=XX
#define WAIT   _INSTR(0000), I=0, R=1, SUBOP=111, COND=X, IDX=XX

#define SRU    _INSTR(0000), I=1, R=0, SUBOP=000, COND=X, IDX=XX // All shifts and rolls are here.
#define SKP    _INSTR(0000), I=1, R=0, SUBOP=001, COND=X, IDX=XX // Skips
#define RMB    _INSTR(0000), I=1, R=0, SUBOP=010, COND=X, IDX=XX // Read a Memory Bank Register
#define SMB    _INSTR(0000), I=1, R=0, SUBOP=011, COND=X, IDX=XX // Set an Memory Bank Register
//#define      _INSTR(0000), I=1, R=0, SUBOP=100, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=101, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=110, COND=X, IDX=XX // This is available
//#define IND  _INSTR(0000), I=1, R=0, SUBOP=111, COND=X, IDX=XX // THIS IS IND R (SEE BELOW)

#define JPA    _INSTR(0000), I=1, R=1, SUBOP=000, COND=X, IDX=XX
#define JSA    _INSTR(0000), I=1, R=1, SUBOP=001, COND=X, IDX=XX
//#define      _INSTR(0000), I=1, R=1, SUBOP=010, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=1, SUBOP=011, COND=X, IDX=XX // This is available
#define UOP    _INSTR(0000), I=1, R=1, SUBOP=100, COND=X, IDX=XX // ** SUBOP is not arbitrary!
#define IFL    _INSTR(0000), I=1, R=1, SUBOP=101,         IDX=XX // ** SUBOP is not arbitrary!
#define IFV    _INSTR(0000), I=1, R=1, SUBOP=110,         IDX=XX // ** SUBOP is not arbitrary!
#define IND    _INSTR(0000), I=1,      SUBOP=111, COND=X, IDX=XX // THIS INCLUDES AN R VARIANT

#define LIA    _INSTR(0001), SUBOP=XXX, COND=X                   // Only for I=0

#define LJSR   _INSTR(0001), SUBOP=XXX, COND=X                   // Only for I=1
#define LJMP   _INSTR(0010), SUBOP=XXX, COND=X			 // Only for I=1
#define JSR    _INSTR(0011), SUBOP=XXX, COND=X
#define JMP    _INSTR(0100), SUBOP=XXX, COND=X

#define IN     _INSTR(0101), SUBOP=XXX, COND=X
#define OUT    _INSTR(0110), SUBOP=XXX, COND=X
#define IOT    _INSTR(0111), SUBOP=XXX

#define LOAD   _INSTR(1000), SUBOP=XXX, COND=X
#define STORE  _INSTR(1001), SUBOP=XXX, COND=X
#define DSZ    _INSTR(1010), SUBOP=XXX, COND=X

//#define ???  _INSTR(1011), ... // Available full instruction

#define ADD    _INSTR(1100), SUBOP=XXX, COND=X
#define AND    _INSTR(1101), SUBOP=XXX, COND=X
#define OR     _INSTR(1110), SUBOP=XXX, COND=X
#define XOR    _INSTR(1111), SUBOP=XXX, COND=X

// , I=0, R=1, SUBOP=XXX, IDX=IDX_REG;
// #define INSTR(x)          _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=XX
// #define INSTR_I(x)        _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=XX
// #define INSTR_I_R(x)      _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=XX
// #define INSTR_I_R_INC(x)  _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=IDX_INC
// #define INSTR_I_R_DEC(x)  _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=IDX_DEC
// #define INSTR_I_R_SP(x)   _INSTR(x), I=0, R=0, SUBOP=XXX, IDX=IDX_SP



///////////////////////////////////////////////////////////////////////////////
//
// THE IRET INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: IRET
// NAME:     Interrupt Return
// DESC:     Return from Interrupt
// GROUP:    Flow Control
// MODE:     Implied
// FLAGS:    *NZVIL
//
// Pops the AC, PC and MBP from the Hardware Stack to return from an Interrupt
// Service Routine.

start IRET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(ac), /action_sti;		// 02 AC ← mem[--SP]
      STACK_POP(pc);				// 05 PC ← mem[--SP]
      STACK_POP(mbp_flags), END;                // 08 flags:MBP ← mem[--SP]


///////////////////////////////////////////////////////////////////////////////
//
// THE LRET INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LRET
// NAME:     Long Return
// DESC:     Return from Long Subroutine Jump
// GROUP:    Flow Control
// MODE:     Implied
// FLAGS:    -----
//
// Pops the PC and MBP from the Hardware Stack to return from a subroutine
// entered with LJSR.

start LRET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc);				// 02 PC ← mem[--SP]
      STACK_POP(mbp), END;			// 05 MBP ← mem[--SP]

///////////////////////////////////////////////////////////////////////////////
//
// THE RET INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: RET
// NAME:     Return
// DESC:     Return from Subroutine
// GROUP:    Flow Control
// MODE:     Implied
// FLAGS:    -----
//
// Pops the PC from the Hardware Stack to return from a subroutine entered
// with JSR.

start RET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc), END;			// 02 PC ← mem[--SP]


///////////////////////////////////////////////////////////////////////////////
//
// THE TAS INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: TAS
// NAME:     Transfer Accumulator to Stack Pointer
// DESC:     Sets SP to the current value of the AC.
// GROUP:    Transfer
// MODE:     Implied
// FLAGS:    -----

start TAS;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(sp, ac), END;				// 02 SP ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE TSA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: TSA
// NAME:     Transfer Stack Pointer to Accumulator
// DESC:     Sets AC to the current value of the SP.
// GROUP:    Transfer
// MODE:     Implied
// FLAGS:    *NZ---

start TSA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, sp), END;				// 02 AC ← SP


///////////////////////////////////////////////////////////////////////////////
//
// THE TAD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: TAD
// NAME:     Transfer Accumulator to Data Register
// DESC:     Sets DR to the current value of the AC.
// GROUP:    Transfer
// MODE:     Implied
// FLAGS:    -----

start TAD;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, ac), END;				// 02 DR ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE TDA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: TDA
// NAME:     Transfer Data Register to Accumulator
// DESC:     Sets AC to the current value of the DR.
// GROUP:    Transfer
// MODE:     Implied
// FLAGS:    *NZ---

start TDA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, dr), END;				// 02 AC ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE ISR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: ISR
// NAME:     Software Interrupt
// DESC:     Call Interrupt Service Routine
// GROUP:    Flow Control
// MODE:     Literal
// FLAGS:    ---i-
//
// Calls the Interrupt Service Routine. The 7-bit value in the operand is
// written to the DR. An ISR can transfer this value to the AC to implement
// custom software interrupts or traps.

start ISR;
      /action_cli, STACK_PUSH(mbp_flags);       // 00 mem[MBS:SP++] ← flags:MBP; CLI
      STACK_PUSH(pc);			        // 02 mem[MBS:SP++] ← PC
      STACK_PUSH(ac);		                // 04 mem[MBS:SP++] ← AC
      SET(pc, cs_isrvec0);			// 06 PC ← 0002
      SET(mbp, cs_isrvec1);			// 07 MBP ← 0003
      SET(agl, dr), END;			// 08 DR ← AGL


///////////////////////////////////////////////////////////////////////////////
//
// THE PHA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: PHA
// NAME:     Push Accumulator
// DESC:     Pushes AC onto the Hardware Stack.
// GROUP:    Stack
// MODE:     Implied
// FLAGS:    -----
//
// Pushes the AC onto the Hardware Stack and increments the SP.

start PHA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(ac), END;			// 02 mem[MBS:SP++] ← ac


///////////////////////////////////////////////////////////////////////////////
//
// THE PPA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: PPA
// NAME:     Pop Accumulator
// DESC:     Pops the AC from the Hardware Stack.
// GROUP:    Stack
// MODE:     Implied
// FLAGS:    *NZ---
//
// Decrements the SP and loads the AC from the memory location pointed to by
// the SP.

start PPA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(ac), END;			// 02 AC ← mem[--SP]


///////////////////////////////////////////////////////////////////////////////
//
// THE PHF INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: PHF
// NAME:     Push Flags
// DESC:     Pushes Flags onto the Hardware Stack.
// GROUP:    Stack
// MODE:     Implied
// FLAGS:    -----
//
// Pushes the Flags onto the Hardware Stack and increments the SP.

start PHF;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(flags), END;			// 02 mem[MBS:SP++] ← flags


///////////////////////////////////////////////////////////////////////////////
//
// THE PPF INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: PPF
// NAME:     Pop Flags
// DESC:     Pops the Flags from the Hardware Stack.
// GROUP:    Stack
// MODE:     Implied
// FLAGS:    *--VIL
//
// Decrements the SP and loads the Flags from the memory location pointed to by
// the SP. The Z and N flags will not be updated.

start PPF;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(flags), END;			// 02 flags ← mem[--SP]


///////////////////////////////////////////////////////////////////////////////
//
// THE STI INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: STI
// NAME:     Set Interrupt Flag
// DESC:     Enables interrupt servicing.
// GROUP:    Flow Control
// MODE:     Implied
// FLAGS:    ---I-
//
// Sets the Interrupt Flag. If interrupts are already pending, control will
// jump to the ISR immediately. Subsequent interrupts will be processed
// asynchronously, after whatever instruction is executing has finished.

start STI;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      /action_sti, END;		                // 02 STI


///////////////////////////////////////////////////////////////////////////////
//
// THE CLI INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: CLI
// NAME:     Clear Interrupt Flag
// DESC:     Disables interrupt servicing.
// GROUP:    Flow Control
// MODE:     Implied
// FLAGS:    ---i-
//
// Clears the Interrupt Flag. Any pending interrupts are ignored and the
// pending interrupt flag is cleared. Subsequent interrupts will also be
// ignored.

start CLI;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      /action_cli, END;		                // 02 CLI


///////////////////////////////////////////////////////////////////////////////
//
// THE WAIT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: WAIT
// NAME:     Wait for Interrupt
// DESC:     Suspends program execution until an interrupt arrives.
// GROUP:    Flow Control
// MODE:     Literal
// FLAGS:    ---I-
//
// Enables Interrupt Flag and stops program execution until an interrupt
// arrives. The program will hang until an interrupt arrives. Control then
// jumps to the Interrupt Service Routine. When the interrupt has been
// serviced, program execution resumes with the instruction after WAIT.
//
// Like the ISR instruction, the 7-bit value in the operand is written to the
// DR. An ISR can transfer this value to the AC to implement custom software
// interrupts or traps.
//
// NOTES:
//
// The WAIT instruction stops execution until an interrupt arrives (in
// case it's handled).
//
// There's no fetch cycle here! The instruction just executes END, but doesn't
// fetch anything, which puts the microcode sequencer in an endless loop. It
// will be broken out of that loop only when an interrupt arrives, and the
// interrupt handler microprogram gets executed. That can only happen when END
// is asserted. Conveniently, we're asserting END on every processor cycle.
//
// While WAIT is active, the front panel will appear to be stuck in the ‘Fetch’
// state with the µPC stuck to zero and Interrupts enabled.

start WAIT;
      SET(agl, dr), /action_sti, END; // 00 DR ← AGL; STI; loop forever
      hold;			      // And keep on doing this.
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //
      hold;			      //

///////////////////////////////////////////////////////////////////////////////
//
// THE UNARY OPERATION GROUP: IFL, IFV, UOP
//
///////////////////////////////////////////////////////////////////////////////

//             6543210
// CLA = UOP  '-1-----		; if5: A <- 0
// CLL = UOP  '--1----		; if4: L <- 0
// NOT = UOP  '---1---		; if3: A <- NOT A
// INC = UOP  '----1--		; if2: <L,A> <- <L,A> + 1
// DEC = UOP  '-----1-		; if1: <L,A> <- <L,A> + 1
// CPL = UOP  '------1		; if0: L <- NOT L

// L=1 ⇒ COND=0, so IFL takes action.

start IFL, COND=0;
      FETCH_IR, if_l;		                // 00 IR ← mem[PC++];
      if_ir5;					// If L:
      /action_cla, if_ir4;			// If IR5: AC ← 0
      /action_cll, if_ir3;			// If IR4: L ← 0
      SET(ac, alu_not), if_ir2;			// If IR3: AC ← ~AC
      /action_incac, if_ir1;                    // IF IR2: AC++
      /action_decac, if_ir0;                    // IF IR1: AC--
      /action_cpl, END;				// IF IR0: L ← ¬L

start IFL, COND=1;
      FETCH_IR, if_l;		                // 00 IR ← mem[PC++];
      END;
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;

start IFV, COND=0;
      FETCH_IR, if_v;		                // 00 IR ← mem[PC++];
      if_ir5;					// If V:
      /action_cla, if_ir4;			// If IR5: AC ← 0
      /action_cll, if_ir3;			// If IR4: L ← 0
      SET(ac, alu_not), if_ir2;			// If IR3: AC ← ~AC
      /action_incac, if_ir1;                    // IF IR2: AC++
      /action_decac, if_ir0;                    // IF IR1: AC--
      /action_cpl, END;				// IF IR0: L ← ¬L

start IFV, COND=1;
      FETCH_IR, if_v;		                // 00 IR ← mem[PC++];
      END;
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;

start UOP, COND=0;
      FETCH_IR, if_ir5;		                // 00 IR ← mem[PC++];
      /action_cla, if_ir4;			// If IR5: AC ← 0
      /action_cll, if_ir3;			// If IR4: L ← 0
      SET(ac, alu_not), if_ir2;			// If IR3: AC ← ~AC
      /action_incac, if_ir1;                    // IF IR2: AC++
      /action_decac, if_ir0;                    // IF IR1: AC--
      /action_cpl, END;				// IF IR0: L ← ¬L

start UOP, COND=1;
      FETCH_IR, if_ir5;		                // 00 IR ← mem[PC++];
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;


///////////////////////////////////////////////////////////////////////////////
//
// SHIFTS AND ROTATIONS
//
///////////////////////////////////////////////////////////////////////////////

//            OP   I R 987 654 3210
// SHL = SRU  0111'1'0'000'000'dddd    ; Bitwise shift left by d bits
// SHR = SRU  0111'1'0'000'001'dddd    ; Bitwise shift right by d bits
// ASR = SRU  0111'1'0'000'011'dddd    ; Arithmetic shift right by d bits
// ROL = SRU  0111'1'0'000'100'dddd    ; Rotate left by d bits
// ROR = SRU  0111'1'0'000'101'dddd    ; Rotate right by d bits

// L=1 ⇒ COND=0, so IFL takes action.

// IR bits are directly linked to the shift/rotate unit, so all
// of these instructions have the same microcode.
start SRU;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      /action_sru;				// 02 SRU cycle #1 (sync wait)
      ;				                // 03 SRU cycle #2
      ;				                // 04 SRU cycle #3
      ;				                // 05 SRU cycle #4
      ;				                // 06 SRU cycle #5
      SET(ac, alu_b), END;			// 07 AC ← ALU B Reg


///////////////////////////////////////////////////////////////////////////////
//
// SKIPS
//
///////////////////////////////////////////////////////////////////////////////

//            OP   I R 987 6543210
//       SKP  0000'1'0'001'000dddd    ;
//       NOP  0000'1'0'001'0000000    ; G1 Skip never (NOP)
//       SNA  0000'1'0'001'--01---    ; G1 Skip if Negative AC: A < 0 => PC++
//       SZA  0000'1'0'001'--0-1--    ; G1 Skip if Zero AC: A == 0 => PC++
//       SSL  0000'1'0'001'--0--1-    ; G1 Skip if Link set: L == 1 ==> PC++
//       SSV  0000'1'0'001'--0---1    ; G1 Skip if Overflow set: V == 1 ==> PC++ (1)
//
//       SKIP 0000'1'0'001'--10000    ; G2 Skip always: PC++
//       SNN  0000'1'0'001'--11---    ; G2 Skip if Non-Negative AC: a >=0 ==> PC++  (2)
//       SNZ  0000'1'0'001'--1-1--    ; G2 Skip if Non-Zero AC: AC != 0 ==> PC++ (2)
//       SCL  0000'1'0'001'--1--1-    ; G2 Skip if Link clear: L == 0 ==> PC++ (2)
//       SCV  0000'1'0'001'--1---1    ; G2 Skip if Overflow clear: V == 0 ==> PC++ (2)
//
// G1 and G2 sub-instructions may be combined, but not across groups.
// G1 condition bits are ORred together.
// G2 conditions bits are ANDed together.
//
// The OR/AND logic isn't microcoded, it's part of the hardwired
// decoding of the branch bits.

// The skip mechanism is hard-wired, so the microcode is fairly simple
// here.

// First, the version where the skip isn't taken.
start SKP, COND=0;
      FETCH_IR, if_branch;	                // 00 IR ← mem[PC++]
      END;					// 02 IF not skip: END

// Next, the version where the skip is taken.
start SKP, COND=0;
      FETCH_IR, if_branch;	                // 00 IR ← mem[PC++]
      /action_incpc, END;			// 02 If skip: PC++



///////////////////////////////////////////////////////////////////////////////
//
// THE TBA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// Removed this as it's not easily feasible given the current architecture.
// start TBA;
//       FETCH_IR;                                 // 00 IR ← mem[PC++]
//       SET(ac, alu_b), END;			// 02 AC ← ALU B


///////////////////////////////////////////////////////////////////////////////
//
// THE TAB INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// Removed this as it's not easily feasible given the current architecture.
// start TBA;
//       FETCH_IR;                                 // 00 IR ← mem[PC++]
//       SET(alu_b, ac), END;			// 02 ALU_B ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE RMB INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

start RMB;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, mbn), END;			// 02 AC ← MB[IR0..IR2]


///////////////////////////////////////////////////////////////////////////////
//
// THE SMB INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

start SMB;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(mbn, ac), END;			// 02 MB[IR0..02] ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE JPA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

start JPA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(pc, ac), END;				// 02 PC ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE JSA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

start JSA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      SET(pc, ac), END;				// 04 PC ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE IND INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① IND, local address addressing mode
start IND, R=0;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, ac);				// 02 DR ← AC
      MEMREAD(mbp, ac, dr), END;		// 03 AC ← mem[MBP:DR]

// ② IND, register address addressing mode.

// Note: this is redundant (case ① above can handle it with an appropriate
// operand). It's here because it allows the ‘R’ notation to work as expected,
// at the cost of one micro-program (we can spare them these days).
start IND, R=1;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, ac);				// 02 DR ← AC
      MEMREAD(mbz, ac, dr), END;		// 03 AC ← mem[MBZ:DR]


///////////////////////////////////////////////////////////////////////////////
//
// THE LIA/LI INSTRUCTIONS
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LIA
// NAME:     Literal Address
// GROUP:    Miscellaneous
//
// Interprets operand as a Page-Local or Page Zero address and set the AC to
// it.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Limited set of addressing modes.
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register

// MNEMONIC: LI
// NAME:     Literal
// GROUP:    Miscellaneous
// MODE:     Literal
//
// Sets the AC to the 10-bit literal value in the operand. The top six bits in
// the AC are cleared. This is the same instruction as LIA in Register mode.

// NOTE: LIA makes no sense with I=1, so it shares opcodes with the
// LJSR instruction, which makes no sense with I=1.

// (1) LIA, Page-Local
start LIA, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(ac, agl), END;			// 02 AC ← AGL

// (2) LIA, Register (also LI, Literal)
start LIA, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(ac, agl), END;			// 02 AC ← AGL


///////////////////////////////////////////////////////////////////////////////
//
// THE LJSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: LJSR makes no sense with I=0, so it shares opcodes with the
// LIA instruction, which makes no sense with I=0.

// ③ LJSR (always with I=1), local indirect addressing mode.
start LJSR, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[MBS:SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[MBS:SP++] ← PC
      SET(dr, agl);				// 06
      MEMREAD(mbp, agl, pc), /action_incdr;	// 07 PC ← mem[MBP:AGL]
      MEMREAD(mbp, dr, mbp), END;		// 09 MBP ← mem[MBP:AGL+1]

// ④ LJSR (always with I=1), register indirect addressing mode.
start LJSR, I=1, R=1, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[MBS:SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[MBS:SP++] ← PC
      SET(dr, agl);				// 06
      MEMREAD(mbz, agl, pc), /action_incdr;	// 07 PC ← mem[MBZ:AGL]
      MEMREAD(mbz, dr, mbp), END;		// 09 MBP ← mem[MBZ:AGL+1]

// TODO: NOTE: POSSIBLE BUG IN AGL FOUND MAKING THIS MICROPROGRAM FAIL BADLY.

// ⑤ LJSR (always with I=1), register double indirect autoincrement addressing mode.
// NOTE: If /action_incdr can happen fast enough, we can shave off two cycles here.
start LJSR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[MBS:SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);	                // 06 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, pc);	                // 08 PC ← mem[MBD:DR]
      /action_incdr;                            // 10 DR++
      MEMREAD(mbd, dr, mbp);	                // 11 MBP ← mem[MBD:DR]
      /action_incdr;                            // 13 DR++
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBZ:AGL] ← DR

// ⑥ LJSR (always with I=1), register indirect autodecrement addressing mode.
start LJSR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[MBS:SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);	                // 06 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, mbp);	                // 08 MBP ← mem[MBD:DR]
      /action_decdr;                            // 10 DR--
      MEMREAD(mbd, dr, pc);	                // 11 PC ← mem[MBD:DR]
      /action_decdr;                            // 13 DR--
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBZ:AGL] ← DR

// ⑦ LJSR (always with I=1), register indirect stack addressing mode.
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to
// them. Push MBP onto the stack FIRST.
start LJSR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[MBS:SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, dr, pc);	                // 06 MBP ← mem[MBD:DR]
      MEMREAD(mbd, agl, dr);	                // 08 DR ← mem[MBD:AGL]
      /action_decdr;                            // 10 DR--
      MEMREAD(mbd, dr, mbp);	                // 11 PC ← mem[MBD:DR]
      /action_decdr;                            // 13 DR--
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBD:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE LJMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: LJMP makes no sense with I=0, so the ① and ② microprograms
// are blank and available for another instruction where indirection
// makes no sense.

// ③ LJMP (always with I=1), local indirect addressing mode.
start LJMP, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(dr, agl);				// 02 DR ← AGL
      MEMREAD(mbp, agl, pc), /action_incdr;	// 03 PC ← mem[MBP:AGL]; DR++
      MEMREAD(mbp, dr, mbp), END;		// 05 MBP ← mem[MBP:AGL+1]

// ④ LJMP (always with I=1), register indirect addressing mode.
start LJMP, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(dr, agl);				// 02 DR ← AGL
      MEMREAD(mbz, agl, pc), /action_incdr;	// 03 PC ← mem[MBZ:AGL]; DR++
      MEMREAD(mbz, dr, mbp), END;		// 05 MBP ← mem[MBZ:AGL+1]

// ⑤ LJMP (always with I=1), register double indirect autoincrement addressing mode.
// NOTE: If /action_incdr can happen fast enough, we can shave off two cycles here.
start LJMP, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);	                // 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, pc);	                // 04 PC ← mem[MBD:DR]
      /action_incdr;                            // 06 DR++
      MEMREAD(mbd, dr, mbp);	                // 07 MBP ← mem[MBD:DR]
      /action_incdr;                            // 09 DR++
      MEMWRITE(mbz, agl, dr), END;               // 10 mem[MBZ:AGL] ← DR


// ⑥ LJMP (always with I=1), register indirect autodecrement addressing mode.
start LJMP, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);	                // 02 DR ← mem[MBD:AGL]
      MEMREAD(mbd, dr, mbp);	                // 04 MBP ← mem[MBD:DR]
      /action_decdr;                            // 06 DR--
      MEMREAD(mbd, dr, pc);	                // 07 PC ← mem[MBD:DR]
      /action_decdr;                            // 09 DR--
      MEMWRITE(mbz, agl, dr), END;               // 10 mem[MBD:AGL] ← DR


// ⑦ LJMP (always with I=1), register indirect stack addressing mode.
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to
// them. Push MBP onto the stack first.
start LJMP, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);	                // 02 DR ← mem[MBD:AGL]
      MEMREAD(mbd, dr, pc);	                // 04 PC ← mem[MBD:DR]
      /action_decdr;                            // 06 DR--
      MEMREAD(mbd, dr, mbp);	                // 07 MBP ← mem[MBD:DR]
      /action_decdr;                            // 09 DR--
      MEMWRITE(mbz, agl, dr), END;              // 10 mem[MBD:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE JSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JSR
// NAME:     Jump to Subroutine
// GROUP:    Flow Control
//
// Push PC to the Hardware Stack and jump to a subroutine. Jumps are always
// relative to the current value of the MBP.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Non-Standard addressing modes marked with *** below
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F   *** ( ) Auto-Increment Double Indirect
//  1   1   380–3BF   *** ( ) Auto-Decrement Double Indirect
//  1   1   3C0–3FF       (8) Stack

// (1) & (2) JSR, Page-local and Page Zero modes
start JSR, I=0, R=X, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      SET(pc, agl), END;			// 04 PC ← AGL

// (3) JSR, Indirect.
start JSR, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      MEMREAD(mbp, agl, pc), END;		// 04 PC ← mem[MBP:AGL]

// (4) & (5) JSR, Register Indirect and Memory Bank-Relative Indirect
start JSR, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, pc), END;		// 04 PC ← mem[MBZ:AGL]

// NON-STANDARD: (6) JSR, Auto-Increment Double Indirect
start JSR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);			// 04 DR ← mem[MBZ:AGL]
      MEMREAD(mbp, dr, pc), /action_incdr;	// 06 PC ← mem[MBP:DR]; DR++
      MEMWRITE(mbz, agl, dr), END;		// 08 mem[MBZ:AGL] ← DR

// NON-STANDARD: (7) JSR, Auto-Decrement Double Indirect
start JSR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);			// 04 DR ← mem[MBZ:AGL]
      MEMREAD(mbp, dr, pc), /action_decdr;	// 06 PC ← mem[MBP:DR]; DR--
      MEMWRITE(mbz, agl, dr), END;		// 08 mem[MBZ:AGL] ← DR

// (8) JSR, indirect stack addressing mode.
// Pops a 16-bit value from the specified stack register and jumps to the
// subroutine there.
start JSR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);			// 04 DR ← mem[MBZ:AGL]
      /action_decdr;				// 06 DR--
      MEMREAD(mbp, dr, pc);	                // 07 PC ← mem[MBP:DR]
      MEMWRITE(mbz, agl, dr), END;		// 09 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE JMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JMP
// NAME:     Jump
// GROUP:    Flow Control
//
// Jump unconditionally. Jumps are always relative to the current value of the
// MBP.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Non-Standard addressing modes marked with *** below
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F   *** ( ) Auto-Increment Double Indirect
//  1   1   380–3BF   *** ( ) Auto-Decrement Double Indirect
//  1   1   3C0–3FF       (8) Stack

// (1) & (2), Page-Local and Register addressing modes
start JMP, I=0, R=X, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(pc, agl), END;			// 02 PC ← AGL

// (3) JMP, Indirect
start JMP, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, pc), END;		// 02 PC ← mem[MBP:AGL]

// (4) & (5) JMP, Register Indirect and Memory Bank-Relative Indirect
start JMP, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, pc), END;		// 02 PC ← mem[MBZ:AGL]

// NON-STANDARD: (6) JMP, Auto-Increment Double Indirect
start JMP, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbp, dr, pc), /action_incdr;	// 04 PC ← mem[MBP:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBD:AGL] ← DR

// NON-STANDARD: (7) JMP, Auto-Decrement Double Indirect
start JMP, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbp, dr, pc), /action_decdr;	// 04 PC ← mem[MBP:DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (8) JMP, Stack.
// Pops a 16-bit value from the specified stack register and jumps to it.
start JMP, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr;                            // 04 DR--;
      MEMREAD(mbp, dr, pc);	                // 05 PC ← mem[MBP:DR]
      MEMWRITE(mbz, agl, dr), END;              // 07 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE DSZ INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// First, without skips. The last microinstruction is an END.

// ① DSZ, local addressing mode.
start DSZ, COND=1, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac);	                // 02 AC ← mem[MBP:AGL]
      /action_decac;				// 04 AC++;
      MEMWRITE(mbp, agl, ac), if_z;              // 05 mem[MBP:AGL] ← AC
      END;					// 07

// ② DSZ, register addressing mode.
start DSZ, COND=1, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac);	                // 02 AC ← mem[MBZ:AGL]
      /action_decac;				// 04 AC++;
      MEMWRITE(mbz, agl, ac), if_z;              // 05 mem[MBZ:AGL] ← AC
      END;					// 07

// ③ DSZ, local indirect addressing mode.
start DSZ, COND=1, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ④ DSZ, register indirect addressing mode.
start DSZ, COND=1, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑤ DSZ, register indirect autoincrement addressing mode.
start DSZ, COND=1, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑥ DSZ, register indirect autodecrement addressing mode.
start DSZ, COND=1, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑦ DSZ, register indirect stack addressing mode.  This technically
// pops a value from the stack and writes it back. With no net change
// in the stack pointer register, we don't need to increment or decrement.
start DSZ, COND=1, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// And now the same, with skips taken: /action_incpc is executed in
// the last microstep.

// ① DSZ, local addressing mode.
start DSZ, COND=0, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac);	                // 02 AC ← mem[MBP:AGL]
      /action_decac;				// 04 AC++;
      MEMWRITE(mbp, agl, ac), if_z;              // 05 mem[MBP:AGL] ← AC
      END;					// 07

// ② DSZ, register addressing mode.
start DSZ, COND=0, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac);	                // 02 AC ← mem[MBZ:AGL]
      /action_decac;				// 04 AC++;
      MEMWRITE(mbz, agl, ac), if_z;              // 05 mem[MBZ:AGL] ← AC
      /action_incpc, END;			// 07 PC++;

// ③ DSZ, local indirect addressing mode.
start DSZ, COND=0, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ④ DSZ, register indirect addressing mode.
start DSZ, COND=0, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑤ DSZ, register indirect autoincrement addressing mode.
start DSZ, COND=0, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑥ DSZ, register indirect autodecrement addressing mode.
start DSZ, COND=0, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑦ DSZ, register indirect stack addressing mode.
start DSZ, COND=0, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE(mbd, dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;


///////////////////////////////////////////////////////////////////////////////
//
// THE LOAD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① LOAD, local addressing mode.
start LOAD, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac), END;		// 02 AC ← mem[MBP:AGL]

// ② LOAD, register addressing mode.
start LOAD, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac), END;		// 02 AC ← mem[MBZ:AGL]

// ③ LOAD, local indirect addressing mode.
start LOAD, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac), END;			// 04 AC ← mem[MBD:DR]

// ④ LOAD, register indirect addressing mode.
start LOAD, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac), END;			// 04 AC ← mem[MBD:DR]

// ⑤ LOAD, register indirect autoincrement addressing mode.
// TODO: /action_incdr might need to be in a processor cycle of its own!
start LOAD, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR

// ⑥ LOAD, register indirect autodecrement addressing mode.
// TODO: /action_incdr might need to be in a processor cycle of its own!
start LOAD, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, ac), /action_decdr;	// 04 AC ← mem[MBD:DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR

// ⑦ LOAD, register indirect stack addressing mode.
start LOAD, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr;				// 04 DR--
      MEMREAD(mbd, dr, ac);	                // 05 AC ← mem[MBD:DR];
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE STORE INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① STORE, local addressing mode.
start STORE, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMWRITE(mbp, agl, ac), END;		// 02 mem[MBP:AGL] ← AC

// ② STORE, register addressing mode.
start STORE, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMWRITE(mbz, agl, ac), END;		// 02 mem[MBZ:AGL] ← AC

// ③ STORE, local indirect addressing mode.
start STORE, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMWRITE(mbd, dr, ac), END;		// 04 mem[MBD:DR] ← AC

// ④ STORE, register indirect addressing mode.
start STORE, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMWRITE(mbz, dr, ac), END;		// 04 mem[MBZ:DR] ← AC

// ⑤ STORE, register indirect autoincrement addressing mode.
start STORE, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]p
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMWRITE(mbd, dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR

// ⑥ STORE, register indirect autodecrement addressing mode.
start STORE, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMWRITE(mbd, dr, ac), /action_decdr;	// 04 mem[MBD:DR] ← AC; DR--;
      MEMWRITE(mbz, agl, dr);			// 06 mem[MBZ:AGL] ← DR

// ⑦ STORE, register indirect stack addressing mode.
start STORE, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]p
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMWRITE(mbd, dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE IN INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// I/O space is 16 bits wide. The first 10 bits of those are faster to use, and
// these are all the CFT bothers with.

// ① IN, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IN, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOREAD(agl, ac), END;     		// 02 AC ← io[AGL]

// ② IN, direct addressing mode.
start IN, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOREAD(agl, ac), END;		        // 02 AC ← io[AGL]

// ③ IN, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IN, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOREAD(dr, ac), END;      		// 04 AC ← io[DR]

// ④ IN, indirect addressing mode.
start IN, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOREAD(dr, ac), END;		        // 04 AC ← io[DR]

// ⑤ IN, indirect autoincrement addressing mode.
start IN, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOREAD(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑥ IN, indirect autodecrement addressing mode.
start IN, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOREAD(dr, ac), /action_decdr;		// 04 AC ← io[DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR

// ⑦ IN, indirect stack addressing mode.
start IN, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr, IOREAD(dr, ac);		// 04 DR--; AC ← io[DR];
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE OUT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① OUT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start OUT, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;			// 02 io[AGL] ← AC

// ② OUT, register addressing mode.
start OUT, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;			// 02 io[AGL] ← AC

// ③ OUT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start OUT, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac), END;			// 04 io[DR] ← AC

// ④ OUT, register indirect addressing mode.
start OUT, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), END;			// 04 io[DR] ← AC

// ⑤ OUT, register indirect autoincrement addressing mode.
start OUT, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR

// ⑥ OUT, register indirect autodecrement addressing mode.
start OUT, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      MEMWRITE(mbz, agl, dr);			// 06 mem[MBZ:AGL] ← DR

// ⑦ OUT, register indirect stack addressing mode.
start OUT, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;		// 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE IOT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// IOT writes to an I/O address, then reads back a value. This is used to
// implement processor extensions. After the I/O write, an extension can assert
// SKIPEXT to skip the next instruction, and this is processed here. The
// extension can also assert ENDEXT to skip past reading the AC. If they do
// that, auto-increment and auto-decrement modes act as plain register modes.

// First, without skips. Remember, SKIP (aka COND) is active low.

// ① IOT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IOT, COND=1, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), END;			// 04 AC ← io[AGL]

// ② IOT, register addressing mode.
start IOT, COND=1, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), END;			// 04 AC ← io[AGL]

// ③ IOT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IOT, COND=1, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]

// ④ IOT, register indirect addressing mode.
start IOT, COND=1, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]

// ⑤ IOT, register indirect autoincrement addressing mode.
start IOT, COND=1, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), END;		// 08 mem[MBZ:AGL] ← DR

// ⑥ IOT, register indirect autodecrement addressing mode.
start IOT, COND=1, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr);			// 08 mem[MBZ:AGL] ← DR

// ⑦ IOT, register indirect stack addressing mode.
// Note: This acts like register indirect mode, so it's microcoded like it too.
start IOT, COND=1, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]


// And Now, with skips requested. Remember, SKIP is active low.

// ① IOT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IOT, COND=0, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), /action_incpc, END;	// 04 AC ← io[AGL]; PC++

// ② IOT, register addressing mode.
start IOT, COND=0, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), /action_incpc, END;	// 04 AC ← io[AGL]; PC++

// ③ IOT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start IOT, COND=0, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), /action_incpc, END;	// 04 AC ← io[DR]; PC++

// ④ IOT, register indirect addressing mode.
start IOT, COND=0, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), /action_incpc, END;	// 04 AC ← io[DR]; PC++

// ⑤ IOT, register indirect autoincrement addressing mode.
start IOT, COND=0, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), /action_incpc, END; // 08 mem[MBZ:AGL] ← DR; PC++

// ⑥ IOT, register indirect autodecrement addressing mode.
start IOT, COND=0, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), /action_incpc, END; // 08 mem[MBD:AGL] ← DR; PC++

// ⑦ IOT, register indirect stack addressing mode.
// Note: This acts like register indirect mode, so it's microcoded coded like
// it too.
start IOT, COND=0, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), /action_incpc, END;	// 06 AC ← io[DR]; PC++


///////////////////////////////////////////////////////////////////////////////
//
// THE ADD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// All four ALU binary operations have microcode that looks very
// similar to the LOAD one (the ALU B port is loaded rather then the
// ACcumulator, and there's an additional processor cycle to perform
// the operation.
//
// And all four ALU binary operations are nearly identical, only the
// final microstep differs.

// ① ADD, local addressing mode.
start ADD, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                  // 02 B ← mem[MBP:AGL]
      SET(ac, alu_add), END;			// 04 AC ← AC + B

// ② ADD, register addressing mode.
start ADD, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                  // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_add), END;			// 04 AC ← AC + B

// ③ ADD, local indirect addressing mode.
start ADD, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_add), END;			// 06 AC ← AC + B

// ④ ADD, register indirect addressing mode.
start ADD, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbp, dr, alu_b);			// 04 B ← mem[MBP:DR]
      SET(ac, alu_add), END;			// 06 AC ← AC + B

// ⑤ ADD, register indirect autoincrement addressing mode.
start ADD, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_add), END;			// 08 AC ← AC + B

// ⑥ ADD, register indirect autodecrement addressing mode.
start ADD, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_add), END;			// 08 AC ← AC + B

// ⑦ ADD, register indirect stack addressing mode.
start ADD, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr;			        // 04 DR--
      MEMREAD(mbd, dr, alu_b);			// 05 B ← mem[MBD:DR];
      MEMWRITE(mbz, agl, dr);	                // 07 mem[MBD:AGL] ← DR
      SET(ac, alu_add), END;			// 09 AC ← AC + B


///////////////////////////////////////////////////////////////////////////////
//
// THE AND INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① AND, local addressing mode.
start AND, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                  // 02 B ← mem[MBP:AGL]
      SET(ac, alu_and), END;			// 04 AC ← AC & B

// ② AND, register addressing mode.
start AND, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                  // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_and), END;			// 04 AC ← AC & B

// ③ AND, local indirect addressing mode.
start AND, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_and), END;			// 06 AC ← AC & B

// ④ AND, register indirect addressing mode.
start AND, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_and), END;			// 06 AC ← AC & B

// ⑤ AND, register indirect autoincrement addressing mode.
start AND, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;			// 08 AC ← AC & B

// ⑥ AND, register indirect autodecrement addressing mode.
start AND, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;			// 08 AC ← AC & B

// ⑦ AND, register indirect stack addressing mode.
start AND, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr;			        // 04 DR--
      MEMREAD(mbd, dr, alu_b);	                // 05 B ← mem[MBD:DR];
      MEMWRITE(mbz, agl, dr);	                // 07 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;			// 09 AC ← AC & B


///////////////////////////////////////////////////////////////////////////////
//
// THE OR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① OR, local addressing mode.
start OR, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                  // 02 B ← mem[MBP:AGL]
      SET(ac, alu_or), END;			// 04 AC ← AC | B

// ② OR, register addressing mode.
start OR, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                  // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_or), END;			// 04 AC ← AC | B

// ③ OR, local indirect addressing mode.
start OR, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_or), END;			// 06 AC ← AC | B

// ④ OR, register indirect addressing mode.
start OR, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbz, dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_or), END;			// 06 AC ← AC | B

// ⑤ OR, register indirect autoincrement addressing mode.
start OR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;			// 08 AC ← AC | B

// ⑥ OR, register indirect autodecrement addressing mode.
start OR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;			// 08 AC ← AC | B

// ⑦ OR, register indirect stack addressing mode.
start OR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr;				// 04 DR--;
      MEMREAD(mbd, dr, alu_b);			// 05 B ← mem[MBD:DR];
      MEMWRITE(mbz, agl, dr);	                // 07 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;			// 09 AC ← AC | B


///////////////////////////////////////////////////////////////////////////////
//
// THE XOR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① XOR, local addressing mode.
start XOR, I=0, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                  // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;			// 04 AC ← AC ^ B

// ② XOR, register addressing mode.
start XOR, I=0, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                  // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;			// 04 AC ← AC ^ B

// ③ XOR, local indirect addressing mode.
start XOR, I=1, R=0, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_xor), END;			// 06 AC ← AC ^ B

// ④ XOR, register indirect addressing mode.
start XOR, I=1, R=1, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_xor), END;			// 06 AC ← AC ^ B

// ⑤ XOR, register indirect autoincrement addressing mode.
start XOR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 08 AC ← AC ^ B

// ⑥ XOR, register indirect autodecrement addressing mode.
start XOR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbd, dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE(mbz, agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 08 AC ← AC ^ B

// ⑦ XOR, register indirect stack addressing mode.
start XOR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);			// 02 DR ← mem[MBZ:AGL]
      /action_decdr;				// 04 DR--;
      MEMREAD(mbd, dr, alu_b);			// 05 B ← mem[MBD:DR];
      MEMWRITE(mbz, agl, dr);	                // 07 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 09 AC ← AC ^ B


// End of file.
