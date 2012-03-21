// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// GENERIC MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Macro: ADC(addr)
//
// Add with carry. Calculates AC = AC + L + addr
//
// Side effects:
//   AC = AC + L + mem[addr]
//   L
.macro ADC (addr)
	OP1 IFL INC		; Increment AC if L is set
	ADD %addr
.end

///////////////////////////////////////////////////////////////////////////////
//
// LITERAL MACROS
//
///////////////////////////////////////////////////////////////////////////////

// We need quite a few macros on the CFT because of its simplicity


	
// Macro: LSET(tgt,literal)
//
// Set tgt with literal value.
//
// Warnings:
//   %literal must be between &000 and &3ff.
//
// Side effects:
//   mem[%tgt] = %literal
//   AC = %literal
.macro LSET(tgt, literal)
	LI %literal		; LSET(%tgt, %literal)
	STORE %tgt
.end

	

// Macro: LINCn (addr, n)
//
// Increment the value at addr by n.
//
// Warnings:
//   %addr must be page-local.
//   %n must be between &000 and &3ff.
//	
// Side effects:
//   mem[addr] += n
//   AC = mem[addr]
//   L
.macro LINCn (addr,n)
	LI %n			; LINCn(%addr, %n)
	ADD %addr
	STORE %addr
.end

// Macro: INCM (addr)
//
// Increment the value at addr by 1.
//
// Warnings:
//   %addr must be page-local.
//   %n must be between &000 and &3ff.
//	
// Side effects:
//   mem[addr]++
//   AC = mem[addr]
//   L
.macro INCM (addr)
	LINCn (%addr, 1)
.end

// Macro: LDECn (addr)
//
// Decrement the value at addr by one.
//
// Conditions:
//   %n must be 1, 2, or 3.
//
// Side effects:
//   mem[addr] -= n
//   AC = mem[addr]
//   L
.macro LDECn (addr, n)
	LOAD %addr		; LDECn(%addr, %n)
	ADD MINUS%n
	STORE %addr
.end

// Macro: DECM (addr)
//
// Decrement the value at addr by one.
//
// Side effects:
//   mem[addr]--
//   AC = mem[addr]
//   L
.macro DECM (addr)
	LDECn (%addr, 1)
.end


///////////////////////////////////////////////////////////////////////////////
//
// TRAPS AND CALLING CONVENTIONS
//
///////////////////////////////////////////////////////////////////////////////

.macro ROMTRAP1(trap, arg1)
.end


// Macro: ENTTRAP (reg)
//
// Enter a trap. Stores a pointer to the trap's argument block to %reg
// (TI0 is a good choice). Leaves trap return address in A so it can be
// saved.
//
// Side effects:
//   TR0 = RTTV + %argc
//   PC = mem[RTTV] + %argc
//   L
.macro ENTTRAP(reg)
	LOAD I RTTV		; ENTTRAP(%reg)
	STORE %reg
	LOAD RTTV
.end

// Macro: RETTRAP (argc)
//
// Return from a trap that uses %argc arguments.
//
// Side effects:
//   TR0 = RTTV + %argc
//   PC = mem[RTTV] + %argc
//   L
.macro RETTRAP(argc)
	STORE TR1		; RETTRAP(%argc)
	LI %argc
	ADD RTTV
	STORE TR0
	LOAD TR1
	JMP I TR0
.end



///////////////////////////////////////////////////////////////////////////////
//
// REGISTER MACROS
//
///////////////////////////////////////////////////////////////////////////////

// These Rxxx() macros operate on 3-macro sets, like grown up CPU instruction
// sets.

// Macro: _RAPPLY1(op, tgt, src)
//
// Apply unary operation op to value of src, store result to tgt.
//
// Side effects:
//   mem[%tgt] = op(%src)
//   AC = op(%src)
//   Any side effects of %op
.macro _RAPPLY1(op, tgt, src)
	LOAD %src			; RSUB(%tgt, %src)
	%op
	STORE %tgt
