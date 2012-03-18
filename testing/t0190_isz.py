#!/usr/bin/python2.6
"""
Assembler tests.

"""

import os
import sys
import random
import unittest
import testlib



class JSR_direct(testlib.testBaseClass):
    def runTest(self):
        """ISZ direct"""

        num = 50

        self.asm('       .fill &ffff FAIL')
        self.asm('&0801: LI %(num)s' % locals())
        self.asm('       NEG')
        self.asm('       STORE 0')
        self.asm('loop:  ')
        self.asm('       NEG')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       ISZ 0')
        self.asm('       JMP loop')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0801')

        self.assertSim('%s[ok]' % (''.join(["%d " % (num - x,) for x in xrange(num)]),))


class JSR_indirect(testlib.testBaseClass):
    def runTest(self):
        """ISZ indirect"""

        num = 50

        self.asm('       .fill &ffff FAIL')
        self.asm('&0802: LI %(num)s' % locals())
        self.asm('       NEG')
        self.asm('       STORE 0')
        self.asm('       LIA 0')
        self.asm('       STORE 1')
        self.asm('       LOAD I 1')
        self.asm('loop:  ')
        self.asm('       NEG')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       ISZ I 1')
        self.asm('       JMP loop')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0802')

        self.assertSim('%s[ok]' % (''.join(["%d " % (num - x,) for x in xrange(num)]),))


# End of file.
