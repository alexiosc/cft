#!/usr/bin/python

import os
import sys
import unittest
import testlib
import random


MAX = 16

random.seed(207205965)


class InstructionTest(testlib.testBaseClass):

    def runTest(self):
        """Test OP2 instruction, conditional skips"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        # Strategy: there are 32 skip instruction combinations. Try them all
        # against all 12 combinations of the Z, N, L, V flags (Z & N are
        # mutually exclusive, hence 12). Try MAX different tests for AC
        # (affecting Z, N flags).

        # Zero 'dataset':
        self.asm('&0100:')
        self.asm('zero:     .fill %d 0' % MAX)
            
        # Positive dataset:
        self.asm('&0200:')
        self.asm('pos:')
        self.asm('clrv:     .word 1')
        self.asm('          .word 32767')
        for i in range(MAX - 2):
            self.asm('          .word %d' % random.randint(2, 32766))
            
        # Negative dataset:
        self.asm('&0300:')
        self.asm('neg:')
        self.asm('setv:     .word -32768   ; 1000000000000000')
        self.asm('          .word -1       ; 1111111111111111')
        for i in range(MAX - 2):
            self.asm('          .word -%d' % random.randint(2, 32767))

        self.asm('&0400:')
        self.asm('boot:')
        
        for dataset in ('neg', 'zero', 'pos'):
            for l in (0, 1):
                for v in (0, 1):

                    # Set the flags.
                    if v:
                        self.asm('          LOAD R setv')
                        self.asm('          ADD R setv')
                    else:
                        self.asm('          LOAD R clrv')
                        self.asm('          ADD R clrv')

                    if l:
                        self.asm('          CLL CPL')
                    else:
                        self.asm('          CLL')

                    for ofs in range(MAX):
                        self.asm('          LOAD R @%s+%d' % (dataset, ofs))

                        for skip in range(32):
                            shouldSkip = False
                            
                            shouldSkip = shouldSkip or bool(v and skip & 1)
                            shouldSkip = shouldSkip or bool(l and skip & 2)
                            shouldSkip = shouldSkip or bool(dataset == 'zero' and skip & 4)
                            shouldSkip = shouldSkip or bool(dataset == 'neg' and skip & 8)
                            if skip & 16:
                                shouldSkip = not shouldSkip
                            self.asm('          OP2 #%s ; should %sskip' % \
                                         (bin(skip)[2:].zfill(5), ['not ', ''][int(shouldSkip)]))
                            if shouldSkip:
                                self.asm('          FAIL')
                                self.asm('          SUCCESS')
                            else:
                                self.asm('          OP2 SKIP   ; For page crossing, not part of test')
                                self.asm('          FAIL')
                                self.asm('          SUCCESS')
                            exp += '[ok]'
                            self.asm('')


        self.asm('HALT')

        self.assemble()
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
