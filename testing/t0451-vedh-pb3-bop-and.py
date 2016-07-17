#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Binary Operations, Bitwise AND"""
        self.simulateTestbed('PB3-BOP-and')


# End of file.
