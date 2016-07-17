#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardB(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 2, Program Counter"""
        self.simulateTestbed('PB2-PC-test')


# End of file.
