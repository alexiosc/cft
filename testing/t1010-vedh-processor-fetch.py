#!/usr/bin/python

import os
import sys
import random
import unittest
import testlib


FRAMEWORKS = 'v'


class ProcessorFetch(testlib.VerilogTest):
    def runTest(self):
        """Processor, Fetch cycle"""
        self.simulateTestbed('processor-fetch')


# End of file.
