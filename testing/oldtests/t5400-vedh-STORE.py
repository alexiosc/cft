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

MAX = 63

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test STORE instruction"""
        exp = ''
        self.asm("&0000: .fill 65536 FAIL")
        self.asm("&0006: .word 5")

        self.asm("&0080: .word &0100")

        self.asm("&0100:")
        self.asm("dataset:")
        for addr in xrange(MAX):
            self.asm("       .word &%04x" % (addr ^ 0xffff))

        self.asm("&1000:")
        self.asm("tmp:       .word 0")
        self.asm("&1001:")
        self.asm("boot:")

        # Test local addressing
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset+%d" % addr)
            self.asm("       STORE tmp")
            self.asm("       LOAD tmp")
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test register addressing
        self.asm("test2:")
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset+%d" % addr)
            self.asm("       STORE R 5")
            self.asm("       LOAD R 5")
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test indirect addressing
        self.asm("test3:")
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset+%d" % addr)
            self.asm("       STORE I @+4")
            self.asm("       LOAD R 5")
            self.asm("       PRINTH")
            self.asm("       JMP @+2")
            self.asm("       .word 5")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test indirect register addressing
        self.asm("test4:")
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset+%d" % addr)
            self.asm("       STORE I R 6")
            self.asm("       LOAD R 5")
            self.asm("       PRINTH")
            self.asm("       SUCCESS")
            exp += '%04x[ok]' % (addr ^ 0xffff)

        # Test autoincrement
        self.asm("test5:")
        for addr in xrange(MAX):
            self.asm("       LOAD R @dataset+%d" % addr)
            self.asm("       STORE I R &080")
            self.asm("       LOAD R &%03x" % (addr + 0x100))
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
