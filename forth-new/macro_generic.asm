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

// These Rxxx() macros operate on 3-register sets, like grown up CPU instruction
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
	LOAD %src			; _RAPPLY1(%tgt, %src)
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

	

// Macro: RRNL(tgt, src)
//
// Roll src four bits left, store to tgt.
//
// Side effects:
//   mem[%tgt] = %a >> 1
//   AC = %a - %b >> 1
//   L (as per roll instructions)
.macro RRNL(tgt, src)
	_RAPPLY1(RNL, %tgt, %src)
.end

	

// Macro: RRNR(tgt, src)
//
// Roll src four bits right, store to tgt.
//
// Side effects:
//   mem[%tgt] = %a >> 1
//   AC = %a - %b >> 1
//   L (as per roll instructions)
.macro RRNR(tgt, src)
	_RAPPLY1(RNR, %tgt, %src)
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



// Macro: ROUT(tgt,src)
//
// Send value of src to I/O address tgt.
//
// Side effects:
//   io[%tgt] = %src
//   AC = %src
.macro ROUT(tgt, src)
	LOAD %src		; ROUT(%tgt, %src)
	OUT %tgt
.end





///////////////////////////////////////////////////////////////////////////////
//
// LITERAL MACROS
//
///////////////////////////////////////////////////////////////////////////////

// These Lxxx() macros operate on literal values.

// Macro: _LAPPLY1(op, tgt, lit)
//
// Apply unary operation op to lit, store result to tgt.
//
// Side effects:
//   mem[%tgt] = op(%lit)
//   AC = op(%lit)
//   Any side effects of %op
.macro _LAPPLY1(op, tgt, lit)
	LI %lit			; _RAPPLY1(%tgt, %lit)
	%op
	STORE %tgt
.end

	

// Macro: _LAPPLY2(op, tgt, reg, lit)
//
// Apply binary operation op to value of reg and literal value lit, store result in tgt.
//
// Side effects:
//   mem[%tgt] = %lit %op %reg
//   AC = %lit %op %reg
//   Any side effects of %op
.macro _LAPPLY2(op, tgt, reg, lit)
	LI %lit			; _LAPPLY2(%op, %tgt, %reg, %lit)
	%op %reg
	STORE %tgt
.end

	

// Macro: LMOV(tgt,src)
//
// Load value of src and store in tgt.
//
// Side effects:
//   mem[%tgt] = %lit
//   AC = %lit
.macro LMOV(tgt, lit)
	LI %lit 		; LMOV(%tgt, %lit)
	STORE %tgt
.end


// Macro: LADD(tgt,a,lit)
//
// Add values of register a and literal lit and store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a + %lit
//   AC = %a + %lit
//   L
.macro LADD(tgt, a, lit)
	_LAPPLY2(ADD, %tgt, %a, %lit)
.end


	
// Macro: LADC(tgt,a,lit)
//
// Add register to literal with carry. Calculate L + a + lit and store the
// result in tgt.
//
// Side effects:
//   mem[%tgt] = L + %a + %lit
//   AC = L + %a + %lit
//   L
.macro LADC(tgt, a, lit)
	LI %lit			; RADD(%tgt, %a, %lit)
	ADC(%a)
	STORE %tgt
.end


	
// Macro: LSUB(tgt,a,lit)
//
// Subtract literal value li5 from a, store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a - %lit
//   AC = %a - %lit
//   L
.macro LSUB(tgt, a, lit)
	LI %lit
	NEG
	ADD %a
	STORE %tgt
.end


	
// Macro: LAND(tgt,a,lit)
//
// AND values of addresses/register a and literal lit, store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a & %lit
//   AC = %a & %lit
//   L
.macro LAND(tgt, a, lit)
	_LAPPLY2(AND, %tgt, %a, %lit)
.end


	
// Macro: LOR(tgt,a,b)
//
// OR values of addresses/register a and literal lit, store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a | %lit
//   AC = %a | %lit
//   L
.macro LOR(tgt, a, lit)
	_LAPPLY2(OR, %tgt, %a, %lit)
