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

// Define the opcodes for convenience.

#define LJSR  0000
#define LJMP  0000
#define IOT   0001
#define LOAD  0010
#define STORE 0011
#define IN    0100
#define OUT   0101
#define JMP   0110
#define JSR   0111
#define ADD   1000
#define AND   1001
#define OR    1010
#define XOR   1011
#define OP1   1100              // Also OP2

#define OP2   1101              // OP=1101, I=0: OP1
#define POP   1101              // v6. OP=1101, I=1: POP
#define ISZ   1110
#define LIA   1111              // OP=1111, I=0: LIA/LI
#define JMPII 1111              // v6. OP=1111, I=1: JMPII

// SKIP constants (reversed, and defined for easier semantics)

#define ACT 0
#define DONT_ACT 1

// Flags are inverted in the SBL
#define FLAG_SET 0
#define FLAG_CLEAR 1
#define FZ_IS_1 0
#define FZ_IS_0 1

//              MODES
// Instruction  Literal  Direct  Indirect  Autoindex    Special
// ----------------------------------------------------------------------------
// LJSR            X         X                 X
// IOT             X         X                 X
// LOAD            X         X                 X
// STORE           X         X                 X
// IN              X         X                 X
// OUT             X         X                 X
// JMP             X         X                 X
// JSR             X         X                 X
// ADD                       X       X         X
// AND                       X       X         X
// OR                        X       X         X
// XOR                       X       X         X
// OP1                                                    X
// OP2                                                    X
// ISZ                       X       X         X
// LIA             X
// JMPII           X*        X*                X*         (double indirection)
// ----------------------------------------------------------------------------


///////////////////////////////////////////////////////////////////////////////
//
// Conditions: fields embedded in the MicroROM address.
//
///////////////////////////////////////////////////////////////////////////////

cond RST:1;                   // When low, machine is resetting.
cond INT:1;                   // When low, servicing an interrupt request
cond SKIP:1;                  // When low: SBL returned TRUE. (registered, reset on END)
cond OP:4;                    // The opcode field of the IR.
cond I:1;                     // The indirection field of the IR.
cond R:1;                     // The register field of the IR.
cond SUBOP:3;		      // Used to implement instructions without operands.
cond IDX:2;		      // Auto-index type

#define IDX_REG  00           // Ordinary register
#define IDX_INC  01	      // Autoincrement register
#define IDX_DEC  10	      // Autodecrement register
#define IDX_SP   11	      // Stack register

// The uaddr field of the address is mandatory. This just sets its
// width. It was 4 bits wide before Version 7.
cond uaddr:5;

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
// 00001
// 00010     AGL         IR           The AGL is read-only; the IR is write-only.
// 00011     SP          SP           The CFT is a big boy now, it has a Stack Pointer!                         
// 00100                 AR:MBP       Write to the Address Register, use Program MBR.
// 00101                 AR:MBD       Write to the AR, use Data MBR.
// 00110                 AR:MBS       Write to the AR, use Stack MBR.
// 00111                 AR:MBn       MB reg depends on IR bits.
// 01000     PC          PC                                 
// 01001     DR          DR                                      
// 01010     AC          AC                                      
// 01011     ALU:B?      ALU:B        The ALU B port is treated as a major reg without increments.
// 01100     MBP         MBP          The MBP is pushed onto the stack before a long jump.
// 01101     MBP + flags MBP + flags  This is used in interrupt handlers for speed.
// 01110                                      
// 01111                                      
// 10000     ALU:ADD
// 10001     ALU:AND                                      
// 10010     ALU:OR                                      
// 10011     ALU:XOR                                      
// 10100     ALU:ROLL                                      
// 10101     ALU:NOT                                      
// 10110                                      
// 10111                                      
// 11000     CS0                      Read from constant store
// 11001     CS1                      
// 11010     ...                      
// 11011                                      
// 11100                                      
// 11101                                      
// 11110                                      
// 11111

// NEXT (µADDRESS) FIELD. This is for implemting jumps.
jump_field jump        = ___________________________XXXXX; // The next value for the µPC
field reserved         = ________________________XXX_____; // Reserved for future expansion.

// RADDR FIELD
field  READ            = ___________________XXXXX________; // Read unit field
signal read_agl        = ...................00010........; // Read from address generation logic
signal read_pc         = ...................01000........; // Read from PC
signal read_dr         = ...................01001........; // Read from DR
signal read_ac         = ...................01010........; // Read from AC
signal read_mbp        = ...................01100........; // Read MBP (MB0)
signal read_mbp_flags  = ...................01101........; // Read combination MBP+flags
signal read_alu_add    = ...................10000........; // ALU: Read from the Adder unit
signal read_alu_and    = ...................10001........; // ALU: Read from the AND unit
signal read_alu_or     = ...................10010........; // ALU: Read from the OR unit
signal read_alu_xor    = ...................10011........; // ALU: Read from the XOR unit
signal read_alu_roll   = ...................10100........; // ALU: Read from the ROLL unit
signal read_alu_not    = ...................10101........; // ALU: Read from the NOT unit
signal read_cs_rstvec  = ...................11   ........; // Constant Store: Reset Vector
signal read_cs_isrvec0 = ...................11   ........; // Constant Store: ISR Vector (MSB)
signal read_cs_isrvec1 = ...................11   ........; // Constant Store: ISR Vector (LSB)
signal read_cs_sp      = ...................11001........; // Constant Store: Stack Pointer

// WADDR FIELD
field  WRITE           = ______________XXXXX_____________; // Write unit field
signal write_ir        = ..............00010.............; // Write to the Instruction Register
signal write_ar_mbp    = ..............00100.............; // Write MBP:AR (program area, extend with MBP)
signal write_ar_mbd    = ..............00101.............; // Write MBD:AR (data area, extend with MBD)
signal write_ar_mbs    = ..............00110.............; // Write MBS:AR (stack area, extend with MBS)
signal write_ar_mbn    = ..............00111.............; // Write MBn:AR (use MBx decided using IR)
signal write_pc        = ..............01000.............; // Write to PC
signal write_dr        = ..............01001.............; // Write to DR
signal write_ac        = ..............01010.............; // Write to AC
signal write_alu_b     = ..............01011.............; // Write to ALU's B Port
signal write_mbp       = ..............01100.............; // Read MBP
signal write_mbp_flags = ..............01101.............; // Read combination MBP+flags

