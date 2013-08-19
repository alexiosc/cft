#!/usr/bin/env python2.6

import os
import sys
import array
import romtables
import threading

class Binary(threading.Thread):
    """

    ==Binary ROM==

    The binary ROM evaluates our four binary operations (ADD, AND, OR,
    XOR). Since we need 17 bits of output, we split it into three
    identical ROMs implementing the binary operations on 6-bit
    quantities with carry (L) in/out.

    Truth table inputs:

    * OP (2 bits)
    * L_IN (1 bit)
    * A (16 bits)
    * B (16 bits)

    Truth table outputs:
    
    * X (16 bits)
    * L_OUT (1 bit)
    * V_OUT (1 bit)

    Slice inputs:

    * OP (2 bits)
    * L_IN (1 bit)
    * A (6 bits)
    * B (6 bits)

    Slice outputs:
    
    * X (6 bits)
    * L_OUT (1 bit)

    """

    ADD = 0
    AND = 1
    OR = 2
    XOR = 3
    
    opcodes = ['ADD', 'AND', 'OR', 'XOR']
    syms = ['+', '&', '|', '^']

    def __init__(self, tt):
        self.tt = tt
        threading.Thread.__init__(self)
        #print "Thread %s: (%d,%d)" % (self.name, a0, a1)


    def run(self):
        """
        Run the thread.
        """
        tt = self.tt
        for op in xrange(4):
            for l_in in xrange(2):
                for a in xrange(64):
                    for b in xrange(64):

                        l_out = l_in
                        v_out = 0
                        if op == self.ADD:
                            x = (l_in & 1) + a + b 
                            l_out = (x >> 6) & 1

                            a4 = (a >> 5) & 1
                            b4 = (b >> 5) & 1
                            x4 = (x >> 5) & 1
                            if a4 == b4 and a4 != x4:
                                v_out = 1
                        elif op == self.AND:
                            x = a & b
                        elif op == self.OR:
                            x = a | b
                        elif op == self.XOR:
                            x = a ^ b
                        else:
                            raise RuntimeError("Should never happen")

                        x = x & 0x3f
                        l_out = l_out & 1
                        v_out = v_out & 1
                    
                        # Store it in the Function Table.
                        addr = tt.make_vector(tt.inputs, op=op, l_in=l_in, a=a, b=b)
                        data = tt.make_vector(tt.outputs, v_out=v_out, l_out=l_out, x=x)
                        tt.put(addr, data)
        
                        if debug:
                            print '%s %05x %d %s (%2d) %s %s (%2d) = %s (%2d) %s%s' % \
                                (self.opcodes[op],
                                 addr,
                                 l_in,
                                 romtables.mybin(a, 6), a,
                                 self.syms[op],
                                 romtables.mybin(b, 6), b,
                                 romtables.mybin(x, 6), x,
                                 "-L"[l_out],
                                 "-V"[v_out],
                                 )
                        else:
                            tt.progress(dt=5)




class ShortBinary(Binary):
    """
    This ROM is similar to the other two ROMs, except it outputs fewer
    bits, and the L output is inverted so it can be fed to active-low
    units. It also has a clock output to latch L and V flags on (this
    strobes when addition is selected and should be ANDed with
    something like CLK5.
    """
    def run(self):
        """
        Run the thread.
        """
        tt = self.tt
        for op in xrange(4):
            for l_in in xrange(2):
                for a in xrange(16):
                    for b in xrange(16):

                        l_out = l_in
                        v_out = 0
                        # Alexios (2012-07-27): changed to active-high FLATCH
                        lvs = 0
                        if op == self.ADD:
                            lvs = 1
                            x = (l_in & 1) + a + b 
                            l_out = ((x >> 4) & 1) ^ 1

                            a2 = (a >> 3) & 1
                            b2 = (b >> 3) & 1
                            x2 = (x >> 3) & 1
                            if a2 == b2 and a2 != x2:
                                v_out = 1
                        elif op == self.AND:
                            x = a & b
                        elif op == self.OR:
                            x = a | b
                        elif op == self.XOR:
                            x = a ^ b
                        else:
                            raise RuntimeError("Should never happen")

                        x = x & 0xf
                        l_out = l_out & 1
                        v_out = v_out & 1
                    
                        # Store it in the Function Table.
                        addr = tt.make_vector(tt.inputs, op=op, l_in=l_in, a=a, b=b)
                        data = tt.make_vector(tt.outputs, v_out=v_out, lvs=lvs, l_out=l_out, x=x, pad=0)
                        tt.put(addr, data)
        
                        if debug:
                            print '%s %05x %d %s (%2d) %s %s (%2d) = %s (%2d) %s%s%s = %s' % \
                                (self.opcodes[op],
                                 addr,
                                 l_in,
                                 romtables.mybin(a, 6), a,
                                 self.syms[op],
                                 romtables.mybin(b, 6), b,
                                 romtables.mybin(x, 6), x,
                                 "-S"[lvs],
                                 "L-"[l_out],
                                 "-V"[v_out],
                                 romtables.mybin(data, 8)
                                 )
                        else:
                            tt.progress(dt=5)




# Set debugging.
debug = False
#debug = True

print "Generating 6-bit ROM"
# The main Binary ROM, as per the documentation above.
binaryROM = romtables.FunctionTable('op:2 l_in a:6 b:6', 'v_out l_out x:6', singleROM=True)
Binary(binaryROM).run()
binaryROM.report()
print 'Writing Verilog files.'
binaryROM.writeVerilog('alu-binary-6bit')
print 'Writing binary images.'
binaryROM.writeBin('alu-binary-6bit')


debug = True
print "Generating 4-bit ROM"
# The short Binary ROM, as per the documentation above.
shortBinaryROM = romtables.FunctionTable('op:2 l_in a:4 b:4', 'v_out l_out lvs pad:1 x:4', singleROM=True)
ShortBinary(shortBinaryROM).run()
shortBinaryROM.report()
print 'Writing Verilog files.'
shortBinaryROM.writeVerilog('alu-binary-4bit')
print 'Writing binary images.'
shortBinaryROM.writeBin('alu-binary-4bit')

# End of file.
