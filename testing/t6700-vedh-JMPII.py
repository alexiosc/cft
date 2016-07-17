#!/usr/bin/python

import os
import sys
import unittest
import testlib


MAX = 1024

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test JMPII instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        self.asm('&0100:')
        self.asm('dataset:')
        for i in xrange(min(768, MAX)):
            self.asm('          .word lbl%d' % i)
        
        self.asm('&0400:')
        self.asm('boot:')
        
        exp = ''

        # Test 1. Local
        for i in xrange(MAX):
            c = 97 + (i % 26)
            self.asm('          LI %d' % c)
            self.asm('          PRINTC')
            self.asm('          SUCCESS')
            self.asm('          JMPII @+4')
            self.asm('          FAIL')
            self.asm('          .word @+3')
            self.asm('          FAIL')
            self.asm('          .word @-2')
            exp += '%c[ok]' % c

        # Test 2. Register
        for i in xrange(min(768, MAX)):
            c = 65 + (i % 26)
            self.asm('          LI %d' % c)
            self.asm('          PRINTC')
            self.asm('          SUCCESS')
            self.asm('          JMPII R @dataset+%d' % i)
            self.asm('          FAIL')
            self.asm('lbl%d:     .word @+3' % i)
            self.asm('          FAIL')
            self.asm('          FAIL')
            exp += '%c[ok]' % c

        self.asm('HALT')

        self.assemble()
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        #exp = 'Afff2[ok]B0806[ok]C0405[ok]D0906[ok]E0a06[ok]0b01[ok]'
        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
