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


ASM = """
	.equ n1 R &10		; First number
	.equ n2 R &11		; Second number
	.equ tmp0 R &12		; Temporary

&0400:
boot:	
	CLL			; Clear L
	LI 0			; Seed the generator with 0, 1.
	STORE n1
        PRINTU
        SUCCESS
	LI 1
	STORE n2
        PRINTU
        SUCCESS

fib_loop:	
	LOAD n2
	STORE tmp0
	ADD n1
	SCL			; L set? If so, we ran out of bits. Stop.
	JMP fib_done
	
	PRINTU
	SUCCESS
	STORE n2
	LOAD tmp0
	STORE n1
	JMP fib_loop

fib_done:	
	HALT

&fff0:	JMP I @+1
        .word boot
"""


MAX = 5

class Fibonacci(testlib.testBaseClass):

    FIB = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987,
           1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368]


    def runTest(self):
        """Algorithm test: Fibonacci sequence (16 bits)"""

        exp = ''.join('%d[ok]' % x for x in self.FIB)
        self.asm(ASM)
        self.assemble()
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        try:
            self.assertEqual(sim, exp, 'Test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
