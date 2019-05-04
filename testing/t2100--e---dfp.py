#!/usr/bin/python2.6
"""
Tests:

* Quite a few instructions.
* Looping.
* Strings.
"""

import unittest
import testlib
import random


class DFP(testlib.testBaseClass):

    def runTest(self):
        """Basic DFP functionality test."""
        self.clear()

        exp = ''
        
        self.asm('&fff0:    JMP I baddr')
        self.asm('baddr:    .word boot')
        self.asm('&f000:')
        self.asm('boot:')
        self.asm('          SUCCESS')
        self.asm('          LI 65')
        self.asm('          PRINTC')
        self.asm('          SUCCESS')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          PRINTH')
        self.asm('          SUCCESS')
        self.asm('          PRINTB')
        self.asm('          SUCCESS')
        self.asm('          PRINTNL')
        self.asm('          SUCCESS')
        self.asm('          PRINTSP')
        self.asm('          SUCCESS')
        self.asm('          HALT')
        self.asm('          FAIL')

        exp += '[ok]A[ok]65[ok]0041[ok]0000000001000001[ok]\n[ok] [ok]'

        self.assemble()
        sim = self.simulate()
        try:
            self.assertEqual(sim, exp,
                             'Test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated: ", sim
            raise


# End of file.
