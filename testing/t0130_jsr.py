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
        """JSR direct"""
        self.asm('       .fill &ffff FAIL')
        self.asm('&0800: JSR &100')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('&0900: SUCCESS')
        self.asm('       RET')
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')

        self.assertSim('[ok]' * 2)


class JSR_indirect(testlib.testBaseClass):
    def runTest(self):
        """JSR indirect"""
        self.asm('.fill &ffff FAIL')
        self.asm('&0800: .word &0900')
        self.asm('&0801: JSR I &000')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('&0900: SUCCESS')
        self.asm('       RET')
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0801')

        self.assertSim('[ok]' * 2)


class JSR_indirect_zero(testlib.testBaseClass):
    def runTest(self):
        """JSR indirect (zero page)"""
        self.asm('.fill &ffff FAIL')
        self.asm('&0042: .word &0900')
        self.asm('&0801: JSR I R &042')
        self.asm('       SUCCESS')
        self.asm('       HALT')
        self.asm('&0900: SUCCESS')
        self.asm('       RET')
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0801')

        self.assertSim('[ok]' * 2)


class JSR_indirect_inc(testlib.testBaseClass):
    def runTest(self):
        """JSR indirect (increment)"""
        self.asm('.fill &ffff FAIL')

        self.asm('&0080: .word &0300')

        self.asm('&0300:')
        self.asm('jumptable:')
        self.asm('       JMP &310')
        self.asm('       JMP &318')
        self.asm('       JMP &320')
        self.asm('       JMP &328')

        self.asm('&0310: LI 1')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('       RET')

        self.asm('&0318: LI 42')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('       RET')

        self.asm('&0320: LI 80')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('       RET')

        self.asm('&0328: LI 666')
        self.asm('       PRINTD')
        self.asm('       SUCCESS')
        self.asm('       RET')

        self.asm('&0800:')
        self.asm('start:')
        self.asm('       JSR I R &80')
        self.asm('       JSR I R &80')
        self.asm('       JSR I R &80')
        self.asm('       JSR I R &80')
        self.asm('       SUCCESS')
        self.asm('       HALT')

        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')

        self.assertSim('1[ok]42[ok]80[ok]666[ok][ok]')


# End of file.
