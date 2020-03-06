#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 1000

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test ADD instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0080:    .word &0100')
        # Register-address Datasets
        dataset = [ random.randint(0, 65535) for x in xrange(512) ]
        for i, val in enumerate(dataset):
            self.asm('&%04x:    .word &%04x' % (0x100 + i, val))
        for i in xrange(256):
            self.asm('&%04x:    .word &%04x' % (0x300 + i, 0x100 + i))

        self.asm('&07ff:')
        self.asm('boot:')
        
        # Test 1. Local addressing
        self.asm('          LI 0')
        ac = 0
        for i in range(MAX):
            val = random.randint(0, 65535)
            self.asm('          ADD @+3')
            self.asm('          PRINTU')
            self.asm('          JMP @+5')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (ac + val) & 0xffff
            exp += '%u[ok]' % ac

        # Test 2. Indirect addressing
        for i in range(MAX):
            val = random.randint(0, 65535)
            self.asm('          ADD I @+6')
            self.asm('          PRINTU')
            self.asm('          JMP @+5')
            self.asm('          .word &%04x' % val)
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          .word @-3')
            self.asm('          SUCCESS')
            ac = (ac + val) & 0xffff
            exp += '%u[ok]' % ac

        # Test 3. Register addressing
        for i in range(min(512, MAX)):
            val = dataset[i]
            self.asm('          ADD R &%04x' % (0x100 + i))
            self.asm('          PRINTU')
            self.asm('          JMP @+5')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (ac + val) & 0xffff
            exp += '%u[ok]' % ac

        # Test 4. Indirect register addressing
        for i in range(min(256, MAX)):
            val = dataset[i]
            self.asm('          ADD I R &%04x' % (0x300 + i))
            self.asm('          PRINTU')
            self.asm('          JMP @+5')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (ac + val) & 0xffff
            exp += '%u[ok]' % ac

        # Test 5. Indirect register addressing
        for i in range(min(512, MAX)):
            val = dataset[i]
            self.asm('          ADD I R &80')
            self.asm('          PRINTU')
            self.asm('          JMP @+5')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          FAIL')
            self.asm('          SUCCESS')
            ac = (ac + val) & 0xffff
            exp += '%u[ok]' % ac

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
