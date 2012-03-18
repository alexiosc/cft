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

&0100:
_x:	.word 0
divd:	.word 0
dvdr:	.word 0

	.equ TR0 R &0100
	.equ TR1 R &0101
	.equ TR2 R &0102
	.equ TR3 R &0103

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&e000:
start:
	LOAD mydivn		; Dividend (left hand side)
	STORE TR0
	LOAD mydvdr		; Divider (right hand side)
	STORE TR1
	
	TRAP _rom_div16

	LOAD TR0		; Quotient
	PRINTD
        PRINTSP

	LOAD TR2		; Modulo
	PRINTD
        PRINTSP

        SUCCESS
	HALT

_rom_div16:
	LOAD minus16		; 16 bits
	STORE TR3

	LI 0
	STORE TR2		; modulo = 0

nextbit:
	LOAD TR3		; Check loop iterations
	SNA			; Done?
	RTT			;   Yes. Return
	INC
	STORE TR3

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
	

minus16:  .word -16
mydivn:	  .word %(a)d
mydvdr:   .word %(b)d
"""

class Div16(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 16-bit integer division"""
        a = 65320
        b = 50
        self.asm(ASM1 % dict(a=a, b=b))
        self.assertSim('%d %d [ok]' % (a // b, a % b))


# End of file.
