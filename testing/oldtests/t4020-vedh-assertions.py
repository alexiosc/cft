#!/usr/bin/python

import os
import sys
import unittest
import testlib


asm = """
&0000:    .fill 65536 FAIL
&fff0:    SUCCESS
          FAIL
          SUCCESS
          HALT
          SUCCESS
          JMP @+1
"""


class AssertionTest(testlib.testBaseClass):
    def runTest(self):
        """Test DEB Assertions"""
        self.assemble(asm)
        sim = self.simulate()
        self.assertEqual(sim, '[ok][FAIL!]', 'SUCCESS/FAIL/HALT problem.')


# End of file.
