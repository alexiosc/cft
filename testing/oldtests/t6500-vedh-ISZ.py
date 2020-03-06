#!/usr/bin/python

import os
import sys
import unittest
import testlib


MAX = 1

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test ISZ instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')
        self.asm('          ; Boot code')
        self.asm('&fff0:    JMP I @+1')
        self.asm('          .word boot')
        
        exp = ''

        self.asm('&0050:')
        self.asm('t3reps:   .word -%d' % MAX)
        self.asm('t4reps:   .word -%d' % MAX)
        self.asm('t5reps:   .word -%d' % MAX) # &0052
        self.asm('&0070:')
        self.asm('t4ptr:    t4reps')
        self.asm('&0080:')
        self.asm('t5ptr:    t5reps')

        self.asm('&0800:')
        self.asm('boot:')

        # Test 1: Local addressing
        self.asm('          LOAD t1reps')
        self.asm('loop1:  ')
        self.asm('          NEG')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          ISZ t1reps')
        self.asm('          JMP loop1')
        self.asm('          SUCCESS')
        self.asm('          JMP test2')
        self.asm('t1reps:   .word -%d' % MAX)
        exp += ''.join('%d[ok]' % x for x in range(MAX, 0, -1)) + '[ok]'

        # Test 2: Indirect addressing
        self.asm('test2:')
        self.asm('          LOAD I t2ptr')
        self.asm('loop2:')
        self.asm('          NEG')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          ISZ I t2ptr')
        self.asm('          JMP loop2')
        self.asm('          SUCCESS')
        self.asm('          JMP test3')
        self.asm('t2ptr:    .word t2reps')
        self.asm('          FAIL')
        self.asm('          FAIL')
        self.asm('t2reps:   .word -%d' % MAX)
        exp += ''.join('%d[ok]' % x for x in range(MAX, 0, -1)) + '[ok]'

        # Test 3: Register addressing
        self.asm('test3:')
        self.asm('          LOAD R t3reps')
        self.asm('loop3:')
        self.asm('          NEG')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          ISZ R t3reps')
        self.asm('          JMP loop3')
        self.asm('          SUCCESS')
        self.asm('          JMP test4')
        exp += ''.join('%d[ok]' % x for x in range(MAX, 0, -1)) + '[ok]'

        # Test 4: Indirect register addressing
        self.asm('test4:')
        self.asm('          LOAD I R t4ptr')
        self.asm('loop4:')
        self.asm('          NEG')
        self.asm('          PRINTD')
        self.asm('          SUCCESS')
        self.asm('          ISZ I R t4ptr')
        self.asm('          JMP loop4')
        self.asm('          SUCCESS')
        self.asm('          JMP test5')
        exp += ''.join('%d[ok]' % x for x in range(MAX, 0, -1)) + '[ok]'

        # Test 5: Autoindex (limited usefulness)
        self.asm('test5:')
        self.asm('          LOAD I R t5ptr')
        self.asm('loop5:')
        self.asm('          NEG')
        self.asm('          PRINTD')
        self.asm('          LOAD R t5ptr')
        self.asm('          PRINTSP')
        self.asm('          PRINTA')
        self.asm('          LI R t5reps')
        self.asm('          STORE R t5ptr')
        self.asm('          SUCCESS')
        self.asm('          ISZ I R t5ptr')
        self.asm('          JMP loop5')
        self.asm('          SUCCESS')
        self.asm('          JMP done')
        exp += ''.join('%d 0053[ok]' % x for x in range(MAX, 0, -1)) + '[ok]'

        self.asm('done:')
        self.asm('          HALT')

        self.assemble()
        self.addArg('+timeout=100000000')
        sim = self.simulate()
        #exp = 'Afff2[ok]B0806[ok]C0405[ok]D0906[ok]E0a06[ok]0b01[ok]'
        try:
            self.assertEqual(sim, exp,
                             'Instruction test failure.')
        except:
            print "\nExpected: ", exp
            print "Simulated:", sim
            raise


# End of file.
