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

MAX = 96 # Higher than this won't work (code/data too far away)

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test LOAD instruction"""
        exp = ''
        self.asm("&0000: .fill 65536 FAIL")
        self.asm("&0080: .word dataset1")
        self.asm("&0100:")
        self.asm("dataset1:")
        for addr in xrange(MAX):
            self.asm("       .word &%04x" % (addr ^ 0xffff))
        self.asm("dataset2:")
        for addr in xrange(MAX):
            self.asm("       .word &%04x" % (addr + 0x100))
        self.asm("boot:")

        # Test dataset 1 (local addressing)
        for addr in xrange(MAX):
            self.asm("       LOAD @dataset1+%d" % addr)
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test dataset 2 (local indirect addressing)
        for addr in xrange(MAX):
            self.asm("       LOAD I @dataset2+%d" % addr)
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)
        self.asm("       JMP I @+1")
        self.asm("       .word far")

        self.asm("&1000:")
        self.asm("far:")

        # Test dataset 1 (register addressing)
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset1+%d" % addr)
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test dataset 2 (register indirect addressing)
        for addr in xrange(MAX):
            self.asm("       LOAD R I @dataset2+%d" % addr)
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test dataset 2 (autoindex)
        for addr in xrange(MAX):
            self.asm("       LOAD R I &080")
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)
        self.asm("       LOAD R &080")
        self.asm("       PRINTA")
        exp += '%04x' % (0x100 + addr + 1)

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
