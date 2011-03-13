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
signal r_pr           = ....................0111; // Read from the PR
signal alu_add        = ....................1000; // Read from the Adder unit
signal alu_and        = ....................1001; // Read from the AND unit
signal alu_or         = ....................1010; // Read from the OR unit
signal alu_xor        = ....................1011; // Read from the XOR unit
signal alu_not        = ....................1100; // Read from the NOT unit
signal alu_roll       = ....................1101; // Read from the ROLL unit (roll op controlled by IR)
signal r_spare14      = ....................1110; //   ** RESERVED
signal r_spare15      = ....................1111; //   ** RESERVED

signal w_dbus         = .................001....; // Write to the data bus
signal w_mar          = .................010....; // Write to the MAR
signal w_pc           = .................011....; // Write to the PC
signal w_ir           = .................100....; // Write to the IR
signal w_dr           = .................101....; // Write to the DR
signal w_a            = .................110....; // Write to the Accumulator
signal w_pr           = .................111....; // Write to the PR

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

signal /dab           = ......1.................; // Drive Address bus
signal /mem           = .....1..................; // Memory access
signal /io            = ....1...................; // Input/Output enable
signal /R             = ...1....................; // Memory read
signal /W             = ..1.....................; // Memory write
signal /END           = .1......................; // Reset microprogram, go to fetch state.
signal /HALT          = 1.......................; // Halt the clock

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
    /DAB, /MEM, /R; \
    w_##_dreg, r_dbus, hold
    //-/DAB, -/MEM, -/IO, -/R, -/W
    

// At the end of this macro, /DAB, and /MEM are still active. It's assumed that
// the caller of the macro will deactivate the lines, deselecting the
// memory. This may not be necessary, though.

// This macro deselects the memory and terminates memory access. Needed between memory read cycles.
#define _DESEL \
    -/DAB, -/MEM, -/IO, -/R, -/W	   // 5. Deselect I/O and memory.


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
    /dab, /mem, /w; \
    w_dbus, r_##_dreg, /dab, /mem, /w; \
    r_##_dreg, /dab, /mem

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

start IRQ=X, RST=1, OP=XXXX, I=X, SKIP=X;
      _FETCH_IR;		// Just fetch an instruction.


///////////////////////////////////////////////////////////////////////////////
//
// Reset code
//
///////////////////////////////////////////////////////////////////////////////

// The reset sequence is little more than a fetch sequence, but we pad
// it with a few NOPs.

start IRQ=X, RST=0, OP=XXXX, I=X, SKIP=X;
      w_pc, r_cs, /cli, /end;
      hold;
      hold;
      hold;
      hold;	
      /end;

///////////////////////////////////////////////////////////////////////////////
//
// LOAD instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start IRQ=X, RST=1, OP=LOAD, I=0, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      _DESEL;			// Prepare for the next memory read.
      _MEMREAD(agl, A);		// A <- mem[agl].
      _DESEL, /end;	 // The fetch cycle begins with a memory read.


start IRQ=X, RST=1, OP=LOAD, I=1, SKIP=X;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      _DESEL;			// Prepare for the next memory read.
      _MEMREAD(DR, A);		// A <- mem[DR].
      _DESEL, /end;	 // The fetch cycle begins with a memory read.



///////////////////////////////////////////////////////////////////////////////
//
// STORE instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start IRQ=X, RST=1, OP=STORE, I=0, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      _MEMWRITE(agl, a);	// mem[agl] <- DR
      _DESEL, /end;		// The fetch cycle begins with a memory read.

start IRQ=X, RST=1, OP=STORE, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      _MEMWRITE(dr, a);		// mem[A] <- DR
      _DESEL, /end;		// The fetch cycle begins with a memory read.



///////////////////////////////////////////////////////////////////////////////
//
// IN instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
//start IRQ=X, RST=1, OP=LOAD, I=0, SKIP=X;
//      _FETCH_IR;		// Fetch the instruction and operand.
//      _DESEL;			// Prepare for the next memory read.
//      r_agl;
//      w_mar;
//      /DAB, /IO, /R;	        // Select I/O space, prepare to read.
//      w_dbus, /DAB, /IO, /R;	// Hold (wait state)
//      r_a, hold;		// Read.
//      _DESEL, /end;		// The fetch cycle begins with a memory read.


