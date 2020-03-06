#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardUCB(testlib.VerilogTest):
    def runTest(self):
        """MicroPC"""
        self.simulateTestbed('PB0-UPC-test')


# End of file.
