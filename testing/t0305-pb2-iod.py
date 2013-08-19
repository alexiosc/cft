#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardB(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 2, I/O address decoder"""
        self.simulateTestbed('PB2-IOD-test')


# End of file.
