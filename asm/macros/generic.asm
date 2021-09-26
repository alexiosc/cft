;;; -*- cftasm -*-
		
;;; Generic Assembly Macros.
;;;
;;; Copyright © 2014-2021 Alexios Chouchoulas.
;;;
;;; This program is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by the Free
;;; Software Foundation; either version 2, or (at your option) any later
;;; version.
;;; 
;;; This program is distributed in the hope that it will be useful, but WITHOUT
;;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;;; more details.
;;; 
;;; You should have received a copy of the GNU General Public License along with
;;; this program; if not, write to the Free Software Foundation, Inc., 59 Temple
;;; Place - Suite 330, Boston, MA 02111-1307, USA.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; LITERAL MACROS
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; We need quite a few macros on the CFT because of its simplicity


	
;;; Macro: LSET(tgt,literal)
;;;
;;; Set tgt with literal value.
;;;
;;; Warnings:
;;;   %literal must be between &000 and &3ff.
;;;
;;; Side effects:
;;;   mem[%tgt] = %literal
;;;   AC = %literal
.macro LSET(tgt, literal)
		LI %literal		; LSET(%tgt, %literal)
		STORE %tgt
.endmacro

	




		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		

		
;;; 
;;; OBSOLETE?
;;; 
;;; 
;;; ;;; Macro: CMPEQ(a, b)
;;;
;;; Compare a and b for equality (XOR)
;;;
;;; Side effects:
;;;   AC = a ^ b
.macro CMPEQ (a, b)
		LOAD %a			; CMPEQ(%a, %b)
		XOR %b
.endmacro

;;; Macro: LINC (addr, n)
;;;
;;; Increment the value at addr by n.
;;;
;;; Warnings:
;;;   %addr must be page-local.
;;;   %n must be between &000 and &3ff.
;;	
;;; Side effects:
;;;   mem[addr] += n
;;;   AC = mem[addr]
;;;   L
.macro LINC (addr,n)
		LI %n			; LINC(%addr, %n)
		ADD %addr
		STORE %addr
.endmacro



		
; ;;; Macro: RINC (addr)
; ;;;
; ;;; Increment the value at addr by 1.
; ;;;
; ;;; Warnings:
; ;;;   %addr must be page-local.
; ;;;   %n must be between &000 and &3ff.
; ;;	
; ;;; Side effects:
; ;;;   mem[addr]++
; ;;;   AC = mem[addr]
; ;;;   L
; .macro RINC (addr)
; 		LINC(%addr, 1)
; .endmacro

; ;;; Macro: LDECn (addr)
; ;;;
; ;;; Decrement the value at addr by one.
; ;;;
; ;;; Conditions:
; ;;;   %n must be 1, 2, or 3.
; ;;;
; ;;; Side effects:
; ;;;   mem[addr] -= n
; ;;;   AC = mem[addr]
; ;;;   L
; .macro LDECn (addr, n)
; 		LOAD %addr		; LDECn(%addr, %n)
; 		ADD MINUS%n
; 		STORE %addr
; .endmacro

; ;;; Macro: DECM (addr)
; ;;;
; ;;; Decrement the value at addr by one.
; ;;;
; ;;; Side effects:
; ;;;   mem[addr]--
; ;;;   AC = mem[addr]
; ;;;   L
; .macro DECM (addr)
; 		LDECn (%addr, 1)
; .endmacro



; ;;;; Macro: SIA (addr, reg)
; ;;;
; ;;;; Store an address to a register (using LIA).
; ;;;
; ;;;; Side effects:
; ;;;;   mem[reg] = addr
; ;;;;   AC = addr
; .macro SIA (reg, addr)
; 		LIA %addr		; SIA(%reg, %addr)
; 		STORE %reg
; .endmacro

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; TRAPS AND CALLING CONVENTIONS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; .macro ROMTRAP1(trap, arg1)
; .endmacro


; ;;; Macro: ENTTRAP (reg)
; ;;;
; ;;; Enter a trap. Stores a pointer to the trap's argument block to %reg
; ;;; (TI0 is a good choice). Leaves trap return address in A so it can be
; ;;; saved.
; ;;;
; ;;; Side effects:
; ;;;   TR0 = RTTV + %argc
; ;;;   PC = mem[RTTV] + %argc
; ;;;   L
; .macro ENTTRAP(reg)
; 		LOAD I RTTV		; ENTTRAP(%reg)
; 		STORE %reg
; 		LOAD RTTV
; .endmacro

