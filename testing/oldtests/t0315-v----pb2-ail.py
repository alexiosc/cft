#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardB(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 2, Auto-Increment Logic"""
        self.simulateTestbed('PB2-AIL-test')


# End of file.
