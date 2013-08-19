#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoard0(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 0, RUNIT decoder"""
        self.simulateTestbed('PB0-runit')


# End of file.
