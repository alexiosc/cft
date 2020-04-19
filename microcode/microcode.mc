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
//
//   Version 7b: (2019-09-21) moved instructions around a bit to ease
//   memorisation.
//
//   Version 7c: (2019-10-05) added ISR instruction to call the interrupt
//   handler programmatically for traps etc. WAIT also transfers its (7-bit
//   operand) to the DR for software interrupt support. Added IRETC instruction
//   to return from Interrupt without enabling interrupts again.
//
//   Version 7d: (2019-10-06) added HCF instruction for a lark.
//
//   Version 7e: (2019-10-08) rearranged /if_xxx controls signals to
//   match those of the Skip & Branch Unit schematics.
//
//   Version 7f: (2019-11-10) added RRA and RLA instructions.
//
//   Version 7g: (2019-12-26) removed RMB and SMB instructions. Memory banking
//   configuration can be done using I/O space transactions. This releases one
//   internal address.
//
//   Version 7h: (2020-03-23) added memory bank operand to the IND
//   instruction. Removed IND R. Swapped some signal values around for decoding
//   convenience. Fixed autoindex bug by adding an action and MEMREAD_IDX,
//   MEMWRITE_IDX macros that use it.


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
// and name of addressing modes. For non-standard instructions, copy the table
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
cond SUBOP:3;                 // Used to implement instructions without operands. (IR[9..7])
cond IN_RESERVED:1;           // Reserved.
cond COND:1;                  // When low: SBL returned TRUE. (registered, reset on END)
cond IDX:2;                   // Auto-index type (IR[7..6] if IR[9..8] == 01, otherwise 00)

#define IDX_REG  00           // Ordinary register
#define IDX_INC  01           // Autoincrement register
#define IDX_DEC  10           // Autodecrement register
#define IDX_SP   11           // Stack register

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

//
// NOTE: THIS IS THE MASTER ADDRESS MAP! If the definitions below, schematics
//       or Verilog sources differ, fix them to match this list.
//
// IBUS address map:
//
// Addr      Read from   Write to     Notes
// -------------------------------------------------------------------------------
// 00000     Idle        Idle         Needed to disable reading/writing
// 00001
// 00010                                                 
// 00011
// 00100     CS0         MBP:AR       Read &0000; write <MB0,IBUS> to AR
// 00101     CS1         MBD:AR       Read &0001; write <MB1,IBUS> to AR
// 00110     CS2         MBS:AR       Read &0002; write <MB2,IBUS> to AR
// 00111     CS3         MBZ:AR       Read &0003; write <MB3,IBUS> to AR
// -------------------------------------------------------------------------------
// 01000     PC          PC
// 01001     DR          DR
// 01010     AC          AC
// 01011     SP          SP           The CFT is a big boy now, it has a Stack Pointer!
// 01100                 MBP          
// 01101     MBP+flags   MBP+flags    Pushed onto stack as a single 16-bit value (for speed)
// 01110                 flags        Pushed onto stack as a single 16-bit value (for speed)
// 01111     AGL         IR           Read AGL; write IR.
// -------------------------------------------------------------------------------
// 10000     ALU:ADD                  Read ADD result.
// 10001     ALU:AND                  Read AND result.
// 10010     ALU:OR                   Read OR result.
// 10011     ALU:XOR                  Read XOR result.
// 10100     ALU:NOT                  Read NOT result.
// 10101                              Reserved for ALU.
// 10110                              Reserved for ALU.
// 10111                              Reserved for ALU.
// -------------------------------------------------------------------------------
// 11000     ALU:B       ALU:B        Currently only used by the SRU.                              
// 11001                              
// 11010                              
// 11011                              
// 11100                              
// 11101                              
// 11110                              
// 11111                              
// -------------------------------------------------------------------------------

// RADDR FIELD
field  READ            = ___________________XXXXX; // Read unit field
//signal read_idle     = ...................00000; // No read
//signal               = ...................00001; // (Available)
//signal read_agl        = ...................00010; // Read from address generation logic
//signal               = ...................00011; // (Available)
signal read_cs0        = ...................00100; // Constant Store: 0000 (Zero; Reset)
signal read_cs1        = ...................00101; // Constant Store: 0001 (Unused)
signal read_cs2        = ...................00110; // Constant Store: 0002 (ISR Vector)
signal read_cs3        = ...................00111; // Constant Store: 0003 (ISR Vector)
signal read_pc         = ...................01000; // Read from PC
signal read_dr         = ...................01001; // Read from DR
signal read_ac         = ...................01010; // Read from AC
signal read_sp         = ...................01011; // Read from SP
//signal read_mbp      = ...................01100; // No longer used: Read MBP (MB0)
signal read_mbp_flags  = ...................01101; // Read combination MBP+flags
//signal read_flags    = ...................01110; // No longer uesd: Read flags
signal read_agl        = ...................01111; // Read from address generation logic
signal read_alu_add    = ...................10000; // ALU: Read from ALU: AC + B + L
signal read_alu_and    = ...................10001; // ALU: Read from ALU: AC AND B
signal read_alu_or     = ...................10010; // ALU: Read from ALU: AC OR B
signal read_alu_xor    = ...................10011; // ALU: Read from ALU: AC XOR B
signal read_alu_not    = ...................10100; // ALU: Read from ALU: NOT AC
//signal               = ...................10101; // ALU: reserved.
//signal               = ...................10110; // ALU: reserved.
//signal               = ...................10111; // ALU: reserved.
signal read_alu_b      = ...................11000; // Read the ALU B Port (SRU result)
//signal               = ...................11001; // (Available)
//signal               = ...................11010; // (Available)
//signal               = ...................11011; // (Available)
//signal               = ...................11100; // (Available)
//signal               = ...................11101; // (Available)
//signal               = ...................11110; // (Available)
//signal               = ...................11111; // (Available)

// WADDR FIELD
field  WRITE           = ______________XXXXX_____; // Write unit field
//signal write_idle    = ..............00000.....; // No write
//signal               = ..............00001.....; // (Available)
//signal write_ir        = ..............00010.....; // Write to the Instruction Register
//signal               = ..............00011.....; // (Available)
signal write_ar_mbp    = ..............00100.....; // Write MBP:AR (program area, extend with MBP)
signal write_ar_mbd    = ..............00101.....; // Write MBD:AR (data area, extend with MBD)
signal write_ar_mbs    = ..............00110.....; // Write MBS:AR (stack area, extend with MBS)
signal write_ar_mbz    = ..............00111.....; // Write MBZ:AR (page zero with index registers)
signal write_pc        = ..............01000.....; // Write to PC
signal write_dr        = ..............01001.....; // Write to DR
signal write_ac        = ..............01010.....; // Write to AC
signal write_sp        = ..............01011.....; // Write to AC
signal write_mbp       = ..............01100.....; // Write MBP
signal write_mbp_flags = ..............01101.....; // Read combination MBP+flags
signal write_flags     = ..............01110.....; // Write flags (not all are written!)
signal write_ir        = ..............01111.....; // Write to the Instruction Register
//signal               = ..............10000.....; // (Reserved for the ALU)
//signal               = ..............10001.....; // (Reserved for the ALU)
//signal               = ..............10010.....; // (Reserved for the ALU)
//signal               = ..............10011.....; // (Reserved for the ALU)
//signal               = ..............10100.....; // (Reserved for the ALU)
//signal               = ..............10101.....; // (Reserved for the ALU)
//signal               = ..............10110.....; // (Reserved for the ALU)
//signal               = ..............10111.....; // (Reserved for the ALU)
signal write_alu_b     = ..............11000.....; // Write to ALU's B Port
//signal               = ..............11001.....; // (Available)
//signal               = ..............11010.....; // (Available)
//signal               = ..............11011.....; // (Available)
//signal               = ..............11100.....; // (Available)
//signal               = ..............11101.....; // (Available)
//signal               = ..............11110.....; // (Available)
//signal               = ..............11111.....; // (Available)

// Convenient aliases for the constants in the Constant Store
#define read_cs_rstvec  read_cs0
#define read_cs_isrvec0 read_cs2
#define read_cs_isrvec1 read_cs3

// COND FIELD (UNDER REDESIGN)
// TODO: Rearrange the upper eight ones?
field  IF              = _________XXXXX__________; // OPx IF field
// signal if_idle      = .........00000..........; // COND high (false), SBU idle.
signal if_ir0          = .........00001..........; // COND low (true) if IR[0] set
signal if_ir1          = .........00010..........; // COND low (true) if IR[1] set
signal if_ir2          = .........00011..........; // COND low (true) if IR[2] set
signal if_ir3          = .........00100..........; // COND low (true) if IR[3] set
signal if_ir4          = .........00101..........; // COND low (true) if IR[4] set
signal if_ir5          = .........00110..........; // COND low (true) if IR[5] set
signal if_ir6          = .........00111..........; // COND low (true) if IR[6] set (currently unused)
//signal if_cext1      = .........01000..........; // CEXT1 (reserved for expansion)
//signal if_cext2      = .........01001..........; // CEXT2 (reserved for expansion)
//signal if_cext3      = .........01010..........; // CEXT3 (reserved for expansion)
signal if_v            = .........01011..........; // COND low if V set
signal if_l            = .........01100..........; // COND low if L set
signal if_z            = .........01101..........; // COND low if Z set
signal if_n            = .........01110..........; // COND low if N set (currently unused)
signal if_branch       = .........01111..........; // SKP instruction logic
// signal              = .........1xxxx..........; // (available)

// ACTION FIELD (UNDER REDESIGN)
//                      76543210FEDCBA9876543210
field  ACTION          = _____XXXX_______________;
signal action_cpl      = .....0001...............; // Complement L
signal action_cll      = .....0010...............; // Clear L flag
signal action_sti      = .....0011...............; // Set I flag
signal action_cli      = .....0100...............; // Clear I flag
signal action_idx      = .....0101...............; // Autoindexing; use IR to select MBn bank
//signal action_???    = .....0110...............; // (possible ALU extension)
signal action_sru      = .....0111...............; // Start the shift/roll engine

// ACTION 1XXX is decoded by the REG board and is just increments and
// decrements of each major register (except the PC which isn't wired
// for decrementation).

