#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardC(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 3, Binary Operations, ADD"""
        self.simulateTestbed('PB3-BOP-add')


# End of file.
