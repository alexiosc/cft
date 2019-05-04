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

// Define the opcodes for convenience.

#define TRAP  0000
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
#define OP1   1100
#define OP2   1101		// OP=1101, I=0: OP1
#define POP   1101		// v6. OP=1101, I=1: POP
#define ISZ   1110
#define LIA   1111		// OP=1111, I=0: LIA/LI
#define JMPII 1111		// v6. OP=1111, I=1: JMPII

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
// TRAP            X         X                 X
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

cond UCB:4;		      // Microcode Bank (µCB) Extension
cond RST:1;                   // Resetting
cond INT:1;                   // Servicing an interrupt request
cond V:1;		      // The oVerflow flag
cond L:1;		      // The Link flag
cond OP:4;                    // The opcode field of the IR.
cond I:1;                     // The indirection field of the IR.
cond SKIP:1;                  // The skip flag from the skip logic.
cond INC:1;		      // The IR points to an autoincrement location.

// The uaddr field of the address is mandatory. This just sets its width.
cond uaddr:4;

///////////////////////////////////////////////////////////////////////////////
//
// Signals: outputs of the MicroROM
//
///////////////////////////////////////////////////////////////////////////////

// Register order: AR, IR, A, DR, PC, dbus.
//
// UNIT   LHS   RHS
// ----------------
// DBUS   001   001
// AR    010
// PC     011   011
// IR     100
// DR     101   100
// A      110   101
// AGL          010
// CONST        110   When OP[0] = 0: CONST = 0000. When OP[0] = 1: CONST = 0001.
// ALU          111

field  R_UNIT         = ____________________XXXX; // Read unit field
//signal r_dbus       = ....................0001; // Read from the data bus

signal r_agl          = ....................0010; // Read from address generation logic
signal r_pc           = ....................0011; // Read from PC
signal r_dr           = ....................0100; // Read from DR
signal r_ac           = ....................0101; // Read from the Accumulator
//signal r_spare6     = ....................0110; //   ** RESERVED
//signal r_spare7     = ....................0111; //   ** RESERVED

signal alu_add        = ....................1000; // ALU: Read from the Adder unit
signal alu_and        = ....................1001; // ALU: Read from the AND unit
signal alu_or         = ....................1010; // ALU: Read from the OR unit
signal alu_xor        = ....................1011; // ALU: Read from the XOR unit

signal alu_roll       = ....................1100; // ALU: Read from the ROLL unit
                                                  //   (roll op controlled by IR)
signal alu_not        = ....................1101; // ALU: Read from the NOT unit
signal r_cs1          = ....................1110; // ALU: Read from the Constant Store
                                                  //   (bank 1)
signal r_cs2          = ....................1111; // ALU: Read from the Constant Store
                                                  //   (bank 2)

field  W_UNIT         = _________________XXX____; // Write unit field
//signal w_dbus       = .................001....; // Write to the data bus
signal w_ar           = .................010....; // Write to the AR
signal w_pc           = .................011....; // Write to the PC
signal w_ir           = .................100....; // Write to the IR
signal w_dr           = .................101....; // Write to the DR
signal w_ac           = .................110....; // Write to the Accumulator
signal w_alu          = .................111....; // Write to the ALU's B port

field  OP_IF          = _____________XXXX_______; // OPx IF field
signal if9            = .............0111.......; // SKIP = IR[9]
signal if8            = .............0110.......; // SKIP = IR[8]
signal if7            = .............0101.......; // SKIP = IR[7]
signal if6            = .............0100.......; // SKIP = IR[6]
signal if5            = .............0011.......; // SKIP = IR[5]
signal if4            = .............0010.......; // SKIP = IR[4]
signal if3            = .............0001.......; // SKIP = IR[3]
signal ifv            = .............1010.......; // SKIP = V
signal ifl            = .............1011.......; // SKIP = L
signal ifzero         = .............1100.......; // SKIP = Z
signal ifneg          = .............1101.......; // SKIP = N
signal ifroll         = .............1110.......; // SKIP = roll_logic(IR[2:0])
signal ifbranch       = .............1111.......; // SKIP = skip_logic(IR[3:0])

