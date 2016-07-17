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



MAX = 50

random.seed(207205965)


class Mul16(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: unsigned 16-bit multiplication"""

        self.asm('&0000: .fill 65535 FAIL')
        self.asm('&fff0: JMP I @+1')
        self.asm('       .word boot')

        # Write out the dataset.
        dataset = [ (0, 0), (0, 1), (1, 0), (1, 1) ]
        dataset += [ (random.randint(1, 65535),
                      random.randint(1, 65535))
                     for x in xrange(min(380, MAX - 4)) ]

        exp = ''
        self.asm('       .equ X R 10')
        self.asm('       .equ Y R 11')
        self.asm('       .equ S R 12')
        self.asm('&0100:')
        self.asm('dataset:')
        for (a, b) in dataset:
            self.asm('          .word %u ; A' % a)
            self.asm('          .word %u ; B' % b)
            self.asm('')
            exp += '%d %d %d[ok]' % (a, b, (a * b) & 0xffff)
        exp += '[ok]'

        self.asm('&0400:')
        self.asm('boot:')
        self.asm('       LIA R dataset')
        self.asm('       STORE R &80')
        self.asm('       LI %d' % MAX)
        self.asm('       NEG')
        self.asm('       STORE R 5')
        self.asm('')

        self.asm('loop:  LOAD I R &80')
        self.asm('       PRINTU')
        self.asm('       PRINTSP')
        self.asm('       STORE X')
        self.asm('       LOAD I R &80')
        self.asm('       PRINTU')
        self.asm('       PRINTSP')
        self.asm('       STORE Y')
        self.asm('')

        self.asm('       LI 0')
        self.asm('       STORE S')
        self.asm('')

        self.asm('loop2: LOAD Y')
        self.asm('       SNZ')
        self.asm('       JMP done')
        self.asm('       SBR')
        self.asm('       STORE Y')
        self.asm('       SSL')
        self.asm('       JMP noadd')
        self.asm('')
        self.asm('add:   LOAD S')
        self.asm('       ADD X')
        self.asm('       STORE S')
        self.asm('')
        self.asm('noadd: LOAD X')
        self.asm('       SBL')
        self.asm('       STORE X')
        self.asm('       JMP loop2')
        self.asm('')

        self.asm('done:  LOAD S')
        self.asm('       PRINTU')
        self.asm('')

        # Loop again
        self.asm('       SUCCESS')
        self.asm('       ISZ R 5')
        self.asm('       JMP loop')

        self.asm('       SUCCESS')
        self.asm('       HALT')

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
