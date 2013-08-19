#!/usr/bin/python
# coding:utf-8

import os
import sys
import unittest
import testlib


MAX = 62

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test JMP instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        self.asm('&0400:')
        
        exp = ''

        # Note: the flow of execution is BACKWARDS for every 4-5 instruction
        # ‘block’.

        # Test 1. Local
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test2')
        self.asm('          FAIL')
        exp += '[ok]'
        for i in xrange(MAX):
            c = 65 + (i % 26)
            self.asm('          LI %d' % c)
            self.asm('          SUCCESS')
            self.asm('          PRINTC')
            self.asm('          JMP @-7')
            exp = ('[ok]%c' % c) + exp

        self.asm('boot:         JMP @-4')


        # Test 2. Indirect
        exp2 = ''
        self.asm('&2000:')
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test3')
        self.asm('          FAIL')
        self.asm('          FAIL')

        for i in xrange(MAX):
            c = 97 + (i % 26)
            self.asm('          LI %d' % c)
            self.asm('          SUCCESS')
            self.asm('          PRINTC')
            self.asm('          JMP I @+1')
            self.asm('          .word @-9')
            exp2 = ('[ok]%c' % c) + exp2

        exp += exp2 + '[ok]'

        self.asm('test2:         JMP @-5')


        # Test 3. Register
        self.asm('&0100:')
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test4')
        self.asm('          FAIL')
        exp2 = ''
        for i in xrange(min(63, MAX)):
            c = 48 + (i % 10)
            self.asm('          LI %d' % c)
            self.asm('          SUCCESS')
            self.asm('          PRINTC')
            self.asm('          JMP R @-7')
            exp2 = ('[ok]%c' % c) + exp2

        exp += exp2 + '[ok]'

        self.asm('test3:')
        self.asm('          JMP R @-4')



        # Test 4. Register Indirect
        # Make the dataset
        for i in xrange(min(256, MAX)):
            self.asm('&%04x:    .word @test4a+%d' % (0x200 + i, (i + 1) * 5))

        self.asm('&4000:')
        self.asm('test4:')

        self.asm('test4a:')
        for i in xrange(min(256, MAX)):
            c = 33 + (i % 94)
            self.asm('          LI %d' % c)
            self.asm('          SUCCESS')
            self.asm('          PRINTC')
            self.asm('          JMP I R &%03x' % (0x200 + i,))
            self.asm('          FAIL')
            exp += '[ok]%c' % c
        self.asm('          SUCCESS')
        self.asm('          JMP I @+1')
        self.asm('          .word test5')

        exp += '[ok]'


        # Test 5. Autoindex (of limited use)
        self.asm('&6000:')
        self.asm('test5:')
        for i in xrange(min(110, MAX)):
            c = 65 + (i % 26)
            self.asm('          LIA @+5')      # 6000 + 9i
            self.asm('          STORE R &080') # 6001 + 9i
            self.asm('          LI %d' % c)    # 6002 + 9i
            self.asm('          JMP I R &080') # 6003 + 9i
            self.asm('          FAIL')         # 6004 + 9i
            self.asm('          SUCCESS')      # 6005 + 9i
            self.asm('          PRINTC')       # 6006 + 9i
            self.asm('          LOAD R &080')  # 6007 + 9i
            self.asm('          PRINTA')       # 6008 + 9i
            exp += '[ok]%c%04x' % (c, 0x6006 + 9 * i)

        self.asm('          SUCCESS')
        self.asm('          HALT')
        exp += '[ok]'

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