; ;;; Macro: RETTRAP (argc)
; ;;;
; ;;; Return from a trap that uses %argc arguments.
; ;;;
; ;;; Side effects:
; ;;;   TR0 = RTTV + %argc
; ;;;   PC = mem[RTTV] + %argc
; ;;;   L
; .macro RETTRAP(argc)
; 		STORE TR1		; RETTRAP(%argc)
; 		LI %argc
; 		ADD RTTV
; 		STORE TR0
; 		LOAD TR1
; 		JMP I TR0
; .endmacro



; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; REGISTER MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; These Rxxx() macros operate on 3-register sets, like grown up CPU instruction
; ;;; sets.

; ;;; Macro: _RAPPLY1(op, tgt, src)
; ;;;
; ;;; Apply unary operation op to value of src, store result to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = op(%src)
; ;;;   AC = op(%src)
; ;;;   Any side effects of %op
; .macro _RAPPLY1(op, tgt, src)
; 		LOAD %src		; _RAPPLY1(%tgt, %src)
; 		%op
; 		STORE %tgt
; .endmacro

	

; ;;; Macro: _RAPPLY1B(op, tgt, src)
; ;;;
; ;;; Apply binary operation op to value of tgt and src, store result to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %tgt %op %src
; ;;;   AC = %tgt %op %src
; ;;;   Any side effects of %op
; .macro _RAPPLY1B(op, tgt, src)
; 		LOAD %tgt		; _RAPPLY1B(%tgt, %src)
; 		%op %src
; 		STORE %tgt
; .endmacro

	

; ;;; Macro: _RAPPLY2(op, tgt, a, b)
; ;;;
; ;;; Apply binary operation op to value of a and b, store result to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a %op %b
; ;;;   AC = %a %op %b
; ;;;   Any side effects of %op
; .macro _RAPPLY2(op, tgt, a, b)
; 		LOAD %a			; _RAPPLY2(%op, %tgt, %a, %b)
; 		%op %b
; 		STORE %tgt
; .endmacro

	

; ;;; Macro: RMOV(tgt,src)
; ;;;
; ;;; Load value of src and store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %src
; ;;;   AC = %src
; .macro RMOV(tgt, src)
; 		LOAD %src		; RMOV(%tgt, %src)
; 		STORE %tgt
; .endmacro


