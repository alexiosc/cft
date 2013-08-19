#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, ALU Operation Decoder"""
        self.simulateTestbed('PB3-decoder-test')


# End of file.
