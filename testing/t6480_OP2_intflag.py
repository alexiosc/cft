#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 20

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):

    def runTest(self):
        """Test OP2 instruction, interrupt flag"""

        self.setSimulator('cft-mc-CPU-MEM64-DEB-PFP-irq.o', '+irqperiod=25000')

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        self.asm('&fff8:    LI 42         ; A tiny ISR')
        self.asm('          STORE R 3')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          RTI')
        
        exp = ''

        self.asm('&0400:')
        self.asm('boot:')

        for i in xrange(MAX):
            # Test 1: Control test. No interrupts fired.
            for i in range(256-11):
                self.asm('          NOP')
            self.asm('          SUCCESS')
            exp += '[ok]'
    
            # Test 2: Enable interrupts and wait for the ISR to run.
            self.asm('          LI 0')
            self.asm('          STORE R 3')
            self.asm('          SEI')
            self.asm('          LOAD R 3')
            self.asm('          SNZ')
            self.asm('          JMP @-2')
            exp += '42[ok]'         # The ISR emits these

            # Test 3. Immediately enable and disable interrupts. We
            # just serviced an int so there's time enough to run SEI
            # without an interrupt arriving.
            self.asm('          SEI')
            self.asm('          CLI')

            # Print AC as was left by the last ISR execution
            self.asm('          PRINTH')
            self.asm('          SUCCESS')
            exp += '002a[ok]'

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
