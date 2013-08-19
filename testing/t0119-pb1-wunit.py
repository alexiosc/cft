#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoard0(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 0, WUNIT decoder"""
        self.simulateTestbed('PB0-wunit')


# End of file.
