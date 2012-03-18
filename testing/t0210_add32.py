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



class Random_Add32(testlib.testBaseClass):
    def runTest(self):
        """Algorithm test: 32-bit addition"""

        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')
        self.asm('&0080: .word &0900')
        self.asm('&0900:')

        self.old_a = 0
        self.results = []
        self.num = 0

        def _add(a, b):
            self.results.append(a + b)
            self.num += 1
            self.asm('       .word &%04x ; a lo' % (a & 0xffff,))
            self.asm('       .word &%04x ; b lo' % (b & 0xffff,))
            self.asm('       .word &%04x ; a hi' % ((a >> 16) & 0xffff,))
            self.asm('       .word &%04x ; b hi' % ((b >> 16) & 0xffff,))
            self.asm('')

        _add(0, 0)
        N = 1
        #for a in xrange(N):
        #    for b in xrange(N):
        #        _add(21 * a + 15, 13 * b + 27)

        #for a in xrange(N):
        #    for b in xrange(N):
        #        _add(997 * a + 71, 143 * b + 28)

        for a in xrange(N):
            for b in xrange(N):
                _add(65530 + a, 143 * (b + 1) + 28)

        #print '\n'.join(self._source)

        self.asm('&0800:')
        self.asm('       LI %d' % self.num)
        self.asm('       NEG')
        self.asm('       STORE R &11')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('loop:')
        self.asm('       CLL')
        self.asm('       LOAD I R &80')
        self.asm('       ADD I R &80')
        self.asm('       STORE R I &10')
        self.asm('       LOAD I R &80')
        self.asm('       IFL INC')
        self.asm('       ADD I R &80')
        self.asm('       PRINTHI')
        self.asm('       LOAD R I &10')
        self.asm('       PRINTLO')
        self.asm('       PRINTSP')
        self.asm('       LOAD R &11')
        self.asm('       ISZ R &11')
        self.asm('       JMP loop')
        self.asm('       SUCCESS')
        self.asm('       HALT')

        expected = '%d[ok]' % (-self.num,)
        expected += ''.join('%x ' % x for x in self.results)
        expected += '[ok]'
        self.assertSim(expected)



# End of file.