; ;;; Macro: RADD(tgt,a,b)
; ;;;
; ;;; Add values of addresses/registers a + b and store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a + %b
; ;;;   AC = %a + %b
; ;;;   L
; .macro RADD(tgt, a, b)
; 		_RAPPLY2(ADD, %tgt, %a, %b)
; .endmacro


	
; ;;; Macro: RADD1(tgt,a)
; ;;;
; ;;; Add value of a to address at tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] += %a
; ;;;   AC = %tgt + %b
; ;;;   L
; .macro RADD1(tgt, a)
; 		_RAPPLY1B(ADD, %tgt, %a)
; .endmacro


	
; ;;; Macro: RADC(tgt,a,b)
; ;;;
; ;;; Register add with carry. Calculate L + a + b and store the
; ;;; result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = L + %a + %b
; ;;;   AC = L + %a + %b
; ;;;   L
; .macro RADC(tgt, a, b)
; 		LOAD %a			; RADD(%tgt, %a, %b)
; 		ADC(%b)
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: RADC2(tgt,a)
; ;;;
; ;;; Register add with carry. Calculate L + tgt + a and store the
; ;;; result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] += L + %a
; ;;;   AC = L + %tgt + %a
; ;;;   L
; .macro RADC1(tgt, a)
; 		LOAD %tgt		; RADC1(%tgt, %a)
; 		ADC(%a)
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: RSUB(tgt,a,b)
; ;;;
; ;;; Subtract values of addresses/registers a - b and store the result in tgt.
; ;;,b
; ;;; Side effects:
; ;;;   mem[%tgt] = %a - %b
; ;;;   AC = %a - %b
; ;;;   L
; .macro RSUB(tgt, a, b)
; 		LOAD %b			; RSUB(%tgt, %a, %b)
; 		NEG
; 		ADD %a
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: RSUB1(tgt,a)
; ;;;
; ;;; Subtract values of a from tgt, store to tgt.
; ;;,b
; ;;; Side effects:
; ;;;   mem[%tgt] -= %a
; ;;;   AC = %tgt - %a
; ;;;   L
; .macro RSUB1(tgt, a)
; 		LOAD %a			; RSUB1(%tgt, %a)
; 		NEG
; 		ADD %tgt
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: RAND(tgt,a,b)
; ;;;
; ;;; AND values of addresses/registers a & b and store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a & %b
; ;;;   AC = %a & %b
; ;;;   L
; .macro RAND(tgt, a, b)
; 		_RAPPLY2(AND, %tgt, %a, %b)
; .endmacro


	
; ;;; Macro: RAND1(tgt,a)
; ;;;
; ;;; AND values of tgt & a, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] &= %a
; ;;;   AC = %tgt & %a
; ;;;   L
; .macro RAND1(tgt, a)
; 		_RAPPLY1B(AND, %tgt, %a)
; .endmacro


	
; ;;; Macro: ROR(tgt,a,b)
; ;;;
; ;;; OR values of addresses/registers a & b and store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a | %b
; ;;;   AC = %a | %b
; ;;;   L
; .macro ROR(tgt, a, b)
; 		_RAPPLY2(OR, %tgt, %a, %b)
; .endmacro


	
; ;;; Macro: ROR1(tgt,a)
; ;;;
; ;;; OR values of tgt & a, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] |= %a
; ;;;   AC = %tgt | %a
; ;;;   L
; .macro ROR1(tgt, a)
; 		_RAPPLY1B(OR, %tgt, %a)
; .endmacro


	
; ;;; Macro: RXOR(tgt,a,b)
; ;;;
; ;;; OR values of addresses/registers a & b and store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a ^ %b
; ;;;   AC = %a ^ %b
; ;;;   L
; .macro RXOR(tgt, a, b)
; 		_RAPPLY2(XOR, %tgt, %a, %b)
; .endmacro


	
; ;;; Macro: RXOR1(tgt,a)
; ;;;
; ;;; XOR values of tgt & a, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] ^= %a
; ;;;   AC = %tgt ^ %a
; ;;;   L
; .macro RXOR1(tgt, a)
; 		_RAPPLY1B(XOR, %tgt, %a)
; .endmacro


	
; ;;; Macro: RSBL(tgt, src)
; ;;;
; ;;; Location tgt gets the value of src << 1.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a << 1
; ;;;   AC = %a - %b << 1
; ;;;   L (as per roll instructions)
; .macro RSBL(tgt, src)
; 		_RAPPLY1(SBL, %tgt, %src)
; .endmacro

	

; ;;; Macro: RSBR(tgt, src)
; ;;;
; ;;; Location tgt gets the value of src >> 1.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a >> 1
; ;;;   AC = %a - %b >> 1
; ;;;   L (as per roll instructions)
; .macro RSBR(tgt, src)
; 		_RAPPLY1(SBR, %tgt, %src)
; .endmacro

	

; ;;; Macro: RRBL(tgt, src)
; ;;;
; ;;; Roll src one bit left, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a << 1
; ;;;   AC = %a - %b << 1
; ;;;   L (as per roll instructions)
; .macro RRBL(tgt, src)
; 		_RAPPLY1(RBL, %tgt, %src)
; .endmacro

	

; ;;; Macro: RRBR(tgt, src)
; ;;;
; ;;; Roll src one bit right, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a >> 1
; ;;;   AC = %a - %b >> 1
; ;;;   L (as per roll instructions)
; .macro RRBR(tgt, src)
; 		_RAPPLY1(RBR, %tgt, %src)
; .endmacro

	

; ;;; Macro: RRNL(tgt, src)
; ;;;
; ;;; Roll src four bits left, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a >> 1
; ;;;   AC = %a - %b >> 1
; ;;;   L (as per roll instructions)
; .macro RRNL(tgt, src)
; 		_RAPPLY1(RNL, %tgt, %src)
; .endmacro

	

; ;;; Macro: RRNR(tgt, src)
; ;;;
; ;;; Roll src four bits right, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a >> 1
; ;;;   AC = %a - %b >> 1
; ;;;   L (as per roll instructions)
; .macro RRNR(tgt, src)
; 		_RAPPLY1(RNR, %tgt, %src)
; .endmacro