signal action_incpc    = .....1000...............; // Step the PC
//signal action_???    = .....1001...............; //
signal action_incdr    = .....1010...............; // Increment DR
signal action_decdr    = .....1011...............; // Decrement DR
signal action_incac    = .....1100...............; // Increment AC
signal action_decac    = .....1101...............; // Increment AC
signal action_incsp    = .....1110...............; // Increment SP
signal action_decsp    = .....1111...............; // Increment SP

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

// This macro uses cpp's symbol concatenation, which is why it's extra ugly.
#define MEMREAD(mbr, addr, data)             \
    write_ar_##mbr, read_##addr;             \
    /MEM, /R, write_##data

// This macro performs a read relative to memory bank register n, where n is
// determined from IR[2:0]. This implements half of the autoindexing register
// scheme usually selected with instructions XXXX I R &3xx. Note that the
// specified mbd works as a default here. Should the operand be <&300, mbd will
// be used for indexing.
#define MEMREAD_IDX(mbd, addr, data)  action_idx, MEMREAD(mbd, addr, data)

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

// The MEMWRITE equivalent of MEMREAD_IDX
#define MEMWRITE_IDX(mbd, addr, data)  action_idx, MEMWRITE(mbd, addr, data)

// I/O space is 16 bits wide and ignores AB[16..23], so we can use any
// old MBR to write to the AR, it doesn't matter.
#define IOWRITE(addr, data)        \
    write_ar_mbp, read_##addr;     \
    /IO, /WEN, read_##data


///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO USE THE HARWDARE STACK
//
///////////////////////////////////////////////////////////////////////////////

#define STACK_PUSH(data)                         \
        MEMWRITE(mbs, sp, data), action_incsp

#define STACK_POP(data)           \
        action_decsp;            \
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

#define FETCH_IR MEMREAD(mbp, pc, ir), action_incpc


///////////////////////////////////////////////////////////////////////////////
//
// UTILITY MACROS
//
///////////////////////////////////////////////////////////////////////////////

#define END /END

// #define IFBIT(x) /if##x, action_end;


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
      SET(pc,cs_rstvec), action_cli, END;  // 00
      hold;                                // 01
      hold;                                // 02
      hold;                                // 03
      hold;                                // 04
      hold;                                // 05
      hold;                                // 06
      hold;                                // 07
      hold;                                // 08
      hold;                                // 09
      hold;                                // 10
      hold;                                // 11
      hold;                                // 12
      hold;                                // 13
      hold;                                // 14
      hold;                                // 15


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
// The Interrupt handler is currently 10 cycles long, which gives 2.5µs
// latency. The Return process will probably be identical.

start RST=1, INT=0, IN_RESERVED=X, COND=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      STACK_PUSH(mbp_flags);                    // 00 mem[MBS:SP++] ← <flags,MBP>
      action_cli, STACK_PUSH(pc);               // 02 mem[MBS:SP++] ← PC; CLI
      STACK_PUSH(ac);                           // 04 mem[MBS:SP++] ← AC
      SET(pc, cs_isrvec0);                      // 06 PC ← 0002
      SET(mbp, cs_isrvec1), END;                // 07 MBP ← 0003

// TODO: This jumps to [03:0002] which is a little inelegant. Rework
// the constant source and jump to [00:0008] or something.


///////////////////////////////////////////////////////////////////////////////
//
// INSTRUCTION SET
//
///////////////////////////////////////////////////////////////////////////////


// Define the opcodes for convenience.

#define _INSTR(x) RST=1, INT=1, IN_RESERVED=X, OP=x

// PART I: INSTRUCTION 0 (maximum 7-bit operands)

#define IRET   _INSTR(0000), I=0, R=0, SUBOP=000, COND=X, IDX=XX
#define LRET   _INSTR(0000), I=0, R=0, SUBOP=001, COND=X, IDX=XX
#define RET    _INSTR(0000), I=0, R=0, SUBOP=010, COND=X, IDX=XX
#define TAS    _INSTR(0000), I=0, R=0, SUBOP=011, COND=X, IDX=XX
#define TSA    _INSTR(0000), I=0, R=0, SUBOP=100, COND=X, IDX=XX
#define TAD    _INSTR(0000), I=0, R=0, SUBOP=101, COND=X, IDX=XX
#define TDA    _INSTR(0000), I=0, R=0, SUBOP=110, COND=X, IDX=XX
//#define      _INSTR(0000), I=0, R=0, SUBOP=111, COND=X, IDX=XX // This is available

#define ISR    _INSTR(0000), I=0, R=1, SUBOP=000, COND=X, IDX=XX // ** SUBOP AND R are not arbitrary!
#define PHA    _INSTR(0000), I=0, R=1, SUBOP=001, COND=X, IDX=XX
#define PPA    _INSTR(0000), I=0, R=1, SUBOP=010, COND=X, IDX=XX
#define PHF    _INSTR(0000), I=0, R=1, SUBOP=011, COND=X, IDX=XX
#define PPF    _INSTR(0000), I=0, R=1, SUBOP=100, COND=X, IDX=XX
#define STI    _INSTR(0000), I=0, R=1, SUBOP=101, COND=X, IDX=XX
#define CLI    _INSTR(0000), I=0, R=1, SUBOP=110, COND=X, IDX=XX
#define WAIT   _INSTR(0000), I=0, R=1, SUBOP=111, COND=X, IDX=XX

#define SRU    _INSTR(0000), I=1, R=0, SUBOP=000, COND=X, IDX=XX // All shifts and rolls are here.
#define SKP    _INSTR(0000), I=1, R=0, SUBOP=001, COND=X, IDX=XX // Skips
//#define      _INSTR(0000), I=1, R=0, SUBOP=010, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=011, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=100, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=101, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=110, COND=X, IDX=XX // This is available
//#define      _INSTR(0000), I=1, R=0, SUBOP=111, COND=X, IDX=XX // This is available

#define JPA    _INSTR(0000), I=1, R=1, SUBOP=000, COND=X, IDX=XX
#define JSA    _INSTR(0000), I=1, R=1, SUBOP=001, COND=X, IDX=XX
//#define      _INSTR(0000), I=1, R=1, SUBOP=010, COND=X, IDX=XX // This is available
#define HCF    _INSTR(0000), I=1, R=1, SUBOP=011, COND=X, IDX=XX // HCF instruction for commit #666! ;)
#define UOP    _INSTR(0000), I=1, R=1, SUBOP=100, COND=X, IDX=XX // ** SUBOP is not arbitrary!
#define IFL    _INSTR(0000), I=1, R=1, SUBOP=101,         IDX=XX // ** SUBOP is not arbitrary!
#define IFV    _INSTR(0000), I=1, R=1, SUBOP=110,         IDX=XX // ** SUBOP is not arbitrary!
#define IND    _INSTR(0000), I=1, R=1, SUBOP=111, COND=X, IDX=XX // Do not move! I=1, R=1, SUBOP=111!

// PART II: INSTRUCTIONS 1–15, 10-bit operands

#define LIA    _INSTR(0001), SUBOP=XXX, COND=X                   // Only for I=0

#define LJSR   _INSTR(0001), SUBOP=XXX, COND=X                   // Only for I=1
#define LJMP   _INSTR(0010), SUBOP=XXX, COND=X                   // Only for I=1
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
// FORMAT:   :-------
//
// Pops the AC, PC, MBP and flags from the Hardware Stack to return
// from an Interrupt Service Routine. Flags include the I flag, so
// interrupts are re-enabled atomically during this command if they
// were enabled when the ISR was called.

start IRET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(ac);                            // 02 AC ← mem[--SP]
      STACK_POP(pc);                            // 05 PC ← mem[--SP]
      STACK_POP(mbp_flags), END;                // 08 <flags,MBP> ← mem[--SP]



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
// FORMAT:   :-------
//
// Pops the PC and MBP from the Hardware Stack to return from a subroutine
// entered with LJSR.

start LRET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc);                            // 02 PC ← mem[--SP]
      STACK_POP(mbp), END;                      // 05 MBP ← mem[--SP]

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
// FORMAT:   :-------
//
// Pops the PC from the Hardware Stack to return from a subroutine entered
// with JSR.

start RET;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc), END;                       // 02 PC ← mem[--SP]


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
// FORMAT:   :-------

start TAS;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(sp, ac), END;                         // 02 SP ← AC


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
// FORMAT:   :-------

start TSA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, sp), END;                         // 02 AC ← SP


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
// FORMAT:   :-------

start TAD;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, ac), END;                         // 02 DR ← AC


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
// FORMAT:   :-------

start TDA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, dr), END;                         // 02 AC ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE ISR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: ISR
// NAME:     Software Interrupt
// DESC:     Call Interrupt Service Routine
// GROUP:    Flow Control
// MODE:     Literal (7-bit)
// FLAGS:    ---i-
// FORMAT:   :LLLLLLL
//
// Calls the Interrupt Service Routine. The 7-bit value in the operand is
// written to the DR. An ISR can transfer this value to the AC to implement
// custom software interrupts or traps.

start ISR;
      action_cli, STACK_PUSH(mbp_flags);        // 00 mem[MBS:SP++] ← flags:MBP; CLI
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      STACK_PUSH(ac);                           // 04 mem[MBS:SP++] ← AC
      SET(pc, cs_isrvec0);                      // 06 PC ← 0002
      SET(mbp, cs_isrvec1);                     // 07 MBP ← 0003
      SET(dr, agl), END;                        // 08 DR ← AGL


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
// FORMAT:   :-------
//
// Pushes the AC onto the Hardware Stack and increments the SP.

start PHA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(ac), END;                      // 02 mem[MBS:SP++] ← ac


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
// FORMAT:   :-------
//
// Decrements the SP and loads the AC from the memory location pointed to by
// the SP.

start PPA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(ac), END;                       // 02 AC ← mem[--SP]


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
// FORMAT:   :-------
//
// Pushes the Flags onto the Hardware Stack and increments the SP.

start PHF;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags), END;               // 02 mem[MBS:SP++] ← flags


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
// FORMAT:   :-------
//
// Decrements the SP and loads the Flags from the memory location pointed to by
// the SP. The Z and N flags will not be updated.

start PPF;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(flags), END;                    // 02 flags ← mem[--SP]


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
// FORMAT:   :-------
//
// Sets the Interrupt Flag. If interrupts are already pending, control will
// jump to the ISR immediately. Subsequent interrupts will be processed
// asynchronously, after whatever instruction is executing has finished.

