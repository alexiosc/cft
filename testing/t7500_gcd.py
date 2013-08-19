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


ASM1 = """
&0003:
gcdvec: .word gcd

data:
        .word 1071
        .word 1029

        .equ x R @data+0
        .equ y R @data+1

&0400:
gcd:
	LOAD x			; if (x == 0) return y;
	SZA
	JMP loop
	LOAD y			; print out y and finish.
	JMP end

loop:
	LOAD y			; Not trivial.
	SNZ			; if (y == 0)
	JMP retx		;  ... return x

	LOAD y			; Calculate x - y
	NEG
	ADD x
	SNN SNZ			; Skip if A > 0 (A >= 0 && a != 0)
	JMP ydec		; if x > y

xdec:
	STORE x			; x = A (which is x - y)
	JMP loop

ydec:
	NEG			; A = x-y already. Get y-x:  y-x = -(x-y)
	STORE y
	JMP loop

retx:
	LOAD x			; print out x and finish.
end:
        RET

&fff0:	JMP I baddr
baddr:  .word boot
"""


MAX = 5

random.seed(207205965)


class GCD(testlib.testBaseClass):

    def gcd(self, x, y):
        """
        Calculate the greatest common divisor of two integers.  Use Euclid's
        algorithm.
        """
        if x == 0:
            return y
        while y:
            if x > y:
                x -= y
            else:
                y -= x
        return x
        

    def runTest(self):
        """Algorithm test: Greatest Common Divisor"""
        self.clear()
        self.asm(ASM1)

        # Output the dataset
        self.asm('&0100:')
        self.asm('dataset:')
        dataset = [ (1071, 1029) ]
        dataset += [ (random.randint(1, 32767), random.randint(1, 32767))
                    for x in xrange(min(382, MAX - 1)) ]
        for x, y in dataset:
            self.asm('          .word %d' % x)
            self.asm('          .word %d' % y)

        exp = ''
            
        self.asm('&0800:')
        self.asm('boot:')
        self.asm('          LIA R dataset')
        self.asm('          STORE R &80')


        for x, y in dataset:
            self.asm('          LOAD I R &80')
            self.asm('          STORE x')
            self.asm('          PRINTD')
            self.asm('          PRINTSP')

            self.asm('          LOAD I R &80')
            self.asm('          STORE y')
            self.asm('          PRINTD')
            self.asm('          PRINTSP')
            
            self.asm('          JSR I R gcdvec')
            self.asm('          PRINTD')
            self.asm('          SUCCESS')
            self.asm('          PRINTNL')

            exp += '%d %d %d[ok]\n' % (x, y, self.gcd(x, y))

        exp += '[ok]'
        self.asm('          SUCCESS')
        self.asm('          HALT')


        self.assemble()
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
