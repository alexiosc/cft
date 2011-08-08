// -*- mode: conf -*-
// This is an example of microcode.

// Define the opcodes for convenience.

#define TRAP 0000
#define LOAD 0010
#define STORE 0011
#define IN 0100
#define OUT 0101
#define JMP 0110
#define JSR 0111
#define ADD 1000
#define AND 1001
#define OR 1010
#define XOR 1011
#define OP1 1100
#define OP2 1101
#define LI 1111

///////////////////////////////////////////////////////////////////////////////
//
// Conditions: fields embedded in the MicroROM address.
//
///////////////////////////////////////////////////////////////////////////////

cond RST:1;                   // Resetting
cond IRQ:1;                   // IRQ request
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

// Register order: MAR, IR, A, DR, PC, dbus.
//
// UNIT   LHS   RHS
// ----------------
// DBUS   001   001
// MAR    010
// PC     011   011
// IR     100
// DR     101   100
// A      110   101
// AGL          010
// CONST        110   When OP[0] = 0: CONST = 0000. When OP[0] = 1: CONST = 0001.
// ALU          111

signal r_dbus         = ....................0001; // Read from the data bus
signal r_agl          = ....................0010; // Read from address generation logic
signal r_pc           = ....................0011; // Read from PC
signal r_dr           = ....................0100; // Read from DR
signal r_a            = ....................0101; // Read from the Accumulator
signal r_cs           = ....................0110; // Read from the Constant Store
//signal r_spare7     = ....................0111; //   ** RESERVED
signal alu_add        = ....................1000; // Read from the Adder unit
signal alu_and        = ....................1001; // Read from the AND unit
signal alu_or         = ....................1010; // Read from the OR unit
signal alu_xor        = ....................1011; // Read from the XOR unit
signal alu_not        = ....................1100; // Read from the NOT unit
signal alu_roll       = ....................1101; // Read from the ROLL unit (roll op controlled by IR)
//signal r_spare14    = ....................1110; //   ** RESERVED
//signal r_spare15    = ....................1111; //   ** RESERVED

signal w_dbus         = .................001....; // Write to the data bus
signal w_mar          = .................010....; // Write to the MAR
signal w_pc           = .................011....; // Write to the PC
signal w_ir           = .................100....; // Write to the IR
signal w_dr           = .................101....; // Write to the DR
signal w_a            = .................110....; // Write to the Accumulator
//signal w_spare7     = .................111....; //   * RESERVED

signal if9            = .............0111.......; // SKIP = IR[9]
signal if8            = .............0110.......; // SKIP = IR[8]
signal if7            = .............0101.......; // SKIP = IR[7]
signal if6            = .............0100.......; // SKIP = IR[6]
signal if5            = .............0011.......; // SKIP = IR[5]
signal if4            = .............0010.......; // SKIP = IR[4]
signal if3            = .............0001.......; // SKIP = IR[3]
signal ifroll         = .............1011.......; // SKIP = roll_logic(IR[2:0])
signal ifbranch       = .............1111.......; // SKIP = skip_logic(IR[3:0])

signal /inc_a         = ............1...........; // Step the A counter.
signal cpl            = ...........1............; // Complement L (active low)
signal /cll           = ..........1.............; // Clear L flag
signal cpi            = .........1..............; // Complement I flag
signal /cli           = ........1...............; // Clear I flag
signal /pc++          = .......1................; // Step the PC

signal /inc_dr        = ......1.................; // Increment DR (for autoincrement mode)
signal /dec_dr        = .....1..................; // Decrement DR (for POP instruction)
signal /mem           = ....1...................; // Memory access
signal /io            = ...1....................; // Input/Output enable
signal /R             = ..1.....................; // Memory read
signal /W             = .1......................; // Memory write
signal /END           = 1.......................; // Reset microprogram, go to fetch state.
//signal /HALT          = 1.......................; // Halt the clock

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
//         _____       _____       _____       _____       _____
// CLK ___|     |_____|     |_____|     |_____|     |_____|     |_____
//     ___       _____       _____       _____       _____       _____                                          
// CLK2   |_____|     |_____|     |_____|     |_____|     |_____|     
//
// MAR XXXXX|<============ VALID ==============>|XXXXXXXXXXXXXXXXXXXXXXXXXXX
//
// AB  ZZZZZ|<============ DRIVEN =============>|ZZZZZZZZZZZZZZZZZZZZZZZZZZZ
//     _____                                     ______________________
// DAB      |___________________________________|
//     _____                                     ______________________
// MEM      |___________________________________|
//     _____             _____________________________________________     
// R        |___________|                         
//     __________             ________________________________________     
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
#define _MEMREAD(_areg, _dreg) \
    w_mar, r_##_areg; \
    /MEM, /R; \
    w_##_dreg, r_dbus, hold
    //-/DAB, -/MEM, -/IO, -/R, -/W
    

