#!/usr/bin/python2.6
"""
Tests that:

* The PC increments.
* The PC wraps around.
"""

import unittest
import testlib


ASM_WRAP = """
&0000:	.fill 65536 LI 0
&0000:	SUCCESS
        HALT
"""


class T0_ShortPCWrap(testlib.BaseTest):
    def runTest(self):
        """PC wraps around correctly."""
        self.assemble(ASM_WRAP)
        sim = self.simulate()
        self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')


ASM_STEP = """
&0000:	.fill 65536 FAIL
&fff0:	.fill 13 LI 42
        SUCCESS
        HALT
"""

class T1_TinyPCStep(testlib.BaseTest):
    def runTest(self):
        """PC steps correctly."""
        self.assemble(ASM_STEP)
        sim = self.simulate()
        self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')


ASM_HEADER = """
&0000:	.fill 65536 LI 0
&ffee:	SUCCESS
        HALT
"""


class T2_ShortPCStep(testlib.BaseTest):
    def runTest(self):
        """Medium PC wrap-around test."""
        asm = ASM_HEADER
        expected = ''
        for x in range(0x0000, 0x0100, 0x1000):
            expected += '%04x[ok]' % (x >> 12)
            asm += '&%04x:  LI &%04x\n\tPRINTH\n\tSUCCESS\n\tHALT\n' % (x, x >> 12)
        self.assemble(asm)
        sim = self.simulate()
        self.assertEqual(sim, expected, 'Not all checkpoints passed.')


class T3_LongPCStep(testlib.BaseTest):
    def runTest(self):
        """Long PC wrap-around test (all of memory)."""
        asm = ASM_HEADER
        expected = ''
        for x in range(0x0000, 0xffff, 0x1000):
            expected += '%04x[ok]' % (x >> 12)
            asm += '&%04x:  LI &%04x\n\tPRINTH\n\tSUCCESS\n\t\n' % (x, x >> 12)
        expected += '[ok]'
        #print asm
        self.assemble(asm)
        sim = self.simulate()
        #print
        #print "expected:", expected
        #print 'sim:', sim
        self.assertEqual(sim, expected, 'Not all checkpoints passed.')


# End of file.