//                      76543210FEDCBA9876543210
signal /cpl           = ............1...........; // Complement L
signal /cll           = ...........1............; // Clear L flag
signal /sti           = ..........1.............; // Set I flag
signal /cli           = .........1..............; // Clear I flag

//                      76543210FEDCBA9876543210
signal /incpc         = ........1...............; // Step the PC.
signal /stpdr         = .......1................; // Step DR (for autoinc/-dec mode)
signal /stpac         = ......1.................; // Step AC
signal /dec           = .....1..................; // 1 (default): increment. 0: decrement.

signal /mem           = ....1...................; // Memory access
signal /io            = ...1....................; // Input/Output enable
signal /R             = ..1.....................; // Memory read
signal /WEN           = .1......................; // Memory write
signal /END           = 1.......................; // Reset uaddr, go to fetch state.

// Note: /W is /WEN AND CLK5 and is synthesised elsewhere.

// ALU ops:
//
// 001 ADD
// 010 AND
// 011 OR
// 100 XOR
// 101 NOT
// 110 ROLLS (RBL, RBR, RNL, RNR)

// Also:
//
// OP1/2 bit testing logic (3 bits)
//
// * OP1: L <- 0
// * OP1: L <- ~L
// * OP1: A <- ~A
// * OP1: INC <L,A>
// * OP1: RBL
// * OP1: RBR
// * OP1: RNL
// * OP1: RNR
// * OP1: HALT
//
// * OP2: Skip logic enable
// * OP2: CLI
// * OP2: SEI


///////////////////////////////////////////////////////////////////////////////
//
// Crucial microcode macros.
//
///////////////////////////////////////////////////////////////////////////////


// To read from RAM:
//
// 1. Deselect CS and OE for the RAM. This will already have been
//    done in the last step of the fetch cycle.
// 2. Select the chip, enable reading.
// 3. Drive the address bus.
// 4. Read from the data bus.
// 5. Deselect the chip.

// This is the read cycle we're going for:
//
// uSTEP  0.......... 1.......... 2.......... 3.......... 4...........  
// ___     _____       _____       _____       _____       _____
// T12 ___|     |_____|     |_____|     |_____|     |_____|     |_____
// ___ ___       _____       _____       _____       _____       _____
// T34    |_____|     |_____|     |_____|     |_____|     |_____|     
//
// AR XXXXX|<============ VALID ==============>|XXXXXXXXXXXXXXXXXXXXXXXXXXX
//
// AB  ZZZZZ|<============ DRIVEN =============>|ZZZZZZZZZZZZZZZZZZZZZZZZZZZ
// ___ _____                                     ______________________
// DAB      |___________________________________|
// ___ _____                                     ______________________
// MEM      |___________________________________|
// _   _____             _____________________________________________     
// R        |___________|                         
// __  __________             ________________________________________     
// MR*           |___________|    ::::
//                                ::::
//                                ::::
// BUS SAMPLE                     ||||
//
//
// * MR = is buffered from the ALU microcode ROM on the rising edge of CLK2,
// (falling edge of CLK). The pulse is one period of CLK, synchronised with
// CLK2, which is what we use for memory. This implies there are two buffers
// needed to hold microcode output: one latches just after the microcode ROM
// outputs its signals, one latches on CLK2.
//
// ** The RAM outputs valid signals once its address has stabilised. We allow
// it to also process the MR pulse, if it needs it.

// This macro defines a memory read cycle, i.e. steps 2 to 4 above.

// Three-cycle read (obsolete)
#define _MEMREAD_3CYCLE(_areg, _dreg) \
    w_ar, r_##_areg; \
    /MEM, /R; \
    w_##_dreg, hold
    //-/DAB, -/MEM, -/IO, -/R, -/WEN

