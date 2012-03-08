#!/usr/bin/python2.6
"""
Tests that:

* The reset sequence works.
* The initial value of the PC is correct.
* Tests the basics of the debugging unit.
* Tests the fundaments of the OUT instruction.

"""

import unittest
import testlib


ASM = """

&0000:	.fill &ffff FAIL

&fff0:	SUCCESS
        HALT
"""

class ResetAddress(testlib.testBaseClass):
    def runTest(self):
        """Check reset and PC initialisation"""
        self.assemble(ASM)
        self.assertSim(self.simulate(), 'Incorrect post-reset address.')

# End of file.
