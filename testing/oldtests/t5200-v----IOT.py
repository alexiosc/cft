#!/usr/bin/python

import os
import sys
import unittest
import testlib


MAX = 75

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test IOT instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')        
        self.asm('          ; Boot code')        
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        self.asm('&0200:')
        self.asm('boot:')
        
        exp = ''

        # Test 1. Local (must be done in page zero)
        for i in xrange(min(64, MAX)):
            self.asm('          LI %d' % i)
            self.asm('          IOT &107')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]%d' % ((i * 10) & 0xffff)

        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test2')
        exp += '[ok]'
        
        # Test 2. Indirect
        self.asm('&0800:    .word &107')
        self.asm('test2:')
        for i in range(min(256, MAX)):
            self.asm('          LI %d' % i)
            self.asm('          IOT I 0') # Page-relative 0 = &0800
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]%d' % ((i * 10) & 0xffff)

        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test3')
        exp += '[ok]'

        # Test 3. Indirect Register
        self.asm('&0010:    .word &107')
        self.asm('&1000:')
        self.asm('test3:')
        for i in range(MAX):
            self.asm('          LI %d' % i)
            self.asm('          IOT I R &10')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]%d' % ((i * 10) & 0xffff)
            
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test4')
        exp += '[ok]'


        # Test 4. Register
        self.asm('&1200:')
        self.asm('test4:')
        for i in range(MAX):
            self.asm('          LI %d' % i)
            self.asm('          IOT R &107')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]%d' % ((i * 10) & 0xffff)
            
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test5')
        exp += '[ok]'


        # Test 5. Autoincrement
        self.asm('&1400:')
        self.asm('test5:')
        for i in range(MAX):
            self.asm('          LI &107')
            self.asm('          STORE R &80')
            self.asm('          LI %d' % i)
            self.asm('          IOT I R &80')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            self.asm('          PRINTSP')
            self.asm('          LOAD R &80')
            self.asm('          PRINTH')
            exp += '[ok]%d %04x' % (((i * 10) & 0xffff, 0x108))

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
