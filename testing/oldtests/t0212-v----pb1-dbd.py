#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardA(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 1, Data Bus Driver"""
        self.simulateTestbed('PB1-DBD-test')


# End of file.
