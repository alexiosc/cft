#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardA(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 1, Skip/Branch Logic"""
        self.simulateTestbed('PB1-SBL-test', debug=True)


# End of file.
