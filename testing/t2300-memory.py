#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class MEMBoard(testlib.VerilogTest):
    def runTest(self):
        """Memory Board (MEM)"""
        self.simulateTestbed('memory-test')


# End of file.
