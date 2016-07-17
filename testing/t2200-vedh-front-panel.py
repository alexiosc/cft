#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class PFPBoard(testlib.VerilogTest):
    def runTest(self):
        """Programmer's Front Panel (PFP)"""
        self.simulateTestbed('front-panel-test')


# End of file.