// COND FIELD (UNDER REDESIGN)
field  IF              = _________XXXXX__________________; // OPx IF field
signal if_ir3          = .........00001..................; // SKIP = IR[3]
signal if_ir4          = .........00010..................; // SKIP = IR[4]
signal if_ir5          = .........00011..................; // SKIP = IR[5]
signal if_ir6          = .........00100..................; // SKIP = IR[6]
signal if_ir7          = .........00101..................; // SKIP = IR[7]
signal if_ir8          = .........00110..................; // SKIP = IR[8]
signal if_ir9          = .........00111..................; // SKIP = IR[9]
signal if_v            = .........01010..................; // SKIP = V
signal if_l            = .........01011..................; // SKIP = L
signal if_z            = .........01100..................; // SKIP = Z
signal if_ifneg        = .........01101..................; // SKIP = N
signal if_roll         = .........01110..................; // SKIP = roll_logic(IR[2:0])
signal if_branch       = .........01111..................; // SKIP = skip_logic(IR[3:0])

// ACTION FIELD (UNDER REDESIGN)
//                      76543210FEDCBA9876543210
field  ACTION          = _____XXXX_______________........; 
signal /action_cpl     = .....0001.......................; // Complement L
signal /action_cll     = .....0010.......................; // Clear L flag
signal /action_sti     = .....0011.......................; // Set I flag
signal /action_cli     = .....0100.......................; // Clear I flag
signal /action_incpc   = .....1000.......................; // Step the PC
signal /action_incdr   = .....1001.......................; // Increment DR
signal /action_decdr   = .....1010.......................; // Decrement DR
signal /action_incac   = .....1011.......................; // Increment AC
signal /action_decac   = .....1100.......................; // Increment AC
signal /action_incsp   = .....1101.......................; // Increment SP
signal /action_decsp   = .....1110.......................; // Increment SP

// HORIZONTAL SIGNALS
signal /MEM            = ....1...........................; // Memory access
signal /IO             = ...1............................; // Input/Output enable
signal /R              = ..1.............................; // Memory read
signal /WEN            = .1..............................; // Memory write
signal /END            = 1...............................; // Reset uaddr, go to fetch state.



///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO READ FROM MEMORY AND I/O SPACE
//
///////////////////////////////////////////////////////////////////////////////

// Note: the final ‘;’ is purposefully left out in the second cycle,
// so these macros can be combined with other microinstructions.

// This macros uses cpp's symbol concatenation, which is why it's extra ugly.
#define _MEMREAD(mbr, addr, data)            \
    write_ar_##mbr, read_##addr;             \
    /MEM, /R, write_##data

// I/O space is 16 bits wide and ignores AB[16..23], so we can use any
// old MBR to write to the AR, it doesn't matter.
#define IOREAD(addr, data)                   \
    write_ar_mbp, read_##addr;               \
    /IO, /R, write_##data

// Shorthands to reduce bugs
#define MEMREAD_PROGRAM(addr, data) _MEMREAD(MBP, addr, data)
#define MEMREAD_LOCAL(addr, data)   MEMREAD_PROGRAM(addr, data)

#define MEMREAD_DATA(addr, data)    _MEMREAD(MBD, addr, data)
#define MEMREAD_PAGE0(addr, data)   MEMREAD_DATA(addr, data)

#define MEMREAD_STACK(addr, data)   _MEMREAD(MBS, addr, data)


///////////////////////////////////////////////////////////////////////////////
//
// MACROS TO WRITE TO MEMORY AND I/O SPACE
//
///////////////////////////////////////////////////////////////////////////////

#define _MEMWRITE(mbr, addr, data)        \
    write_ar_##mbr, read_##addr;             \
    /MEM, /WEN, read_##data

// I/O space is 16 bits wide and ignores AB[16..23], so we can use any
// old MBR to write to the AR, it doesn't matter.
#define IOWRITE(addr, data)                  \
    write_ar_mbp, read_##addr;                   \
    /MEM, /WEN, read_##data


// Shorthands to reduce bugs
#define MEMWRITE_PROGRAM(addr, data) _MEMWRITE(MBP, addr, data)
#define MEMWRITE_LOCAL(addr, data)   MEMWRITE_PROGRAM(addr, data)

#define MEMWRITE_DATA(addr, data)    _MEMWRITE(MBD, addr, data)
#define MEMWRITE_PAGE0(addr, data)   MEMWRITE_DATA(addr, data)

#define MEMWRITE_STACK(addr, data)   _MEMWRITE(MBS, addr, data)


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

#define FETCH_IR MEMREAD_CODE(pc, ir), /incpc


///////////////////////////////////////////////////////////////////////////////
//
// UTILITY MACROS
//
///////////////////////////////////////////////////////////////////////////////

#define END /END, jump=0

#define IFBIT(x) /if##x, /action_end;


// Set a register to another register. E.g. SET(pc,dr) will write the value of
// DR to the PC.
#define SET(__TGTREG__, __SRCREG) read_##__SRCREG__, write_##__TGTREG__


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

start RST=X, INT=X, IN_RESERVED=X, SKIP=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      END;
      fill;


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

start RST=X, INT=X, IN_RESERVED=X, SKIP=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      FETCH_IR;                // Just fetch an instruction.


///////////////////////////////////////////////////////////////////////////////
//
// Reset code
//
///////////////////////////////////////////////////////////////////////////////

// The reset sequence is little more than a fetch sequence, but we pad
// it with a few NOPs.

start RST=X, INT=X, IN_RESERVED=X, SKIP=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      SET(pc,cs_rstvec0), /cli, END;
      fill;


///////////////////////////////////////////////////////////////////////////////
//
// Interrupt service code
//
///////////////////////////////////////////////////////////////////////////////

// The stack pointer is a minor register, and it can't increment or
// decrement. We temporarily transfer it to the DR, which is used as a scratch
// register and can do both.
#define STACK_PUSH(data) \
      MEMWRITE_STACK(sp, data), /action_incsp

