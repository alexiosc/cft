#!/usr/bin/python2.6
"""
Assembler tests: OP1 instruction
"""

import os
import sys
import random
import unittest
import testlib



class OP1_basics(testlib.testBaseClass):
    def runTest(self):
        """OP1 basics"""
        self.asm('&0800:')
        self.asm('       LI 42')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       CLA')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 42')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       CLL')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 42')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       CLA NOT')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 42')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       NEG')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 99')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       INC')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 255')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       CLL CPL') # Set L
        self.asm('       IFL CLA') # If L => Clear AC
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       LI 128')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')
        self.asm('       RBL') # L is set from before
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       CLL RBL')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       CLL RBR')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       CLL RBR')
        self.asm('       PRINTD')
        self.asm('       PRINTSP')

        self.asm('       HALT')
        self.asm('&0000: .fill 65536 FAIL')
        self.asm('&fff0: JMP I &3f5')
        self.asm('&fff5: .word &0800')

        self.assertSim('42 0 42 42 42 -1 42 -42 99 100 255 0 128 257 514 257 128 ')


# End of file.
