#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Binary Operations, Exclusive Or"""
        self.simulateTestbed('PB3-BOP-xor')


# End of file.
