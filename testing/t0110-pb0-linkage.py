#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardUCB(testlib.VerilogTest):
    def runTest(self):
        """Microcode Board Linkage"""
        self.simulateTestbed('PB0-linkage')


# End of file.
