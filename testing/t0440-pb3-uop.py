#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Unary Operations and Constant Store"""
        self.simulateTestbed('PB3-UOP')


# End of file.