// Two-cycle read
#define _MEMREAD_2CYCLE(_areg, _dreg) \
    w_ar, r_##_areg; \
    /MEM, /R, w_##_dreg
    //-/DAB, -/MEM, -/IO, -/R, -/WEN

#define _MEMREAD _MEMREAD_2CYCLE
    
#define _IOREAD(_areg, _dreg) \
    w_ar, r_##_areg; \
    /IO, /R, w_##_dreg


// At the end of this macro, /DAB, and /MEM are still active. It's assumed that
// the caller of the macro will deactivate the lines, deselecting the
// memory. This may not be necessary, though.

// This macro deselects the memory and terminates memory access. Needed between
// memory read cycles.
#define _DESEL \
    -/MEM, -/IO, -/R, -/WEN	   // 5. Deselect I/O and memory.


// To write to RAM:
//
// 1. Deselect CS and OE for the RAM. This will already have been
// done in the last step of the fetch cycle.
// 2. Select the chip, enable writing.
// 3. Drive the address bus.
// 4. Drive the data bus.
// 5. Deselect the chip. (implicit)

// This is the write cycle we're going for:
//
// uSTEP  0.......... 1.......... 2.......... 3.......... 4...........  
//         _____       _____       _____       _____       _____
// CLK ___|     |_____|     |_____|     |_____|     |_____|     |_____
//     ___       _____       _____       _____       _____       _____
// CLK2   |_____|     |_____|     |_____|     |_____|     |_____|     
//
// AR XXXXX|<============ VALID ==============>|XXXXXXXXXXXXXXXXXXXXXXXXXXX
//
// AB  ZZZZZ|<============ DRIVEN =============>|ZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//     _____                                     ______________________
// DAB      |___________________________________|
//     _____                                     ______________________
// MEM      |___________________________________|
//           ___________ 
// DDB* ZZZZ|___________|<==== CPU DRIVES =====>|ZZZZZZZZZZZZZZZZZZZZZZ
//     _____                         _________________________________     
// W        |_______________________|             
//     _____                         _________________________________
// MW**     |_______________________|         
//                                  :          
// LATCH DATA                       | on rising edge of MW
//
// * The CPU drives the data bus 
//
// ** Unlike MR, MW rises on the rising edge of CLK.

// This macro implements steps 2 to 4, which are enough for the
// microcode of the STORE instruction.
//
// AR <- DR, /DAB, /MEM, /WEN    // 2. Select memory, enable writing. Latch to AR.
// /DAB, /MEM, /WEN		 // 3. Drive the address bus.
// DBUS <- A, hold, /end	 // 4. Drive the data bus. End.

#define _MEMWRITE_3CYCLE(_areg, _dreg) \
    w_ar, r_##_areg; \
    r_##_dreg, /mem, /wen; \
    r_##_dreg, /mem

// Note: second cycle not finished.
#define _MEMWRITE_2CYCLE(_areg, _dreg) \
    w_ar, r_##_areg; \
    r_##_dreg, /mem, /wen

#define _MEMWRITE _MEMWRITE_2CYCLE


// The fetch cycle:
//
// 1. Read IR from mem[PC]. At this point, the indirection bit is
//    loaded into IR and the microprogram automatically branches
//    accordingly to 2a or 2b (for each instruction):

// 2a. I=0: Read operand from memory.
//
// 2b. I=1: Read address of operand from memory.
// 3b.      Read operand from memory.
//
// 4. Execute.


// This macro implements step 1. Useful for JMP-like instructions and literal
// addressing. And of course as a basis for direct and indirect modes.
// Note the second cycle is not complete! The caller can add flags to it.
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
        r_dr, /mem, /wen;	\
        r_dr, /mem

#define _AUTOINC_2CYCLE \
	r_agl, w_ar, /stpdr; \
        r_dr, /mem, /wen

#define _AUTOINC _AUTOINC_2CYCLE


