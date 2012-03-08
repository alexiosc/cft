#!/usr/bin/python2.6
"""
Tests:

* Quite a few instructions.
* Looping.
* Strings.
"""

import unittest
import testlib
import random


code = """
// -*- asm -*-
&0100:
_x:	.word 0
prod:	.word &1234
mulr:	.word &24
mulnd:	.word &11

	.equ TR0 R &0100
	.equ TR1 R &0101
	.equ TR2 R &0102

	;; Reset vector
&fff0:
reset:
	JMP I @+1
	.word start

	.equ PUTCHAR	OUT TTY0 TTYDATA ; Print out a character

&e000:
start:
	LOAD mymulr
	STORE TR0
	LOAD mymulnd
	STORE TR1
	
	TRAP _rom_mul16

	LOAD TR2
	PRINTU
        PRINTSP
        SUCCESS
	HALT

_rom_mul16:
	LI 0
	STORE TR2		; TR2 = product = 0

_rom_mul16_loop:
	LOAD TR0		; a == 0?
	SNZ
	RTT			; Then we're done.

	SBR			; L = A & 1, A = A >> 1
	STORE TR0
	SSL			; L == 0?
	JMP _rom_mul16_noadd

	LOAD TR1		; prod += b
	ADD TR2
	STORE TR2

_rom_mul16_noadd:
	LOAD TR1		; b <<= 1
	SBL
	STORE TR1

	JMP _rom_mul16_loop	; Loop again

	
minus_16: .word -16
mymulr:	  .word %(a)d
mymulnd:  .word %(b)d
"""

class Div16(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 16-bit integer multiplication"""

        random.seed(0x11223399);

        def _mul(a,b):
            self.assemble(code % dict(a=a, b=b))
            try:
                expected = '%d [ok]' % ((a * b) & 0xffff)
                sim = self.simulate()
                self.assertSim(sim, 'Mis-jump')
                self.assertEqual(sim, expected, 'Multiplication miscalculated.')
            except:
                print "Expected:", expected
                print "Saw:     ", sim
                raise

        for n in xrange(20):
            _mul(random.randint(0,0xffff), random.randint(0,0xffff))

# End of file.
