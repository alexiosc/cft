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
        """Test AND instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0080:    .word &0100')
        # Register-address (and operand) Datasets
        dataset = [ random.randint(0, 65535) for x in xrange(512) ]
        for i, val in enumerate(dataset):
            self.asm('&%04x:    .word &%04x' % (0x100 + i, val))
        for i in xrange(256):
            self.asm('&%04x:    .word &%04x' % (0x300 + i, 0x100 + i))

        self.asm('&07fd:')
        self.asm('boot:')
        
        # Test 1. Local addressing
        self.asm('          LI 0')
        self.asm('          LI &100')
        self.asm('          STORE R &80')
        ac = 0
        for i in range(min(512, MAX)):
            val = random.randint(0, 65535)
            self.asm('          LOAD R I &80')
            self.asm('          AND @+3')
            self.asm('          PRINTH')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (dataset[i] & val) & 0xffff
            exp += '%04x[ok]' % ac

        self.asm('          LI &100')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test2')

        # Test 2. Indirect addressing
        self.asm('&4000:')
        self.asm('test2:')
        for i in range(min(512,MAX)):
            val = random.randint(0, 65535)
            self.asm('          LOAD R I &80')
            self.asm('          AND I @+5')
            self.asm('          PRINTH')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          .word @-2')
            self.asm('          SUCCESS')
            ac = (dataset[i] & val) & 0xffff
            exp += '%04x[ok]' % ac

        # Test 3. Register addressing
        for i in range(min(512, MAX)):
            val1 = dataset[i]
            val2 = random.randint(0, 65535)
            self.asm('          LOAD @+4')
            self.asm('          AND R &%04x' % (0x100 + i))
            self.asm('          PRINTH')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val2)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (val1 & val2) & 0xffff
            exp += '%04x[ok]' % ac

        # Test 4. Indirect register addressing
        for i in range(min(256, MAX)):
            val1 = dataset[i]
            val2 = random.randint(0, 65535)
            self.asm('          LOAD @+4')
            self.asm('          AND I R &%04x' % (0x300 + i))
            self.asm('          PRINTH')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val2)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (val1 & val2) & 0xffff
            exp += '%04x[ok]' % ac

        self.asm('          LI &100')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test5')

        # Test 5. Indirect register addressing
        self.asm('&8000:')
        self.asm('test5:')
        for i in range(min(512, MAX)):
            val1 = dataset[i]
            val2 = random.randint(0, 65535)
            self.asm('          LOAD @+4')
            self.asm('          AND I R &80')
            self.asm('          PRINTH')
            self.asm('          JMP @+4')
            self.asm('          .word &%04x' % val2)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (val1 & val2) & 0xffff
            exp += '%04x[ok]' % ac

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