start STI;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      action_sti, END;                          // 02 STI


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
// FORMAT:   :-------
//
// Clears the Interrupt Flag. Any pending interrupts are ignored and the
// pending interrupt flag is cleared. Subsequent interrupts will also be
// ignored.

start CLI;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      action_cli, END;                          // 02 CLI


///////////////////////////////////////////////////////////////////////////////
//
// THE WAIT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: WAIT
// NAME:     Wait for Interrupt
// DESC:     Suspends program execution until an interrupt arrives.
// GROUP:    Flow Control
// MODE:     Literal (7-bit)
// FLAGS:    ---I-
// FORMAT:   :LLLLLLL
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
      SET(dr, agl), action_sti, END;  // 00 DR ← AGL; STI; loop forever
      hold;                           // 01   And keep on doing this.
      hold;                           // 02 Instruction entry point.
      hold;                           // 03 
      hold;                           // 04 
      hold;                           // 05 
      hold;                           // 06 
      hold;                           // 07 
      hold;                           // 08 
      hold;                           // 09 
      hold;                           // 10 
      hold;                           // 11 
      hold;                           // 12 
      hold;                           // 13 
      hold;                           // 14 
      hold;                           // 15 

///////////////////////////////////////////////////////////////////////////////
//
// THE SRU GROUP: SHIFTS AND ROTATIONS
//
///////////////////////////////////////////////////////////////////////////////

//            OP   I R 987 654 3210
// SHL = SRU  0111'1'0'000'000'dddd    ; Bitwise shift left by d bits
// SHR = SRU  0111'1'0'000'001'dddd    ; Bitwise shift right by d bits
// ASR = SRU  0111'1'0'000'011'dddd    ; Arithmetic shift right by d bits
// ROL = SRU  0111'1'0'000'100'dddd    ; Rotate <L,AC> left by d bits
// ROR = SRU  0111'1'0'000'101'dddd    ; Rotate <L,AC> right by d bits
//
// This results in the following instructions:

// MNEMONIC: SHL
// NAME:     Bitwise Shift Left
// DESC:     Shift Accumulator left.
// GROUP:    Arithmetic and Logic
// MODE:     Literal (4 bits)
// FLAGS:    *NZ---
// FORMAT:   :000:LLLL
//
// Shifts the AC left by the number of bits specified in the operand. Shift
// distances between 1 and 15 can be specified. A zero operand makes no sense
// and should not be used.

// MNEMONIC: SHR
// NAME:     Bitwise Shift Right
// DESC:     Shift Accumulator right without sign extension.
// GROUP:    Arithmetic and Logic
// MODE:     Literal (4 bits)
// FLAGS:    *NZ---
// FORMAT:   :001:LLLL
//
// Shifts the AC right by the number of bits specified in the operand. Shift
// distances between 1 and 15 can be specified. A zero operand makes no sense
// and should not be used.

// MNEMONIC: ASR
// NAME:     Arithmetic Shift Right
// DESC:     Shift Accumulator right with sign extension.
// GROUP:    Arithmetic and Logic
// MODE:     Literal (4 bits)
// FLAGS:    *NZ---
// FORMAT:   :011:LLLL
//
// Shifts the AC right by the number of bits specified in the operand. Shift
// distances between 1 and 15 can be specified. A zero operand makes no sense
// and should not be used.

// MNEMONIC: ROL
// NAME:     Roll Left
// DESC:     Roll Link and Accumulator left.
// GROUP:    Arithmetic and Logic
// MODE:     Literal (4 bits)
// FLAGS:    *NZ--L
// FORMAT:   :100:LLLL
//
// Treats the Link Register and the AC as a 17-bit vector (L being the most
// significant bit) and rolls it left by the specified number of bits.

// MNEMONIC: ROR
// NAME:     Roll Right
// DESC:     Roll Link and Accumulator right.
// GROUP:    Arithmetic and Logic
// MODE:     Literal (4 bits)
// FLAGS:    *NZ--L
// FORMAT:   :101:LLLL
//
// Treats the Link Register and the AC as a 17-bit vector (L being the most
// significant bit) and rolls it right by the specified number of bits.

// Removed RLA and RRA instructions.

// xMNEMONIC: RLA
// xNAME:     Roll Left Accumulator
// xDESC:     Roll Accumulator left.
// xGROUP:    Arithmetic and Logic
// xMODE:     Literal (4 bits)
// xFLAGS:    *NZ--L
// xFORMAT:   :110:LLLL
//
// Rotates the Accumulator left by the specified number of bits. This
// is a 16-bit left rotation, where ROL is a 17-bit rotation. L is set
// to the most significant bit of the AC prior to rotation.

// xMNEMONIC: RRA
// xNAME:     Roll Right Accumulator
// xDESC:     Roll Accumulator right.
// xGROUP:    Arithmetic and Logic
// xMODE:     Literal (4 bits)
// xFLAGS:    *NZ--L
// xFORMAT:   :111:LLLL
//
// Rotates the Accumulator right by the specified number of bits. This
// is a 16-bit right rotation, where ROR is a 17-bit rotation. L is set
// to the most significant bit of the AC prior to rotation.

// MNEMONIC: [SRU]
// NAME:     An undefined SRU sub-instruction.
// DESC:     Does nothing.
// GROUP:    Unary Operations, SRU
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :-------
//
// This instruction definition is here only for automatically generating
// disassemblers. It makes it possible to catch and display an otherwise
// invalid SRU bitmap.

// L=1 ⇒ COND=0, so IFL takes action.

// IR bits are directly linked to the shift/rotate unit, so all
// of these instructions have the same microcode.
start SRU;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(alu_b, ac), action_sru;               // 02 B ← AC. (write B port, request SRU start)
      -END;                                     // 03 SRU cycle #2
      -END;                                     // 04 SRU cycle #3
      -END;                                     // 05 SRU cycle #4
      -END;                                     // 06 SRU cycle #5
      -END;                                     // 07 SRU cycle #5
      SET(ac, alu_b), END;                      // 08 AC ← ALU B Reg


///////////////////////////////////////////////////////////////////////////////
//
// THE HCF INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: HCF
// NAME:     Halt and Catch Fire
// DESC:     Terminate operation and burn-in registers, perhaps literally.
// GROUP:    Miscellaneous
// MODE:     Implied
// FLAGS:    *NZ-IL
// FORMAT:   :-------
//
// HCF makes the processor become unresponsive to interrupts and all other
// means of flow control. It includes no Instruction Fetch, so the program will
// never move on to the next instruction and HCF will be executed continuously
// until the processor is turned off, reset or the fire put out.
//
// During execution, the following things will happen:
//
// * The I flag is cleared, disabling interrupts.
// * The Shift/Rotate Unit is cranked and will run for five cycles in parallel
//   with everything else.  This should cause a lot of woe.
// * The PC, DR, AC and SP will be incremented three times per instruction
//   execution.
// * The AR will be set to MBP:PC, MBD:PC, MBS:PC and MBZ:PC, cycling every
//   four processor cycles.
// * A dummy memory read cycle will be performed every three out of four cycles
//   using the address in the AR and the read data discarded.
// * The L Flag is toggled making HCF easily identifiable on the front panel.
//
// These are as likely to set a CMOS-based processor on fire as anything.

// This is a joke instruction added for GitHub commit #666. May delete later.
start HCF;
      /MEM, SET(ar_mbp, pc),  action_cpl;    // 00 CPL
      /MEM, /R, write_ar_mbp, action_sru;    // 01 Kick the Shift/Rotate Unit
      /MEM, /R, write_ar_mbp, action_cli;    // 02 CLI (entry point)
      /MEM, /R, write_ar_mbp, action_incpc;  // 03 PC++

      /MEM, SET(ar_mbd, pc),  action_incac;  // 04 Use MBD. AC++
      /MEM, /R, write_ar_mbd, action_incsp;  // 05 SP++
      /MEM, /R, write_ar_mbd, action_incdr;  // 06 DR++
      /MEM, /R, write_ar_mbd, action_incpc;  // 07 PC++

      /MEM, SET(ar_mbs, pc),  action_incac;  // 08 Use MBS. AC++
      /MEM, /R, write_ar_mbs, action_incsp;  // 09 SP++
      /MEM, /R, write_ar_mbs, action_incdr;  // 10 DR++
      /MEM, /R, write_ar_mbs, action_incpc;  // 11 PC++

      /MEM, SET(ar_mbz, pc),  action_incac;  // 12 Use MBZ. AC++
      /MEM, /R, write_ar_mbz, action_incsp;  // 13 SP++
      /MEM, /R, write_ar_mbz, action_incdr;  // 14 DR++
      /MEM, /R, write_ar_mbz, action_incpc;  // 15 PC++ (and loop)

///////////////////////////////////////////////////////////////////////////////
//
// THE UNARY OPERATION GROUP: IFL, IFV, UOP
//
///////////////////////////////////////////////////////////////////////////////

//             6543210
// CLA = UOP  '-1-----          ; if5: A <- 0
// CLL = UOP  '--1----          ; if4: L <- 0
// NOT = UOP  '---1---          ; if3: A <- NOT A
// INC = UOP  '----1--          ; if2: <L,A> <- <L,A> + 1
// DEC = UOP  '-----1-          ; if1: <L,A> <- <L,A> - 1
// CPL = UOP  '------1          ; if0: L <- NOT L
//
// This allows for the following instructions (or combinations thereof):

// MNEMONIC: (UOP) NOP9
// NAME:     No Operation, 9 Cycles
// DESC:     Do nothing.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    nZ---
// FORMAT:   0000:1:1:100:0000000
//
// Does nothing for 9 processor cycles.

// MNEMONIC: (UOP) CLA
// NAME:     Clear Accumulator
// DESC:     Set the AC to zero.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    nZ---
// FORMAT:   0000:1:1:100:-1-----
//
// Sets the AC to zero.

// MNEMONIC: (UOP) CLL
// NAME:     Clear Link
// DESC:     Clear the Link Register.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    ----l
// FORMAT:   0000:1:1:100:--1----
//
// Sets L to zero.

// MNEMONIC: (UOP) NOT
// NAME:     Complement Accumulator
// DESC:     Invert all bits in the Accumulator.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ---
// FORMAT:   0000:1:1:100:---1---
//
// Inverts all bits in the AC, producing a one's complement negation of AC or
// evaluating -(AC-1) in two's complement arithmetic.

