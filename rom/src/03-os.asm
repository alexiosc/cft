;;; -*- cftasm -*-
		
;;; Essential CFT OS calls.
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

&e000:

;;; Convenience routines

.pushns os

rtt0:		LMOV(RET0, 0)		; Return 0
		RTT
rtt1:		LMOV(RET0, 1)		; Return 1
		RTT
rttval:		STORE RET0		; Store AC and return from trap
		RTT
rttnop:		errno(err.ENOP)
		RMOV(RET0, MINUS1)	; -1 Usually signifies an error.
		RTT
.popns
		

		
;;; Print out a packed string.
putsp:
.scope
		STORE ITMP0
loop:		LOAD I ITMP0		; Read a pair of characters
		SNZ			; Done?
		RET			; Yes
		STORE TMP15		; No.
		GETLOCHAR()
		OUT dfp.TX		; Print the first character

		LOAD TMP15
		GETHICHAR()
		SNZ			; Are we done now?
		RET			; Yes
		OUT dfp.TX 		; Print the second character

		JMP loop
.endscope

;;; Print out a 16-bit unsigned decimal without using division (faster).
putud:          
.scope
		enter_sub_ac()		; TMP15: AC
		
		SIA(ITMP0, decades)
		LSET(TMP14, 0)		; TMP14 > 0: printed at least one digit

new_digit:      LSET(TMP13, 48)		; TMP13: current digit ('0')
		RMOV(TMP12, I ITMP0)	; Load next decade (already negated)
		SNZ			; Are we done? (decade = 0)
		JMP units
again:		CLL
		ADD TMP15		; Subtract decade from running modulo.
		SSL			; L=1 => number >= decade
		JMP next_decade
		STORE TMP15		; Update running modulo.
		RINC(TMP13)		; TMP13++
		LSET(TMP14, 1)
		LOAD TMP12
		JMP again

next_decade:	LOAD TMP14		; Skip leading zeroes
		SNZ
		JMP new_digit
		LOAD TMP13		; Alright, we'll print it
		OUT dfp.TX		; Print the character
		JMP new_digit

units:		LI 48
		ADD TMP15
		OUT dfp.TX		; Print the character

		return()

decades:        .data -10000 -1000 -100 -10 0

.endscope


;;; Print out a 16-bit hex number in AC

puth:
.scope
		enter_sub_ac()

		LOAD TMP15
		JSR printx
		STORE TMP13

		RRNR(TMP15, TMP15)
		JSR printx
		STORE TMP12

		RRNR(TMP15, TMP15)
		JSR printx
		STORE TMP11

		RRNR(TMP15, TMP15)
		JSR printx
		OUT dfp.TX		; Print the character

		LOAD TMP11
		OUT dfp.TX		; Print the character
		LOAD TMP12
		OUT dfp.TX		; Print the character
		LOAD TMP13
		OUT dfp.TX		; Print the character

		return()

		;; Return the ASCII code of a character in base 2-56 (at least,
		;; though bases over 56 aren't legible).
printx:         AND d0
		ADD minus10
		SNA
		JMP alpha
		ADD plus58
		RET
alpha:		ADD plus97
		RET
		
d0:		.word &000f
minus10:	.word -10
plus58:		.word 58
plus97:		.word 97
.endscope



;;; memcpy(dst, src, count)
;;;
;;; Copies count words from dst to src.
;;;
;;; Arguments:
;;;   SP Stack: dst src
;;;   AC:       word count
;;; 
;;; Returns:
;;;   Nothing
;;;
;;; Clobbers:
;;;   TMP15
;;;   I15
;;;   I14

memcpy:
.scope
		NEG
		STORE TMP15
		RPOP(I14, SP)		; I14 = src
		RPOP(I15, SP)		; I15 = dst
loop:		RMOV(I I15, I I14)	; Copy a word
		ISZ TMP15
		JMP loop
		RET
.endscope


;;; memset(dst, value, count)
;;;
;;; Writes the value to count words, starting at dst.
;;;
;;; Arguments:
;;;   SP Stack:	 dst value
;;;   AC:	 count

memset:
.scope
		NEG
		STORE TMP15		; TMP15 = count
		RPOP(TMP14, SP)		; TMP14 = value
		RPOP(I15, SP)		; I15 = dst ponter
loop:		RMOV(I I15, TMP14)	; Write value
		LOAD TMP15
		ISZ TMP15		; Loop
		JMP loop
		RET
.endscope

;;; delay(count)
;;;
;;; Delays execution by running through 6*count instructions.
;;;
;;; Arguments:
;;;   AC:	loop count
;;;   TMP15:	running variable

delay:
.scope
		NEG			; Negate AC
		STORE TMP15
loop:	        NOP
		NOP
		NOP
		NOP
		ISZ R TMP15
		JMP loop
		RET
.endscope

postfail:
.scope:
		NOT
		SEL
		SOR
		CLI
		FAIL
		HALT
		JMP @
.endscope


///////////////////////////////////////////////////////////////////////////////
/// 
/// System vectors
///
///////////////////////////////////////////////////////////////////////////////

&fff0:		LI dfp.FTR_HOB		; No halt on bus errors (for emulator)
		DISEF
		LI &80			; Ensure ROM bank 0 is mapped at &8000
		SMB 4			; 4 * &2000
		FARJMP(post.start)	; Boot vector (far jump)

&fff8:		JMP I R ISRV		; Interrupt Service vector
null_isr:	RTI			; Null ISR

;;; End of file.
