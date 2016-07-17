#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorBoardA(testlib.VerilogTest):
    def runTest(self):
        """Processor Board 1, Interrupt State Machine"""
        self.simulateTestbed('PB1-ISM-test')


# End of file.