#define STACK_POP(data) \
      /action_decsp;
      MEMREAD_STACK(sp, data)

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

start RST=1, INT=0, IN_RESERVED=X, SKIP=X, OP=XXXX, I=X, R=X, SUBOP=XXX, IDX=XX;
      STACK_PUSH(mbp_flags);	                // 00 mem[SP++] ← flags:MBP
      /action_cli, STACK_PUSH(pc);		// 02 mem[SP++] ← PC; CLI
      STACK_PUSH(ac);		                // 04 mem[SP++] ← AC
      SET(cs_isrvec0, pc);			// 06 PC ← ISR vector low
      SET(cs_isrvec1, mbp), END;		// 08 MBP ← ISR vector high



///////////////////////////////////////////////////////////////////////////////
//
// THE INSTRUCTION SET
//
///////////////////////////////////////////////////////////////////////////////

//                                  (1)  (2)  (3)  (4)  (5)  (6)  (7)     
//                    I              0    0    1    1    1    1    1	
//                    R              0    1    0    1    1    1    1	
//             REG TYPE                  REG       REG  INC  DEC  SP   BIT
//             INSTR  OP    IRSUB    :    :    :    :    :    :    :    :
// --------------------------------------------------------------------------------------
// DONE:       LJSR   0000  0        1    1              2    2    2
// DONE:       LJMP   0000  1                  X    X    2    2    2
// DONE:       JMP    0110           X    X    X    X    2    2    2
// DONE:       JSR    0111           X    X    X    X    2    2    2
// --------------------------------------------------------------------------------------
// DONE:       IOT    0001           .    X    .    X    ?    ?    ?
// DONE:       IN     0100           .    X    .    X    ?    ?    ?
// DONE:       OUT    0101           .    X    .    X    ?    ?    ?
// --------------------------------------------------------------------------------------
// DONE:       LOAD   0010           X    X    X    X    X    X    X
// DONE:       STORE  0011           X    X    X    X    X    X    X
// DONE:       ISZ    1110           X    X    X    3    3    3    3
// --------------------------------------------------------------------------------------
// DONE:       ADD    1000           X    X    X    X    X    X    X
// DONE:       AND    1001           X    X    X    X    X    X    X
// DONE:       OR     1010           X    X    X    X    X    X    X
// DONE:       XOR    1011           X    X    X    X    X    X    X
// --------------------------------------------------------------------------------------
// DONE:       LIA    1111  0        X    X
// DONE:       LI     1111                X
// --------------------------------------------------------------------------------------
//             OP1    1100  000XX                                       IRET LRET RET ???
//             OP1    1100  001XX                                       TSA TAS CLI STI
//             OP1    1100  010XX                                       PHA PPA PHF PPF
//             OP1    1100  011XX                                       NOT/NEG ...
//             ???    ????  100XX                                       SKIPS
//             ???    ????  101XX                                       ROLLS/SHIFTS
//             ???    ????  110XX                                       ?
//             ???    ????  111XX                                       ?
 
// --------------------------------------------------------------------------------------
//
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

// NOP =  OP2 '-----00000               ; 
// SNA =  OP2 '-----01---               ; A < 0 ==> PC++  (1)
// SZA =  OP2 '-----0-1--               ; A == 0 ==> PC++ (1)
// SLS =  OP2 '-----0--1-               ; L == 1 ==> PC++ (1)
// SSV =  OP2 '-----0---1               ; V == 1 ==> PC++ (1)
// SKIP = OP2 '-----10000               ; PC++
// SNN =  OP2 '-----11---               ; a >=0 ==> PC++  (2)
// SNZ =  OP2 '-----1-1--               ; A != 0 ==> PC++ (2)
// SCL =  OP2 '-----1--1-               ; L == 0 ==> PC++ (2)
// SCV =  OP2 '-----1---1               ; V == 0 ==> PC++ (2)
// CLA =  OP2 '--1-------               ; A <- 0
// CLI =  OP2 '---1------               ; INT <= 0
// STI =  OP2 '----1-----               ; INT <= 1

// TSA =                                ; Transfer SP to AC
// TAS =                                ; Transfer AC to SP
// PHF =                                ; Push flags
// PPF =                                ; Pop flags
// PHA =                                ; Push AC
// PPA =                                ; Pop AC
// CLI =
// STI =
// RET =
// RTI =

// ROLLS/SHIFTS
//
// * Arithmetic/Logic
// * Left/Right
// * 1
// * 2

// Needs 4 bits, 3 bits left, 3 bits right + 4 bits 



///////////////////////////////////////////////////////////////////////////////
//
// THE LJSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ③ LJSR (always with I=0), local indirect addressing mode.
// Note: despite I=0, this is an indirect mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJSR, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]      
      STACK_PUSH(mbp);				// 02 mem[SP++] ← MBP     
      STACK_PUSH(pc);				// 04 mem[SP++] ← PC      
      SET(dr, agl);				// 06                     
      MEMREAD_LOCAL(agl, pc), /action_incdr;	// 07 PC ← mem[MBP:AGL]   
      MEMREAD_LOCAL(dr, mbp), END;		// 09 MBP ← mem[MBP:AGL+1]

// ④ LJSR (always with I=0), register indirect addressing mode.
// Note: despite I=0, this is an indirect mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJSR, I=0, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[SP++] ← MBP
      STACK_PUSH(pc);				// 04 mem[SP++] ← PC
      SET(dr, agl);				// 06
      MEMREAD_PAGE0(agl, pc), /action_incdr;	// 07 PC ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, mbp), END;		// 09 MBP ← mem[MBD:AGL+1]


// ⑤ LJSR (always with I=1), register double indirect autoincrement addressing mode.
// NOTE: If /action_incdr can happen fast enough, we can shave off two cycles here.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJSR, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[SP++] ← MBP     
      STACK_PUSH(pc);				// 04 mem[SP++] ← PC      
      MEMREAD_PAGE0(agl, dr);	                // 06 DR ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, pc);	                // 08 PC ← mem[MBD:DR]
      /action_incdr;                            // 10 DR++
      MEMREAD_PAGE0(dr, mbp);	                // 11 MBP ← mem[MBD:DR]
      /action_incdr;                            // 13 DR++
      MEMWRITE_PAGE0(agl, dr), END;             // 14 mem[MBD:AGL] ← DR


