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



MAX = 200

random.seed(207205965)


class Random_Neg32(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 32-bit negation"""

        self.asm('&0000: .fill 65535 FAIL')
        self.asm('&fff0: JMP I @+1')
        self.asm('       .word boot')

        # Write out the dataset.
        dataset = [ 0, 255, 65535, 16777215, 2147483647 ]
        dataset += [ random.randint(1, 2147483646)
                     for x in xrange(min(379, MAX - 5)) ]

        exp = ''
        self.asm('&0100:')
        self.asm('dataset:')
        for x in dataset:
            self.asm('          .word &%04x ; Low: %d' % (x & 65535, x))
            self.asm('          .word &%04x ; High' % ((x >> 16) & 65535))
            self.asm('')
            exp += '%x[ok]' % (-x & 0xffffffff)
        exp += '[ok]'

        self.asm('&0400:')
        self.asm('boot:')
        self.asm('       LIA R dataset')
        self.asm('       STORE R &80')
        self.asm('       LI %d' % MAX)
        self.asm('       NEG')
        self.asm('       STORE R 5')

        self.asm('loop:')

        # The neg32 code
        self.asm('       LOAD I R &80')
        self.asm('       CLL NEG')
        self.asm('       STORE R 6')
        self.asm('       LOAD I R &80')
        self.asm('       NOT')
        self.asm('       IFL INC')
        self.asm('       PRINTHI')
        self.asm('       LOAD R 6')
        self.asm('       PRINTLO')

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