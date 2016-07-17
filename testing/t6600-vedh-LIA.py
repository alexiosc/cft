#!/usr/bin/python

import os
import sys
import unittest
import testlib


MAX = 250

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test LIA instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        self.asm('&0400:')
        self.asm('boot:')
        
        exp = ''

        # Test 1. LIA test (R=1)
        for i in xrange(MAX):
            self.asm('          LIA %d' % i)
            self.asm('          SUCCESS')
            self.asm('          PRINTA')
            exp += '[ok]%04x' % (0x400 + i)

        self.asm('          SUCCESS')
        exp += '[ok]'


        # Test 2. LI test (R=1)
        self.asm('test2:')
        for i in xrange(MAX):
            self.asm('          LI %d' % i)
            self.asm('          SUCCESS')
            self.asm('          PRINTA')
            exp += '[ok]%04x' % (i & 0x3ff)

        self.asm('          SUCCESS')
        exp += '[ok]'


        self.asm('HALT')

        self.assemble()
        #self.addArg('+timeout=3000000')
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