///////////////////////////////////////////////////////////////////////////////
//
// Fill the entire microcode ROM with /end signals.
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

start UCB=XXXX, INT=X, RST=X, V=X, L=X, OP=XXXX, I=X, SKIP=X, INC=X;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;

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

start UCB=XXXX, INT=X, RST=1, V=X, L=X, OP=XXXX, I=X, SKIP=X, INC=X;
      _FETCH_IR;		// Just fetch an instruction.


///////////////////////////////////////////////////////////////////////////////
//
// Reset code
//
///////////////////////////////////////////////////////////////////////////////

// The reset sequence is little more than a fetch sequence, but we pad
// it with a few NOPs.

start UCB=XXXX, INT=X, RST=0, V=X, L=X, OP=XXXX, I=X, SKIP=X, INC=X;
      w_pc, r_cs1, /cli, /end;
      hold;
      hold;
      hold;
      hold;	
      /end;


///////////////////////////////////////////////////////////////////////////////
//
// Interrupt service code
//
///////////////////////////////////////////////////////////////////////////////

start UCB=XXXX, INT=0, RST=1, V=X, L=X, OP=XXXX, I=X, SKIP=X, INC=X;
      /cli, _MEMWRITE(cs1, pc);	// Store PC at location 0002.
      w_pc, r_cs2, /end;		// Jump to location fff8.
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;
      /end;

///////////////////////////////////////////////////////////////////////////////
//
// Load instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=LOAD, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, ac); // A <- mem[agl].
      _DESEL, /end;	 // The fetch cycle begins with a memory read.

// Indirect mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=LOAD, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, ac);		// A <- mem[DR].
      _DESEL, /end;

// FIXED: Autoindex mode
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=LOAD, I=1, SKIP=X, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      //_DESEL;			// Deselect all memory signals and wait.
      _MEMREAD(dr, ac);		// Indirection step: A <- mem[DR]
      _AUTOINC;			// mem[agl] <- ++DR
      _DESEL, /end;	        // The fetch cycle begins with a memory read.



///////////////////////////////////////////////////////////////////////////////
//
// STORE instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=STORE, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      _MEMWRITE(agl, ac);	// mem[agl] <- A
      _DESEL, /end;		// The fetch cycle begins with a memory read.

// Indirect mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=STORE, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      _MEMWRITE(dr, ac);	// mem[DR] <- A
      _DESEL, /end;

// FIXED: Autoindex mode
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=STORE, I=1, SKIP=X, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      //_DESEL;			// Deselect all memory signals and wait.
      _MEMWRITE(dr, ac);	// Indirection step: mem[DR] <- A
      _AUTOINC;			// mem[agl] <- ++DR
      _DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// IOT instruction: OUT A, wait, then IN a. Implements CPU extensions
// or memory-mapped 'functions'.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      r_ac, /io, /wen;
      //r_ac, /io;               // 2-cycle I/O
      
      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r, /end;


// LITERAL MODE INSTRUCTION with SKIP asserted.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      r_ac, /io, /wen;
      //r_ac, /io;               // 2-cycle I/O
      
      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r, /incpc, /end; // Increment the PC here.


// Direct mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=1, SKIP=DONT_ACT, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_ar, r_dr;		// Indirection.
      r_ac, /io, /wen;
      //r_ac, /io;               // 2-cycle I/O

      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r, /end;

// Direct mode, SKIP asserted
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=1, SKIP=ACT, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_ar, r_dr;		// Indirection.
      r_ac, /io, /wen;
      //r_ac, /io;               // 2-cycle I/O

      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r, /incpc, /end;

// Autoindex mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=1, SKIP=DONT_ACT, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      w_ar, r_dr;		// Indirection: io[dr] <- A
      r_ac, /io, /wen;

      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r;
      _AUTOINC, /end;		// mem[agl] <- ++DR
      