// ⑥ LJSR (always with I=1), register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJSR, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[SP++] ← MBP     
      STACK_PUSH(pc);				// 04 mem[SP++] ← PC      
      MEMREAD_PAGE0(agl, dr);	                // 06 DR ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, mbp);	                // 08 MBP ← mem[MBD:DR]
      /action_decdr;                            // 10 DR--
      MEMREAD_PAGE0(dr, pc);	                // 11 PC ← mem[MBD:DR]
      /action_decdr;                            // 13 DR--
      MEMWRITE_PAGE0(agl, dr), END;             // 14 mem[MBD:AGL] ← DR


// ⑦ LJSR (always with I=1), register indirect stack addressing mode.
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to
// them. Push MBP onto the stack FIRST.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJSR, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(mbp);				// 02 mem[SP++] ← MBP     
      STACK_PUSH(pc);				// 04 mem[SP++] ← PC      
      MEMREAD_PAGE0(dr, pc);	                // 06 MBP ← mem[MBD:DR]
      MEMREAD_PAGE0(agl, dr);	                // 08 DR ← mem[MBD:AGL]
      /action_decdr;                            // 10 DR--
      MEMREAD_PAGE0(dr, mbp);	                // 11 PC ← mem[MBD:DR]
      /action_decdr;                            // 13 DR--
      MEMWRITE_PAGE0(agl, dr), END;             // 14 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE LJMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ③ LJMP (always with I=1), local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJMP, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(dr, agl);				// 02 DR ← AGL
      MEMREAD_LOCAL(agl, pc), /action_incdr;	// 03 PC ← mem[MBP:AGL]; DR++
      MEMREAD_LOCAL(dr, mbp), END;		// 05 MBP ← mem[MBP:AGL+1]

// ④ LJMP (always with I=1), register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJMP, I=1, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(dr, agl);				// 02 DR ← AGL
      MEMREAD_PAGE0(agl, pc), /action_incdr;	// 03 PC ← mem[MBD:AGL]; DR++
      MEMREAD_PAGE0(dr, mbp), END;		// 05 MBP ← mem[MBD:AGL+1]

// ⑤ LJMP (always with I=1), register double indirect autoincrement addressing mode.
// NOTE: If /action_incdr can happen fast enough, we can shave off two cycles here.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJMP, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);	                // 02 DR ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, pc);	                // 04 PC ← mem[MBD:DR]
      /action_incdr;                            // 06 DR++
      MEMREAD_PAGE0(dr, mbp);	                // 07 MBP ← mem[MBD:DR]
      /action_incdr;                            // 09 DR++
      MEMWRITE_PAGE0(agl, dr), END;             // 10 mem[MBD:AGL] ← DR


// ⑥ LJMP (always with I=1), register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJMP, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);	                // 02 DR ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, mbp);	                // 04 MBP ← mem[MBD:DR]
      /action_decdr;                            // 06 DR--
      MEMREAD_PAGE0(dr, pc);	                // 07 PC ← mem[MBD:DR]
      /action_decdr;                            // 09 DR--
      MEMWRITE_PAGE0(agl, dr), END;             // 10 mem[MBD:AGL] ← DR


// ⑦ LJMP (always with I=1), register indirect stack addressing mode.
// NOTE: Pops pairs of (MBP, PC) tuples off a stack and jumps to
// them. Push MBP onto the stack first.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LJMP, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);	                // 02 DR ← mem[MBD:AGL]
      MEMREAD_PAGE0(dr, pc);	                // 04 PC ← mem[MBD:DR]
      /action_decdr;                            // 06 DR--
      MEMREAD_PAGE0(dr, mbp);	                // 07 MBP ← mem[MBD:DR]
      /action_decdr;                            // 09 DR--
      MEMWRITE_PAGE0(agl, dr), END;             // 10 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE JMP INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① JMP, local address addressing mode
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(pc, agl), END;			// 02 PC ← AGL

// ② JMP, register address addressing mode
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(pc, agl), END;			// 02 PC ← AGL

// ③ JMP, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_CODE(agl, pc), END;		// 02 PC ← mem[MBP:AGL]

// ④ JMP, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, pc), END;		// 02 PC ← mem[MBD:AGL]

// ⑤ JMP, double register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_incdr;	// 04 PC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;             // 06 mem[MBD:AGL] ← DR

// ⑥ JMP, double register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_decdr;	// 04 PC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;             // 06 mem[MBD:AGL] ← DR

// ⑦ JMP, double register indirect autoincrement addressing mode.
// NOTE: behaves like ⑥, popping subroutine locations from a stack
// register and jumping to them.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JMP, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_decdr;	// 04 PC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;             // 06 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE JSR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① JSR, local address addressing mode
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=0, R=X, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      SET(pc, agl), END;			// 04 PC ← AGL

// ⓢ JSR, register address addressing mode
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=0, R=X, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      SET(pc, agl), END;			// 04 PC ← AGL

// ③ JSR, local indirect address addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      MEMREAD_CODE(agl, pc), END;		// 04 PC ← mem[MBP:AGL]

// ④ JSR, register indirect address addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      MEMREAD_PAGE0(agl, pc), END;		// 04 PC ← mem[MBD:AGL]

// ⑤ JSR, double register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      MEMREAD_PAGE0(agl, dr);			// 04 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_incdr;	// 06 PC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 08 mem[MBD:AGL] ← DR

// ⑥ JSR, double register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      MEMREAD_PAGE0(agl, dr);			// 04 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_decdr;	// 06 AC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 08 mem[MBD:AGL] ← DR

// ⑦ JMP, double register indirect autoincrement addressing mode.
// NOTE: behaves like ⑥, popping subroutine locations from a stack
// register and jumping to them.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=JSR, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      STACK_PUSH(pc);				// 02 mem[SP++] ← PC; CLI
      MEMREAD_PAGE0(agl, dr);			// 04 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, pc), /action_decdr;	// 06 AC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 08 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE ISZ INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// First, without skips. The last microinstruction is an END.