// MNEMONIC: (UOP) INC
// NAME:     Increment Accumulator
// DESC:     Increment <L,AC> by one.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:100:----1--
//
// Treats <L,AC> as a 17-bit unsigned integer and adds one it. It can also be
// seen as an incrementation of AC by one, where L is toggled on AC overflow.

// MNEMONIC: (UOP) NEG
// NAME:     Negate Accumulator
// DESC:     Two's complement negation of the AC.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:100:---11--
//
// Negates the AC, then adds one to it. If the value wraps around during
// incrementation, L will be complemented.

// MNEMONIC: (UOP) DEC
// NAME:     Decrement Accumulator
// DESC:     Decrement <L,AC> by one.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:100:-----1-
//
// Treats <L,AC> as a 17-bit unsigned integer and subtracts one it. It can also
// be seen as an decrementation of AC by one, where L is toggled on AC
// underflow.

// MNEMONIC: (UOP) CPL
// NAME:     Complement Link
// DESC:     Toggle the L Flag.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *----L
// FORMAT:   0000:1:1:100:------1
//
// Complements (toggles) the L Flag or Link Register.

// MNEMONIC: (UOP) SEL
// NAME:     Set Link
// DESC:     Set the L Flag.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    ----L
// FORMAT:   0000:1:1:100:--1---1
//
// Sets the L Flag or Link Register. This instruction is a combination of the
// `CLL` and `CPL` instructions.

// MNEMONIC: [UOP]
// NAME:     An undefined UOP sub-instruction.
// DESC:     Does nothing.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   0000:1:1:100:-------
//
// This instruction definition is here only for automatically generating
// disassemblers. It makes it possible to catch and display an otherwise
// invalid UOP bitmap.



// MNEMONIC: IFL CLA
// NAME:     Clear Accumulator If Link Set
// DESC:     Set the AC to zero if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *NZ---
// FORMAT:   0000:1:1:101:-1-----
//
// If the L flag is set, sets the AC to zero.

// MNEMONIC: IFL CLL
// NAME:     Clear Link if Link Set
// DESC:     Clear the Link Register if L is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *----l
// FORMAT:   0000:1:1:101:--1----
//
// If the L flag is set, this sets it to zero. This is useless, unless part of
// a more complicated bimap instruction.

// MNEMONIC: IFL NOT
// NAME:     Complement Accumulator If Link Set
// DESC:     Invert all bits in the AC if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *NZ---
// FORMAT:   0000:1:1:101:---1---
//
// If the L flag is set, all bits in the AC are inverted.

// MNEMONIC: IFL INC
// NAME:     Increment Accumulator If Link Set
// DESC:     Increment <L,AC> by one if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:101:----1--
//
// If the L Flag is set, this treats <L,AC> as a 17-bit unsigned integer and
// adds one it. It can also be seen as an incrementation of AC by one, where L
// is cleared on AC overflow. Clearing the L flag does not stop execution of
// the IFL instruction. The check for L happens only once, before starting
// instruction execution.

// MNEMONIC: IFL NEG
// NAME:     Negate Accumulator If Link Set
// DESC:     Perform two's complement negation of the AC if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:101:---11--
//
// If the L Flag is set, this negates the AC, then adds one to it. If the value
// wraps around during incrementation, L will be cleared. Clearing the L flag
// does not stop execution of the IFL instruction. The check for L happens only
// once, before starting instruction execution.

// MNEMONIC: IFL DEC
// NAME:     Decrement Accumulator If Link Set
// DESC:     Decrement <L,AC> by one if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:101:-----1-
//
// If the L Flag is set, tihs treats <L,AC> as a 17-bit unsigned integer and
// subtracts one it. It can also be seen as an decrementation of AC by one,
// where L is cleared on AC underflow. Clearing the L flag does not stop
// execution of the IFL instruction. The check for L happens only once, before
// starting instruction execution.

// MNEMONIC: IFL CPL
// NAME:     Complement Link If Link Set ***
// DESC:     Toggle the L Flag if L is set.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    *----L
// FORMAT:   0000:1:1:101:------1
//
// Complements (toggles) the L Flag or Link Register. If the complementation
// clears the L flag, the instruction execution is not affected. The check for
// L happens only once, before starting instruction execution and all selected
// components of the instruction will be executed. `IFL CPL` is probably
// useless on its own. It might be more useful as part of a more complicated
// bimap instruction.

// MNEMONIC: IFL SEL
// NAME:     Set Link
// DESC:     Set the L Flag.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *----L
// FORMAT:   0000:1:1:101:--1---1
//
// If L i set, sets the L Flag or Link Register. This instruction is a
// combination of the `IFL CLL` and `IFL CPL` instructions. It is all but
// useless on its own, but can be useful as part of a more complex composite
// `IFL` instruction.

// MNEMONIC: [IFL]
// NAME:     An undefined IFL sub-instruction.
// DESC:     Does nothing.
// GROUP:    Unary Operations, IFL
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   0000:1:1:101:-------
//
// This instruction definition is here only for automatically generating
// disassemblers. It makes it possible to catch and display an otherwise
// invalid IFL bitmap.



// MNEMONIC: IFV CLA
// NAME:     Clear Accumulator on Overflow
// DESC:     Set the Accumulator to zero if V is set.
// GROUP:    Unary Operations, IFV
// MODE:     Implied
// FLAGS:    nZ---
// FORMAT:   0000:1:1:110:-1-----
//
// If the Overflow Flag is set, the AC is cleared.

// MNEMONIC: IFV CLL
// NAME:     Clear Link on Overflow
// DESC:     Clear the Link Register if V is set.
// GROUP:    Unary Operations, IFV
// MODE:     Implied
// FLAGS:    *----L
// FORMAT:   0000:1:1:110:--1----
//
// If the Overlflow Flag is set, sets L to zero.

// MNEMONIC: IFV NOT
// NAME:     Complement Accumulator on Overflow
// DESC:     Invert all bits in the Accumulator if V is set.
// GROUP:    Unary Operations, IFV
// MODE:     Implied
// FLAGS:    *NZ---
// FORMAT:   0000:1:1:110:---1---
//
// If the Overflow Flag is set, inverts all bits in the AC, producing a one's
// complement negation of AC or evaluating -(AC-1) in two's complement
// arithmetic.

// MNEMONIC: IFV INC
// NAME:     Increment Accumulator on Overflow
// DESC:     Increment <L,AC> by one if V is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:110:----1--
//
// If the Overflow Flag is set, treats <L,AC> as a 17-bit unsigned integer and
// adds one it. It can also be seen as an incrementation of AC by one, where L
// is toggled on AC overflow.

// MNEMONIC: IFV NEG
// NAME:     Negate Accumulator on Overflow
// DESC:     Two's complement negation of the AC if V is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:110:---11--
//
// Negates the AC, then adds one to it. If the value wraps around during
// incrementation, L will be complemented.

// MNEMONIC: IFV DEC
// NAME:     Decrement Accumulator on Overflow
// DESC:     Decrement <L,AC> by one if V is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *NZ--L
// FORMAT:   0000:1:1:110:-----1-
//
// Treats <L,AC> as a 17-bit unsigned integer and subtracts one it. It can also
// be seen as an decrementation of AC by one, where L is toggled on AC
// underflow.

// MNEMONIC: IFV CPL
// NAME:     Complement Link on Overflow
// DESC:     Toggle the L Flag if V is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    *----L
// FORMAT:   0000:1:1:110:------1
//
// Complements (toggles) the L Flag or Link Register.

// MNEMONIC: IFV SEL
// NAME:     Set Link on Overflow
// DESC:     Toggle the L Flag if V is set.
// GROUP:    Unary Operations, UOP
// MODE:     Implied
// FLAGS:    ----L
// FORMAT:   0000:1:1:110:--1---1
//
// Sets the L Flag or Link Register. This instruction is a combination of the
// `CLL` and `CPL` instructions.

// MNEMONIC: [IFV]
// NAME:     An undefined IFV sub-instruction.
// DESC:     Does nothing.
// GROUP:    Unary Operations, IFV
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   0000:1:1:110:-------
//
// This instruction definition is here only for automatically generating
// disassemblers. It makes it possible to catch and display an otherwise
// invalid IFV bitmap.


// L=1 ⇒ COND=0, so IFL takes action.

// TODO: it's likely FETCH_IR and if_l/if_v can't happen on the same cycle!
start IFL, COND=0;
      FETCH_IR, if_l;                           // 00 IR ← mem[PC++];
      if_ir5;                                   // If L:
      SET(ac, cs0), if_ir4;                     // If IR5: AC ← 0
      action_cll, if_ir3;                       // If IR4: L ← 0
      SET(ac, alu_not), if_ir2;                 // If IR3: AC ← ~AC
      action_incac, if_ir1;                     // IF IR2: AC++
      action_decac, if_ir0;                     // IF IR1: AC--
      action_cpl, END;                          // IF IR0: L ← ¬L

start IFL, COND=1;
      FETCH_IR, if_l;                           // 00 IR ← mem[PC++];
      END;
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;

start IFV, COND=0;
      FETCH_IR, if_v;                           // 00 IR ← mem[PC++];
      if_ir5;                                   // If V:
      SET(ac, cs0), if_ir4;                     // If IR5: AC ← 0
      action_cll, if_ir3;                       // If IR4: L ← 0
      SET(ac, alu_not), if_ir2;                 // If IR3: AC ← ~AC
      action_incac, if_ir1;                     // IF IR2: AC++
      action_decac, if_ir0;                     // IF IR1: AC--
      action_cpl, END;                          // IF IR0: L ← ¬L

start IFV, COND=1;
      FETCH_IR, if_v;                           // 00 IR ← mem[PC++];
      END;
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;

start UOP, COND=0;
      FETCH_IR, if_ir5;                         // 00 IR ← mem[PC++];
      SET(ac, cs0), if_ir4;                     // If IR5: AC ← 0
      action_cll, if_ir3;                       // If IR4: L ← 0
      SET(ac, alu_not), if_ir2;                 // If IR3: AC ← ~AC
      action_incac, if_ir1;                     // IF IR2: AC++
      action_decac, if_ir0;                     // IF IR1: AC--
      action_cpl, END;                          // IF IR0: L ← ¬L