.end


	
// Macro: LXOR(tgt,a,b)
//
// XOR values of addresses/register a and literal lit, store the result in tgt.
//
// Side effects:
//   mem[%tgt] = %a ^ %lit
//   AC = %a | %lit
//   L
.macro LXOR(tgt, a, lit)
	_LAPPLY2(XOR, %tgt, %a, %lit)
.end


	
// Macro: LSBL(tgt, lit)
//
// Location tgt gets the value of lit << 1.
//
// Side effects:
//   mem[%tgt] = %lit << 1
//   AC = %lit << 1
//   L (as per roll instructions)
.macro LSBL(tgt, lit)
	_LAPPLY1(SBL, %tgt, %lit)
.end



// Macro: LRBL(tgt, lit)
//
// Roll literal one bit left, store in tgt.
//
// Side effects:
//   mem[%tgt] = RBL(%lit)
//   AC = RBL(%lit)
//   L (as per roll instructions)
.macro LRBL(tgt, lit)
	_LAPPLY1(RBL, %tgt, %lit)
.end



// Macro: LRNL(tgt, lit)
//
// Roll literal four bits left, store to tgt.
//
// Side effects:
//   mem[%tgt] = RNL(%lit)
//   AC = RNL(%lit)
//   L (as per roll instructions)
.macro LRNL(tgt, lit)
	_LAPPLY1(RNL, %tgt, %lit)
.end

	

// Macro: LRNR(tgt, lit)
//
// Roll literal four bits right, store to tgt.
//
// Side effects:
//   mem[%tgt] = RNR(%lit)
//   AC = RNR(%lit)
//   L (as per roll instructions)
.macro LRNR(tgt, lit)
	_LAPPLY1(RNR, %tgt, %lit)
.end



// Macro: LNOT(tgt, lit)
//
// Take one's complement of literal, store in tgt.
//
// Side effects:
//   mem[%tgt] = %lit ^ &FFFF
//   AC = %lit ^ &FFFF
//   L (as per roll instructions)
.macro LNOT(tgt, lit)
	_LAPPLY1(NOT, %tgt, %lit)
.end



// Macro: LNEG(tgt, lit)
//
// Take two's complement of literal, store in tgt.
//
// Side effects:
//   mem[%tgt] = -%lit
//   AC = -%lit
//   L (as per roll instructions)
.macro LNEG(tgt, lit)
	_LAPPLY1(NEG, %tgt, %lit)
.end



// Macro: LOUT(tgt,li5)
//
// Send value of literal to I/O address tgt.
//
// Side effects:
//   io[%tgt] = %lit
//   AC = %src
.macro LOUT(tgt, lit)
	LI %lit			; LOUT(%tgt, %lit)
	OUT %tgt
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

// Macro: OUTL (addr, literal)
//
// OUT literal to the specified I/O address. (port).
// Conditions:
//   literal must be 0..&3ff.
//
// Side effects:
//   AC = char

.macro OUTL(addr, literal)
	LI %literal		; OUTL(%addr, %literal)
	OUT %addr
.end



// Macro: RIN(reg, addr)
//
// IN from addr and store to reg.
//
// Side effects:
//   AC = char

.macro RIN(reg, addr)
	IN %ADDR		; RIN(%reg, %addr)
	STORE %reg
.end



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
	PUSH(SP)
	FORTH(dw_EMIT)
.end



	

///////////////////////////////////////////////////////////////////////////////
//
// LONG JUMPS ETC
//
///////////////////////////////////////////////////////////////////////////////

// Macro: LJUMP (label)
//
// Jump to a label far from the current page.
// Conditions:
//   None, but the word after the JMP instruction is non-executable (data).
//
// Side effects:
//   Those of JMP.
.macro LJMP(label)
	JMP I @+1		; LJMP(%label)
	.word %label
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
