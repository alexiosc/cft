#!/usr/bin/python2.6
"""
Assembler tests.

Tests that:

* The .fill directive works.

"""

import os
import sys
import unittest
import testlib


class T1_Basic_Jump(testlib.testBaseClass):
    def runTest(self):
        """Basic JMP from boot address"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: JMP &3f5 ; same page')
        asm.append('&fff5: SUCCESS')
        asm.append('       HALT')

        self.assemble('\n'.join(asm))
        sim = self.simulate()

        self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')


class T2_Jump_From_FFFE(testlib.testBaseClass):
    def runTest(self):
        """Jump within page"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: .fill 14 SUCCESS')
        asm.append('&fffe: JMP 0 ; local page')
        asm.append('&fc00: SUCCESS')
        asm.append('       HALT')

        self.assemble('\n'.join(asm))
        sim = self.simulate()

        self.assertEqual(sim, '[ok]' * 15, 'Not all checkpoints passed.')


class T3_Jump_From_FFFF(testlib.testBaseClass):
    def runTest(self):
        """Jump at end of page"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: .fill 15 SUCCESS')
        asm.append('&fc00: SUCCESS')
        asm.append('       HALT')
        asm.append('&ffff: JMP 0 ; page has changed already! Absolute address &03ff')

        self.assemble('\n'.join(asm))
        #self.addArg('+timeout=100000000')
        sim = self.simulate()

        self.assertEqual(sim, '[ok]' * 16, 'Not all checkpoints passed.')


class T4_Jump_Indirection(testlib.testBaseClass):
    def runTest(self):
        """Jump indirectly"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: JMP I &3ff ; current page, abs addr &ffff')
        asm.append('&ffff: .word &1234')
        asm.append('&1234: SUCCESS')
        asm.append('       HALT')

        self.assemble('\n'.join(asm))
        sim = self.simulate()

        self.assertEqual(sim, '[ok]', 'Not all checkpoints passed.')


class T4_Jump_Zero_Indirection(testlib.testBaseClass):
    def runTest(self):
        """Indirect jumps (zero page)"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: JMP R I 1')
        asm.append('&0001: .word &1000')
        asm.append('&0002: .word &2000')
        asm.append('&0003: .word &3000')
        asm.append('&0004: .word &4000')
        asm.append('&1000:')
        asm.append('       LI 1')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       JMP R I 2 ')

        asm.append('&2000:')
        asm.append('       LI 2')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       JMP R I 3 ')

        asm.append('&3000:')
        asm.append('       LI 3')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       JMP R I 4')

        asm.append('&4000: LI 4')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       HALT')

        self.assemble('\n'.join(asm))
        sim = self.simulate()

        self.assertEqual(sim, '1[ok]2[ok]3[ok]4[ok]', 'Not all checkpoints passed.')


class T5_JSR(testlib.testBaseClass):
    def runTest(self):
        """JSR instruction"""
        asm = list()
        asm.append('&0000: .fill 65535 FAIL')
        asm.append('&fff0: ')
        asm.append('       JSR 0 ; abs addr = &fc00')
        asm.append('       JSR R I 5')
        asm.append('       JSR I &3ff')
        asm.append('       JSR R &300 ; abs addr = &0300')
        asm.append('       SUCCESS')
        asm.append('       HALT')
        asm.append('&0005: .word &1000')
        asm.append('&ffff: .word &2000')
        asm.append('&fc00:')
        asm.append('       LI 1')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       RET')
        asm.append('&1000:')
        asm.append('       LI 2')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       RET')
        asm.append('&2000:')
        asm.append('       LI 3')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       RET')
        asm.append('&0300:')
        asm.append('       LI 4')
        asm.append('       PRINTD')
        asm.append('       SUCCESS')
        asm.append('       RET')

        self.assemble('\n'.join(asm))
        sim = self.simulate()

        self.assertEqual(sim, '1[ok]2[ok]3[ok]4[ok][ok]', 'Not all checkpoints passed.')


# End of file.
