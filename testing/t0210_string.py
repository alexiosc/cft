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


ASM3 = """
&0000:  .fill &ffff FAIL
&0012:  .word &ff

&0080:  .word hello

&0800:
start:  
loop:   LOAD R I &80
        SNZ
        JMP end
        PRINTC

        RNR
        RNR
        AND R &12 
        SNZ
        JMP end
        PRINTC

        JMP loop

end:    SUCCESS
        HALT

hello:  .strp "Hello, world! This is a word-packed string!" 0

&fff0:	JMP I baddr
baddr:  .word start
"""


ASM4 = """
&0000:  .fill &ffff FAIL
&0012:  .word &ff00
&0013:  .word %(x)d

&0080:  .word hello

&0800:
start:  
        LOAD R &013 // For debugging verification: actual byte length of string.
        PRINTD
        SUCCESS

        LI 0
        STORE R &10 // Length in bytes (empty string -> 0)
        STORE R &11 // Length in words allocated (empty string -> 1)

loop:   ISZ R &11

        LOAD R I &80
        SNZ
        JMP end1

        AND R &12 
        SNZ
        JMP end

        LI 2
        ADD R &10
        STORE R &10

        JMP loop

end:    ISZ R &10  // Count in 
        PRINTD
        PRINTSP
        LOAD R &11
        PRINTD
        SUCCESS
        HALT

end1:   LOAD R &10
        PRINTD
        PRINTSP
        LOAD R &11
        PRINTD
        SUCCESS
        HALT

hello:  .strp "%(s)s" 0

&fff0:	JMP I baddr
baddr:  .word start
"""


ASM5 = """
&0000:  .fill &ffff FAIL
&0010:  .word 0
&0012:  .word %(x)d
&0013:  .word &ff

tmp:    .word 0
tp:     .word tgt

&0080:
sp:     .word src

&0800:
start:  
        LIA src
        STORE R sp
        LIA tgt
        STORE R tp

        LOAD R &012 // For debugging verification: actual byte length of string.
        PRINTD
        SUCCESS

loop:   LOAD R I sp
        STORE R I tp
        SNZ
        JMP end

        LOAD R I sp
        AND R &13  / AND &00ff
        RNL
        RNL
        SNZ
        JMP end

        OR R I tp
        STORE R I tp

        ISZ R tp / Increment tp

        JMP loop

end:
        STORE R I tp

        LIA tgt
        STORE R &80

        SUCCESS

printloop:
        LOAD R I &80
        SNZ
        JMP printend
        PRINTC

        RNR
        RNR
        AND R &13 / AND &00ff
        SNZ
        JMP printend
        PRINTC

        JMP printloop

printend:
        SUCCESS
        HALT

src:  .str "%(s)s" 0
tgt:    .word &beef

&fff0:	JMP I baddr
baddr:  .word start
"""


class NullTerminated(testlib.testBaseClass):
    def runTest(self):
        """Test null-terminated strings."""
        self.asm(ASM1)

        self.assertSim('Hello, world![ok]')


class NegTerminated(testlib.testBaseClass):
    def runTest(self):
        """Test negative-terminated strings."""
        self.asm(ASM2)
        sim = self.simulate()
        self.assertSim('Hello, world![ok]')


class Packed(testlib.testBaseClass):
    def runTest(self):
        """Test packed 8-bit-per-char."""

        self.asm(ASM3)

        self.assertSim('Hello, world! This is a word-packed string![ok]')


class PackedLen(testlib.testBaseClass):
    def runTest(self):
        """Test length of packed 8-bit-per-char strings."""

        test = 'spam'
        for x in xrange(len(test)+1):
            s = test[:x]
            self.clear()
            self.asm(ASM4 % locals())
            self.assertSim('%d[ok]%d %d[ok]' % (len(s), len(s), (len(s) + 2) // 2))


class PackNullTerminated(testlib.testBaseClass):
    def runTest(self):
        """Test packing of null-terminated strings."""

        test = 'spam'
        for x in [4]:#xrange(len(test)+1):
            s = test[:x]
            self.clear()
            self.asm(ASM5 % locals())
            self.assertSim('%d[ok][ok]%s[ok]' % (len(s), s))

# End of file.
