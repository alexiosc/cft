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
x:	.word 1071
y:	.word 1029

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

	LOAD Y			; Calculate x - y
	NEG
	ADD X
	SNN SNZ			; Skip if A > 0 (A >= 0 && a != 0)
	JMP ydec		; if x > y

xdec:
	STORE x			; x = A (which is x - y)
	JMP loop

ydec:
	NEG			; A = x-y already. Get y-x:  y-x = -(x-y)
	STORE y
	jmp loop

retx:
	LOAD x			; print out x and finish.
end:
	PRINTD
        SUCCESS
        HALT

&fff0:	JMP [baddr]
baddr:  .word gcd
"""


class GCD(testlib.BaseTest):
    def runTest(self):
        """Algorithm test: Greatest Common Divisor"""
        self.assemble(ASM1)
        sim = self.simulate()
        self.assertSim(sim, 'Mis-jump')
        self.assertEqual(sim, '21[ok]', 'GCD miscalculation.')


# End of file.
