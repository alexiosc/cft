#!/usr/bin/python2.6
"""
Assembler tests.

Tests that:

* The .fill directive works.

"""

import os
import sys
import random
import unittest
import testlib



class Link(testlib.BaseTest):
    def runTest(self):
        """Test L register essentials."""
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')
        self.asm('&0800:')
        self.asm('        CLL')
        self.asm('        SCL')
        self.asm('        FAIL')
        self.asm('        SUCCESS')
        for x in xrange(10):
            self.asm('        CPL ; L=1')
            self.asm('        SSL')
            self.asm('        FAIL')
            self.asm('        SUCCESS')
            self.asm('        CPL ; L=0')
            self.asm('        SCL')
            self.asm('        FAIL')
            self.asm('        SUCCESS')
        self.asm('        HALT')
        #print '\n'.join(self._source)

        self.assemble()
        sim = self.simulate()
        #print sim
        exp = '[ok]' * 21

        #print exp
        self.assertEqual(sim, exp, 'Not all checkpoints passed.')


# End of file.