// Autoindex mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IOT, I=1, SKIP=ACT, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      //_DESEL;			// Deselect all memory signals and wait.
      w_ar, r_dr;		// Indirection: io[dr] <- A
      r_ac, /io, /wen;
      //r_ac, /io;               // 2-cycle I/O

      // The CPU may be inhibited here to get wait states.

      w_ac, /io, /r;
      _AUTOINC, /incpc, /end;	// mem[agl] <- ++DR
      


///////////////////////////////////////////////////////////////////////////////
//
// IN instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IN, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      w_ac, /io, /r, /end;
      //_DESEL, /end;	// Release the address and data bus.

// Direct mode. (I=1, one level of indirection)
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IN, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _IOREAD(dr, ac);		// A <- io[DR].
      _DESEL, /end;

// FIXED: Autoindex mode
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=IN, I=1, SKIP=X, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      //_DESEL;			// Deselect all memory signals and wait.
      _IOREAD(dr, ac);		// Indirection step: A <- mem[DR]
      _AUTOINC;			// mem[agl] <- ++DR
      _DESEL, /end;	        // The fetch cycle begins with a memory read.





///////////////////////////////////////////////////////////////////////////////
//
// OUT instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OUT, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      r_ac, /io, /wen, /end;	// 2-cycle I/O
      //r_ac, /io, /end;

// Direct mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OUT, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_ar, r_dr;		// Indirection.
      r_ac, /io, /wen, /end;	// 2-cycle I/O
      //r_ac, /io, /end;

// FIXED: Autoindex mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OUT, I=1, SKIP=X, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      //_DESEL;			// Deselect all memory signals and wait.

      w_ar, r_dr;		// was: r_agl (why?)
      r_ac, /io, /wen;		
      //r_ac, /io;               // 2-cycle I/O

      _AUTOINC, /end;	        // mem[agl] <- ++DR
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// ADD instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The ALU operation is decoded directly for the IR. Further, the ALU is
// always enabled and always performs operations between A and DR. There's
// very little we need to do here but latch data from the ALU back to A.
//
// We use a register for the output of the ALU to ensure the result is stable
// before sticking it back into A.
//
// Carry propagation through the 3 ALU ROMs can take up to 210ns for
// 70ns ROMs, so we introduce a wait state.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ADD, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, alu);       // B <- mem[DR].
      //alu_add;                  // Start calculating (wait state)
      w_ac, alu_add, /end;	// A <- A + B.
 
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ADD, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      //alu_add;                  // Start calculating (wait state)
      w_ac, alu_add, /end;	// A <- A + B.

// FIXED: Autoincrement
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ADD, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      //alu_add;                  // Start calculating (wait state)
      w_ac, alu_add;		// A <- A + B.
      _AUTOINC, /end;		// Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// AND instruction.
//
///////////////////////////////////////////////////////////////////////////////

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=AND, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, alu);       // B <- mem[DR].
      w_ac, alu_and, /end;	// A <- A & B.
 
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=AND, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_and, /end;	// A <- A & B.

// FIXED: Autoincrement
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=AND, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_and;		// A <- A & B.
      _AUTOINC, /end;		// Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.

///////////////////////////////////////////////////////////////////////////////
//
// OR instruction.
//
///////////////////////////////////////////////////////////////////////////////

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OR, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, alu);       // B <- mem[DR].
      w_ac, alu_or, /end;	// A <- A | B.
 
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OR, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_or, /end;	// A <- A | B.

// FIXED: Autoincrement
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OR, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_or;		// A <- A | B.
      _AUTOINC, /end;		// Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// XOR instruction.
//
///////////////////////////////////////////////////////////////////////////////

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=XOR, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, alu);       // B <- mem[DR].
      w_ac, alu_xor, /end;	// A <- A | B.
 
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=XOR, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_xor, /end;	// A <- A | B.

// FIXED: Autoincrement
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=XOR, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the address and operand.
      //_DESEL;			// Prepare for the next memory read.
      _MEMREAD(dr, alu);	// B <- mem[DR].
      w_ac, alu_xor;		// A <- A | B.
      _AUTOINC, /end;		// Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.



