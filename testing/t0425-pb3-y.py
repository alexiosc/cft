#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Output (Y) Port"""
        self.simulateTestbed('PB3-Y-test')


# End of file.