start UOP, COND=1;
      FETCH_IR, if_ir5;                         // 00 IR ← mem[PC++];
      if_ir4;
      if_ir3;
      if_ir2;
      if_ir1;
      if_ir0;
      END;


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
// The OR/AND logic isn't microcoded, it's part of the hardwired decoding of
// the branch bits: IR4 causes the result evaluated so far to be inverted, so
// where we checked for (Z + N), we now check for ¬(Z + N), which by De
// Morgan's Law is equal to (¬Z · ¬N). This is the way the PDP-8 seems to do
// it, too.

// The skip mechanism is hard-wired, so the microcode is fairly simple
// here. The bitmap nature still gives us a wide range of instructions,
// including all possible comparisons of the Accumulator against zero.

// MNEMONIC: (SKP) NOP
// NAME:     No Operation
// DESC:     Never skip (do nothing).
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :0000000
//
// Never skips, which is tantamount to No Operation and used as such.

// MNEMONIC: (SKP) SNA
// NAME:     Skip on Negative Accumulator
// DESC:     Skip next instruction if AC is less than zero.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--01---
//
// Skips the next instruction if the N Flag is set. This can also be interpreted as:
//
// * SKip if AC < 0; or
// * SKip if the AC's most significant bit is set.

// MNEMONIC: (SKP) SZA
// NAME:     Skip on Zero Accumulator
// DESC:     Skip next instruction if AC is equal to zero.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--0-1--
//
// Skips the next instruction if the Z Flag is set, i.e. skip if the AC is zero.

// MNEMONIC: (SKP) SNP
// NAME:     Skip on Non-Positive Accumulator
// DESC:     Skip next instruction if AC is negative or zero.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--011--
//
// Skips the next instruction if the N or Z Flag is set, i.e. skip if the AC is
// less than or equal to zero.

// MNEMONIC: (SKP) SSL
// NAME:     Skip on Link
// DESC:     Skip next instruction if L is set.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--0--1-
//
// Skips the next instruction if the L Flag is set.

// MNEMONIC: (SKP) SSV
// NAME:     Skip on Overflow
// DESC:     Skip next instruction if V is set.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--0---1
//
// Skips the next instruction if the V Flag is set.



// MNEMONIC: (SKP) SKIP
// NAME:     Skip
// DESC:     Always skip next instruction.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--10000
//
// Always skips. This is the negation of `NOP`.

// MNEMONIC: (SKP) SNN
// NAME:     Skip on Non-Negative Accumulator
// DESC:     Skip next instruction if AC is zero or greater.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--11---
//
// Skips the next instruction if the N Flag is clear. This can also be interpreted as:
//
// * SKip if AC ≥ 0;
// * Skip if the AC's most significant bit is clear; or
// * Skip if the AC is in the range 0–32767.

// MNEMONIC: (SKP) SNZ
// NAME:     Skip on Non-Zero Accumulator
// DESC:     Skip next instruction if AC is non-zero.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--1-1--
//
// Skips the next instruction if the Z Flag is clear, i.e.:
//
// * Skip if the AC is non-zero; or
// * Skip if any bits in the AC are set.

// MNEMONIC: (SKP) SPA
// NAME:     Skip on Positive Accumulator
// DESC:     Skip next instruction if AC is positive.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--111--
//
// Skips the next instruction if the N and Z Flag are both clear, i.e. the AC,
// interpreted as a signed integer, is greater than zero or in the range
// 1–32767.

// MNEMONIC: (SKP) SCL
// NAME:     Skip on Link Clear
// DESC:     Skip next instruction if L is clear.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--1--1-
//
// Skips the next instruction if the L Flag is clear.

// MNEMONIC: (SKP) SCV
// NAME:     Skip on Overflow
// DESC:     Skip next instruction if V is clear.
// GROUP:    Flow Control, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :--1---1
//
// Skips the next instruction if the V Flag is clear.

// MNEMONIC: [SKP]
// NAME:     An undefined SKP sub-instruction.
// DESC:     Does nothing.
// GROUP:    Unary Operations, SKP
// MODE:     Implied
// FLAGS:    -----
// FORMAT:   :-------
//
// This instruction definition is here only for automatically generating
// disassemblers. It makes it possible to catch and display an otherwise
// invalid SKP bitmap.


// First, the version where the skip isn't taken.
start SKP, COND=1;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      if_branch;                                // 02 IF not skip:
      END;                                      // 03 END

// Next, the version where the skip is taken.
start SKP, COND=0;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      if_branch;                                // 02 IF skip:
      action_incpc, END;                        // 03 PC++


///////////////////////////////////////////////////////////////////////////////
//
// THE RMB INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: Removed in favour of using the MBU via I/O transactions.

// xMNEMONIC: RMB
// xNAME:     Read Memory Bank
// xDESC:     Transfers a Memory Bank Register to AC.
// xGROUP:    Transfers
// xMODE:     Literal (3-bit)
// xFLAGS:    *NZ---
// xFORMAT:   :----LLL
//
// Sets the AC to the value of the MBx register specified in the three least
// significant bits of the operand. The value of the top eight bits is
// currently undefined and should not be relied on.

// start RMB;
//       FETCH_IR;                                 // 00 IR ← mem[PC++]
//       SET(ac, mbn), END;                     // 02 AC ← MB[IR0..IR2]


///////////////////////////////////////////////////////////////////////////////
//
// THE SMB INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: Removed in favour of using the MBU via I/O transactions.

// xMNEMONIC: SMB
// xNAME:     Set Memory Bank
// xDESC:     Transfers the AC to a Memory Bank Register.
// xGROUP:    Transfers
// xMODE:     Literal (3-bit)
// xFLAGS:    -----
// xFORMAT:   :----LLL
//
// Sets the MBx register specified by the three least significant bits of the
// operand to the value of AC, configuring a memory bank. The top 8 bits of the
// AC are ignored.

// start SMB;
//       FETCH_IR;                                 // 00 IR ← mem[PC++]
//       SET(mbn, ac), END;                     // 02 MB[IR0..02] ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE JPA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JPA
// NAME:     Jump to Accumulator
// DESC:     Jump to address of AC relative to MBP.
// GROUP:    Flow Control
// MODE:     Accumulator
// FLAGS:    -----
// FORMAT:   :-------
//
// Jumps to the address held in the Accumulator. The MBP does not change.

start JPA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(pc, ac), END;                         // 02 PC ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE JSA INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JSA
// NAME:     Jump to Subroutine at Accumulator
// DESC:     Jump to the subroutine address in AC relative to MBP.
// GROUP:    Flow Control
// MODE:     Accumulator
// FLAGS:    -----
// FORMAT:   :-------
//
// Pushes the PC onto the stack and jumps to the address held in the
// Accumulator. The MBP does not change.

start JSA;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      SET(pc, ac), END;                         // 04 PC ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE IND INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: IND
// NAME:     Indirect
// DESC:     Load memory from Accumulator
// GROUP:    Flow Control
// MODE:     Accumulator Indirect
// FLAGS:    -----
// FORMAT:   :1---LLL
//
// Loads the value at the memory address held in the AC relative to the memory
// bank register specified in the lower three bits of the operand. The address
// is interpreted as a 16-bit offset relative to the Memory Bank Register
// specified in LLL. Both I and R Fields must be set for this instruction. If
// an auto-indexing location is accessed, it will not be incremented or
// decremented.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Non-Standard addressing modes marked with *** below
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  1   1   Any       *** (4) Accumulator Indirect (MBn-relative)

// TODO: It's likely the DR←AC transfer isn't necessary and can save a cycle.

// IND, MBn-Relative Accumulator Indirect 
start IND;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, ac);                              // 02 DR ← AC
      MEMREAD_IDX(mbd, dr, ac), END;		// 03 AC ← mem[MBR[L]:DR]


///////////////////////////////////////////////////////////////////////////////
//
// THE LIA/LI INSTRUCTIONS
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LIA
// NAME:     Literal Address
// GROUP:    Miscellaneous
// FLAGS:    *NZ---
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
// FLAGS:    *NZ---
// FORMAT:   0001:0:1:LLLLLLLLLL
//
// Sets the AC to the 10-bit literal value in the operand. The top six bits in
// the AC are cleared. This is the same instruction as LIA in Register mode.

// NOTE: LIA makes no sense with I=1, so it shares opcodes with the
// LJSR instruction, which makes no sense with I=1.

// (1) LIA, Page-Local
start LIA, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, agl), END;                        // 02 AC ← AGL

// (2) LIA, Register (also LI, Literal)
start LIA, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(ac, agl), END;                        // 02 AC ← AGL


///////////////////////////////////////////////////////////////////////////////
//
// THE LJSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LJSR
// NAME:     Long Jump to Subroutine
// DESC:     Jump to subroutine in a non-local memory bank.
// GROUP:    Flow Control
// FLAGS:    -----
// FORMAT:   0001:1:R:aaaaaaaaaa
//
// Pushes the MBP and PC to the Hardware Stack. Then reads a new value of MBP
// from the address specified in the operand, and new value for the PC from the
// next address, allowing a subroutine anywhere in the 24-bit address space to
// be called. This instruction only supports indirect addressing modes.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Limited and non-standard set of addressing modes.
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F   *** ( ) Auto-Increment Double Indirect
//  1   1   380–3BF   *** ( ) Auto-Decrement Double Indirect
//  1   1   3C0–3FF       (8) Stack

// NOTE: LJSR makes no sense with I=0, so it shares opcodes with the
// LIA instruction, which makes no sense with I=0.

// (3) LJSR, Indirect
start LJSR, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags);                    // 02 mem[MBS:SP++] ← <flags,MBP>
      STACK_PUSH(pc);                           // 04 mem[MBS:SP++] ← PC
      SET(dr, agl);                             // 06
      MEMREAD(mbp, agl, pc), action_incdr;      // 07 PC ← mem[MBP:AGL]
      MEMREAD(mbp, dr, mbp), END;               // 09 MBP ← mem[MBP:AGL+1]