///////////////////////////////////////////////////////////////////////////////
//
// JMP instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The JMP instruction simply transfers the result of the address generation
// logic to the PC.
//
// The addressing mode of this one is literal! JMP 0000 doesn't involve reading
// the value of mem[0000] from memory, we just set the PC to that address.
//
// JMP I 0000 *DOES* involve reading mem[0000], though. Basically, JMP-like
// instructions involve one less memory read cycle.


// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMP, I=0, SKIP=X, INC=X;
      _FETCH_IR;	 // Fetch the instruction and operand. That's
	    	         // all we need.
      w_pc, r_agl, /end; // Set the PC from AGL

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMP, I=1, SKIP=X, INC=1;
      _FETCH_IR;		// Fetch the address and operand.
      _MEMREAD(agl, pc), /end;	// PC<-mem[AGL]

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMP, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;	        // Fetch the instruction and operand. Autoincrement.
      w_pc, r_dr;	        // Set the PC from DR.
      _AUTOINC, /end;		// Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// JSR instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The JSR instruction saves the current PC to memory location 0000
// and performs a jump to the specified address.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JSR, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      _MEMWRITE(cs1, PC);	// Store PC at location 0000.
      w_pc, r_agl, /end;	// Set the PC from AGL(IR.operand)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JSR, I=1, SKIP=X, INC=1;
      _FETCH_IR;		// Fetch the IR
      _MEMWRITE(cs1, pc);	// store PC at location 0000.
      _MEMREAD(agl, pc), /end;	// PC<-mem[AGL]

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JSR, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;	        // Fetch the instruction and operand.
      _MEMWRITE(cs1, PC);	// Store PC at location 0000.
      w_pc, r_dr;
      _AUTOINC, /end;	        // Autoindex
      //_DESEL, /end;	        // The fetch cycle begins with a memory read.


///////////////////////////////////////////////////////////////////////////////
//
// TRAP instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The TRAP instruction saves the current PC to memory location 0001
// and performs a jump to the specified address.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      _MEMWRITE(cs2, pc);	// Store PC at location 0001.
      w_pc, r_agl, /end;	// Set the PC from AGL(IR.operand)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      _MEMWRITE(cs2, pc);	// Store PC at location 0001.
      w_pc, r_dr, /end;	        // Set the PC from DR.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=TRAP, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      _MEMWRITE(cs2, pc);	// Store PC at location 0001.
      w_pc, r_dr;
      _AUTOINC, /end;	        // Autoindex



///////////////////////////////////////////////////////////////////////////////
//
// LIA/LI instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The LIA instruction operates in literal mode, just like the JMP instruction,
// but loads the Accumulator with its result, not the PC. The indirection bit
// is ignored for this, but the R flag is honoured. LIA is 'load address'
// because it sets the AC with a page-relative value (thus, an address). LIA R
// is LI, 'load immediate' or 'LIteral' because it sets AC to the the 9-bit
// operand (zero-padded to 16 bits) and is useful for quickly loading small
// constants.

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=LIA, I=0, SKIP=X, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      w_ac, r_agl, /end; 	// A <- AGL(IR.operand)



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
      _FETCH_IR;		// Fetch the address and operand.
      _MEMREAD(agl, dr);	// DR <- mem[AGL]. # First indirection
      _MEMREAD(dr, PC), /end;	// PC <- mem[DR]. # Second indirection

