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
datum2: .word &aaab
start:  LOAD datum
        PRINTC       ; Must output 'U'
        LI &20
        PRINTC

        LOAD datum
        PRINTD       ; Must output 21845
        LI &20
        PRINTC

        LOAD datum2
        PRINTD       ; Must output -21845
        LI &20
        PRINTC

        LOAD datum
        PRINTH       ; Must output 5555
        LI &20
        PRINTC

        LOAD datum2
        PRINTH       ; Must output 5555
        LI &20
        PRINTC

        LOAD datum
        PRINTB       ; Must output 0101010101010101

        SUCCESS
        HALT

&fff0:	JMP I baddr
baddr:  .word start
"""

class DebuggingOutput(testlib.testBaseClass):
    def runTest(self):
        self.assemble(ASM)
        sim = self.simulate()
        self.assertNoFail(sim, 'Mis-jump')
        exp = 'U 21845 -21845 5555 aaab 0101010101010101[ok]'
        try:
            self.assertEqual(sim, exp, 'Debugging output failure.')
        except:
            print "Expected:         ", exp
            print "Unexpected output:", sim
            raise

# End of file.
