#!/usr/bin/python

import os
import sys
import unittest
import testlib


MAX = 65

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test IN instruction"""

        # Make the dataset
        ds = []
        ds += [ 1<<x for x in range(16) ]
        ds += [ (1<<x) ^ 0xffff for x in range(16) ]
        ds += [ (15<<x) for x in range(12) ]
        ds += [ (15<<x) ^ 0xffff for x in range(12) ]
        ds += [ 0x5555, 0xaaaa ]

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')        
        self.asm('          ; Boot code')        
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        self.asm('&0100:')
        self.asm('dssize:   .word -%d' % len(ds))
        self.asm('dataset:')
        for x in ds:
            self.asm('          .word &%04x' % x)

        self.asm('boot:')
        self.asm('          IN R &108')
        self.asm('          STORE R 3')
        self.asm('          LIA dataset')
        self.asm('          STORE R 4')
        self.asm('          STORE R &80')

        exp = ''

        # Test 1. Local (must be done in page zero)
        for i in range(len(ds)):
            self.asm('          LOAD I R &80')
            self.asm('          IN &107')
            self.asm('          XOR R &3')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]0'

        self.asm('          SUCCESS')
        self.asm('          LOAD R 4')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test2')
        exp += '[ok]'
        
        # Test 2. Indirect
        self.asm('ind_test: .word &108')
        self.asm('test2:')
        for i in range(len(ds)):
            self.asm('          LOAD I R &80')
            self.asm('          IN I ind_test')
            self.asm('          XOR R &3')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]0'

        self.asm('          SUCCESS')
        self.asm('          LOAD R 4')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test3')
        exp += '[ok]'

        # Test 3. Indirect Register
        self.asm('test3:')
        self.asm('          LI &108')
        self.asm('          STORE R &10')
        for i in range(len(ds)):
            self.asm('          LOAD I R &80')
            self.asm('          IN I R &10')
            self.asm('          XOR R &3')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]0'
            
        self.asm('          SUCCESS')
        self.asm('          LOAD R 4')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test4')
        exp += '[ok]'

        # Test 4. Register
        self.asm('test4:')
        for i in range(len(ds)):
            self.asm('          LOAD I R &80')
            self.asm('          IN R &107')
            self.asm('          XOR R &3')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            exp += '[ok]0'
            
        self.asm('          SUCCESS')
        self.asm('          LOAD R 4')
        self.asm('          STORE R &80')
        self.asm('          JMP I @+1')
        self.asm('          .word test5')
        exp += '[ok]'


        # Test 5. Autoincrement
        self.asm('test5:')
        for i in range(len(ds)):
            self.asm('          LI &108')
            self.asm('          STORE R &81')
            self.asm('          LOAD I R &80')
            self.asm('          IN I R &81')
            self.asm('          XOR R &3')
            self.asm('          SUCCESS')
            self.asm('          PRINTU')
            self.asm('          PRINTSP')
            self.asm('          LOAD R &81')
            self.asm('          PRINTH')
            # Expect the autoincrement register to have incremented correctly.
            exp += '[ok]0 %04x' % (0x109,)

        self.asm('          SUCCESS')
        exp += '[ok]'
        self.asm('          HALT')

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
            print self.hldiff(exp,sim)
            raise


# End of file.