// FIXED: Autoindex mode
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=JMPII, I=1, SKIP=X, INC=0;
      _FETCH_IR;		// Fetch the address and operand.
      _MEMREAD(agl, dr);	// DR <- mem[AGL]. # First indirection
      _MEMREAD(dr, PC);		// PC <- mem[DR]. # Second indirection
      _AUTOINC, /end;		// mem[AGL] <- ++DR


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
// IFL = OP1  '1---------		; if9: END if L=0
// IFV = OP1  '-1--------		; if8: END if V=0
// CLA = OP1  '--1-------		; if7: A <- 0
// CLL = OP1  '---1------		; if6: L <- 0
// NOT = OP1  '----1-----		; if5: A <- NOT A
// INC = OP1  '-----1----		; if4: <L,A> <- <L,A> + 1
// CPL = OP1  '------1---		; if3: L <- NOT L
// RBL = OP1  '-------010		; ifroll: <L,A> <- <L,A> << 1
// RBR = OP1  '-------001		; <L,A> <- <L,A> >> 1
// RNL = OP1  '-------110		; <L,A> <- <L,A> << 4
// RNR = OP1  '-------101		; <L,A> <- <L,A> >> 4
//
// (*) The final /end is necessary when the computer comes out of the
// HALT state.

// TO DO: Copy these two microprograms another 3 times, amend for all
// combinations of <V,L> inputs.

//
// Here are the OP1 macros with comments.
//
// #define OP1COMMON_SKIP1 \
//      w_ac, r_cs1, if6; \	// 4. If bit 7: do nothing here \
//      /cll, if5; \		// 5. If bit 6: do nothing here \
//      w_ac, alu_not, if4; \	// 6. If bit 5: complement A    \
//      /stpac, if3; \		// 7. If bit 4: increment A     \
//      /cpl, ifroll; \		// 8. If bit 3: complement L    \
//      w_ac, alu_roll; \		// 9. If roll: well, roll.      \
//      /end			// (*)
//
//#define OP1COMMON_SKIP0 \
//      if6; \                    // 4. If bit 7: do nothing here \
//      if5; \		        // 5. If bit 6: do nothing here \
//      if4; \	                // 6. If bit 5: complement A    \
//      if3; \	                // 7. If bit 4: increment A     \
//      ifroll; \			// 8. If bit 3: complement L    \
//      /end; \			// 9. If roll: well, roll.      \
//      /end \			// (*)
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
      if9;		        // 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: end if L=0 (handled below)
      if7;			// 3. If bit 8: end if V=0 (handled below)
      OP1COMMON_SKIP0;

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: end if L=0 (handled below)
      if7;			// 3. If bit 8: end if V=0 (handled below)
      OP1COMMON_SKIP1;


// V=0, L=1 (stops if IFV [if8] is set)
start UCB=XXXX, INT=1, RST=1, V=0, L=1, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: end if L=0 (handled below)
      /end, if7;	        // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=0, L=1, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: end if L=0 (handled below)
      if7;	                // 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


// V=1, L=0 (stops if IFL [if9] is set)
start UCB=XXXX, INT=1, RST=1, V=1, L=0, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      /end, if8;	        // 2. If bit 9: end if L=0 (handled below)
      if7;			// 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=1, L=0, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      if8;                      // 2. If bit 9: end if L=0 (handled below)
      if7;			// 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


// V=0, L=0 (stops if IFL [if9] or IFV [if8] are set).
start UCB=XXXX, INT=1, RST=1, V=0, L=0, OP=OP1, I=0, SKIP=ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      /end, if8;		// 2. If bit 9: end if L=0 (handled below)
      /end, if7;		// 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.

start UCB=XXXX, INT=1, RST=1, V=0, L=0, OP=OP1, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      if9;		        // 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: end if L=0 (handled below)
      if7;			// 3. If bit 8: end if V=0 (handled below)
      // Fall-through to the V=X, L=X case above.


///////////////////////////////////////////////////////////////////////////////
//
// ISZ instruction: LOAD A, increment, STORE A. Skip next instruction if A=0.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1, no skip

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=0, SKIP=FZ_IS_0, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      w_ac, /mem, /r;
      /stpac;                   // Increment A

      r_ac, /mem, /wen, ifzero;	// Write it back. (AR is already setup)
      /end;			// Don't skip.

