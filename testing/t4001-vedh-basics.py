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


ASM1 = """
&0000:	.fill &10000 0x1234
"""

ASM2 = """
&0000:	
        .fill &8000 0x1234
        .fill &8000 0x5678
"""

ASM3 = """
&0000:	
        .fill &ffff 0x1234
        .word 0x5678
"""

class T1_ImagePresence(testlib.testBaseClass):
    def runTest(self):
        """The binary image (a.bin) is created."""
        self.assemble(ASM1)

        fname = os.path.join(self._basedir, 'a.bin')
        self.assertTrue(os.path.exists(fname), 'Memory image file not generated (%s)' % fname)

        mem = self.readbin()
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')


class T2_ImageSize(testlib.testBaseClass):
    def runTest(self):
        """The binary image (a.bin) is the right size."""
        self.assemble(ASM1)

        fname = os.path.join(self._basedir, 'a.bin')
        self.assertTrue(os.path.exists(fname), 'Memory image file not generated')

        mem = self.readbin()
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')



class T3_Fill1(testlib.testBaseClass):
    def runTest(self):
        """The .fill directive works."""
        fname = os.path.join(self._basedir, 'a.bin')
        self.assemble(ASM1)

        fname = os.path.join(self._basedir, 'a.bin')
        self.assertTrue(os.path.exists(fname), 'Memory image file not generated')

        mem = self.readbin()
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')

        byte_order_error = [0x3412] * 65536
        self.assertNotEqual(mem, byte_order_error, 'Incorrect byte order (want 0x1234)')

        expected = [0x1234] * 65536
        self.checkbin(expected, 'Expected 65,536 copies of 0x1234')


class T3_Fill2(testlib.testBaseClass):
    def runTest(self):
        """Stacking .fill directives."""
        self.assemble(ASM2)

        fname = os.path.join(self._basedir, 'a.bin')
        self.assertTrue(os.path.exists(fname), 'Memory image file not generated')

        mem = self.readbin()
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')

        expected = [0x1234] * 32768
        expected += [0x5678] * 32768
        self.checkbin(expected, 'Expected 32,768 x 0x1234 + 32,768 x 0x5678')


class T3_Fill3(testlib.testBaseClass):
    def runTest(self):
        """Stacking .fill and .word directives."""
        self.assemble(ASM3)

        fname = os.path.join(self._basedir, 'a.bin')
        self.assertTrue(os.path.exists(fname), 'Memory image file not generated')

        mem = self.readbin()
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')

        expected = [0x1234] * 65535
        expected.append(0x5678)
        self.checkbin(expected, 'Expected 65535 x 0x1234 + 1 x 0x5678')


class T4_Word1(testlib.testBaseClass):
    def runTest(self):
        """The .word directive works."""
        asm = list()
        asm.append('.word 0x1234')
        asm.append('.word 0x1200 0x34')
        asm.append('.word 0x1000 0x200 0x30 0x4')
        asm.append('.word 0x1000 512 0x30 #100')
        asm.append('.word 4660')
        asm.append('.word #1001000110100')
        asm.append('.word FOO')
        asm.append('&1234:')
        asm.append('FOO:')

        self.assemble('\n'.join(asm))

        expected = [0x1234] * 7
        expected += [0x0000] * 65529
        self.checkbin(expected, 'Expected 7 x 0x1234 + 65529 x 0x0000')


class T4_Word_and_Fill1(testlib.testBaseClass):
    def runTest(self):
        """Overwrite .fill area with .word"""
        asm = list()
        asm.append('&0000: .fill 0x10000 0x5600 0x78')
        asm.append('&0000: .word 0x1234')
        asm.append('       .word 0x1200 0x34')
        asm.append('       .word 0x1000 0x200 0x30 0x4')
        asm.append('       .word 0x1000 512 0x30 #100')
        asm.append('       .word 4660')
        asm.append('       .word #1001000110100')

        self.assemble('\n'.join(asm))

        expected = [0x1234] * 6
        expected += [0x5678] * 65530
        self.checkbin(expected, 'Expected 6 x 0x1234 + 65530 x 0x5678')


class T4_Word_and_Fill2(testlib.testBaseClass):
    def runTest(self):
        """Overwrite .words with .fill"""
        asm = list()
        asm.append('&0000: .word 0x1234')
        asm.append('       .word 0x1200 0x34')
        asm.append('       .word 0x1000 0x200 0x30 0x4')
        asm.append('       .word 0x1000 512 0x30 #100')
        asm.append('       .word 4660')
        asm.append('       .word #1001000110100')
        asm.append('&10000: .fill 0x10000 0x5600 0x78')

        self.assemble('\n'.join(asm))

        expected = [0x5678] * 65536
        self.checkbin(expected, 'Expected 65,536 x 0x5678')


class T4_FillWrap(testlib.testBaseClass):
    def runTest(self):
        """Check if .fill wraps around"""
        asm = list()
        asm.append('&8000: .fill 0x10000 0x1234')

        self.assemble('\n'.join(asm))

        expected = [0x1234] * 65536
        self.checkbin(expected, 'Expected 65,536 x 0x1234')


# End of file.