; ;;; Macro: RNOT(tgt, src)
; ;;;
; ;;; Take one's complement of src, store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = mem[src] ^ &FFFF
; ;;;   AC = mem[src] ^ &FFFF
; ;;;   L (as per roll instructions)
; .macro RNOT(tgt, src)
; 		_RAPPLY1(NOT, %tgt, %src)
; .endmacro



; ;;; Macro: RNEG(tgt, src)
; ;;;
; ;;; Take two's complement of src, store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = mem[src] ^ &FFFF
; ;;;   AC = mem[src] ^ &FFFF
; ;;;   L (as per roll instructions)
; .macro RNEG(tgt, src)
; 		_RAPPLY1(NEG, %tgt, %src)
; .endmacro



; ;;; Macro: ROUT(tgt,src)
; ;;;
; ;;; Send value of src to I/O address tgt.
; ;;;
; ;;; Side effects:
; ;;;   io[%tgt] = %src
; ;;;   AC = %src
; .macro ROUT(tgt, src)
; 		LOAD %src		; ROUT(%tgt, %src)
; 		OUT %tgt
; .endmacro


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; LITERAL MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; These Lxxx() macros operate on literal values.

; ;;; Macro: _LAPPLY1(op, tgt, lit)
; ;;;
; ;;; Apply unary operation op to lit, store result to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = op(%lit)
; ;;;   AC = op(%lit)
; ;;;   Any side effects of %op
; .macro _LAPPLY1(op, tgt, lit)
; 		LI %lit			; _RAPPLY1(%tgt, %lit)
; 		%op
; 		STORE %tgt
; .endmacro

	

; ;;; Macro: _LAPPLY2(op, tgt, reg, lit)
; ;;;
; ;;; Apply binary operation op to value of reg and literal value lit, store result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %lit %op %reg
; ;;;   AC = %lit %op %reg
; ;;;   Any side effects of %op
; .macro _LAPPLY2(op, tgt, reg, lit)
; 		LI %lit			; _LAPPLY2(%op, %tgt, %reg, %lit)
; 		%op %reg
; 		STORE %tgt
; .endmacro

	

; ;;; Macro: LMOV(tgt,lit)
; ;;;
; ;;; Store literal value lit in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %lit
; ;;;   AC = %lit
; .macro LMOV(tgt, lit)
; 		LI %lit 		; LMOV(%tgt, %lit)
; 		STORE %tgt
; .endmacro


; ;;; Macro: LADD(tgt,a,lit)
; ;;;
; ;;; Add values of register a and literal lit and store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a + %lit
; ;;;   AC = %a + %lit
; ;;;   L
; .macro LADD(tgt, a, lit)
; 		_LAPPLY2(ADD, %tgt, %a, %lit)
; .endmacro


	
; ;;; Macro: LADC(tgt,a,lit)
; ;;;
; ;;; Add register to literal with carry. Calculate L + a + lit and store the
; ;;; result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = L + %a + %lit
; ;;;   AC = L + %a + %lit
; ;;;   L
; .macro LADC(tgt, a, lit)
; 		LI %lit			; RADD(%tgt, %a, %lit)
; 		ADC(%a)
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: LSUB(tgt,a,lit)
; ;;;
; ;;; Subtract literal value li5 from a, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a - %lit
; ;;;   AC = %a - %lit
; ;;;   L
; .macro LSUB(tgt, a, lit)
; 		LI %lit
; 		NEG
; 		ADD %a
; 		STORE %tgt
; .endmacro


	
; ;;; Macro: LAND(tgt,a,lit)
; ;;;
; ;;; AND values of addresses/register a and literal lit, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a & %lit
; ;;;   AC = %a & %lit
; ;;;   L
; .macro LAND(tgt, a, lit)
; 		_LAPPLY2(AND, %tgt, %a, %lit)
; .endmacro


	
; ;;; Macro: LAND1(tgt,lit)
; ;;;
; ;;; AND value of addresses/register tgt and literal lit, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] &= %lit
; ;;;   AC = mem[%tgt] & %lit
; ;;;   L
; .macro LAND1(tgt, lit)
; 		_LAPPLY2(AND, %tgt, %tgt, %lit)
; .endmacro


	
; ;;; Macro: LOR(tgt,a,lit)
; ;;;
; ;;; OR values of addresses/register a and literal lit, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a | %lit
; ;;;   AC = %a | %lit
; ;;;   L
; .macro LOR(tgt, a, lit)
; 		_LAPPLY2(OR, %tgt, %a, %lit)
; .endmacro


	
; ;;; Macro: LOR1(tgt,lit)
; ;;;
; ;;; OR value of addresses/register tgt and literal lit, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] |= %lit
; ;;;   AC = mem[%tgt] | %lit
; ;;;   L
; .macro LOR1(tgt, lit)
; 		_LAPPLY2(OR, %tgt, %tgt, %lit)
; .endmacro


	
; ;;; Macro: LXOR(tgt,a,b)
; ;;;
; ;;; XOR values of addresses/register a and literal lit, store the result in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %a ^ %lit
; ;;;   AC = %a | %lit
; ;;;   L
; .macro LXOR(tgt, a, lit)
; 		_LAPPLY2(XOR, %tgt, %a, %lit)
; .endmacro


	
; ;;; Macro: LSBL(tgt, lit)
; ;;;
; ;;; Location tgt gets the value of lit << 1.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %lit << 1
; ;;;   AC = %lit << 1
; ;;;   L (as per roll instructions)
; .macro LSBL(tgt, lit)
; 		_LAPPLY1(SBL, %tgt, %lit)
; .endmacro



