#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class DEBBoard(testlib.VerilogTest):
    def runTest(self):
        """Debugging board (DFP)"""
        self.simulateTestbed('DFP-test')


# End of file.
