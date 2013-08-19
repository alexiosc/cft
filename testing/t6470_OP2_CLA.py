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
        """Test OP2 instruction, CLA minor operation"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0800:')
        self.asm('boot:')

        # Test 1: Numbers in sequence.
        for i in range(MAX):
            val = i
            self.asm('          LOAD @+4')
            self.asm('          OP2 CLA')
            self.asm('          PRINTD')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            exp += '0[ok]'

        # Test 2: Numbers in sequence (counting down)
        for i in range(MAX):
            val = 65535 - i
            self.asm('          LOAD @+4')
            self.asm('          OP2 CLA')
            self.asm('          PRINTD')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            exp += '0[ok]'

        # Test 3: Random numbers.
        for i in range(MAX):
            val = random.randint(0, 65535)
            self.asm('          LOAD @+4')
            self.asm('          OP2 CLA')
            self.asm('          PRINTD')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            exp += '0[ok]'

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