// (4) & (5) LJSR, Register Indirect and Memory Bank-Relative Indirect
start LJSR, I=1, R=1, IDX=IDX_REG;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags);                    // 02 mem[MBS:SP++] ← <flags,MBP>
      STACK_PUSH(pc);                           // 04 mem[MBS:SP++] ← PC
      SET(dr, agl);                             // 06
      MEMREAD(mbz, agl, pc), action_incdr;      // 07 PC ← mem[MBZ:AGL]
      MEMREAD(mbz, dr, mbp), END;               // 09 MBP ← mem[MBZ:AGL+1]

// NON-STANDARD: (6) LJSR, Auto-Increment Double Indirect
// TODO: If action_incdr can happen fast enough, we can shave off two cycles here.
// TODO: Can't tell if this microprogram fails or not. Test before control unit is fabricated!
start LJSR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags);                    // 02 mem[MBS:SP++] ← <flags,MBP>
      STACK_PUSH(pc);                           // 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);                    // 06 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, pc);			// 08 PC ← mem[MBn:DR]
      action_incdr;                             // 10 DR++
      MEMREAD_IDX(mbd, dr, mbp);		// 11 MBP ← mem[MBn:DR]
      action_incdr;                             // 13 DR++
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBZ:AGL] ← DR

// NON-STANDARD: (7) LJSR, Auto-Decrement Double Indirect.
start LJSR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags);                    // 02 mem[MBS:SP++] ← <flags,MBP>
      STACK_PUSH(pc);                           // 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);                    // 06 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, mbp);                // 08 MBP ← mem[MBn:DR]
      action_decdr;                             // 10 DR--
      MEMREAD_IDX(mbd, dr, pc);                 // 11 PC ← mem[MBn:DR]
      action_decdr;                             // 13 DR--
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBZ:AGL] ← DR

// (8) LJSR, Stack
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to
// them. Push MBP onto the stack FIRST.
start LJSR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(mbp_flags);                    // 02 mem[MBS:SP++] ← <flags,MBP>
      STACK_PUSH(pc);                           // 04 mem[MBS:SP++] ← PC
      MEMREAD(mbz, dr, pc);                     // 06 MBP ← mem[MBn:DR]
      MEMREAD_IDX(mbd, agl, dr);                // 08 DR ← mem[MBn:AGL]
      action_decdr;                             // 10 DR--
      MEMREAD_IDX(mbd, dr, mbp);                // 11 PC ← mem[MBn:DR]
      action_decdr;                             // 13 DR--
      MEMWRITE(mbz, agl, dr), END;              // 14 mem[MBD:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE LJMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LJMP
// NAME:     Long Jump
// DESC:     Jump to an address in a non-local memory bank.
// GROUP:    Flow Control
// FLAGS:    -----
// FORMAT:   0010:1:R:aaaaaaaaaa
//
// Reads a new value for the MBP from the address specified in the operand, and
// a new value for the PC from the next address effectively jumping to any
// 24-bit location. This instruction only supports indirect addressing modes.
//
// ---------------------------------------------------------------------------
//
// CAUTION:  Limited and non-standard set of addressing modes.
//
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F   *** ( ) Auto-Increment Double Indirect
//  1   1   380–3BF   *** ( ) Auto-Decrement Double Indirect
//  1   1   3C0–3FF       (8) Stack

// NOTE: LJMP makes no sense with I=0, so the ① and ② microprograms
// are blank and available for another instruction where indirection
// makes no sense.

// (3) LJMP, Indirect
start LJMP, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, agl);                             // 02 DR ← AGL
      MEMREAD(mbp, agl, pc), action_incdr;      // 03 PC ← mem[MBP:AGL]; DR++
      MEMREAD(mbp, dr, mbp), END;               // 05 MBP ← mem[MBP:AGL+1]

// (4) & (5) LJMP, Register Indirect and Memory Bank-Relative Indirect
start LJMP, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(dr, agl);                             // 02 DR ← AGL
      MEMREAD(mbz, agl, pc), action_incdr;      // 03 PC ← mem[MBZ:AGL]; DR++
      MEMREAD(mbz, dr, mbp), END;               // 05 MBP ← mem[MBZ:AGL+1]

// NON-STANDARD: (6) LJMP, Auto-Increment Double Indirect
// NOTE: If action_incdr can happen fast enough, we can shave off two cycles here.
start LJMP, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, pc);                 // 04 PC ← mem[MBn:DR]
      action_incdr;                             // 06 DR++
      MEMREAD_IDX(mbd, dr, mbp);                // 07 MBP ← mem[MBn:DR]
      action_incdr;                             // 09 DR++
      MEMWRITE(mbz, agl, dr), END;              // 10 mem[MBZ:AGL] ← DR

// NON-STANDARD: (7) LJMP, Auto-Decrement Double Indirect
start LJMP, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBD:AGL]
      MEMREAD_IDX(mbd, dr, mbp);                // 04 MBP ← mem[MBn:DR]
      action_decdr;                             // 06 DR--
      MEMREAD_IDX(mbd, dr, pc);                 // 07 PC ← mem[MBn:DR]
      action_decdr;                             // 09 DR--
      MEMWRITE(mbz, agl, dr), END;              // 10 mem[MBD:AGL] ← DR

// (8) LJMP, Stack.
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to them. Push MBP
// onto the stack first.
start LJMP, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBD:AGL]
      MEMREAD_IDX(mbd, dr, pc);                 // 04 PC ← mem[MBn:DR]
      action_decdr;                             // 06 DR--
      MEMREAD_IDX(mbd, dr, mbp);                // 07 MBP ← mem[MBn:DR]
      action_decdr;                             // 09 DR--
      MEMWRITE(mbz, agl, dr), END;              // 10 mem[MBD:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE JSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JSR
// NAME:     Jump to Subroutine
// FLAGS:    -----
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
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      SET(pc, agl), END;                        // 04 PC ← AGL

// (3) JSR, Indirect.
start JSR, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      MEMREAD(mbp, agl, pc), END;               // 04 PC ← mem[MBP:AGL]

// (4) & (5) JSR, Register Indirect and Memory Bank-Relative Indirect
start JSR, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      MEMREAD_IDX(mbz, agl, pc), END;           // 04 PC ← mem[MBZ:AGL]

// NON-STANDARD: (6) JSR, Auto-Increment Double Indirect
start JSR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);                    // 04 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbp, dr, pc), action_incdr;   // 06 PC ← mem[MBP:DR]; DR++
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// NON-STANDARD: (7) JSR, Auto-Decrement Double Indirect
start JSR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);                    // 04 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbp, dr, pc), action_decdr;   // 06 PC ← mem[MBP:DR]; DR--
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// (8) JSR, indirect stack addressing mode.
// Pops a 16-bit value from the specified stack register and jumps to the
// subroutine there.
start JSR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(pc);                           // 02 mem[MBS:SP++] ← PC
      MEMREAD(mbz, agl, dr);                    // 04 DR ← mem[MBZ:AGL]
      action_decdr;                             // 06 DR--
      MEMREAD_IDX(mbp, dr, pc);                 // 07 PC ← mem[MBn:DR]
      MEMWRITE(mbz, agl, dr), END;              // 09 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE JMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: JMP
// NAME:     Jump
// FLAGS:    -----
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
//  0   1   Any       *** (2) MBP-Relative page 0
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F   *** ( ) Auto-Increment Double Indirect
//  1   1   380–3BF   *** ( ) Auto-Decrement Double Indirect
//  1   1   3C0–3FF       (8) Stack

// (1) & (2), Page-Local and Register addressing modes
start JMP, I=0, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(pc, agl), END;                        // 02 PC ← AGL

// (3) JMP, Indirect
start JMP, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, pc), END;               // 02 PC ← mem[MBP:AGL]

// (4) & (5) JMP, Register Indirect and Memory Bank-Relative Indirect
start JMP, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD_IDX(mbz, agl, pc), END;           // 02 PC ← mem[MBn:AGL]

// NON-STANDARD: (6) JMP, Auto-Increment Double Indirect
start JMP, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbp, dr, pc), action_incdr;   // 04 PC ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBD:AGL] ← DR

// NON-STANDARD: (7) JMP, Auto-Decrement Double Indirect
start JMP, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbp, dr, pc), action_decdr;   // 04 PC ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (8) JMP, Stack.
// Pops a 16-bit value from the specified stack register and jumps to it.
start JMP, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr;                             // 04 DR--;
      MEMREAD_IDX(mbp, dr, pc);                 // 05 PC ← mem[MBn:DR]
      MEMWRITE(mbz, agl, dr), END;              // 07 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE DSZ INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: DSZ
// NAME:     Decrement and Skip if Zero
// DESC:     Decrements memory by one and skips the next instruction if zero.
// FLAGS:    *N----, -Z---
// GROUP:    Flow Control, Memory
//
// This instruction interprets its operand as an address in memory. It loads a
// value from that address into the AC, decrements it by one, and stores it
// back. If the AC is zero before decrementation, the next instruction is
// skipped. The DSZ instruction simplifies implementing loops.
//
// DSZ used to be called ISZ when the CFT could only increment the AC, but
// decrementation is more practical.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–3FF       (5) Memory Bank-Relative Indirect
//

// NOTE: Auto-indexing conflicts with DSZ behaviour. All operands between &300
// and &3FF are interpreted using Memory Bank-Relative Indirect mode.

// TODO: clean this up.

// TODO: is there any way to save that separate if_z step? (probably not, the
// AC gets manipulated a lot in these microprograms, there might not be a
// chance for it stay stable long enough for a comparison)

// First, without skips.

// (1) DSZ, Page-Local
start DSZ, COND=1, I=0, R=0, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac);	                 // 02 AC ← mem[MBP:AGL]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      -END;					 // 04 NOP (no skip)
      action_decac, MEMWRITE(mbp, agl, ac), END; // 05 mem[MBP:AGL] ← --AC

// (2) DSZ, Register
start DSZ, COND=1, I=0, R=1, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac);                     // 02 AC ← mem[MBZ:AGL]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      -END;					 // 04 NOP (no skip)
      action_decac, MEMWRITE(mbz, agl, ac), END; // 05 mem[MBZ:AGL] ← --AC

// (3) DSZ, Indirect
start DSZ, COND=1, I=1, R=0, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                     // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac);                      // 04 AC ← mem[MBD:DR]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      -END;					 // 06 NOP (no skip)
      action_decac, MEMWRITE(mbd, dr, ac), END;  // 07 mem[MBD:DR] ← --AC

