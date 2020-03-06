#!/usr/bin/python2.6
"""
Tests that:

* The PC increments.
* The PC wraps around.
"""

import unittest
import testlib


ASM_WRAP = """
&0000:	.fill 65535 LI 0
&ffff:  LI 0
&0000:	SUCCESS
        HALT
"""


class T0_ShortPCWrap(testlib.testBaseClass):
    def runTest(self):
        """PC wraps around correctly."""
        self.assemble(ASM_WRAP)
        try:
            self.addArg('+timeout=100000000')
            sim = self.simulate()
            self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')
        except:
            print sim
            raise


ASM_STEP = """
&0000:	.fill 65535 FAIL
&ffff:  LI 0
&fff0:	.fill 13 LI 42
        SUCCESS
        HALT
"""

class T1_TinyPCStep(testlib.testBaseClass):
    def runTest(self):
        """PC steps correctly."""
        self.assemble(ASM_STEP)
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')


ASM_HEADER = """
&0000:	.fill 65535 LI 0
&ffff:  LI 0
&ffee:	SUCCESS
        HALT
"""


class T2_ShortPCStep(testlib.testBaseClass):
    def runTest(self):
        """Medium PC wrap-around test."""
        asm = ASM_HEADER
        expected = ''
        for x in range(0x0000, 0x1000, 0x400):
            expected += '%04x[ok]' % (x >> 12)
            asm += '&%04x:  LI &%04x\n\tPRINTH\n\tSUCCESS\n' % (x, x >> 12)
        expected += '[ok]'
        try:
            self.assemble(asm)
            self.addArg('+timeout=100000000')
            sim = self.simulate()
            self.assertEqual(sim, expected, 'Not all checkpoints passed.')
        except:
            print expected
            print sim
            raise


class T3_LongPCStep(testlib.testBaseClass):
    def runTest(self):
        """Long PC wrap-around test (all of memory)."""
        asm = ASM_HEADER
        expected = ''
        for x in range(0x0000, 0xffff, 0x400):
            expected += '%04x[ok]' % (x >> 12)
            asm += '&%04x:  LI &%04x\n\tPRINTH\n\tSUCCESS\n\t\n' % (x, x >> 12)
        expected += '[ok]'
        #print asm
        self.assemble(asm)
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        #print
        #print "expected:", expected
        #print 'sim:', sim
        self.assertEqual(sim, expected, 'Not all checkpoints passed.')


# End of file.
