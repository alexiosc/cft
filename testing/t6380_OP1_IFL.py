#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 512

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test OP1 instruction, IFL minor operation"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0800:')
        self.asm('boot:')

        for i in xrange(MAX):
            self.asm('          CLL')
            self.asm('          LI 0')
            self.asm('          IFL NOT')
            self.asm('          PRINTH')
            self.asm('          SUCCESS')

            self.asm('          CLL CPL')
            self.asm('          LI 0')
            self.asm('          IFL NOT')
            self.asm('          PRINTH')
            self.asm('          SUCCESS')

            exp += '0000[ok]ffff[ok]'

        self.asm('HALT')

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
