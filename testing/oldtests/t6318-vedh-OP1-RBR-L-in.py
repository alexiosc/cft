#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 500

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test OP1 instruction, RBL minor operation (L bit, input)"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0010:    .word &fffe')

        self.asm('&0800:')
        self.asm('boot:')

        # Test 1: Odd numbers (L = 1 after shift).
        for i in range(MAX):
            val = i * 2 + 1
            self.asm('          LOAD @+6')
            self.asm('          CLL RBR')
            self.asm('          PRINTH')
            self.asm('          SSL')
            self.asm('          FAIL')
            self.asm('          JMP @+2')
            self.asm('          .word &%04x' % val)
            self.asm('          SUCCESS')
            exp += '%04x[ok]' % ((val >> 1) & 0xffff)

        # Test 2: Even numbers (L = 0 after shift).
        for i in range(MAX):
            val = i * 2
            self.asm('          LOAD @+6')
            self.asm('          CLL RBR')
            self.asm('          PRINTH')
            self.asm('          SCL')
            self.asm('          FAIL')
            self.asm('          JMP @+2')
            self.asm('          .word &%04x' % val)
            self.asm('          SUCCESS')
            exp += '%04x[ok]' % ((val >> 1) & 0xffff)

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