// ① ISZ, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, ac);	                // 02 AC ← mem[MBP:AGL]
      /action_incac;				// 04 AC++;
      MEMWRITE_LOCAL(agl, ac), if_z;            // 05 mem[MBP:AGL] ← AC
      END;					// 07

// ② ISZ, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, ac);	                // 02 AC ← mem[MBD:AGL]
      /action_incac;				// 04 AC++;
      MEMWRITE_PAGE0(agl, ac), if_z;            // 05 mem[MBD:AGL] ← AC
      END;					// 07

// ③ ISZ, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_PAGE0(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_PAGE0(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ④ ISZ, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑤ ISZ, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑥ ISZ, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09

// ⑦ ISZ, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      END;					// 09


// And now the same, with skips taken: /action_incpc is executed in
// the last microstep.

// ① ISZ, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, ac);	                // 02 AC ← mem[MBP:AGL]
      /action_incac;				// 04 AC++;
      MEMWRITE_LOCAL(agl, ac), if_z;            // 05 mem[MBP:AGL] ← AC
      END;					// 07

// ② ISZ, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, ac);	                // 02 AC ← mem[MBD:AGL]
      /action_incac;				// 04 AC++;
      MEMWRITE_PAGE0(agl, ac), if_z;            // 05 mem[MBD:AGL] ← AC
      /action_incpc, END;			// 07 PC++;

// ③ ISZ, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_PAGE0(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_PAGE0(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ④ ISZ, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑤ ISZ, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_incac;				// 06 AC++;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑥ ISZ, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;

// ⑦ ISZ, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=ISZ, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac);	                // 04 AC ← mem[MBD:DR]
      /action_decac;				// 06 AC--;
      MEMWRITE_DATA(dr, ac), if_z;		// 07 mem[MBD:DR] ← AC
      /action_incpc, END;			// 09 PC++;



///////////////////////////////////////////////////////////////////////////////
//
// THE LOAD INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① LOAD, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, ac), END;		// 02 AC ← mem[MBP:AGL]

// ② LOAD, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, ac), END;		// 02 AC ← mem[MBD:AGL]

// ③ LOAD, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_DATA(dr, ac), END;		// 04 AC ← mem[MBD:DR]

// ④ LOAD, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac), END;		// 04 AC ← mem[MBD:DR]

// ⑤ LOAD, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑥ LOAD, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, ac), /action_decdr;	// 04 AC ← mem[MBD:DR]; DR--;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑦ LOAD, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LOAD, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, MEMREAD_DATA(dr, ac);	// 04 DR--; AC ← mem[MBD:DR];
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE STORE INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① STORE, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMWRITE_LOCAL(agl, ac), END;		// 02 mem[MBP:AGL] ← AC

// ② STORE, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMWRITE_PAGE0(agl, ac), END;		// 02 mem[MBD:AGL] ← AC

// ③ STORE, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMWRITE_DATA(dr, ac), END;		// 04 mem[MBD:DR] ← AC

// ④ STORE, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMWRITE_DATA(dr, ac), END;		// 04 mem[MBD:DR] ← AC

// ⑤ STORE, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMWRITE_DATA(dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑥ STORE, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMWRITE_DATA(dr, ac), /action_decdr;	// 04 mem[MBD:DR] ← AC; DR--;
      MEMWRITE_PAGE0(agl, dr);			// 06 mem[MBD:AGL] ← DR

// ⑦ STORE, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=STORE, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMWRITE_DATA(dr, ac), /action_incdr;	// 04 AC ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE IN INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// I/O space is 16 bits wide. The first 10 bits of those are faster to use, and
// these are all the CFT bothers with.

// ① IN, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOREAD(agl, ac), END;     		// 02 AC ← io[AGL]

// ② IN, direct addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOREAD(agl, ac), END;		        // 02 AC ← io[AGL]

// ③ IN, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOREAD(dr, ac), END;      		// 04 AC ← io[DR]

// ④ IN, indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOREAD(dr, ac), END;		        // 04 AC ← io[DR]

// ⑤ IN, indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOREAD(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑥ IN, indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOREAD(dr, ac), /action_decdr;		// 04 AC ← io[DR]; DR--;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑦ IN, indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=IN, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, IOREAD(dr, ac);		// 04 DR--; AC ← io[DR];
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR



///////////////////////////////////////////////////////////////////////////////
//
// THE OUT INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① OUT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;			// 02 io[AGL] ← AC

// ② OUT, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac), END;			// 02 io[AGL] ← AC

// ③ OUT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac), END;			// 04 io[DR] ← AC

// ④ OUT, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), END;			// 04 io[DR] ← AC

// ⑤ OUT, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR

// ⑥ OUT, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      MEMWRITE_PAGE0(agl, dr);			// 06 mem[MBD:AGL] ← DR

// ⑦ OUT, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OUT, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      MEMWRITE_PAGE0(agl, dr), END;		// 06 mem[MBD:AGL] ← DR



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

// First, without skips. Remember, SKIP is active low.

// ① IOT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), END;			// 04 AC ← io[AGL]

// ② IOT, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), END;			// 04 AC ← io[AGL]

// ③ IOT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]

// ④ IOT, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]

// ⑤ IOT, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE_PAGE0(agl, dr), END;		// 08 mem[MBD:AGL] ← DR

// ⑥ IOT, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE_PAGE0(agl, dr);			// 08 mem[MBD:AGL] ← DR

// ⑦ IOT, register indirect stack addressing mode.
// Note: This acts like register indirect mode, so it's microcoded coded like
// it too.
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), END;			// 06 AC ← io[DR]


// And Now, with skips requested. Remember, SKIP is active low.

// ① IOT, local addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), /action_incpc, END;	// 04 AC ← io[AGL]; PC++

// ② IOT, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      IOWRITE(agl, ac);				// 02 io[AGL] ← AC
      IOREAD(agl, ac), /action_incpc, END;	// 04 AC ← io[AGL]; PC++

// ③ IOT, local indirect addressing mode.
// TODO: This addressing mode is pointless. Reuse microprogram?
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), /action_incpc, END;	// 04 AC ← io[DR]; PC++