; ;;; Macro: LRBL(tgt, lit)
; ;;;
; ;;; Roll literal one bit left, store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = RBL(%lit)
; ;;;   AC = RBL(%lit)
; ;;;   L (as per roll instructions)
; .macro LRBL(tgt, lit)
; 		_LAPPLY1(RBL, %tgt, %lit)
; .endmacro



; ;;; Macro: LRNL(tgt, lit)
; ;;;
; ;;; Roll literal four bits left, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = RNL(%lit)
; ;;;   AC = RNL(%lit)
; ;;;   L (as per roll instructions)
; .macro LRNL(tgt, lit)
; 		_LAPPLY1(RNL, %tgt, %lit)
; .endmacro

	

; ;;; Macro: LRNR(tgt, lit)
; ;;;
; ;;; Roll literal four bits right, store to tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = RNR(%lit)
; ;;;   AC = RNR(%lit)
; ;;;   L (as per roll instructions)
; .macro LRNR(tgt, lit)
; 		_LAPPLY1(RNR, %tgt, %lit)
; .endmacro



; ;;; Macro: LNOT(tgt, lit)
; ;;;
; ;;; Take one's complement of literal, store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = %lit ^ &FFFF
; ;;;   AC = %lit ^ &FFFF
; ;;;   L (as per roll instructions)
; .macro LNOT(tgt, lit)
; 		_LAPPLY1(NOT, %tgt, %lit)
; .endmacro



; ;;; Macro: LNEG(tgt, lit)
; ;;;
; ;;; Take two's complement of literal, store in tgt.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgt] = -%lit
; ;;;   AC = -%lit
; ;;;   L (as per roll instructions)
; .macro LNEG(tgt, lit)
; 		_LAPPLY1(NEG, %tgt, %lit)
; .endmacro



; ;;; Macro: LOUT(tgt,li5)
; ;;;
; ;;; Send value of literal to I/O address tgt.
; ;;;
; ;;; Side effects:
; ;;;   io[%tgt] = %lit
; ;;;   AC = %src
; .macro LOUT(tgt, lit)
; 		LI %lit			; LOUT(%tgt, %lit)
; 		OUT %tgt
; .endmacro


; ;;; Macro: LOUTX(base,ofs,lit)
; ;;;
; ;;; Output value %lit to the I/O address %base + %ofs, where %base is a register
; ;;; and %ofs is a literal.
; ;;;
; ;;; Side effects:
; ;;;   MTMP0
; ;;;   io[mem[%base] + %ofs] = %lit
; ;;;   AC = %src
; .macro LOUTX(base, ofs, lit)
; 		LI %ofs			; LOUTX(%base, %ofs, %lit)
; 		ADD %base
; 		STORE MTMP0
; 		LI %lit
; 		OUT I MTMP0
; .endmacro


; ;;; Macro: INX(base,ofs)
; ;;;
; ;;; Input a value from the I/O address %base + %ofs, where %base is a register
; ;;; and %ofs is a literal.
; ;;;
; ;;; Side effects:
; ;;;   MTMP0
; ;;;   AC = io[mem[%base] + %ofs]
; .macro INX(base, ofs)
; 		LI %ofs			; INX(%base, %ofs)
; 		ADD %base
; 		STORE MTMP0
; 		IN I MTMP0
; .endmacro


