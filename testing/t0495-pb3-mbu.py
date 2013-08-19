#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Memory Banking Unit"""
        self.simulateTestbed('PB3-MBU-test')


# End of file.