//start IRQ=X, RST=1, OP=LOAD, I=1, SKIP=X;
//      _FETCH;			// Fetch the instruction and operand.
//      _DESEL;			// Prepare for the next memory read.
//      MAR <- DR, /DAB, /IO, /R; // Select I/O space, prepare to read.
//      /DAB, /IO, /R;		// Hold (wait state)
//      A <- DBUS, hold;		// Read.
//      _DESEL, /end;		// The fetch cycle begins with a memory read.



///////////////////////////////////////////////////////////////////////////////
//
// OUT instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
//start IRQ=X, RST=1, OP=STORE, I=0, SKIP=X;
//      _FETCH_IR;		// Fetch the instruction and operand.
//      _DESEL;			// Prepare for the next memory read.
//      MAR <- agl, /DAB, /IO, /W;// Select I/O space, prepare to write.
//      /DAB, /IO, /W;
//      DBUS <- A, hold;
//      _DESEL, /end;		// The fetch cycle begins with a memory read.

//start IRQ=X, RST=1, OP=STORE, I=1, SKIP=X;
//      _FETCH;			// Fetch the instruction and operand.
//      _DESEL;			// Prepare for the next memory read.
//      MAR <- DR, /DAB, /IO, /W; // Select I/O space, prepare to write.
//      /DAB, /IO, /W;
//      DBUS <- A, hold;
//      _DESEL, /end;		// The fetch cycle begins with a memory read.



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

start IRQ=X, RST=1, OP=ADD, I=0, SKIP=X;
      _FETCH_DIRECT;		// Fetch the instruction and operand.
      w_a, alu_add, /end;	// Latch A from ALU result register.
 
start IRQ=X, RST=1, OP=ADD, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      w_a, alu_add, /end;	// Latch A from ALU result register.



///////////////////////////////////////////////////////////////////////////////
//
// AND instruction.
//
///////////////////////////////////////////////////////////////////////////////

start IRQ=X, RST=1, OP=AND, I=0, SKIP=X;
      _FETCH_DIRECT;	       // Fetch the instruction and operand.
      w_a, alu_and, /end;      // Latch A from ALU result register.

start IRQ=X, RST=1, OP=AND, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      w_a, alu_and, /end;	// Latch A from ALU result register.


///////////////////////////////////////////////////////////////////////////////
//
// OR instruction.
//
///////////////////////////////////////////////////////////////////////////////

start IRQ=X, RST=1, OP=OR, I=0, SKIP=X;
      _FETCH_DIRECT;	       // Fetch the instruction and operand.
      w_a, alu_or, /end;       // Latch A from ALU result register.

start IRQ=X, RST=1, OP=OR, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      w_a, alu_or, /end;	// Latch A from ALU result register.



///////////////////////////////////////////////////////////////////////////////
//
// XOR instruction.
//
///////////////////////////////////////////////////////////////////////////////

start IRQ=X, RST=1, OP=XOR, I=0, SKIP=X;
      _FETCH_DIRECT;		// Fetch the instruction and operand.
      w_a, alu_xor, /end;	// Latch A from ALU result register.

start IRQ=X, RST=1, OP=XOR, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      w_a, alu_xor, /end;	// Latch A from ALU result register.



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

start IRQ=X, RST=1, OP=JMP, I=0, SKIP=X;
      _FETCH_IR;	 // Fetch the instruction and operand. That's
	    	         // all we need.
      w_pc, r_agl, /end;	 // Set the PC from AGL(<PR,IR.operand>)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start IRQ=X, RST=1, OP=JMP, I=1, SKIP=X;
      _FETCH_LITERAL;	// Fetch the instruction and operand.
      w_pc, r_dr, /end;	// Set the PC from DR.



///////////////////////////////////////////////////////////////////////////////
//
// JSR instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The JSR instruction saves the current PC to memory location 0001
// and performs a jump to the specified address.