// ④ IOT, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac);				// 04 io[DR] ← AC
      IOREAD(dr, ac), /action_incpc, END;	// 04 AC ← io[DR]; PC++

// ⑤ IOT, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_incdr;		// 04 AC ← io[DR]; DR++;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE_PAGE0(agl, dr), /action_incpc, END; // 08 mem[MBD:AGL] ← DR; PC++

// ⑥ IOT, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      IOWRITE(dr, ac), /action_decdr;		// 04 io[DR] ← AC; DR--;
      IOREAD(dr, ac);				// 06 AC ← io[DR]
      MEMWRITE_PAGE0(agl, dr), /action_incpc, END; // 08 mem[MBD:AGL] ← DR; PC++

// ⑦ IOT, register indirect stack addressing mode.
// Note: This acts like register indirect mode, so it's microcoded coded like
// it too.
start RST=1, INT=1, IN_RESERVED=X, SKIP=0, OP=IOT, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
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
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_add), END;			// 04 AC ← AC + B

// ② ADD, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_add), END;			// 04 AC ← AC + B

// ③ ADD, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_add), END;			// 06 AC ← AC + B

// ④ ADD, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_add), END;			// 06 AC ← AC + B

// ⑤ ADD, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_add), END;			// 08 AC ← AC + B

// ⑥ ADD, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_add), END;			// 08 AC ← AC + B

// ⑦ ADD, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=ADD, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, MEMREAD_DATA(dr, alu_b);	// 04 DR--; B ← mem[MBD:DR];
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_add), END;			// 08 AC ← AC + B



///////////////////////////////////////////////////////////////////////////////
//
// THE AND INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① AND, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_and), END;			// 04 AC ← AC + B

// ② AND, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_and), END;			// 04 AC ← AC + B

// ③ AND, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_and), END;			// 06 AC ← AC + B

// ④ AND, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_and), END;			// 06 AC ← AC + B

// ⑤ AND, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_and), END;			// 08 AC ← AC + B

// ⑥ AND, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_and), END;			// 08 AC ← AC + B

// ⑦ AND, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=AND, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, MEMREAD_DATA(dr, alu_b);	// 04 DR--; B ← mem[MBD:DR];
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_and), END;			// 08 AC ← AC + B



///////////////////////////////////////////////////////////////////////////////
//
// THE OR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① OR, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_or), END;			// 04 AC ← AC + B

// ② OR, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_or), END;			// 04 AC ← AC + B

// ③ OR, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_or), END;			// 06 AC ← AC + B

// ④ OR, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_or), END;			// 06 AC ← AC + B

// ⑤ OR, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_or), END;			// 08 AC ← AC + B

// ⑥ OR, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_or), END;			// 08 AC ← AC + B

// ⑦ OR, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=OR, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, MEMREAD_DATA(dr, alu_b);	// 04 DR--; B ← mem[MBD:DR];
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_or), END;			// 08 AC ← AC + B



///////////////////////////////////////////////////////////////////////////////
//
// THE XOR INSTRUCTION
//
///////////////////////////////////////////////////////////////////////////////

// ① XOR, local addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;			// 04 AC ← AC + B

// ② XOR, register addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, alu_b);                // 02 B ← mem[MBP:AGL]
      SET(ac, alu_xor), END;			// 04 AC ← AC + B

// ③ XOR, local indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=1, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_LOCAL(agl, dr);			// 02 DR ← mem[MBP:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 AC ← mem[MBD:DR]
      SET(ac, alu_xor), END;			// 06 AC ← AC + B

// ④ XOR, register indirect addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=1, R=1, SUBOP=XXX, IDX=IDX_REG;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b);			// 04 B ← mem[MBD:DR]
      SET(ac, alu_xor), END;			// 06 AC ← AC + B

// ⑤ XOR, register indirect autoincrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=1, R=1, SUBOP=XXX, IDX=IDX_INC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_incdr;	// 04 B ← mem[MBD:DR]; DR++;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 08 AC ← AC + B

// ⑥ XOR, register indirect autodecrement addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=1, R=1, SUBOP=XXX, IDX=IDX_DEC;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      MEMREAD_DATA(dr, alu_b), /action_decdr;	// 04 B ← mem[MBD:DR]; DR--;
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 08 AC ← AC + B

// ⑦ XOR, register indirect stack addressing mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=XOR, I=1, R=1, SUBOP=XXX, IDX=IDX_SP;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      MEMREAD_PAGE0(agl, dr);			// 02 DR ← mem[MBD:AGL]
      /action_decdr, MEMREAD_DATA(dr, alu_b);	// 04 DR--; B ← mem[MBD:DR];
      MEMWRITE_PAGE0(agl, dr);	                // 06 mem[MBD:AGL] ← DR
      SET(ac, alu_xor), END;			// 08 AC ← AC + B



///////////////////////////////////////////////////////////////////////////////
//
// THE LIA/LI INSTRUCTIONS
//
///////////////////////////////////////////////////////////////////////////////

// Only defined for I=0.

// ① LIA, local mode. With R=1, LIA register mode *and* LI, immediate mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LIA, I=0, R=0, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(ac, agl), END;			// 02 AC ← AGL

// ② LI, immediate mode. Also LIA, register mode.
start RST=1, INT=1, IN_RESERVED=X, SKIP=X, OP=LIA, I=0, R=1, SUBOP=XXX, IDX=XX;
      FETCH_IR;			                // 00 IR ← mem[PC++]
      SET(ac, agl), END;			// 02 AC ← AGL



///////////////////////////////////////////////////////////////////////////////
//
// THE RETx INSTRUCTION GROUP (IRET, LRET, RET)
//
///////////////////////////////////////////////////////////////////////////////

// EXACT PATTERNS TBD
//        9876543210
// IRET = 11--------                    ; Transfer SP to AC
// LRET = 1-1-------                    ; Transfer AC to SP
// RET  = 1--1------                    ; Push flags
// ???  = 1---1-----                    ; Pop flags

// IRET
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 0000------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=0, IDX=IDX_REG;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(ac), /action_sti;		// 02 AC ← mem[--SP]
      STACK_POP(pc);				// 05 PC ← mem[--SP]
      STACK_POP(mbp_flags), END;                // 08 flags:MBP ← mem[--SP]


