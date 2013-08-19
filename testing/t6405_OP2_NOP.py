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
        """Test OP2 instruction, NOP minor operation"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0002:    .word 0')

        self.asm('&0800:')
        self.asm('boot:')

        # Test strategy: run NOP, check L and V flags.

        for i in xrange(MAX):
            self.asm('          LI 0')
            self.asm('          ADD R 2  ; V = 0')
            self.asm('          CLL      ; L = 0')
            self.asm('          OP2      ; NOP')
            self.asm('          IFL NOT')
            self.asm('          PRINTH')
            self.asm('          PRINTSP')
            self.asm('          IFV NOT')
            self.asm('          PRINTH')
            self.asm('          SUCCESS')

            exp += '0000 0000[ok]'

        self.asm('HALT')

        self.assemble()
        self.addArg('+timeout=10000000')
        sim = self.simulate()
        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
