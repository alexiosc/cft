#!/usr/bin/python2.6
"""
Assembler tests.

Tests that:

* The .fill directive works.

"""

import os
import sys
import random
import unittest
import testlib



class T2_Random_Add(testlib.BaseTest):
    def _runTest(self, seed):
        """ADD fundamentals"""
        random.seed(seed);
        exp = list()
        self.old_a = 0

        def _add(a, b):
            if self.old_a != a:
                self.asm('       LI %d' % a)
                self.asm('       STORE R &10')
            self.old_a = a
            self.asm('       LI %d' % b)
            self.asm('       ADD R &10')
            self.asm('       PRINTD')
            self.asm('       PRINTSP')
            exp.append('%d ' % ((a + b) & 0xffff,))
            
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')
        self.asm('&0800:')
        self.asm('&0800:')

        for x in xrange(1024):
            _add(random.randint(0,0x3ff), random.randint(0,0x3ff))


        self.asm('       HALT')

        self.assemble()
        sim = self.simulate()
        #print sim

        exp = ''.join(exp)
        #print exp
        self.assertEqual(sim, exp, 'Not all checkpoints passed.')


class T2_Random_Add1(T2_Random_Add):
    def runTest(self):
        """Add random numbers (1/4)."""
        self._runTest(0x11223344)


class T2_Random_Add2(T2_Random_Add):
    def runTest(self):
        """Add random numbers (2/4)."""
        self._runTest(0x11223355)


class T2_Random_Add3(T2_Random_Add):
    def runTest(self):
        """Add random numbers (3/4)."""
        self._runTest(0x11223366)


class T2_Random_Add4(T2_Random_Add):
    def runTest(self):
        """Add random numbers (4/4)."""
        self._runTest(0x11223377)


# End of file.
