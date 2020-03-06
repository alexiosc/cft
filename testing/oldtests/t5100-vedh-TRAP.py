#!/usr/bin/python

import os
import sys
import unittest
import testlib


asm = """
&0000:    .fill 65536 FAIL
&0100:    .word &0900
&0200:    .word &0a00
&0080:    .word &0b00


&0800:
boot:     PRINTC
          LOAD R 1
          PRINTA                ; Expect: fff1
          SUCCESS



          ; Test R mode
          LI 66
          TRAP R &3ff
&03ff:    PRINTC

          LOAD R 1
          PRINTA                ; Expect: 0804
          SUCCESS



          ; Test I R mode
          LI 67
          TRAP I R &100
          FAIL

&0900:    PRINTC
          LOAD R 1
          PRINTA                ; Expect: 0403
          SUCCESS



          ; Test I mode
          LI 68
          TRAP I @+2
          FAIL
          .word &0a00

&0a00:    PRINTC
          LOAD R 1
          PRINTA                ; Expect 0906
          SUCCESS



          ; Test I R autoincrement mode
          LI 69
          TRAP I R &080
          FAIL

&0b00:    PRINTC
          LOAD R 1
          PRINTA                ; Expect 0a06
          SUCCESS

          LOAD R &080
          PRINTH                ; Expect 0b01

          SUCCESS
          HALT

"""


MAX = 60

class InstructionTest(testlib.testBaseClass):
    def runTest(self):
        """Test TRAP instruction"""

        # Boot code
        self.asm('&0000:    .fill 65535 FAIL')        
        self.asm('          ; Boot code')        
        self.asm('&fff0:    LI 64')
        self.asm('          TRAP I @+2')
        self.asm('          FAIL')
        self.asm('          .word boot')
        
        self.asm('&0800:')
        self.asm('boot:')
        self.asm('          PRINTC')
        exp = '@'

        # Test 1, local addressing. Max one page-1 (1023 words) of tests.
        for i in range(MAX):
            c = 65 + (i % 26)
            self.asm('          LI %d' % c) # 801 + 7i
            self.asm('          TRAP @+2')  # 802 + 7i
            self.asm('          FAIL')      # 803 + 7i *** mem[1] should be this
            self.asm('          SUCCESS')   # 804 + 7i
            self.asm('          PRINTC')    # 804 + 7i
            self.asm('          LOAD R 1')  # 805 + 7i
            self.asm('          PRINTH')    # 806 + 7i
            exp += '[ok]%c%04x' % (c, 0x803 + 7 * i)

        # Test 2, indirect addressing.
        self.asm('          SUCCESS')
        self.asm('          TRAP I @+2')
        self.asm('          FAIL')
        self.asm('          .word test2')
        self.asm('&1000:')
        self.asm('test2:')
        exp += '[ok]'

        for i in range(MAX):
            c = 97 + (i % 26)
            addr = 0x1004 + 8 * i
            self.asm('          LI %d' % c) # 1000 + 8i
            self.asm('          TRAP I @+2') # 1001 + 8i
            self.asm('          FAIL')      # 1002 + 8i <-- mem[1]
            self.asm('          .word &%04x' % addr) # 1003 + 8i
            self.asm('          SUCCESS')   # 1004 + 8i <-- trap target
            self.asm('          PRINTC')    # 1005
            self.asm('          LOAD R 1')  # 1006
            self.asm('          PRINTH')    # 1007
            exp += '[ok]%c%04x' % (c, 0x1002 + 8 * i)

        # Test 3, indirect register addressing.
        self.asm('          SUCCESS')
        self.asm('          TRAP I @+2')
        self.asm('          FAIL')
        self.asm('          .word test3')
        exp += '[ok]'

        # Prepare the dataset
        for i in range(MAX):
            self.asm('&%04x:    .word &%04x' % (0x200 + i, 0x2003 + 7 * i))

        self.asm('&2000:')
        self.asm('test3:')
        for i in range(MAX):
            c = 122 - (i % 26)
            retaddr = 0x2002 + 7 * i
            reg = 0x200 + i
            self.asm('          LI %d' % c) # 2000 + 7i
            self.asm('          TRAP I R &%03x' % reg) # 2001
            self.asm('          FAIL')                 # 2002 + 7i (mem[1])
            self.asm('          SUCCESS')   # 2003 + 7i <-- target
            self.asm('          PRINTC')    
            self.asm('          LOAD R 1')  
            self.asm('          PRINTH')    
            exp += '[ok]%c%04x' % (c, retaddr)

        self.asm('          SUCCESS')
        exp += '[ok]'


        # Test 4, register addressing
        self.asm('          TRAP R &100')
        self.asm('          FAIL')
        self.asm('&0100:')
        self.asm('test4:')

        for i in range(min(35, MAX)):
            c = 48 + (i % 10)
            addr = 0x103 + 7 * i
            retaddr = 0x102 + 7 * i;
            self.asm('          LI %d' % c)    # 100
            self.asm('          TRAP R @+2') # 101
            self.asm('          FAIL')         # 102 (ret addr)
            self.asm('          SUCCESS')      # 103 + 7i <-- trap target
            self.asm('          PRINTC')
            self.asm('          LOAD R 1')
            self.asm('          PRINTH')
            exp += '[ok]%c%04x' % (c, retaddr)

        self.asm('          SUCCESS')
        exp += '[ok]'

        # Test 5, autoincrement (limited practicality)
        self.asm('          TRAP I @+1')
        self.asm('          .word     test5')


        # Prepare the dataset
        for i in range(min(128, MAX)):
            self.asm('&%04x:    .word &%04x' % (0x80 + i, 0x3003 + 9 * i))

        self.asm('&3000:')
        self.asm('test5:')
        for i in range(min(128, MAX)):
            c = 33 + (i % 95)
            retaddr = 0x3002 + 9 * i
            reg = 0x80 + i
            self.asm('          LI %d' % c) # 3000
            self.asm('          TRAP I R &%03x' % reg) # 3001
            self.asm('          FAIL')                 # 3002 (retaddr)
            self.asm('          SUCCESS')   # 3003 + 7i <-- target
            self.asm('          PRINTC')
            self.asm('          LOAD R &%03x' % reg)
            self.asm('          PRINTH')
            self.asm('          LOAD R 1')
            self.asm('          PRINTH')
            exp += '[ok]%c%04x%04x' % (c, 0x3004 + 9 * i, retaddr)

        self.asm('          SUCCESS')
        self.asm('          HALT')
        exp += '[ok]'



        self.assemble()
        #self.addArg('+timeout=3000000')
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