; ;;; Macro: LRET(literal)
; ;;;
; ;;; Load AC with a literal and RETurn.
; ;;;
; ;;; Side effects:
; ;;;   AC = %literal
; ;;;   PC = mem[RETV]
; .macro LRET(literal)
; 		LI %literal		; LRET(%literal)
; 		RET
; .endmacro


; ;;; Macro: RRET(addr)
; ;;;
; ;;; Load AC with the value at the specfied address and RETurn.
; ;;;
; ;;; Side effects:
; ;;;   AC = mem[%addr]
; ;;;   PC = mem[RETV]
; .macro RRET(addr)
; 		LOAD %addr		; RRET(%addr)
; 		RET
; .endmacro


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; INDEXING
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: INDEX(addr, ofs)
; ;;;
; ;;; Load a value from a table at addr, offset by ofs (register) words.
; ;;; 
; ;;; Add the value at location ofs to the value at location addr. Store the
; ;;; result at location addr and retrieve the value pointed to by that result.
; ;;;
; ;;; Side effects:
; ;;;   %addr = [%addr] + [%ofs]
; ;;;   AC = [[%addr] + [%ofs]]

; .macro INDEX(addr, ofs)
; 		LOAD %ofs		; INDEX(%addr, %ofs)
; 		ADD %addr
; 		STORE %addr
; 		LOAD I %tmp 
; .endmacro

; ;;; Macro: RINDEX(addr, ofs, tmp)
; ;;;
; ;;; Load a value from a table at addr, offset by ofs (register) words.
; ;;; 
; ;;; Add the value at location ofs to the value at location addr. Store the
; ;;; result at location tmp and retrieve the value pointed to by that result.
; ;;;
; ;;; Side effects:
; ;;;   %tmp = [%addr] + [%ofs]
; ;;;   AC = [[%addr] + [%ofs]]

; .macro RINDEX(addr, ofs, tmp)
; 		LOAD %ofs		; RINDEX(%addr, %ofs, %tmp)
; 		ADD %addr
; 		STORE %tmp
; 		LOAD I %tmp
; .endmacro

; ;;; Macro: LINDEX(addr, ofs, tmp)
; ;;;
; ;;; Load a value from a table at addr, offset by ofs (literal) words.
; ;;; 
; ;;; Add the value at location ofs to the value at location addr. Store the
; ;;; result at location tmp and retrieve the value pointed to by that result.
; ;;;
; ;;; Conditions:
; ;;;   %ofs must be &000-&3FF.
; ;;;
; ;;; Side effects:
; ;;;   %tmp = [%addr] + %ofs
; ;;;   AC = [[%addr] + %ofs]

