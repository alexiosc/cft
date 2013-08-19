#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 100

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test ADD instruction (L side-effects)"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0080:    .word &0100')
        # Datasets
        dataset = [ random.randint(32768, 65535) for x in xrange(MAX * 2) ]
        self.asm('&0100:')
        self.asm('dataset1:')
        for i in xrange(MAX * 2):
            self.asm('          .word &%04x' % random.randint(32768, 65535))

        self.asm('&0200:')
        self.asm('dataset2:')
        for i in xrange(MAX * 2):
            self.asm('          .word &%04x' % random.randint(0, 32767))

        self.asm('&0800:')
        self.asm('boot:')
        
        # Test 1. Carry out.
        ac = 0
        for i in range(MAX):
            self.asm('          CLL')
            self.asm('          LOAD R @dataset1+%d' % i)
            self.asm('          ADD R @dataset1+%d' % (i + 1))
            self.asm('          SSL')
            self.asm('          FAIL')
            self.asm('          JMP @+2')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            exp += '[ok]'

        # Test 1. No Carry out.
        ac = 0
        for i in range(MAX):
            self.asm('          CLL')
            self.asm('          LOAD R @dataset2+%d' % i)
            self.asm('          ADD R @dataset2+%d' % (i + 1))
            self.asm('          SCL')
            self.asm('          FAIL')
            self.asm('          JMP @+2')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            exp += '[ok]'

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
