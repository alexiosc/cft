;;; -*- cftasm -*-
		
;;; Conditional Macros.
;;;
;;; Copyright © 2014 Alexios Chouchoulas.
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

///////////////////////////////////////////////////////////////////////////////
//
// Skips with ‘if’ semantics
//
///////////////////////////////////////////////////////////////////////////////

;;; Define single-instruction macros that make more sense, with reverse
;;; semantics of the skip ones: rather than ‘skip if negative’, we say ‘if
;;; non-negative’.

.equ IFNA       SNN			; If AC < 0: skip if AC ≥ 0 (non-neg)
.equ IFNP	SPA			; If AC ≤ 0: skip if AC > 0 (positive)
.equ IFZA	SNZ			; If AC = 0: skip if AC ≠ 0 (non-zero)
.equ IFNZ	SZA			; If AC ≠ 0: skip if AC = 0 (zero)
.equ IFNN	SNA			; If AC ≥ 0: skip if AC < 0 (negative)
.equ IFPA	SNP			; If AC > 0: skip if AC ≤ 0 (non-pos)

.equ IFSL       SCL			; If L set: skip if L clear
.equ IFCL       SSL			; If L clear: skip if L set
		
.equ IFSV       SCV			; If V set: skip if V clear
.equ IFCV       SSV			; If V clear: skip if V set
		
///////////////////////////////////////////////////////////////////////////////
//
// Conditional jump macros
//
///////////////////////////////////////////////////////////////////////////////

;;; Macro: JNA (addr)
;;;
;;; Jump to address if AC < 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JNA(addr)
		IFNA			; JNA(%addr)
		JMP %addr
.end

;;; Macro: JNP (addr)
;;;
;;; Jump to address if AC ≤ 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JNP(addr)
		IFNP			; JNP(%addr)
		JMP %addr
.end

;;; Macro: JZA (addr)
;;;
;;; Jump to address if AC = 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JZA(addr)
		IFZA			; JZA(%addr)
		JMP %addr
.end

		
;;; Macro: JZA (addr)
;;;
;;; Jump to address if AC ≠ 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JNZ(addr)
		IFNZ			; JNZ(%addr)
		JMP %addr
.end

		
;;; Macro: JNN (addr)
;;;
;;; Jump to address if AC ≥ 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JNN(addr)
		IFNN			; JNN(%addr)
		JMP %addr
.end

		
;;; Macro: JPA (addr)
;;;
;;; Jump to address if AC > 0. The address is a JMP operand.
;;;
;;; Side effects:
;;;   PC = addr (if the jump is taken)

.macro JPA(addr)
		IFPA			; JPA(%addr)
		JMP %addr
.end

		
;;; Macro: IFEQJMP (addr, then)
;;;
;;; If AC == mem[%addr], jump to %then.
;;;
;;; Side effects:
;;;   AC = AC XOR mem[%addr]
;;;   PC (if the jump is taken)

.macro IFEQJMP(addr, then)
		XOR %addr		; IFEQJMP(%addr, %then)
		IFZA
		JMP %then
.end


;;; Macro: IFNEQJMP (addr, then)
;;;
;;; If AC != mem[%addr], jump to %then.
;;;
;;; Side effects:
;;;   AC = AC XOR mem[%addr]
;;;   PC (if the jump is taken)

.macro IFNEQJMP(addr, then)
		XOR %addr		; IFNEQJMP(%addr, %then)
		IFNZ
		JMP %then
.end

		
///////////////////////////////////////////////////////////////////////////////
//
// Jump tables
//
///////////////////////////////////////////////////////////////////////////////		

;;; Macro: JMPTAB (table, tmp, ofs)
;;;
;;; Using the value in the address ofs, jump to the jump table entry at table +
;;; mem[ofs]. A temporary register tmp is used to calculate the address to jump
;;; to. NO checks are performed. tmp and ofs may be the same location, but ofs
;;; will be overwritten.
;;;
;;; Side effects:
;;;   AC = table + [ofs]
;;;   PC = [table + [ofs]]
;;;   L
;;;   %tmp = table + [ofs]

.macro JMPTAB(table, tmp, ofs)
		LIA %table		; JMPTAB(%table, %tmp, %ofs)
		ADD %ofs
		STORE %tmp
		JMPII %tmp
.end		
		
;;; Macro: CASETAB (ofs)
;;;
;;; A special compact form of JMPTAB(). This one CLOBBERS the offset location ofs
;;; and requires that the jump table immediately follow the CASE() macro.
;;;
;;; Side effects:
;;;   AC = table + [ofs]
;;;   PC = [table + [ofs]]
;;;   L
;;;   %ofs = table + [ofs]

.macro CASETAB(ofs)
		LIA @+4			; CASETAB(%ofs)
		ADD %ofs
		STORE %ofs
		JMPII %ofs
.end		
		
;;; Macro: JSRTAB (table, tmp, ofs)
;;;
;;; Using the value in the address ofs, JSR to the jump table entry at table +
;;; mem[ofs]. A temporary register tmp is used to calculate the address to jump
;;; to. NO checks are performed. tmp and ofs may be the same location, but ofs
;;; will be overwritten.
;;;
;;; Note: this takes two instructions (dereference and store) more than JMPTAB
;;; because there of the double-dereference JMPII instruction (which lacks an
;;; equivalent JSRII or TRAPII).
;;;
;;; Side effects:
;;;   AC = table + [ofs]
;;;   PC = [table + [ofs]]
;;;   L

.macro JSRTAB(table, tmpreg, ofs)
		LIA %table		; JMPTAB(%table, %tmpreg, %ofs)
		ADD %ofs
		STORE %tmp
		LOAD I %tmp
		STORE %tmp
		JSR I %tmp
.end		
		
;;; End of file.
