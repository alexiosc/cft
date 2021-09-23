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
rtterr:	
rttminus1:	RMOV(RET0, MINUS1)	; -1 Usually signifies an error.
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

ttysel:         
		clear_errno()
		RPUSH(SP, ARG0)
		RPUSH(SP, ARG1)
		LI 7
		JSR I MEMCPY
		
		JMP os.rtt0		; Return 0 = no error.

		
;;; System call: WAIT. Waits for input. (temporary)
;;;
;;; Arguments:
;;; 
;;;     None.
;;; 
;;; Return Value:
;;;
;;;     RET0: The character received, &ffff on error.
;;;
;;; Errors:
;;;
;;;     Currently none. When it's done: anything the I/O subsystem can throw at
;;;     us.

wait:
.scope
		clear_errno()

		;; TODO: write this.

; 		RPUSH(SP, RETV)
; 		RMOV(p0.OSC_SMC, smc)	; Install the self-modifying program.

; 		JMP p0.OSC		; And jump to it.
; return_here:
		
; 		STORE RET0
; 		RPOP(RETV, SP)

		JMP os.rtt0		; Return 0 = no error.

/smc:		.data &ffff
.endscope

		

		
;;; Print out a packed string.
putsp:
.scope
		STORE ITMP0
loop:		LOAD I ITMP0		; Read a pair of characters
		SNZ			; Done?
		RET			; Yes
		STORE TMP15		; No.
		GETLOCHAR()
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the first character

		LOAD TMP15
		GETHICHAR()
		SNZ			; Are we done now?
		RET			; Yes
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the second character

		JMP loop
.endscope

;;; Subroutine: PUTNSP. Print out a specified number of characters from a
;;; packed string.
;;;
;;; Arguments:
;;; 
;;;     AC: the address of the string.
;;; 
;;;     ARG1: the number of characters to print. At most ARG1 characters will be
;;;     printed.

putnsp:
.scope
		STORE ITMP0
		RNEG(R15, ARG1)		; Negate the count for use with ISZ

loop:		LOAD I ITMP0		; Read a pair of characters
		SNZ			; Done?
		RET			; Yes
		STORE TMP15		; No.
		
		ISZ R15			; Reduce char count
		JMP @+2
		RET

		LOAD TMP15
		GETLOCHAR()
		/TRAP I T_ERB1W
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the first character

		LOAD TMP15
		GETHICHAR()
		STORE TMP15
		SNZ			; Are we done now?
		RET			; Yes
		
		ISZ R15			; Reduce char count
		JMP @+2
		RET

		LOAD TMP15
		/TRAP I T_ERB1W
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the second character

		JMP loop
.endscope
		