// (4) & (5) DSZ, Register Indirect and Memory Bank-Relative Indirect.
// NOTE: action_decac is on its own in autoindexing addressing modes. This is because
// MEMWRITE_IDX action_idx in its first microstep, and ACTION is vertical.
start DSZ, COND=1, I=1, R=1, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                     // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, ac);                  // 04 AC ← mem[MBn:DR]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      -END;					 // 06 NOP (no skip)
      action_decac;                              // 07 AC--
      MEMWRITE_IDX(mbd, dr, ac), END;            // 08 mem[MBn:DR] ← AC


// And now the same, with skips taken: action_incpc is executed in
// the last microstep.

// (1) DSZ, Page-Local (with skip)
start DSZ, COND=0, I=0, R=0, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac);                     // 02 AC ← mem[MBP:AGL]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      action_incpc;				 // 04 PC++ (skip taken)
      action_decac, MEMWRITE(mbp, agl, ac), END; // 05 mem[MBP:AGL] ← --AC

// (2) DSZ, Register (with skip)
start DSZ, COND=0, I=0, R=1, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac);                     // 02 AC ← mem[MBZ:AGL]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      action_incpc;				 // 04 PC++ (skip taken)
      action_decac, MEMWRITE(mbz, agl, ac), END; // 05 mem[MBZ:AGL] ← --AC

// (3) DSZ, Indirect (with skip)
start DSZ, COND=0, I=1, R=0, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                     // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac);                      // 04 AC ← mem[MBD:DR]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      action_incpc;				 // 06 PC++ (skip taken)
      action_decac, MEMWRITE(mbd, dr, ac), END;  // 07 mem[MBD:DR] ← --AC

// (4) & (5) DSZ, Register Indirect and Memory Bank-Relative Indirect. (with skip)
// NOTE: action_decac is on its own in autoindexing addressing modes. This is
// because MEMWRITE_IDX action_idx in its first microstep, and ACTION is
// vertical.
start DSZ, COND=0, I=1, R=1, IDX=XX;
      FETCH_IR;                                  // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                     // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, ac);                  // 04 AC ← mem[MBn:DR]
      if_z;                                      // 02 AC ← mem[MBP:AGL]
      action_incpc;				 // 06 PC++ (skip taken)
      action_decac;                              // 07 AC--
      MEMWRITE_IDX(mbd, dr, ac), END;            // 08 mem[MBn:DR] ← AC


///////////////////////////////////////////////////////////////////////////////
//
// THE LOAD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: LOAD
// NAME:     Load Accumulator
// DESC:     Loads AC from the specified memory address
// GROUP:    Memory
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in memory. It reads
// the value at that address and stores it into the AC.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) LOAD, Page-Local
start LOAD, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, ac), END;               // 02 AC ← mem[MBP:AGL]

// (2) LOAD, Register
start LOAD, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, ac), END;               // 02 AC ← mem[MBZ:AGL]

// (3) LOAD, Indirect
start LOAD, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, ac), END;                // 04 AC ← mem[MBD:DR]

// (4) & (5) LOAD, Register Indirect and Memory Bank-Relative Indirect
start LOAD, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbz, dr, ac), END;		// 04 AC ← mem[MBn:DR]

// (6) LOAD, Auto-Increment
// TODO: action_incdr might need to be in a processor cycle of its own!
start LOAD, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, ac), action_incdr;	// 04 AC ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (7) LOAD, Auto-Decrement
// TODO: action_incdr might need to be in a processor cycle of its own!
start LOAD, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, ac), action_decdr;	// 04 AC ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (8) LOAD, Stack
// NOTE: This is basically POP
// TODO: Decide if this merits to be its own instruction. Leaning towards no.
start LOAD, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr;                             // 04 DR--
      MEMREAD_IDX(mbd, dr, ac);                 // 05 AC ← mem[MBn:DR];
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE STORE INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: STORE
// NAME:     Store Accumulator
// DESC:     Stores AC to the specified memory address
// GROUP:    Memory
// FLAGS:    -----
//
// This instruction interprets its operand as an address in memory and stores
// the AC into it.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) STORE, Page-Local
start STORE, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMWRITE(mbp, agl, ac), END;              // 02 mem[MBP:AGL] ← AC

// (2) STORE, Register
start STORE, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMWRITE(mbz, agl, ac), END;              // 02 mem[MBZ:AGL] ← AC

// (3) STORE, Indirect
start STORE, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMWRITE(mbd, dr, ac), END;               // 04 mem[MBD:DR] ← AC

// (4) & (5) STORE, Register Indirect and Memory Bank-Relative Indirect
start STORE, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMWRITE_IDX(mbz, dr, ac), END;           // 04 mem[MBZ:DR] ← AC

// (6) STORE, Auto-Increment
start STORE, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]p
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMWRITE_IDX(mbd, dr, ac), action_incdr;  // 04 AC ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (7) STORE, Auto-Decrement
start STORE, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMWRITE_IDX(mbd, dr, ac), action_decdr;  // 04 mem[MBn:DR] ← AC; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR

// (8) STORE, Stack
start STORE, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]p
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMWRITE_IDX(mbd, dr, ac), action_incdr;  // 04 AC ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE IN INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: IN
// NAME:     Input from I/O Space
// DESC:     Loads AC from an I/O Space address
// GROUP:    Input/Output
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in I/O Space. It reads
// the value at that address and stores it into the AC. I/O Space is 16 bits
// wide (and only 10 bits are used in practice), so Memory Banks are irrelevant
// here.
//
// Since we're not dealing with memory, Page-Local modes make no sense. They
// are available as of version 7d of the microcode, but must not be used. Their
// microprograms could be used for something else. IN should always be have R,
// and all I/O space register definitions in Assembly programs actually set the
// R field for good measure (and simplicity).
//
// CAUTION:  Limited and non-standard set of addressing modes.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   1   Any           (2) I/O
//  1   1   Any           (4) Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// I/O space is 16 bits wide. The first 10 bits of those are faster to use, and
// these are all the CFT bothers with.

// (1) IN, 'Page-Local' (not quite)
// TODO: This addressing mode is pointless. Reuse microprogram?
// CAUTION: DO NOT USE
// start IN, I=0, R=0, IDX=XX;
//       FETCH_IR;                              // 00 IR ← mem[PC++]
//       IOREAD(agl, ac), END;                  // 02 AC ← io[AGL]

// (1) & (2) IN, I/O
start IN, I=0, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      IOREAD(agl, ac), END;                     // 02 AC ← io[AGL]

// (3) & (4) & (5) IN, Indirect
start IN, I=1, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      IOREAD(dr, ac), END;                      // 04 AC ← io[DR]

// (6) IN, Auto-Increment
start IN, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBD:AGL]
      IOREAD(dr, ac), action_incdr;             // 04 AC ← io[DR]; DR++
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBD:AGL] ← DR

// (7) IN, Auto-Decrement
start IN, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOREAD(dr, ac), action_decdr;             // 04 AC ← io[DR]; DR--;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (8) IN, Stack
start IN, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr, IOREAD(dr, ac);             // 04 DR--; AC ← io[DR]
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE OUT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: OUT
// NAME:     Output to I/O Space
// DESC:     Writes AC to an I/O Space address
// GROUP:    Input/Output
// FLAGS:    -----
//
// This instruction interprets its operand as an address in I/O Space. It
// writes the current value of the AC to that address. I/O Space is 16 bits
// wide (and only 10 bits are used in practice), so Memory Banks are irrelevant
// here.
//
// Since we're not dealing with memory, Page-Local modes make no sense. They
// are available as of version 7d of the microcode, but must not be used. Their
// microprograms could be used for something else. OUT should always be have R,
// and all I/O space register definitions in Assembly programs actually set the
// R field for good measure (and simplicity).
//
// CAUTION:  Limited and non-standard set of addressing modes.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   1   Any           (2) I/O
//  1   1   Any           (4) Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) & (2) OUT, I/O
start OUT, I=0, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;                    // 02 io[AGL] ← AC

// (3) & (4) & (5) OUT, Indirect
start OUT, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;                    // 02 io[AGL] ← AC

// (6) OUT, Auto-Increment
start OUT, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_incdr;            // 04 AC ← io[DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// (7) OUT, Auto-Decrement
start OUT, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_decdr;            // 04 io[DR] ← AC; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR

// (8) OUT, Stack
start OUT, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_incdr;            // 04 AC ← io[DR]; DR++;
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE IOT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: IOT
// NAME:     I/O Transaction
// DESC:     Writes AC to an I/O Space address and Reads it Back
// GROUP:    Input/Output
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in I/O Space. It
// writes the current value of the AC to that address, then immediately reads
// it back. An I/O Space-mapped device will use the write as an instruction
// and/or parameter and the read will yield back the result. Like all memory
// and I/O transactions, a slow may request wait states if it needs additional
// time to produce a result.
//
// IOT is also used to implement processor extensions. After the I/O write, the
// addressed device or extension can assert SKIPEXT to skip the next
// instruction, and this is processed and acted on here. The device or
// extension can also assert ENDEXT to skip past reading the AC. If they do
// that, auto-increment and auto-decrement modes act as plain register modes.
//
// I/O Space is 16 bits wide (and only 10 bits are used in practice), so Memory
// Banks are irrelevant here.
//
// Since we're not dealing with memory, Page-Local modes make no sense. They
// are available as of version 7d of the microcode, but must not be used. Their
// microprograms could be used for something else. OUT should always be have R,
// and all I/O space register definitions in Assembly programs actually set the
// R field for good measure (and simplicity).
//
// CAUTION:  Limited and non-standard set of addressing modes.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   1   Any           (2) I/O
//  1   1   Any           (4) Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// First, without skips. Remember, SKIP (aka COND) is active low. If SKIPEXT is
// asserted, it will be handled in the COND=0 case below.

// (1) & (2) IOT, I/O
start IOT, COND=1, I=0, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);                         // 02 io[AGL] ← AC
      IOREAD(agl, ac), END;                     // 04 AC ← io[AGL]

// (3) & (4) & (5) IOT, Indirect
start IOT, COND=1, I=1, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);                          // 04 io[DR] ← AC
      IOREAD(dr, ac), END;                      // 06 AC ← io[DR]

// (6) IOT, Auto-Increment
start IOT, COND=1, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_incdr;            // 04 AC ← io[DR]; DR++;
      IOREAD(dr, ac);                           // 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// (7) IOT, Auto-Decrement