// Skip taken
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=0, SKIP=FZ_IS_1, INC=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_ar, r_agl;
      w_ac, /mem, /r;
      /stpac;                   // Increment A

      r_ac, /mem, /wen, ifzero;	// Write it back. (AR is already setup)
      /incpc, /end;		// Skip.



// Direct mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=1, SKIP=DONT_ACT, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_ar, r_dr;		// Indirection.

      w_ac, /mem, /r;
      /stpac;		        // Increment A

      r_ac, /mem, /wen, ifzero;	// Write it back (AR is already setup)
      /end;			// Don't skip.

// Skip taken
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=1, SKIP=ACT, INC=1;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_ar, r_dr;		// Indirection.

      w_ac, /mem, /r;
      /stpac;		        // Increment A

      r_ac, /mem, /wen, ifzero;	// Write it back (AR is already setup)
      /incpc, /end;		// Skip.



// Autoindex mode.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=1, SKIP=DONT_ACT, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      w_ar, r_dr;		// Indirection: AR <- mem[AGL]

      w_ac, /mem, /r;		// AC <- mem[mem[AGL]]
      /stpac;          		// AC++

      r_ac, /mem, /wen;		// Write it back (AR is already setup)

      _AUTOINC, ifzero; 	// mem[agl] <- ++DR
      /end;			// Don't skip.

// Skip taken.
start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=ISZ, I=1, SKIP=ACT, INC=0;
      _FETCH_IR;                // Fetch cycle
      _MEMREAD(agl, dr);        // DR <- mem[agl]
      w_ar, r_dr;		// Indirection: AR <- mem[AGL]

      w_ac, /mem, /r;		// AC <- mem[mem[AGL]]
      /stpac;          		// AC++

      r_ac, /mem, /wen;		// Write it back (AR is already setup)

      _AUTOINC, ifzero; 	// mem[agl] <- ++DR
      /incpc, /end;		// Skip.


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
// NOP =  OP2 '-----00000		; 
// SNA =  OP2 '-----01---		; A < 0 ==> PC++  (1)
// SZA =  OP2 '-----0-1--		; A == 0 ==> PC++ (1)
// SLS =  OP2 '-----0--1-		; L == 1 ==> PC++ (1)
// SSV =  OP2 '-----0---1		; V == 1 ==> PC++ (1)
// SKIP = OP2 '-----10000		; PC++
// SNN =  OP2 '-----11---		; a >=0 ==> PC++  (2)
// SNZ =  OP2 '-----1-1--		; A != 0 ==> PC++ (2)
// SCL =  OP2 '-----1--1-		; L == 0 ==> PC++ (2)
// SCV =  OP2 '-----1---1		; V == 0 ==> PC++ (2)
// CLA =  OP2 '--1-------		; A <- 0
// CLI =  OP2 '---1------		; INT <= 0
// STI =  OP2 '----1-----		; INT <= 1
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
      /incpc, if7;		// 5. If branching: branch (if needed)
      w_ac, r_cs1, if6;		// 6. If bit 6: A <= 0
      /cli, if5;		// 7. If bit 5: I <= 0
      /sti, /end;		// 8. If bit 4: I <= 1
      /end;			// (*)

start UCB=XXXX, INT=1, RST=1, V=X, L=X, OP=OP2, I=0, SKIP=DONT_ACT, INC=X;
      _FETCH_IR;
      ifbranch;		        // 4. If bit 7: PR <= PC (note: PC <- PC)
      if7;		        // 5. If branching: branch (if needed)
      if6;		        // 6. If bit 6: A <= 0
      if5;		        // 7. If bit 5: I <= 0
      /end;		        // 8. If bit 4: I <= !I
      /end;			// (*)


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
      _FETCH_DIRECT;		// IR <- mem[PC++], DR <- mem[AGL]

      /dec, /stpdr;		// DR--
      r_dr, /mem, /wen;		// mem[AGL] <- DR (AR is already set up)

      _MEMREAD(dr, ac), /end;	// AC <- mem[DR]


// End of file.