start IRQ=X, RST=1, OP=JSR, I=0, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      _MEMWRITE(cs, PC);	// Store PC at location 0001.
      w_pc, r_agl, /end;	// Set the PC from AGL(<PR,IR.operand>)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start IRQ=X, RST=1, OP=JSR, I=1, SKIP=X;
      _FETCH_INDIRECT;		// Fetch the instruction and operand.
      _DESEL;                   // Deselect memory before writing.
      _MEMWRITE(cs, PC);	// Store PC at location 0001.
      w_pc, r_agl, /end;	// Set the PC from DR.



///////////////////////////////////////////////////////////////////////////////
//
// TRAP instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The TRAP instruction saves the current PC to memory location 0000
// and performs a jump to the specified address.

start IRQ=X, RST=1, OP=TRAP, I=0, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      /cli, _MEMWRITE(cs, pc);	// Store PC at location 0001.
      w_pc, r_agl, /end;	// Set the PC from AGL(<PR,IR.operand>)

// The _FETCH macro fetches the IR and operand, and then loads into DR the
// value stored in mem[operand]. This is all the indirection we need here (one
// less indirection step than normal).

start IRQ=X, RST=1, OP=TRAP, I=1, SKIP=X;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      /cli; //_DESEL;           // Clear interrupts (implicit memory deselection)
      _MEMWRITE(cs, pc);	// Store PC at location 0001.
      w_pc, r_dr, /end;	        // Set the PC from DR.



///////////////////////////////////////////////////////////////////////////////
//
// LI instruction.
//
///////////////////////////////////////////////////////////////////////////////

// The LI instruction operates in literal mode, just like the JMP instruction,
// but loads the Accumulator with its result, not the PC. The indirection bit
// is ignored for this, but the R flag is honoured.

start IRQ=X, RST=1, OP=LI, I=X, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand. That's
				// all we need.
      w_a, r_agl, /end; 	// A <- AGL(<PR,IR.operand>)



///////////////////////////////////////////////////////////////////////////////
//
// OUT instruction.
//
///////////////////////////////////////////////////////////////////////////////

// LITERAL MODE INSTRUCTION: agl used for I=0, direct mode for I=1.
start IRQ=X, RST=1, OP=OUT, I=0, SKIP=X;
      _FETCH_IR;		// Fetch the instruction and operand.
      w_mar, r_agl;
      /dab, /io, /w;
      w_dbus, r_a, /dab, /io, /w;
      w_dbus, r_a, /dab, /io, /end;;

start IRQ=X, RST=1, OP=OUT, I=1, SKIP=X;
      _FETCH_LITERAL;		// Fetch the instruction and operand.
      w_mar, r_dr;		// Indirection.
      /dab, /io, /w;
      w_dbus, r_a, /dab, /io, /w;
      w_dbus, r_a, /dab, /io, /end;


///////////////////////////////////////////////////////////////////////////////
//
// OP1 instruction.
//
///////////////////////////////////////////////////////////////////////////////

// PDP-8-style microcoded instruction. No addressing modes or AGL
// used, but SKIP is used to determine what gets executed and what not.
//
// Note: ifX microcode instructions apply the condition to the NEXT
// microstep, which is why we list them last. SKIP=1 means 'don't
// skip'.
//
// Bit allocation and sequencing:
//
//                     roll
//             98765 3///
// CLA = OP1  '1---------		; if9: A <- 0
// CLL = OP1  '-1--------		; if8: L <- 0
// NOT = OP1  '--1-------		; if7: A <- NOT A
// INC = OP1  '---1------		; if6: <L,A> <- <L,A> + 1
// NTL = OP1  '----1-----		; if5: L <- NOT L
// RBL = OP1  '-------010		; ifroll: <L,A> <- <L,A> >> 1
// RBR = OP1  '-------001		; <L,A> <- <L,A> << 1
// RNL = OP1  '-------110		; <L,A> <- <L,A> >> 4
// RNR = OP1  '-------101		; <L,A> <- <L,A> << 4
// HALT = OP1 '------1---		; if3: Stop clock.
//
// (*) The final /end is necessary when the computer comes out of the
// HALT state.