start IOT, COND=1, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_decdr;            // 04 io[DR] ← AC; DR--;
      IOREAD(dr, ac);                           // 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// (8) IOT, Stack
// TODO: the timing of decdr might not work here.
start IOT, COND=1, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr, IOWRITE(dr, ac);            // 04 io[--DR] ← AC
      IOREAD(dr, ac);                           // 06 AC ← io[DR]
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR

// And Now, with skips requested. Remember, SKIP is active low.

// (1) & (2) IOT, I/O
start IOT, COND=0, I=0, R=X, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);                         // 02 io[AGL] ← AC
      IOREAD(agl, ac), action_incpc, END;       // 04 AC ← io[AGL]; PC++

// (3) & (4) & (5) IOT, Indirect
start IOT, COND=0, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);                          // 04 io[DR] ← AC
      IOREAD(dr, ac), action_incpc, END;        // 04 AC ← io[DR]; PC++

// (6) IOT, Auto-Increment
start IOT, COND=0, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_incdr;            // 04 AC ← io[DR]; DR++
      IOREAD(dr, ac), action_incpc;             // 06 AC ← io[DR]; PC++
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// (7) IOT, Auto-Decrement
start IOT, COND=0, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      IOWRITE(dr, ac), action_incdr;            // 04 AC ← io[DR]; DR++
      IOREAD(dr, ac), action_incpc;             // 06 AC ← io[DR]; PC++
      MEMWRITE(mbz, agl, dr), END;              // 08 mem[MBZ:AGL] ← DR

// (8) IOT, Stack
// TODO: the timing of decdr might not work here.
start IOT, COND=0, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr, IOWRITE(dr, ac);            // 04 io[--DR] ← AC
      IOREAD(dr, ac), action_incpc;             // 06 AC ← io[DR]; PC++
      MEMWRITE(mbz, agl, dr), END;              // 06 mem[MBZ:AGL] ← DR


///////////////////////////////////////////////////////////////////////////////
//
// THE ADD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: ADD
// NAME:     Add To Accumulator
// DESC:     Adds the value at the specified memory address to the AC.
// GROUP:    Arithmetic and Logic
// FLAGS:    *NZV-L
//
// This instruction interprets its operand as an address in memory. It reads
// the value at that address and adds it to the 17-bit vector <L,AC>. That is,
// if the sum is greater than 65,635 the L Register will be toggled.
//
// After the addition, the Overflow flag will be set if and only if the two
// addends (treated as signed 16-bit integers) have the same sign, but the sum
// has the opposite sign. If only one of the addends is positive, or the sign
// of addends and sum is the same, the Overflow Flag will be cleared.
//
// Like the PDP-8, the CFT lacks an explicit subtraction operation as of
// Microcode version 7, but two's complement makes addition and subtraction
// symmetric so only one instruction is needed.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// All four ALU binary operations have microcode that looks very similar to the
// LOAD one (the ALU B port is loaded rather then the Accumulator, and there's
// an additional processor cycle to perform the operation.

// (1) ADD, Page-Local
start ADD, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                 // 02 B ← mem[MBP:AGL]
      SET(ac, alu_add), END;                    // 04 AC ← AC + B

// (2) ADD, Register
start ADD, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                 // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_add), END;                    // 04 AC ← AC + B

// (3) ADD, Indirect
start ADD, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);                  // 04 AC ← mem[MBD:DR]
      SET(ac, alu_add), END;                    // 06 AC ← AC + B

// (4) & (5) ADD, Register Indirect and Memory Bank-Relative Indirect
start ADD, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b);              // 04 B ← mem[MBD:DR]
      SET(ac, alu_add), END;                    // 06 AC ← AC + B

// (6) ADD, Auto-Increment
start ADD, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_incdr;// 04 B ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_add), END;                    // 08 AC ← AC + B

// (7) ADD, Auto-Decrement
start ADD, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_decdr;// 04 B ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_add), END;                    // 08 AC ← AC + B

// (8) ADD, Stack
start ADD, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBD:AGL]
      action_decdr;                             // 04 DR--
      MEMREAD_IDX(mbd, dr, alu_b);              // 05 B ← mem[MBn:DR];
      MEMWRITE(mbz, agl, dr);                   // 07 mem[MBD:AGL] ← DR
      SET(ac, alu_add), END;                    // 09 AC ← AC + B


///////////////////////////////////////////////////////////////////////////////
//
// THE AND INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: AND
// NAME:     Bitwise AND With Accumulator
// DESC:     Bitwise ANDs the value at the specified memory address and AC.
// GROUP:    Arithmetic and Logic
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in memory. It reads
// the value at that address and bitwise ANDs it to the AC.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) AND, Page-Local
start AND, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                 // 02 B ← mem[MBP:AGL]
      SET(ac, alu_and), END;                    // 04 AC ← AC & B

// (2) AND, Register
start AND, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                 // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_and), END;                    // 04 AC ← AC & B

// (3) AND, Indirect
start AND, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);                  // 04 AC ← mem[MBD:DR]
      SET(ac, alu_and), END;                    // 06 AC ← AC & B

// (4) & (5) AND, Register Indirect and Memory Bank-Relative Indirect
start AND, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b);              // 04 B ← mem[MBn:DR]
      SET(ac, alu_and), END;                    // 06 AC ← AC & B

// (6) AND, Auto-Increment
start AND, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_incdr;// 04 B ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;                    // 08 AC ← AC & B

// (7) AND, Auto-Decrement
start AND, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_decdr;// 04 B ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;                    // 08 AC ← AC & B

// (8) AND, Stack
start AND, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr;                             // 04 DR--
      MEMREAD_IDX(mbd, dr, alu_b);              // 05 B ← mem[MBn:DR];
      MEMWRITE(mbz, agl, dr);                   // 07 mem[MBZ:AGL] ← DR
      SET(ac, alu_and), END;                    // 09 AC ← AC & B


///////////////////////////////////////////////////////////////////////////////
//
// THE OR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: OR
// NAME:     Bitwise OR With Accumulator
// DESC:     Bitwise ORs the value at the specified memory address and AC.
// GROUP:    Arithmetic and Logic
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in memory. It reads
// the value at that address and bitwise ORs it to the AC.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) OR, Page-Local
start OR, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                 // 02 B ← mem[MBP:AGL]
      SET(ac, alu_or), END;                     // 04 AC ← AC | B

// (2) OR, Register
start OR, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                 // 02 B ← mem[MBZ:AGL]
      SET(ac, alu_or), END;                     // 04 AC ← AC | B

// (3) OR, Indirect
start OR, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);                  // 04 AC ← mem[MBD:DR]
      SET(ac, alu_or), END;                     // 06 AC ← AC | B

// (4) & (5) OR, Register Indirect and Memory Bank-Relative Indirect
start OR, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD(mbz, dr, alu_b);                  // 04 B ← mem[MBn:DR]
      SET(ac, alu_or), END;                     // 06 AC ← AC | B

// (6) OR, Auto-Increment
start OR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_incdr;// 04 B ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;                     // 08 AC ← AC | B

// (7) OR, Auto-Decrement
start OR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_decdr;// 04 B ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;                     // 08 AC ← AC | B

// (8) OR, Stack
start OR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr;                             // 04 DR--;
      MEMREAD_IDX(mbd, dr, alu_b);              // 05 B ← mem[MBn:DR];
      MEMWRITE(mbz, agl, dr);                   // 07 mem[MBZ:AGL] ← DR
      SET(ac, alu_or), END;                     // 09 AC ← AC | B


///////////////////////////////////////////////////////////////////////////////
//
// THE XOR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// MNEMONIC: XOR
// NAME:     Bitwise XOR With Accumulator
// DESC:     Bitwise XORs the value at the specified memory address and AC.
// GROUP:    Arithmetic and Logic
// FLAGS:    *NZ---
//
// This instruction interprets its operand as an address in memory. It reads
// the value at that address and bitwise exclusive ORs it to the AC.
//
// ---------------------------------------------------------------------------
//  I   R   Operand   (*) (#) Addressing Mode
// ---------------------------------------------------------------------------
//  0   0   Any           (1) Page-Local
//  0   1   Any           (2) Register
//  1   0   Any           (3) Indirect
//  1   1   000–2FF       (4) Register Indirect
//  1   1   300–33F       (5) Memory Bank-Relative Indirect
//  1   1   340–37F       (6) Auto-Increment
//  1   1   380–3BF       (7) Auto-Decrement
//  1   1   3C0–3FF       (8) Stack

// (1) XOR, Page-Local
start XOR, I=0, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, alu_b);                 // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;                    // 04 AC ← AC ^ B

// (2) XOR, Register
start XOR, I=0, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, alu_b);                 // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;                    // 04 AC ← AC ^ B

// (3) XOR, Indirect
start XOR, I=1, R=0, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbp, agl, dr);                    // 02 DR ← mem[MBP:AGL]
      MEMREAD(mbd, dr, alu_b);                  // 04 AC ← mem[MBD:DR]
      SET(ac, alu_xor), END;                    // 06 AC ← AC ^ B

// (4) & (5) XOR, Register Indirect and Memory Bank-Relative Indirect
start XOR, I=1, R=1, IDX=XX;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b);              // 04 B ← mem[MBn:DR]
      SET(ac, alu_xor), END;                    // 06 AC ← AC ^ B

// (6) XOR, Auto-Increment
start XOR, I=1, R=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_incdr;// 04 B ← mem[MBn:DR]; DR++;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;                    // 08 AC ← AC ^ B

// (7) XOR, Auto-Decrement
start XOR, I=1, R=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      MEMREAD_IDX(mbd, dr, alu_b), action_decdr;// 04 B ← mem[MBn:DR]; DR--;
      MEMWRITE(mbz, agl, dr);                   // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;                    // 08 AC ← AC ^ B

// (8) XOR, Stack
start XOR, I=1, R=1, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      MEMREAD(mbz, agl, dr);                    // 02 DR ← mem[MBZ:AGL]
      action_decdr;                             // 04 DR--;
      MEMREAD_IDX(mbd, dr, alu_b);              // 05 B ← mem[MBn:DR];
      MEMWRITE(mbz, agl, dr);                   // 07 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;                    // 09 AC ← AC ^ B

// End of file.