;;; Subroutine:	 putud: print out a 16-bit unsigned decimal.
;;; 
;;; This routine prints 16-bit unsigned decimals without using division
;;; (faster). Instead, it uses a table of powers of 10, which it iteratively
;;; subtracts from the working number, converting them to digits on the fly.
;;;
;;; There are potentially more iterations this way (printing out 65535 iterates
;;; 6+5+5+3=19 times; units are just added to ASCII 48, there's no loop), but
;;; the loops are consideably tighter than those for division, ending in
;;; significantly improved performance.
;;; 
putud:          
.scope
		enter_sub_acr(OSR15)	; TMP15: AC
		SIA(OSI0, decades)
		LSET(OSR14, 0)		; OSR14 > 0: printed at least one digit

new_digit:      LSET(OSR13, 48)		; OSR13: current digit ('0')
		RMOV(OSR12, I OSI0)	; Load next decade (already negated)
		SNZ			; Are we done? (decade = 0)
		JMP units
again:		CLL
		ADD OSR15		; Subtract decade from running modulo.
		SSL			; L=1 => number >= decade
		JMP next_decade
		STORE OSR15		; Update running modulo.
		RINC(OSR13)		; OSR13++
		LSET(OSR14, 1)
		LOAD OSR12
		JMP again

next_decade:	LOAD OSR14		; Skip leading zeroes
		SNZ
		JMP new_digit
		rcallcdrv(p0.TTYA, p0.TTYA_SEND, OSR13) ; Print char in OSR13
		JMP new_digit

units:		LI 48
		ADD OSR15
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the character in AC
		return()

decades:        .data -10000 -1000 -100 -10 0

.endscope


;;; Subroutine: putdud: print out a 32-bit unsigned decimal.
;;; 
;;; This routine prints out 32-bit numbers in decimal, without using
;;; division. This is considerably faster than a division-based solution since
;;; division can take over a thousand cycles on the CFT.
;;;
;;; If the high order word of the number to print is zero, this routine
;;; optimises by calling putud (its 16-bit equivalent).
;;;
;;; Arguments:
;;;
;;;   <ARG1, ARG2>:  Double-word to print
;;;
;;; Side-effects:
;;;
;;;   <OSR1, OSR2>:   Number being converted
;;;   OSR14:	      Leading zero suppression flag
;;;   OSR13:	      Current didit in ASCII
;;;   <OSR11, OSR12>: Negated decade
;;;   <OSR9, OSR10>:  Temporary result of subtraction

putdud:          
.scope
		enter_sub()

		;; Optimisation: if ARG1 is zero, use plain putud instead
		;; (faster).
		RMOV(OSR1, ARG1)
		SZA
		JMP islong		; No way to avoid the extra work!
		LOAD ARG2
		JSR putud
		return()
		
islong:		RMOV(OSR2, ARG2)
		SIA(OSI0, decades)
		LSET(OSR14, 0)		; OSR14 > 0: printed at least one digit

new_digit:      LSET(OSR13, 48)		; OSR13: current digit ('0')
		RMOV(OSR11, I OSI0)	; Next decade, high word
		SNZ			; Are we done? (decade = 0)
		JMP units
		RMOV(OSR12, I OSI0)	; Next decade, low word

again:
		;; Subtract the decade from the running modulo
		DADD(OSR9, OSR10, OSR1, OSR2, OSR11, OSR12)
		SSL			; L=1 => number ≥ decade
		JMP next_decade
		RMOV(OSR1, OSR9)	; Update running modulo.
		RMOV(OSR2, OSR10)
		RINC(OSR13)		; OSR13++
		LSET(OSR14, 1)
		JMP again

next_decade:	LOAD OSR14		; Skip leading zeroes
		SNZ
		JMP new_digit
		rcallcdrv(p0.TTYA, p0.TTYA_SEND, OSR13) ; Print char in OSR13
		JMP new_digit

units:		LI 48
		ADD OSR2
		callcdrv(p0.TTYA, p0.TTYA_SEND)	; Print the character in AC

		return()

decades:
                .data &c465 &3600	; -1000000000
                .data &fa0a &1f00	; -100000000
                .data &ff67 &6980	; -10000000
                .data &fff0 &bdc0	; -1000000
                .data &fffe &7960	; -100000
                .data &ffff &d8f0	; -10000
                .data &ffff &fc18	; -1000
                .data &ffff &ff9c	; -100
                .data &ffff &fff6	; -10
		.data 0

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
		; JSR printx
		; TRAP I T_ERB1W
		; LOAD TMP11
		; TRAP I T_ERB1W
		; LOAD TMP12
		; TRAP I T_ERB1W
		; LOAD TMP13
		; TRAP I T_ERB1W
		
		callcdrv(p0.TTYA, p0.TTYA_SEND) ; Print character 1 (MSB)
		rcallcdrv(p0.TTYA, p0.TTYA_SEND, TMP11) ; Print character 2
		rcallcdrv(p0.TTYA, p0.TTYA_SEND, TMP12) ; Print character 3
		rcallcdrv(p0.TTYA, p0.TTYA_SEND, TMP13) ; Print character 4 (LSB)

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
loop:           RMOV(I I15, I I14)	; Copy a word
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
		


.include "calls/erb.asm"

		
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

.include "drivers/null.asm"		; The NULL driver (TTY/MSD sentinel)

.pushns ser
.include "drivers/serial.asm"		; Serial class drivers
.include "drivers/serial/dfp.asm"	; Serial driver for the DFP console
.include "drivers/serial/tty.asm"	; Serial driver for the TTY board
.include "drivers/serial/vdu.asm"	; Serial driver for the VDU board
.popns

.pushns sto
.include "drivers/storage.asm"		; Storage class drivers
.include "drivers/storage/ide.asm"	; Storage driver for IDE devices
.popns

.popns
		
///////////////////////////////////////////////////////////////////////////////
/// 
/// INTERRUPT SERVICE ROUTINE
///
///////////////////////////////////////////////////////////////////////////////

;;; The IRQ checking code is in the form of an unrolled 8-iteration loop. This
;;; is faster than a loop with index registers and value tables, and it's
;;; important to keep interrupt latency low.

.page
		
isr:		
.scope		
		STORE ISRA		; Save the AC
		IFL CLA INC		; if L: ac<-1
		STORE ISRL		; Store it.
		RMOV(ISRR, RETV)	; Also save the JSR vector

		IN irc.ISR
		STORE ISRR0

chk0:		LI irc.ISR_IRQ0		; IRQ0
		AND ISRR0
		SNZ
		JMP chk1
		JSR I p0.ISR0VEC
		irc.ack(0)

chk1:		LI irc.ISR_IRQ1		; IRQ1
		AND ISRR0
		SNZ
		JMP chk2
		JSR I p0.ISR1VEC
		irc.ack(1)

chk2:		LI irc.ISR_IRQ2		; IRQ2
		AND ISRR0
		SNZ
		JMP chk3
		JSR I p0.ISR2VEC
		irc.ack(2)

chk3:		LI irc.ISR_IRQ3		; IRQ3
		AND ISRR0
		SNZ		
		JMP chk4
		JSR I p0.ISR3VEC
		irc.ack(3)

chk4:		LI irc.ISR_IRQ4		; IRQ4
		AND ISRR0
		SNZ
		JMP chk5
		JSR I p0.ISR4VEC
		irc.ack(4)

chk5:		LI irc.ISR_IRQ5		; IRQ5
		AND ISRR0
		SNZ
		JMP chk6
		JSR I p0.ISR5VEC
		irc.ack(5)

chk6:		LI irc.ISR_IRQ6		; IRQ6
		AND ISRR0
		SNZ
		JMP chk7
		JSR I p0.ISR6VEC
		irc.ack(6)
		
chk7:		LI irc.ISR_IRQ7		; IRQ7
		AND ISRR0
		SNZ
		JMP done
		JSR I p0.ISR7VEC
		irc.ack(7)

done:		RMOV(RETV, ISRR)	; Restore the JSR vector
		LOAD ISRL		; Restore L
		RBR
		LOAD ISRA		; Restore AC

		SEI
		RTI

.endscope

;;; Without an IRC board, every interrupt involves checking every single driver
;;; installed on the system. This is expected to be quite slow.

isr_no_irc:		
.scope		
		STORE ISRA		; Save the AC
		IFL CLA INC		; if L: ac<-1
		STORE ISRL		; Store it.
		RMOV(ISRR, RETV)	; Also save the JSR vector

		JSR I p0.ISR0VEC
		JSR I p0.ISR1VEC
		JSR I p0.ISR2VEC
		JSR I p0.ISR3VEC
		JSR I p0.ISR4VEC
		JSR I p0.ISR5VEC
		JSR I p0.ISR6VEC
		JSR I p0.ISR7VEC

		SEI
		RTI

.endscope

///////////////////////////////////////////////////////////////////////////////
/// 
/// SYSTEM VECTORS
///
///////////////////////////////////////////////////////////////////////////////

&fff0:		LI dfp.FTR_HOB		; No halt on bus errors (for emulator)
		DISEF
		DEBUGON
		LI &80			; Ensure ROM bank 0 is mapped at &8000
		SMB 4			; 4 * &2000
		FARJMP(post.start)	; Boot vector (far jump)

&fff8:		FARJMP(isr)
		RTI

;;; End of file.