; .macro LINDEX(addr, ofs, tmp)
; 		LI %ofs			; LINDEX(%addr, %ofs, %tmp)
; 		ADD %addr
; 		STORE %tmp
; 		LOAD I %tmp
; .endmacro

		
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; 32-BIT MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: DCMP(ah, al, bh, bl)
; ;;;
; ;;; Compare two 32-bit values and yield the difference between either the high
; ;;; word or low word (which one is indeterminate, so don't rely on it) and
; ;;; appropriate values in the flag registers.
; ;;;
; ;;; This macro does not perform a full 32-bit subtraction. It compares the high
; ;;; order words. If they're equal, it also compares the low order words. It uses
; ;;; subtraction per word, but without borrow (sic) propagation.
; ;;;
; ;;; Side effects:
; ;;;   AC:	High word (ah-al) or low word difference (bh-bl).
; ;;;   Z:	Set if <ah,al> = <bh,bl>
; ;;;   N:	Set if <ah,al> < <bh,bl>
; .macro DCMP(ah, al, bh, bl)
; 		LOAD bh			; DCMP(%ah, %al, %bh, %bl)
; 		NEG
; 		ADD ah			; Calculate %ah - %bh
; 		SZA			; Equal?
; 		JMP @+4			; No, don't bother with low order words.
; 		LOAD bl
; 		NEG
; 		ADD al			; Calculate %al - %bl
; .endmacro
		
; ;;; Macro: DSBR1(hi,lo)
; ;;;
; ;;; Right shift a 32-bit quantity stored in a pair of high/low registers.
; ;;;
; ;;; Side effects:
; ;;;   mem[%hi] = msw(<hi,lo> >> 1)
; ;;;   mem[%lo] = lsw(<hi,lo> >> 1)
; ;;;   AC, L
; .macro DSBR1(hi, lo)
; 		LOAD %hi		; DSBL1(%hi, %lo)
; 		SBR
; 		STORE %hi
; 		LOAD %lo
; 		RBR
; 		STORE %lo
; .endmacro


; ;;; Macro: DSBL1(hi,lo)
; ;;;
; ;;; Left shift a 32-bit quantity stored in a pair of high/low registers.
; ;;;
; ;;; Side effects:
; ;;;   mem[%hi] = msw(<hi,lo> << 1)
; ;;;   mem[%lo] = lsw(<hi,lo> << 1)
; ;;;   AC, L
; .macro DSBL1(hi, lo)
; 		LOAD %lo		; DSBL1(%hi, %lo)
; 		SBL
; 		STORE %lo
; 		LOAD %hi
; 		RBR
; 		STORE %hi
; .endmacro

		
; ;;; Macro: DADD(xh, xl, ah, al, bh, bl)
; ;;;
; ;;; Evaluate the result of the 32-bit addition <ah,al>+<bh,bl> and store it in
; ;;; <xh, xl>.
; ;;;
; ;;; Side effects:
; ;;;   mem[%xh] = msw(<ah,al> + <bh, bl>)
; ;;;   mem[%xl] = lsw(<ah,al> + <bh, bl>)
; ;;;   AC, L
; .macro DADD(xh, xl, ah, al, bh, bl)
; 		; DEBUGON
; 		CLL			; DADD(%xh, %xl, %ah, %al, %bh, %bl)
; 		LOAD %al
; 		ADD %bl
; 		STORE %xl

; 		LOAD %ah
; 		IFL INC	CLL		; Propagate carry
; 		ADD %bh
; 		STORE %xh
; 		; DEBUGOFF
; 		; HALT
; .endmacro

	
; ;;; Macro: DINC(regh, regl)
; ;;;
; ;;; Increment <regh,regl> by 1.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgth]
; ;;;   mem[%tgtl]
; ;;;   AC
; ;;;   L (as per roll instructions)
; .macro DINC(regh, regl)
; 		LOAD %regl              ; DINC(%regh, %regl)
; 		CLL INC                 ; Increment by 1. Set up for carry
;                                         ; propagation
; 		STORE %regl
; 		LOAD %regh
; 		IFL INC                 ; Propagate carry.
; 		STORE %regh
; .endmacro

	
	
; ;;; Macro: DRNEG(tgth, tgtl, srch, srcl)
; ;;;
; ;;; Take two's complement of the 32-bit value <srch,srcl>, store in <tgth,tgtl>.
; ;;;
; ;;; Side effects:
; ;;;   mem[%tgth]
; ;;;   mem[%tgtl]
; ;;;   AC
; ;;;   L (as per roll instructions)
; .macro DRNEG(tgth, tgtl, srch, srcl)
; 		LOAD %srcl		; DRNEG(%tgth, %tgtl, %srch, %srcl)
; 		OP1 CLL NOT INC         ; NEG with carry out
; 		STORE %tgtl
; 		LOAD %srch
; 		XOR R MINUS1            ; Fast complementation
; 		IFL INC                 ; Propagate the carry
; 		STORE %tgth
; .endmacro

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; PACKED STRING MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: GETLOCHAR()
; ;;;
; ;;; Given a 16-bit word, extract the least significant 8 bits.
; ;;;
; ;;; Side effects:
; ;;;   AC = AC & 0xff
; .macro GETLOCHAR()
; 		AND BYTELO		; AND &00ff
; .endmacro


	
; ;;; Macro: GETHICHAR()
; ;;;
; ;;; Given a 16-bit word, extract the most significant 8 bits, shifted 8 bits
; ;;; right.
; ;;;
; ;;; Side effects:
; ;;;   AC = (AC >> 8) & 0xff00)
; ;;;   L	
; .macro GETHICHAR()
; 		RNR			; GETHICHAR()
; 		RNR
; 		AND BYTELO		; AND &00ff
; .endmacro


	
; ;;; Macro: MAKEHICHAR()
; ;;;
; ;;; Given a 8-bit character, shift it 8 bits to the right and prepare it for
; ;;; storage in a bit-packed string.
; ;;;
; ;;; Side effects:
; ;;;   AC = (AC << 8) & 0xff00)
; ;;;   L	
; .macro MAKEHICHAR()
; 		RNL			; MAKEHICHAR()
; 		RNL
; 		AND BYTEHI		; AND &ff00
; .endmacro

	

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; I/O CONVENIENCE MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: OUTL (addr, literal)
; ;;;
; ;;; OUT literal to the specified I/O address. (port).
; ;;; Conditions:
; ;;;   literal must be 0..&3ff.
; ;;;
; ;;; Side effects:
; ;;;   AC = char

