
#!/usr/bin/python2.6
"""
Tests:

* Quite a few instructions.
* Looping.
* Strings.
"""

import unittest
import testlib


ASM1 = """
&0000:  .fill &ffff FAIL
&0010:  .word hello

&0800:
start:  
loop:   LOAD R I &10
        SNZ
        JMP end
        PRINTC

        LI 1
        ADD R &10
        STORE R &10

        JMP loop

end:
        SUCCESS
        HALT

hello:  .str "Hello, world!" 0

&fff0:	JMP I baddr
baddr:  .word start
"""


ASM2 = """
&0000:  .fill &ffff FAIL
&0010:  .word hello
&0011:  .word &8000

&0800:
start:  
loop:   LOAD R I &10
        SPA
        JMP end
        PRINTC

        LI 1
        ADD R &10
        STORE R &10

        JMP loop

end:    XOR R &11
        PRINTC

        SUCCESS
        HALT

hello:  .strn "Hello, world!"

&fff0:	JMP I baddr
baddr:  .word start
"""


class NullTerminated(testlib.testBaseClass):
    def runTest(self):
        self.assemble(ASM1)
        try:
            sim = self.simulate()
            self.assertNoFail(sim, 'Mis-jump')
            self.assertEqual(sim, 'Hello, world![ok]', 'Null-terminated string failure.')
        except:
            print sim
            raise


class NegTerminated(testlib.testBaseClass):
    def runTest(self):
        self.assemble(ASM2)
        try:
            sim = self.simulate()
            self.assertNoFail(sim, 'Mis-jump')
            self.assertEqual(sim, 'Hello, world![ok]', 'Neg-terminated string failure.')
        except:
            print sim
            raise


# End of file.