// LRET
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 0001------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=0, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc);				// 02 PC ← mem[--SP]
      STACK_POP(mbp), END;			// 05 MBP ← mem[--SP]


// LRET
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 0010------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=0, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(pc), END;			// 02 PC ← mem[--SP]


// Available:
// ????
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 0011------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=0, IDX=IDX_SP;
//...


///////////////////////////////////////////////////////////////////////////////
//
// THE TRANSFER INSTRUCTION GROUP
//
///////////////////////////////////////////////////////////////////////////////

// EXACT PATTERNS TBD
//        9876543210
// TSA  = 11--------                    ; Transfer SP to AC
// TAS  = 1-1-------                    ; Transfer AC to SP
// PHF  = 1--1------                    ; Push flags
// PPF  = 1---1-----                    ; Pop flags

// TSA
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 1000------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=1, IDX=IDX_REG;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(AC, SP), END;				// 02 SP ← AC


// TAS
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 1001------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=1, IDX=IDX_INC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      SET(SP, AC), END;				// 02 AC ← SP



///////////////////////////////////////////////////////////////////////////////
//
// THE STACK INSTRUCTION GROUP
//
///////////////////////////////////////////////////////////////////////////////

// PHA
// PPA

// PHF
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 1010------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=1, IDX=IDX_DEC;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_PUSH(flags), END;			// 02 mem[SP++] ← flags


// PPF
// Instruction pattern: INSTR I R OPERAND
//                      OP1   0 0 0011------ (TBD)
start RST=1, INT=1, IN_RESERVED=X, SKIP=1, OP=OP1, I=0, R=0, IR9=0, IDX=IDX_SP;
      FETCH_IR;                                 // 00 IR ← mem[PC++]
      STACK_POP(flags), END;			// 02 flags ← mem[--SP]


//        9876543210
// STI  = -1--------                    ; Disable interrupts
// RTI  = -11011----                    ; Enable interrupts and return
// LRET = -00101----
// RET  = -00001----                    ; Return from subroutine
// CLI  = ------1---                    ; Enable interrupts

// TSA = ----1-----                    ; Transfer SP to AC
// TAS = -----1----                    ; Transfer AC to SP
// PHF = ------1---                    ; Push flags
// PPF = -------1--                    ; Pop flags
// PHA = --------1-                    ; Push AC
// PPA = ---------1                    ; Pop AC

// POP MBP

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////










///////////////////////////////////////////////////////////////////////////////
//
// ANYTHING BELOW HERE IS A TO-DO
//
///////////////////////////////////////////////////////////////////////////////

// This macro implements step 1. Useful for JMP-like instructions and literal
// addressing. And of course as a basis for direct and indirect modes.  Note
// the second cycle is not complete! The caller can add signals to it.
#define _FETCH_IR \
        _MEMREAD(PC, IR), /incpc


// This macro implements steps 1 and 2a:
//
// 1. IR <- mem[PC]
//    Deselect the memory, take the opportunity to step the PC.
// 2. DR <- mem[IR.operand]

#define _FETCH_DIRECT \
        _FETCH_IR; \
        _MEMREAD(agl, DR)

#define _FETCH_LITERAL _FETCH_DIRECT


// This macro takes care of most of the autoincrement
// microsteps. NOTE: this can be combined with the last step of
// another macro (as long as it doesn't modify the DR), as the only
// thing it does on its first microstep is to increase the DR.

#define _AUTOINC_3CYCLE \
        r_agl, w_ar, /stpdr; \
        r_dr, /mem, /wen;       \
        r_dr, /mem

#define _AUTOINC_2CYCLE \
        r_agl, w_ar, /stpdr; \
        r_dr, /mem, /wen

#define _AUTOINC _AUTOINC_2CYCLE











///////////////////////////////////////////////////////////////////////////////
//
// TRAP instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The TRAP instruction saves the current PC to memory location 0001
// and performs a jump to the specified address.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=0, SKIP=X, INC=X;
      _FETCH_IR;                // Fetch the instruction and operand. That's
                                // all we need.
      _MEMWRITE(cs2, pc);       // Store PC at location 0001.
      w_pc, r_agl, /end;        // Set the PC from AGL(IR.operand)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;           // Fetch the instruction and operand.
      _MEMWRITE(cs2, pc);       // Store PC at location 0001.
      w_pc, r_dr, /end;         // Set the PC from DR.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;           // Fetch the instruction and operand.
      _MEMWRITE(cs2, pc);       // Store PC at location 0001.
      w_pc, r_dr;
      _AUTOINC, /end;           // Autoindex



///////////////////////////////////////////////////////////////////////////////
//
// JMPII instruction (version 6)
//
///////////////////////////////////////////////////////////////////////////////

// The JMPII instruction performs a double indirection and sets the PC with its
// result. This is used in, among other places, Forth (where it's used as the
// Forth ENTER routine, which is used to start executing a word).
// Semantics:
//
// DR <- mem[AGL]
// PC <- mem[DR]
//
// Total semantics: PC <- mem[mem[AGL]]

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMPII, I=1, SKIP=X, INC=1;
      _FETCH_IR;                // Fetch the address and operand.
      _MEMREAD(agl, dr);        // DR <- mem[AGL]. # First indirection
      _MEMREAD(dr, PC), /end;   // PC <- mem[DR]. # Second indirection

// FIXED: Autoindex mode
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMPII, I=1, SKIP=X, INC=0;
      _FETCH_IR;                // Fetch the address and operand.
      _MEMREAD(agl, dr);        // DR <- mem[AGL]. # First indirection
      _MEMREAD(dr, PC);         // PC <- mem[DR]. # Second indirection
      _AUTOINC, /end;           // mem[AGL] <- ++DR


///////////////////////////////////////////////////////////////////////////////
//
// OP1 instruction.
//
///////////////////////////////////////////////////////////////////////////////

