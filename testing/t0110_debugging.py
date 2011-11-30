#!/usr/bin/python2.6
"""
Tests:

* Basic assembler facilities.
* Indirection across pages.
* The basics of the JMP and LI instructions.
* Debugging facilities.
"""

import unittest
import testlib


ASM = """
&0000:  .fill &ffff FAIL

&0800:
datum:  .word &5555
start:  LOAD datum
        PRINTC       ; Must output 'U'
        LI &20
        PRINTC

        LOAD datum
        PRINTD       ; Must output 21845
        LI &20
        PRINTC

        LOAD datum
        PRINTH       ; Must output 5555
        LI &20
        PRINTC

        LOAD datum
        PRINTB       ; Must output 0101010101010101

        SUCCESS
        HALT

&fff0:	JMP [baddr]
baddr:  .word start
"""

class DebuggingOutput(testlib.BaseTest):
    def runTest(self):
        """Test debugging facilities"""
        self.assemble(ASM)
        sim = self.simulate()
        self.assertSim(sim, 'Mis-jump')
        self.assertEqual(sim, 'U 21845 5555 0101010101010101[ok]', 'Debugging output failure.')

# End of file.
