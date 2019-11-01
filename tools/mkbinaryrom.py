#!/usr/bin/env python3

import os
import sys
import array
import pprint
import romtables
import threading


# # Generate a parity lookup (cache) table
# _parity = dict()
# for n in range(64):
#     _parity[n] = len(bin(n)[2:].replace('0', '')) & 1

# # pprint.pprint(_parity)
# # exit(0)

# def parity(x):
#     return _parity[x]


# 2019 ALU
#
# The original ALU supported ADD, AND, OR, XOR, 1- and 4-bit left and right
# rotations, and negation (NOT).
#
# The 2019 ALU has a serial shifter/rotator, so only NOT is left of the
# original unary operations. The four binary ops and NOT are now in one ROM.
#
# Inputs:
#
# Carry/FL in:       1 bit
# AC (A Port):      16 bits
# B Port:           16 bits
# Operation:         3 bits
# -------------------------
# Total             34 bits
#
# Outputs:
#
# Y (result):       16 bits
# FL Out:            1 bit
# FL write enable:   1 bit¹
# FV Out:            1 bit
# FV write enable:   1 bit¹
# --------------------------
# Total             20 bits
#
# ¹ May be decoded from OP?
#
# Since this is obviously too big a table for one ROM, it's split into
# three. This adds the need to propagate carry, so one additional input and one
# additional output for the first two ROMs. So, the task is broken out into:
#
# ROM 0                    ROM 1                    ROM 2                
# -----------------------------------------------------------------------------
# FL-IN          1 bit     Carry in 1     1 bit     Carry in 2        1 bit 
# A[5:0]         6 bits    A[11:6]        6 bits    A[12:15]          4 bits
# B[5:0]         6 bits    B[11:6]        6 bits    B[12:15]          4 bits
# OP             3 bits    OP             3 bits    OP                3 bits
# -----------------------------------------------------------------------------
# Y[5:0]         6 bits    Y[11:6]        6 bits    Y[12:15]          4 bits
# Carry out 1    1 bit     Carry out 2    1 bit     FL-OUT            1 bit 
# X0 (spare 0)   1 bit     X1 (spare 1)   1 bit     FL latch strobe¹  1 bit
#                                                   FV-OUT            1 bit
#                                                   FV latch strobe¹  1 bit
#
# ¹ Again, it may be possible to decode this from the OP field, but not
#   necessarily desirable.
#
# ROMs 0 and 1 need 16 bits of addresses and 6 bits of output each. 512 kbit
# parts are the smallest candidate.
#
# ROM 2 needs 12 bits of addresses and 8 bits of output. 32k bit parts are
# best.
#
# Because ROMs propagate carry the naïve way, they should be fast. 50ns parts
# will work, barely: it means an addition needs 150ns of the 250ns processor
# cycle. The microcode store needs around 50ns to get the next microinstruction
# (because that's another ROM!), so things are tight.
#
# Luckily, the major registers use latching, so no matter how late in the
# processor cycle the result arrives, it'll be registered. And if for some
# reason we need an extra cycle for some operations, so be it.

sign = lambda n, bits: int((n & (1 << (bits - 1))) != 0)

def op_add(a, b, c, bits, mask):
    y = (a & mask) + (b & mask) + (c & 1)
    fl = int(out > mask)

    sign_a = sign(a, bits)
    sign_b = sign(b, bits)
    sign_y = sign(y, bits)

    # The definition of Overflow
    fv = int(sign_a == sign_b and sign_a != sign_y)

    # result, set_fl, fl, set_fv, fv
    return y, True, fl, True, fv

def op_and(a, b, c, bits, mask):
    y = (a & mask) & (b & mask)
    # result, set_fl, fl, set_fv, fv
    return y, False, 0, False, 0

def op_or(a, b, c, bits, mask):
    y = (a & mask) | (b & mask)
    # result, set_fl, fl, set_fv, fv
    return y, False, 0, False, 0

def op_xor(a, b, c, bits, mask):
    y = (a & mask) ^ (b & mask)
    # result, set_fl, fl, set_fv, fv
    return y, False, 0, False, 0

def op_not(a, b, c, bits, mask):
    y = a ^ mask
    # result, set_fl, fl, set_fv, fv
    return y, False, 0, False, 0

def op_rsvd(a, b, c, bits, mask):
    return 0, False, 0, False, 0