.end

	

// Macro: _RAPPLY2(op, tgt, a, b)
//
// Apply binary operation op to value of a and b, store result to tgt.
//
// Side effects:
//   mem[%tgt] = %a %op %b
//   AC = %a %op %b
//   Any side effects of %op
.macro _RAPPLY2(op, tgt, a, b)
	LOAD %a			; _RAPPLY2(%op, %tgt, %a, %b)
	%op %b
	STORE %tgt
.end

	

// Macro: RMOV(tgt,src)
//
// Load value of src and store in tgt.
//
// Side effects:
//   mem[%tgt] = %src
//   AC = %src
.macro RMOV(tgt, src)
	LOAD %src		; RMOV(%tgt, %src)
	STORE %tgt
.end


// Macro: RADD(tgt,a,b)
//
// Add values of addresses/registers a + b and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a + %b
//   AC = %a + %b
//   L
.macro RADD(tgt, a, b)
	_RAPPLY2(ADD, %tgt, %a, %b)
.end


	
// Macro: RADC(tgt,a,b)
//
// Register add with carry. Calculate L + a + b and store the
// result in tgt.
//
// Side effects:
//   mem[%tgt] = L + %a + %b
//   AC = L + %a + %b
//   L
.macro RADC(tgt, a, b)
	LOAD %a			; RADD(%tgt, %a, %b)
	ADC(%b)
	STORE %tgt
.end


	
// Macro: RSUB(tgt,a,b)
//
// Subtract values of addresses/registers a - b and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a - %b
//   AC = %a - %b
//   L
.macro RSUB(tgt, a, b)
	LOAD %b			; RSUB(%tgt, %a, %b)
	NEG
	ADD %a
	STORE %tgt
.end


	
// Macro: RAND(tgt,a,b)
//
// AND values of addresses/registers a & b and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a & %b
//   AC = %a & %b
//   L
.macro RAND(tgt, a, b)
	_RAPPLY2(AND, %tgt, %a, %b)
.end


	
// Macro: ROR(tgt,a,b)
//
// OR values of addresses/registers a & b and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a | %b
//   AC = %a | %b
//   L
.macro ROR(tgt, a, b)
	_RAPPLY2(OR, %tgt, %a, %b)
.end


	
// Macro: RXOR(tgt,a,b)
//
// OR values of addresses/registers a & b and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a ^ %b
//   AC = %a ^ %b
//   L
.macro RXOR(tgt, a, b)
	_RAPPLY2(XOR, %tgt, %a, %b)
.end


	
// Macro: RSBL(tgt, src)
//
// Location tgt gets the value of src << 1.
//
// Side effects:
//   mem[%tgt] = %a << 1
//   AC = %a - %b << 1
//   L (as per roll instructions)
.macro RSBL(tgt, src)
	_RAPPLY1(SBL, %tgt, %src)
.end

	

// Macro: RSBR(tgt, src)
//
// Location tgt gets the value of src >> 1.
//
// Side effects:
//   mem[%tgt] = %a >> 1
//   AC = %a - %b >> 1
//   L (as per roll instructions)
.macro RSBR(tgt, src)
	_RAPPLY1(SBR, %tgt, %src)
.end

	

// Macro: RRBL(tgt, src)
//
// Roll src one bit left, store to tgt.
//
// Side effects:
//   mem[%tgt] = %a << 1
//   AC = %a - %b << 1
//   L (as per roll instructions)
.macro RRBL(tgt, src)
	_RAPPLY1(RBL, %tgt, %src)
.end

	

// Macro: RRBR(tgt, src)
//
// Roll src one bit right, store to tgt.
//
// Side effects:
//   mem[%tgt] = %a >> 1
//   AC = %a - %b >> 1
//   L (as per roll instructions)
.macro RRBR(tgt, src)
	_RAPPLY1(RBR, %tgt, %src)
.end



