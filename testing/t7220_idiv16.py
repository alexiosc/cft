#!/usr/bin/python2.6
"""
Tests:

* Quite a few instructions.
* Looping.
* Strings.
"""

import unittest
import testlib


ASM1 = """
// -*- asm -*-

.include "../../../../forth/macro_generic.asm"

&0100:
_x:	.word 0
divd:	.word 0
dvdr:	.word 0

	.equ TR0 R &0100
	.equ TR1 R &0101
	.equ TR2 R &0102
	.equ TR3 R &0103

	.equ TMP15 R &0120
	.equ TMP14 R &0121
	.equ TMP13 R &0122

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

&e000:
start:
	LOAD mydivn		; Dividend (left hand side)
	STORE TR0
	LOAD mydvdr		; Divisor (right hand side)
	STORE TR1

	TRAP _rom_idiv16

	LOAD TR0		; Quotient
	PRINTD
        PRINTSP

	LOAD TR2		; Modulo
	PRINTD
        PRINTSP

        SUCCESS
	HALT


_rom_idiv16_negn:
        NEG
        STORE TR0
        LI 1                    ; Flag the negation.
        STORE R &0300
        JMP _rom_idiv16_testr

_rom_idiv16_negr:
        NEG
        STORE TR1
        LI 1                    ; Flag the negation.
        XOR R &0300
        STORE R &0300
        JMP _rom_div16          ; Jump to the main loop.

_rom_idiv16:
        LI 0
        STORE R &0300
        LOAD TR0
        STORE TMP14
        SNN
        JMP _rom_idiv16_negn

_rom_idiv16_testr:
        LOAD TR1
        STORE TMP15
        SNN
        JMP _rom_idiv16_negr

_rom_div16:
	LOAD minus16		; 16 bits
	STORE TR3

	LI 0
	STORE TR2		; modulo = 0

nextbit:
        ISZ TR3                 ; Increment and check if done.
        JMP @+2
        JMP _rom_idiv16_done

        LOAD TR0

	LOAD TR0		; Shift left <TR2,TR0> 32-bit value (<modulo,quotient>)
	SBL
	STORE TR0
	LOAD TR2
	RBL
	STORE TR2

compare:
	LOAD TR1		; Calculate modulo - divisor (TR2 - TR1)
	NEG
	ADD TR2

will_it_fit:
	SNN			; Will it fit?
	JMP nextbit		; No. Try next bit.

it_fits:
	STORE TR2 		; We already have the result of the subtraction. Store it.

	LI 1
	ADD TR0
	STORE TR0
	JMP nextbit



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



_rom_idiv16_bit15:
        .word &8000

_rom_idiv16_done:
	;; This is where symmetric signed division is implemented.
	;; Based on this, we calculate floored division results as per the F83
	;; standard.
	;;
	;; Symmetric division entails (based on unsigned results):
	;; 
	;;   * Flipping the sign of the quotient if the signs of the dividend
	;;     and divisor differ.
	;; 
	;;   * Flipping the sign of the remainder if the dividend is negative.
	;;
	;; Details found at http://www.bearcave.com/software/divide.htm
	
	;; Negate the quotient of the argument signs differ.
	LOAD TMP14
	XOR TMP15
	AND _rom_idiv16_bit15	; Are the signs different?
	STORE TMP13		; Keep this for later (for floored division)
	SNZ
	JMP _rom_idiv16_nonegq

	RNEG(TR0, TR0)		; Negate the quotient.

	;; Don't negate quotient
_rom_idiv16_nonegq:
	;; The sign of the remainder is the same as the sign of the dividend.
	LOAD TMP14
	SNA
	JMP _rom_idiv16_symmetric_done

	RNEG(TR2, TR2)		; Negate the remainder to match.

_rom_idiv16_symmetric_done:

_rom_idiv16_flooored:

        ;; Up to here, we've done floored division. Now convert it to symmetric
        ;; division.
	;; 

        LOAD TR2                ; Load modulo
        SNZ
        RTT                     ; It's zero: all's good. Exit.

	LOAD TMP13		; Non-zero if argument signs differ
	SNZ
	RTT			; Equal signs: all done here. Exit.

        RADD(TR0, TR0, MINUS1)  ; Quotient--
        RADD(TR2, TR2, TMP15)	; modulo += divisor
	
        RTT

MINUS1:   .word -1
minus16:  .word -17
mydivn:	  .word %(a)d
mydvdr:   .word %(b)d
"""

class IDiv16(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 16-bit signed division"""
        def _div16(a,b):
            self.clear()
            al = a & 0xffff
            bl = b & 0xffff
            self.asm(ASM1 % dict(a=al, b=bl))
            self.assertSim('%d %d [ok]' % (a // b, a % b))

        _div16(-1, 3)
        _div16(150, 9)
        _div16(150, -9)
        _div16(-150, -9)
        _div16(-150, 9)



# End of file.