start IRQ=X, RST=1, OP=OP1, I=X, SKIP=1;
      _FETCH_IR, if9;		// 1. Fetch the instruction and operand.
      w_a, r_cs, if8;		// 2. If bit 9: clear A
      /cll, if7;		// 3. If bit 8: clear L
      w_a, alu_not, if6;	// 4. If bit 7: complement A
      /inc_a, if5;		// 5. If bit 6: increment A
      cpl, ifroll;		// 6. If bit 5: complement L
      w_a, alu_roll, if3;	// 7. If roll: well, roll.
      /halt;			// 8. If bit 3: halt.
      /end;			// (*)

start IRQ=X, RST=1, OP=OP1, I=X, SKIP=0;
      _FETCH_IR, if9;		// 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: clear A
      if7;			// 3. If bit 8: clear L
      if6;			// 4. If bit 7: complement A
      if5;			// 5. If bit 6: increment A
      ifroll;			// 6. If bit 5: complement L
      if3;			// 7. If roll: well, roll.
      /end;			// End one cycle early if not HALTing.
      /end;			// (*)

///////////////////////////////////////////////////////////////////////////////
//
// OP2 instruction.
//
///////////////////////////////////////////////////////////////////////////////

// PDP-8-style microcoded instruction. No addressing modes or AGL
// used, but SKIP is used to determine what gets executed and what not.
//
// Note: ifX microcode instructions apply the condition to the NEXT
// microstep, which is why we list them last. SKIP=1 means 'don't
// skip'.
//
// Bit allocation and sequencing:
//
//                    branch
//             987654////
// LPG =  OP2 '1---------		; A <= PR
// SPG =  OP2 '-1--------		; PR <= A
// CPG =  OP2 '--1-------		; PR <= PC
// NOP =  OP2 '------0000		; 
// SNA =  OP2 '------01--		; A < 0 ==> PC++  (1)
// SZA =  OP2 '------0-1-		; A == 0 ==> PC++ (1)
// SSL =  OP2 '------0--1		; L == 1 ==> PC++ (1)
// SKIP = OP2 '------1000		; PC++
// SNN =  OP2 '------11--		; a >=0 ==> PC++   (2)
// SNZ =  OP2 '------1-1-		; A != 0 ==> PC++ (2)
// SCL =  OP2 '------1--1		; L == 0 ==> PC++ (2)
// CLA2 = OP2 '---1------		; A <- 0
// CLI =  OP2 '----1-----		; INT <= 0
// TLI =  OP2 '-----1----		; INT <= !INT
//
// (1) Conditions ORred together
// (2) Conditions ANDed together. The OR/AND logic isn't microcoded,
// it's part of the hardwired decoding of the branch bits.
//
// The branch test logic, along with the bits sets in the
// microinstruction, feed the SKIP field, so SKIP handles both
// microinstruction skips and machine code branches.

start IRQ=X, RST=1, OP=OP2, I=X, SKIP=1;
      _FETCH_IR, if9;		// 1. Fetch the instruction and operand.
      w_a, r_pr, if8;		// 2. If bit 9: A <= PR
      w_pr, r_a, if7;		// 3. If bit 8: PR <= A
      w_pc, r_pc, ifbranch;     // 4. If bit 7: PR <= PC (note: PC <- PC)
      /pc++, if6;		// 5. If branching: branch (if needed)
      w_a, r_cs, if5;		// 6. If bit 6: A <= 0
      /cli, if4;		// 7. If bit 5: I <= 0
      cpi, /end;		// 8. If bit 4: I <= !I
      /end;			// (*)

start IRQ=X, RST=1, OP=OP2, I=X, SKIP=0;
      _FETCH_IR, if9;		// 1. Fetch the instruction and operand.
      if8;			// 2. If bit 9: A <= PR
      if7;			// 3. If bit 8: PR <= A
      ifbranch;		        // 4. If bit 7: PR <= PC (note: PC <- PC)
      if6;		        // 5. If branching: branch (if needed)
      if5;		        // 6. If bit 6: A <= 0
      if4;		        // 7. If bit 5: I <= 0
      /end;		        // 8. If bit 4: I <= !I
      /end;			// (*)

// End of file.
