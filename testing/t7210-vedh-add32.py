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



MAX = 192

class Random_Add32(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 32-bit addition"""

        self.asm('&0000: .fill 65535 FAIL')
        self.asm('&fff0: JMP I @+1')
        self.asm('       .word boot')

        # Write out the dataset.
        dataset = [ (random.randint(0, 0xffffffff),
                     random.randint(0, 0xffffffff))
                    for x in xrange(MAX) ]

        exp = ''
        self.asm('&0100:')
        self.asm('dataset:')
        for (a, b) in dataset:
            self.asm('          .word &%04x ; Lo A' % (a & 65535))
            self.asm('          .word &%04x ; Lo B' % (b & 65535))
            self.asm('          .word &%04x ; Hi A' % ((a >> 16) & 65535))
            self.asm('          .word &%04x ; Hi B' % ((b >> 16) & 65535))
            self.asm('')
            exp += '%x[ok]' % ((a + b) & 0xffffffff)
        exp += '[ok]'

        self.asm('&0400:')
        self.asm('boot:')
        self.asm('       LIA R dataset')
        self.asm('       STORE R &80')
        self.asm('       LI %d' % MAX)
        self.asm('       NEG')
        self.asm('       STORE R 5')

        self.asm('loop:')

        # The add32 code
        self.asm('       CLL')
        self.asm('       LOAD I R &80')
        self.asm('       ADD I R &80')
        self.asm('       STORE R 6')
        self.asm('       LOAD I R &80')
        self.asm('       IFL INC')
        self.asm('       ADD I R &80')
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