// Macro: RNOT(tgt, src)
//
// Take one's complement of src, store in tgt.
//
// Side effects:
//   mem[%tgt] = mem[src] ^ &FFFF
//   AC = mem[src] ^ &FFFF
//   L (as per roll instructions)
.macro RNOT(tgt, src)
	_RAPPLY1(NOT, %tgt, %src)
.end



// Macro: RNEG(tgt, src)
//
// Take two's complement of src, store in tgt.
//
// Side effects:
//   mem[%tgt] = mem[src] ^ &FFFF
//   AC = mem[src] ^ &FFFF
//   L (as per roll instructions)
.macro RNEG(tgt, src)
	_RAPPLY1(NEG, %tgt, %src)
.end





///////////////////////////////////////////////////////////////////////////////
//
// 32-BIT MACROS
//
///////////////////////////////////////////////////////////////////////////////


	
// Macro: INC32(regh, regl)
//
// Increment <regh,regl> by 1.
//
// Side effects:
//   mem[%tgth]
//   mem[%tgtl]
//   AC
//   L (as per roll instructions)
.macro INC32(regh, regl)
        LOAD %regl              ; INC32(%regh, %regl)
        CLL INC                 ; Increment by 1. Set up for carry propagation.
        STORE %regl
        LOAD %regh
        IFL INC                 ; Propagate carry.
        STORE %regh
.end

	
	
// Macro: RNEG32(tgth, tgtl, srch, srcl)
//
// Take two's complement of the 32-bit value <srch,srcl>, store in <tgth,tgtl>.
//
// Side effects:
//   mem[%tgth]
//   mem[%tgtl]
//   AC
//   L (as per roll instructions)
.macro RNEG32(tgth, tgtl, srch, srcl)
        LOAD %srcl		; RNEG32(%tgth, %tgtl, %srch, %srcl)
        OP1 CLL NOT INC         ; NEG with carry out
        STORE %tgtl
        LOAD %srch
        XOR R MINUS1            ; Fast complementation
        IFL INC                 ; Propagate the carry
        STORE %tgth
.end

///////////////////////////////////////////////////////////////////////////////
//
// PACKED STRING MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Macro: GETLOCHAR()
//
// Given a 16-bit word, extract the least significant 8 bits.
//
// Side effects:
//   AC = AC & 0xff
.macro GETLOCHAR()
	AND BYTELO		; AND &00ff
.end


	
// Macro: GETHICHAR()
//
// Given a 16-bit word, extract the most significant 8 bits, shifted 8 bits
// right.
//
// Side effects:
//   AC = (AC >> 8) & 0xff00)
//   L	
.macro GETHICHAR()
	RNR			; GETHICHAR()
	RNR
	AND BYTELO		; AND &00ff
.end


	
// Macro: MAKEHICHAR()
//
// Given a 8-bit character, shift it 8 bits to the right and prepare it for
// storage in a bit-packed string.
//
// Side effects:
//   AC = (AC << 8) & 0xff00)
//   L	
.macro MAKEHICHAR()
	RNL			; MAKEHICHAR()
	RNL
	AND BYTEHI		; AND &ff00
.end

	

///////////////////////////////////////////////////////////////////////////////
//
// I/O CONVENIENCE MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Macro: PUTC (char)
//
// Output the specified character.
// Conditions:
//   char must be 0..&3ff. Most output devices will just use the
//     value modulo 256 anyway, but the value must fit in a CFT instruction.
//
// Side effects:
//   AC = char
.macro PUTC(char)
	LI %char		; PUTC(%char)
	PUTCHAR
.end



	

///////////////////////////////////////////////////////////////////////////////
//
// DEBUGGING MACROS
//
///////////////////////////////////////////////////////////////////////////////

// Macro: PRINT32 (hi,lo)
//
// Output the specified character.
// Conditions:
//   Prints out a 32-bit number in locations hi, lo.
//
// Side effects:
//   AC = char
.macro PRINT32(hi,lo)
	LOAD %hi
	PRINTHI
	LOAD %lo
	PRINTLO
.end


// End of file.
