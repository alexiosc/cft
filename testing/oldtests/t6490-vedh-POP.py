#!/usr/bin/python

import os
import sys
import unittest
import testlib


asm1 = """
&0000:    .fill 65536 FAIL
"""

"""
&0800:
boot:     LI 

          ; Boot code
&fff0:    JMP I @+1
          .word boot
"""

MAX = 250

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test POP instruction"""
        exp = ''
        self.asm("&0000: .fill 65536 FAIL")
        self.asm("&0006: .word 5")

        self.asm("&0100:")
        for addr in xrange(MAX):
            self.asm("       .word &%04x" % (addr ^ 0xffff))
        self.asm("dataset:")
        self.asm(".word     0")

        self.asm("&1000:")
        self.asm("tmp:       .word 0")
        self.asm("&1001:")
        self.asm("boot:")

        # Test autoincrement
        self.asm('LIA    R dataset')
        self.asm('STORE  R &80')
        for addr in xrange(MAX):
            self.asm("       POP R &80")
            self.asm("       XOR R @dataset-%d" % (addr + 1))
            self.asm("       PRINTD")
            self.asm("       SUCCESS")
            exp += '0[ok]'
        self.asm("       LOAD R &080")
        self.asm("       PRINTA")
        exp += '%04x' % 0x100

        self.asm("       HALT")

        self.asm("&fff0: JMP I @+1")
        self.asm("       .word boot")

        #print "\n".join(self._source)
        self.assemble()
        sim = self.simulate()

        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
