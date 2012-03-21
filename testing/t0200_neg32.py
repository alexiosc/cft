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



class Random_Neg32(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 32-bit negation"""

        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')
        self.asm('&0080: .word &0900')
        self.asm('&0900:')

        self.old_a = 0
        self.results = []
        self.num = 0

        def _neg(a):
            self.results.append(-a)
            self.num += 1
            self.asm('       .word &%04x ; a lo' % (a & 0xffff,))
            self.asm('       .word &%04x ; a hi' % ((a >> 16) & 0xffff,))
            self.asm('')

        _neg(5)
        for a in xrange(200):
            _neg( 215320001 *  a + 28) # Wagstaff prime

        #print '\n'.join(self._source)

        self.asm('&0800:')
        self.asm('       LI %d' % self.num)
        self.asm('       NEG')
        self.asm('       STORE R &11')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('loop:')
        self.asm('       LOAD I R &80')
        self.asm('       CLL')
        self.asm('       NEG')
        self.asm('       STORE R &40')
        self.asm('       LOAD I R &80')
        self.asm('       XOR MINUS1')
        self.asm('       IFL INC')
        self.asm('       PRINTHI')
        self.asm('       LOAD R &40')
        self.asm('       PRINTLO')
        self.asm('       PRINTSP')
        self.asm('       SUCCESS')
        self.asm('       PRINTSP')
        self.asm('       LOAD R &11')
        self.asm('       ISZ R &11')
        self.asm('       JMP loop')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('MINUS1: .word 0xffff')

        #print '\n'.join(self._source)

        expected = '%d[ok]' % (-self.num,)
        expected += ''.join('%x [ok] ' % (x&0xffffffff, ) for x in self.results)
        expected += '[ok]'
        self.assertSim(expected)



# End of file.