// PDP-8-style ‘microcoded’ instruction (in the PDP-8 sense, i.e. many
// instructions in one). No addressing modes or AGL used, but SKIP is
// used to determine what gets executed and what not.
//
// Note: ifX microcode instructions apply the condition to the NEXT
// microstep, which is why we list them last. SKIP=DONT_ACT means 'don't
// skip'.
//
// Bit allocation and sequencing:
//
//                     roll
//             9876543///
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
//
// (*) The final /end is necessary when the computer comes out of the
// HALT state.

// TO DO: Copy these two microprograms another 3 times, amend for all
// combinations of <V,L> inputs.

//
// Here are the OP1 macros with comments.
//
// #define OP1COMMON_SKIP1 \
//      w_ac, r_cs1, if6; \     // 4. If bit 7: do nothing here \
//      /cll, if5; \            // 5. If bit 6: do nothing here \
//      w_ac, alu_not, if4; \   // 6. If bit 5: complement A    \
//      /stpac, if3; \          // 7. If bit 4: increment A     \
//      /cpl, ifroll; \         // 8. If bit 3: complement L    \
//      w_ac, alu_roll; \               // 9. If roll: well, roll.      \
//      /end                    // (*)
//
//#define OP1COMMON_SKIP0 \
//      if6; \                    // 4. If bit 7: do nothing here \
//      if5; \                  // 5. If bit 6: do nothing here \
//      if4; \                  // 6. If bit 5: complement A    \
//      if3; \                  // 7. If bit 4: increment A     \
//      ifroll; \                       // 8. If bit 3: complement L    \
//      /end; \                 // 9. If roll: well, roll.      \
//      /end \                  // (*)
//*/

// And without (because they're multiline)
#define OP1COMMON_SKIP0 \
      w_ac, r_cs1, if6; \
      /cll, if5; \
      w_ac, alu_not, if4; \
      /stpac, if3; \
      /cpl, ifroll; \
      w_ac, alu_roll; \
      /end

#define OP1COMMON_SKIP1 \
      if6; \
      if5; \
      if4; \
      if3; \
      ifroll; \
      /end; \
      /end \

// V=1, L=1 (always executes all of instruction)
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      OP1COMMON_SKIP0;

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      OP1COMMON_SKIP1;


// V=0, L=1 (stops if IFV [if8] is set)
start UCB=XXXX, INT=1, RST=1, V=0, L=1, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      /end, if7;                // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=0, L=1, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


// V=1, L=0 (stops if IFL [if9] is set)
start UCB=XXXX, INT=1, RST=1, V=1, L=0, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      /end, if8;                // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=1, L=0, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


// V=0, L=0 (stops if IFL [if9] or IFV [if8] are set).
start UCB=XXXX, INT=1, RST=1, V=0, L=0, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      /end, if8;                // 2. If bit 9: end if L=0 (handled below)
      /end, if7;                // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=0, L=0, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;                      // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;                      // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


///////////////////////////////////////////////////////////////////////////////
//
// OP2 instruction.
//
///////////////////////////////////////////////////////////////////////////////

// PDP-8-style microcoded instruction. No addressing modes or AGL
// used, but SKIP is used to determine what gets executed and what not.
//
// Note: ifX microcode instructions apply the condition to the NEXT
// microstep, which is why we list them last. SKIP=DONT_ACT means 'don't
// skip'.
//
// Bit allocation and sequencing:
//
//                   branch
//             98765/////
// NOP =  OP2 '-----00000               ; 
// SNA =  OP2 '-----01---               ; A < 0 ==> PC++  (1)
// SZA =  OP2 '-----0-1--               ; A == 0 ==> PC++ (1)
// SLS =  OP2 '-----0--1-               ; L == 1 ==> PC++ (1)
// SSV =  OP2 '-----0---1               ; V == 1 ==> PC++ (1)
// SKIP = OP2 '-----10000               ; PC++
// SNN =  OP2 '-----11---               ; a >=0 ==> PC++  (2)
// SNZ =  OP2 '-----1-1--               ; A != 0 ==> PC++ (2)
// SCL =  OP2 '-----1--1-               ; L == 0 ==> PC++ (2)
// SCV =  OP2 '-----1---1               ; V == 0 ==> PC++ (2)
// CLA =  OP2 '--1-------               ; A <- 0
// CLI =  OP2 '---1------               ; INT <= 0
// STI =  OP2 '----1-----               ; INT <= 1
//
// (1) Conditions ORred together
// (2) Conditions ANDed together. The OR/AND logic isn't microcoded,
// it's part of the hardwired decoding of the branch bits.
//
// The branch test logic, along with the bits set in the
// microinstruction, feed the SKIP field, so SKIP handles both
// microinstruction skips and machine code branches.

// TODO: I think r_cs produces 0001 here, not 0000. Check it!
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP2, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      ifbranch;
      /incpc, if7;              // 5. If branching: branch (if needed)
      w_ac, r_cs1, if6;         // 6. If bit 6: A <= 0
      /cli, if5;                // 7. If bit 5: I <= 0
      /sti, /end;               // 8. If bit 4: I <= 1
      /end;                     // (*)

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP2, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      ifbranch;                 // 4. If bit 7: PR <= PC (note: PC <- PC)
      if7;                      // 5. If branching: branch (if needed)
      if6;                      // 6. If bit 6: A <= 0
      if5;                      // 7. If bit 5: I <= 0
      /end;                     // 8. If bit 4: I <= !I
      /end;                     // (*)


///////////////////////////////////////////////////////////////////////////////
//
// POP instruction.
//
///////////////////////////////////////////////////////////////////////////////

// POP is the 'opposite' instruction of STORE I at an autoincrement location
// (used as a stack PUSH). POP decrements the memory location provided (storing
// it back), then loads AC with the decremented value.

// Semantics:
//   DR <- mem[AGL]
//   DR <- DR - 1
//   mem[AGL] <- DR
//   AC <- mem[DR]
//
// Total semantics: AC <- mem[--AGL]

// No autoincrement
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=POP, I=1, SKIP=X, INC=X;
      _FETCH_DIRECT;            // IR <- mem[PC++], DR <- mem[AGL]

      /dec, /stpdr;             // DR--
      r_dr, /mem, /wen;         // mem[AGL] <- DR (AR is already set up)

      _MEMREAD(dr, ac), /end;   // AC <- mem[DR]


// End of file.