// At the end of this macro, /DAB, and /MEM are still active. It's assumed that
// the caller of the macro will deactivate the lines, deselecting the
// memory. This may not be necessary, though.

// This macro deselects the memory and terminates memory access. Needed between memory read cycles.
#define _DESEL \
    -/MEM, -/IO, -/R, -/W	   // 5. Deselect I/O and memory.


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
// MAR XXXXX|<============ VALID ==============>|XXXXXXXXXXXXXXXXXXXXXXXXXXX
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
// MAR <- DR, /DAB, /MEM, /W    // 2. Select memory, enable writing. Latch to MAR.
// /DAB, /MEM, /W		 // 3. Drive the address bus.
				// DBUS <- A, hold, /end	 // 4. Drive the data bus. End.

#define _MEMWRITE(_areg, _dreg) \
     w_mar, r_##_areg; \
    w_dbus, r_##_dreg, /mem, /w; \
    r_##_dreg, /mem

/*
// Long address setup time.
#define _MEMWRITE(_areg, _dreg) \
     w_mar, r_##_areg; \
    /mem, /w; \
    w_dbus, r_##_dreg, /mem, /w; \
    r_##_dreg, /mem
*/

/*
    w_mar, r_##_areg; \
    /DAB, /MEM, /R; \
    w_##_dreg, r_dbus, hold; \
    -/DAB, -/MEM, -/IO, -/R, -/W;

*/




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

#define _FETCH_IR \
	_MEMREAD(PC, IR), /pc++


// This macro implements steps 1 and 2a:
//
// 1. IR <- mem[PC]
//    Deselect the memory, take the opportunity to step the PC.
// 2. DR <- mem[<PR,IR.operand>]

#define _FETCH_DIRECT \
	_FETCH_IR; \
	_MEMREAD(agl, DR)

#define _FETCH_LITERAL _FETCH_DIRECT


// This macro implements steps 1, 2b and 3b:
//
// 1. IR <- mem[PC]
//    Deselect the memory, take the opportunity to step the PC.
// 2. DR <- mem[<PR,IR.operand>]
//    Deselect the memory.
// 3. DR <- mem[DR]

#define _FETCH_INDIRECT \
	_FETCH_IR; \
	_MEMREAD(agl, DR); \
	_DESEL; \
	_MEMREAD(DR, DR)


// This macro takes care of most of the autoincrement
// microsteps. NOTE: this can be combined with the last step of
// another macro (as long as it doesn't modify the DR), as the only
// thing it does on its first microstep is to increase the DR.

#define _AUTOINC \
	/inc_dr, /mem, /w; \
        w_dbus, r_dr, /mem, /w;	\
        r_dr, /mem;


///////////////////////////////////////////////////////////////////////////////
//
// The Microcode itself.
//
///////////////////////////////////////////////////////////////////////////////

// We'll be adding fetch cycles with no execution cycles to all available
// microprogram positions in the microcode ROM. This way, no matter what its
// state, the CPU will always be able to fetch an instruction. Upon fetching,
// the microcode ROM address (fed from the IR, wihch the fetch cycle modifies),
// will jump to the right microcode program. We don't NEED to use separate
// microprograms for direct and indirect modes, since, at the time of the fetch
// cycle, the I flag (which is about to be fetched along with the rest of the
// IR) is invalid anyway.
//
// Assumption: the steps that fetch the IR from memory are identical for both
// direct (I=0) and indirect mode (I=1).

start IRQ=X, RST=1, OP=XXXX, I=X, SKIP=X, INC=X;
      _FETCH_IR;		// Just fetch an instruction.



///////////////////////////////////////////////////////////////////////////////
//
// STORE instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start IRQ=X, RST=1, OP=STORE, I=0, SKIP=X, INC=0;
      _FETCH_IR;		// Fetch the instruction and operand.
      _MEMWRITE(agl, a);	// mem[agl] <- A
      _DESEL, /end;		// The fetch cycle begins with a memory read.

// Indirect mode.
start IRQ=X, RST=1, OP=STORE, I=1, SKIP=X, INC=0;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      _MEMWRITE(dr, a);		// mem[DR] <- A
      _DESEL, /end;		// The fetch cycle begins with a memory read.
      /end;		 	// Pad the rest of the microprogram with /ends.
      /end;		 	// When the autoincrement version below asserts /end,
      /end;		 	// Control will momentarily be passed back here, and
      /end;		 	// /end must stay asserted.
      /end;
      /end;

// Autoindex mode
start IRQ=X, RST=1, OP=STORE, I=1, SKIP=X, INC=1;
      _FETCH_LITERAL;	      	  // Fetch the address and operand (autoindex)
      _AUTOINC;			  // Increment DR and write back.
      _MEMWRITE(dr, a);		  // mem[DR] <- A
      _DESEL, /end;		  // The fetch cycle begins with a memory read.


// End of file.