; .macro OUTL(addr, literal)
; 		LI %literal		; OUTL(%addr, %literal)
; 		OUT %addr
; .endmacro



; ;;; Macro: RIN(reg, addr)
; ;;;
; ;;; IN from addr and store to reg.
; ;;;
; ;;; Side effects:
; ;;;   AC = char

; .macro RIN(reg, addr)
; 		IN %addr		; RIN(%reg, %addr)
; 		STORE %reg
; .endmacro



; ;;; Macro: PUTC (char)
; ;;;
; ;;; Output the specified character.
; ;;; Conditions:
; ;;;   char must be 0..&3ff. Most output devices will just use the
; ;;;     value modulo 256 anyway, but the value must fit in a CFT instruction.
; ;;;
; ;;; Side effects:
; ;;;   AC = char

; .macro PUTC(char)
;  		LI %char		; PUTC(%char)
; 		PUSH(SP)
; 		FORTH(dw_EMIT)
; .endmacro


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; LONG JUMPS ETC
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: FARJUMP (label)
; ;;;
; ;;; Jump to a label far from the current page.
; ;;; Conditions:
; ;;;   None, but the word after the JMP instruction is non-executable (data).
; ;;;
; ;;; Side effects:
; ;;;   Those of JMP.
; .macro FARJMP(label)
; 		JMP I @+1		; LJMP(%label)
; 		.word %label
; .endmacro


; ;;; Macro: FARCALL (page, addr)
; ;;;
; ;;; Request an OS service mapped to a certain page.
; ;;;
; ;;; Conditions:
; ;;;   %page is &00-&FF.
; ;;;
; ;;; Side effects:
; ;;;   Too many to mention. The page mapping will be restored when done, though.
; .macro FARCALL(page, addr)
; 		TRAP I T_FARCALL	; FARCALL(%page, %addr)
; 		.data @%page&255	; Page number
; 		.data @%addr>>13	; Bank to map it to
; 		.data @%addr		; Address to jump to
; .endmacro
		
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; DEBUGGING MACROS
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: PRINT32 (hi,lo)
; ;;;
; ;;; Output the specified character.
; ;;; Conditions:
; ;;;   Prints out a 32-bit number in locations hi, lo.
; ;;;
; ;;; Side effects:
; ;;;   AC = char
; .macro PRINT32(hi,lo)
; 		LOAD %hi
; 		PRINTHI
; 		LOAD %lo
; 		PRINTLO
; .endmacro

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;
; ;;; ROM BOILERPLATE
; ;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;; Macro: ROM_HEADER(numprograms)
; ;;;
; ;;; Output a ROM header suitable for autodetection by the boot loader. The ROM
; ;;; header must be assembled at a multiple of &1000 (4kW) because this is where
; ;;; the boot loader looks.
; ;;;
; ;;; Conditions:
; ;;;   Must be assembled at a multiple of &1000.

; ;;;   Must be followed by a one 16-word packed string (32-character) per
; ;;;   program (the name of the program):
; ;;;
; ;;; Format:
; ;;;   0000:	&0cf7 (magic)
; ;;;   0001:	@-1 (origin address for MBU)
; ;;;   0002:	%numprograms
; ;;;   0003:	&0000 (reserved)
; ;;;   0004-0012:	Program #1 name. 29 characters max (15-words,  strp,
; ;;;  		space padded, null terminated)
; ;;;   0013:	Program #1 address.
; ;;;   0014-0022:	Program #2 name.
; ;;;   0023:	Program #2 address.
; ;;;   ...

; .macro ROM_HEADER(numprograms)

; 		;;; ROM_HEADER(numprograms)
		
; 		.word &0cf7		; Magic (CFT)
; 		.word &1234		; Magic
; 		.word @-1		; Origin addr.
; 		.word %numprograms	; Number of programs
; 		.word 0			; Reserved
; .endmacro

;;; End of file.
