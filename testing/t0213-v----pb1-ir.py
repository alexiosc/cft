#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardA(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 1, Instruction Register"""
        self.simulateTestbed('PB1-IR-test')


# End of file.
