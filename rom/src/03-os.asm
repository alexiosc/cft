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
rttnop:		errno(ENOP)		; Set NOP error, fall through.
rtterr:		RMOV(RET0, MINUS1)	; -1 Usually signifies an error.
		RTT
.popns
		
;;; System call: TTYSEL. Select a TTY device.
;;;
;;; Arguments:
;;; 
;;;     ARG0: an address to write to. This is usually one of p0.TTY[A-C].
;;; 
;;;     ARG1: the address of one of the p0.TTYn_PTR registers.
;;;
;;; Return Value:
;;;
;;;     Always 0.
;;;
;;; Errors:
;;;
;;;     None

ttysel:         clear_errno()
		RPUSH(SP, ARG0)
		RPUSH(SP, ARG1)
		LI 7
		JSR I MEMCPY
		
		JMP os.rtt0		; Return 0 = no error.

		
;;; Print out a packed string.
putsp:
.scope
		STORE ITMP0
loop:		LOAD I ITMP0		; Read a pair of characters
		SNZ			; Done?
		RET			; Yes
		STORE TMP15		; No.
		GETLOCHAR()
		asyscall(p0.TTYA_SEND)	; Print the first character

		LOAD TMP15
		GETHICHAR()
		SNZ			; Are we done now?
		RET			; Yes
		asyscall(p0.TTYA_SEND)	; Print the second character

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
		rsyscall(p0.TTYA_SEND, TMP13)	; Print the character in TMP13
		JMP new_digit

units:		LI 48
		ADD TMP15
		asyscall(p0.TTYA_SEND)	; Print the character in AC

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
		asyscall(p0.TTYA_SEND)	; Print the character 1 (MSB)
		rsyscall(p0.TTYA_SEND, TMP11) ; Print the character 2
		rsyscall(p0.TTYA_SEND, TMP12) ; Print the character 3
		rsyscall(p0.TTYA_SEND, TMP13) ; Print the character 4 (LSB)

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

///////////////////////////////////////////////////////////////////////////////
//
// Memory allocation routines
//
///////////////////////////////////////////////////////////////////////////////

;;; This functionality resembles that of the ProDOS memory ‘managent’ subsystem,
;;; except ProDOS allocates 256 byte blocks and we allocate full 8 kW banks.


;;; System call: memfree(block) -- Free a previously allocated bank of memory.
;;;
;;; Arguments:
;;;   AC:	Bank number (&00-&FF)
;;;
;;; Side effects:
;;;   TMP13
;;;   Memory bitmap
;;;
;;; Returns:
;;;   AC:	0 on success, -1 on failure.
;;;
;;; Errors:
;;;   EARG:	 Argument not in range [0,255].
;;;   EINVAL:	 Memory was already free.

memfree:
.scope
		enter_sub_ac()		; Not a leaf subroutine, save state.

		LAND(TMP14, TMP15, &f)	; AC & f (is the bit number)

		LOAD TMP15
		IFNEQJMP(TMP14, badval)	; Check parameter is 00-FF.
		
		LOAD TMP15
		RNR			; Roll 4 bits right
		AND NYBBLE0
		STORE TMP13		; TMP13: (AC >> 4) & f (word offset)

		LIA p0.MLC_BITMAP0	; Index the correct word
		ADD TMP13
		STORE TMP13		; TMP13: the address to modify

		RMOV(TMP15, I TMP13)	; Save current memory bitmap value

		LINC(TMP14, BIT0)	; Index BITx table, convert bit# to mask.
		LOAD I TMP14
		XOR MINUS1		; Complement. Faster than NOT!
		AND I TMP13		; Turn off a bit in the bitmap
		STORE I TMP13
		
		IFEQJMP(TMP15, invalid)	; Have we changed anything in the bitmap?
		
		pop_retv()		; Apparently, we have. It's all good!
		clear_errno()
		JMP os.rtt0

badval:         pop_retv()		; Argument error (not &00-&FF)
		rtt_errno(EARG)		

invalid:	pop_retv()		; The bit was already clear!
		rtt_errno(EINVAL)
.endscope


;;; System call: memalloc() -- Find and allocate a bank of memory.
;;;
;;; Arguments
;;;   AC:	Bank number (&00-&FF)
;;;
;;; Returns:
;;;   AC:	0 on success, -1 on failure.
;;;   RET0:	The bank allocated.
;;;
;;; Errors:	
;;;   EARG:	Argument not in range [0,255].
;;;   ENOMEM:	Out of memory.

memalloc:
.scope
		enter_sub_ac()

		RMOV(TMP11, p0)		; Counter for memory bitmap
		LMOV(RET0, 0)		; Bank number
		LIA p0.MLC_BITMAP0	; Start of the memory bitmap
		STORE TMP12		; TMP12 = bitmap word

loopword:	LMOV(TMP13, 1)		; Bit number
loopbit:	

		;; Debugging info
		LOAD TMP13
		PRINTB
		PRINTSP
		LOAD TMP12
		PRINTH
		PRINTSP
		LOAD TMP11
		PRINTD
		PRINTSP
		;; End of debugging info
		
		LOAD I TMP12
		AND TMP13		; Check a bank
		PRINTH
		PRINTNL
		SNZ
		JMP found		; Found a free bank

		ISZ RET0		; Next bank (never skips)
		LOAD TMP13
		SBL			; Next bit
		SCL			; Out of bits in this word?
		JMP nextword		; If so, try the next word
		STORE TMP13

		JMP loopbit		; Try again

nextword:	ISZ TMP12		; Next bitmap word (never skips)
		ISZ TMP11		; Are there more words in the bitmap?
		JMP loopword

		pop_retv()		; No free banks found
		rtt_errno(ENOMEM)	; Out of memory

found:		ROR1(I TMP12, TMP13)	; Set the bit in the bitmap
		clear_errno()
		JMP os.rtt0		; All clear

p0:		.word -16
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
/// ESSENTIAL DRIVERS
///
///////////////////////////////////////////////////////////////////////////////

.pushns drv
.include "driver-null.asm"		; The NULL driver (TTY/MSD sentinel)
.include "driver-tty-dfp.asm"		; The DFP TTY driver
.popns
		
///////////////////////////////////////////////////////////////////////////////
/// 
/// SYSTEM VECTORS
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
