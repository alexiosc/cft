#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardUC(testlib.VerilogTest):
    def runTest(self):
        """Microcode board ROMs"""
        self.simulateTestbed('PB0-roms')


# End of file.