class AluRom(threading.Thread):
    """ALU ROMs, 2019 edition"""

    # These also match the RADDRs for the ALU operations or 0b10000.
    ADD = 0
    AND = 1
    OR  = 2
    XOR = 3
    NOT = 4

    ops6 = [
        op_add,                 # 0: Full addition
        op_and,                 # 1: AND (and even parity?)
        op_or,                  # 2: OR (and odd parity?)
        op_xor,                 # 3: XOR (and odd parity?)
        op_not,                 # 4: Bitwise negation (does not modify L/V)
        op_rsvd,                # 5: reserved
        op_rsvd,                # 6: reserved
        op_rsvd                 # 7: reserved
    ]

    ops4 = [
        op_add,                 # 0: Full addition
        op_and4,                # 1: AND (and even parity?)
        op_or4,                 # 2: OR (and odd parity?)
        op_xor4,                # 3: XOR (and odd parity?)
        op_not,                 # 4: Bitwise negation (does not modify L/V)
        op_rsvd,                # 5: reserved
        op_rsvd,                # 6: reserved
        op_rsvd                 # 7: reserved
    ]

    opcodes = ['ADD', 'AND', 'OR', 'XOR', 'NOT']
    syms = ['+', '&', '|', '^']

    def __init__(self, bits, tt):
        self.bits = bits
        self.tt = tt
        self.mask = (1 << bits) - 1

        try:
            self.ops = { 4: self.ops4, 6: self.ops6 }[bits]
        except KeyError:
            raise RuntimeError("Unknown number of bits ({})".format(bits))

        #print "Thread %s: (%d,%d)" % (self.name, a0, a1)


    def run(self):
        """
        Run the thread.
        """
        bits, tt = self.bits, self.tt

        # Address format: op:3, cin:1, b:6, a:6 (in bits)
        for addr in range(1 << (3 + 1 + 2 * bits)):
            # Reconstruct the parameters from the address
            a = addr & self.mask
            b = (addr >> self.bits) & self.mask
            c = (addr >> self.bits + 1) & 1
            op = (addr > self.bits + 2) & 7

            out = self.ops[op](a, b, c, bits, mask)

            



        for op in range(8):
            for l_in in range(2):
                for a in range(64):
                    for b in range(64):

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
                            #v_out = parity(x)
                        elif op == self.OR:
                            x = a | b
                            #v_out = parity(x)
                        elif op == self.XOR:
                            x = a ^ b
                            #v_out = parity(x)
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
                            print('%s %05x %d %s (%2d) %s %s (%2d) = %s (%2d) %s%s' % \
                                (self.opcodes[op],
                                 addr,
                                 l_in,
                                 romtables.mybin(a, 6), a,
                                 self.syms[op],
                                 romtables.mybin(b, 6), b,
                                 romtables.mybin(x, 6), x,
                                 "-L"[l_out],
                                 "-V"[v_out],
                                 ))
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
        for op in range(4):
            for l_in in range(2):
                for a in range(16):
                    for b in range(16):

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
                            #v_out = parity(x)
                        elif op == self.OR:
                            x = a | b
                            #v_out = parity(x)
                        elif op == self.XOR:
                            x = a ^ b
                            #v_out = parity(x)
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
                            print('%s %05x %d %s (%2d) %s %s (%2d) = %s (%2d) %s%s%s = %s' % \
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
                                 ))
                        else:
                            tt.progress(dt=5)




# Set debugging.
debug = False
#debug = True

#debug = True
print("Generating 6-bit ROM")
# The main Binary ROM, as per the documentation above.
binaryROM = romtables.FunctionTable('op:2 l_in a:6 b:6', 'v_out l_out x:6', singleROM=True)
Binary(binaryROM).run()
binaryROM.report()
print('Writing Verilog files.')
binaryROM.writeVerilog('alu-binary-6bit')
print('Writing binary images.')
binaryROM.writeBin('alu-binary-6bit')


#debug = True
print("Generating 4-bit ROM")
# The short Binary ROM, as per the documentation above.
shortBinaryROM = romtables.FunctionTable('op:2 l_in a:4 b:4', 'v_out l_out lvs pad:1 x:4', singleROM=True)
ShortBinary(shortBinaryROM).run()
shortBinaryROM.report()
print('Writing Verilog files.')
shortBinaryROM.writeVerilog('alu-binary-4bit')
print('Writing binary images.')
shortBinaryROM.writeBin('alu-binary-4bit')

# End of file.
