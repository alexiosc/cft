#!/usr/bin/env python2.6

"""
Create the truth table of an ALU ROM.

  Address bits:
    op:    3 bits
      000: ADD
      001: AND
      010: OR
      011: XOR
      100: NOT
      101: RBL
      110: RBR
      111: xxx
    a:     8 bits
    b:     8 bits
    in_hi: 1 bit
    in_lo: 1 bit

  Data bits:
    x:     8 bits
    
  ------------------------------------------------
    total: A 21 bits (2 MBytes/16 MBit) -- 2 needed
           D: 8 bits output + another ROM (or logic) for L out


  L logic: L_out = op==add and a[15] == 1 and b[15] == 1.


  ROMs by op:

  Binary ops (ADD/AND/OR/XOR):

  a:   8 bits
  b:   8 bits
  op:  2 bits
  cin: 1 bit
  
  total: 19 bits (512k/4 MBit, easily available)

  *** Still needs L to be calculated externally, but ADD/AND/OR/XOR is
      now 2 ROMs and some logic.

  Unary ops (NOT/RBL/RBR/RNL/RNR)
  op: 3 bits
  a:  16 bits

  
  Rolls: no point using a ROM but the 4 roll ops need 8x '244 plus
  decoding (necessitating a whole board).

  Idea: Use a unary op ROM?


"""

import os
import sys
import array
import romtables
import threading

class Unary(threading.Thread):
    """
    ==The Unary ROM==
    
      The unary ROM is responsible or calculating unary operations. Currently,
      these are the four rolls (roll <L,A> left/right one bit/nybble) and the NOT
      operation.
    
      The operation is represented using 5 bits, in the OP field:
    
      OP2 OP1 OP0  Operation
      ---------------------------------------
       0   0   0   RBL Roll 1 bit left
       0   0   1   RBR Roll 1 bit right
       0   1   0   RNL Roll 4 bits left
       0   1   1   RNR Roll 4 bits right
       1   X   X   NOT
    
       The NOT operation is straightforward. The value of L is a don't-care, but
       L_OUT = L to simplify the circuitry if necessary.
    
       The ROLL operations are a bit more complex. The unary function domain is
       wider than the intended 4 MBit ROMs, so it's been split up into three
       separate ROMs. ROMs 00 and 01 are each responsible for six bits of output
       (X0..X5 and X6..X11). ROM2 outputs X12..X15 and L_OUT. Implementing ROLL
       involves a truth table equivalent to a multiplexer's. ROMs 00 and 01 are in
       essence hex four-input multiplexers. One added input is needed for NOT,
       making it a one-of-five MUX (but line 0 is inverted). There's a lot of
       overlap in the signals used in the truth table:
    
           OP: 0-3     4     5      6      7
       Xn      NOT    RBL   RBR    RNL    RNR
      ---------------------------------------
        0      !0     L      1     13      4
        1      !1     0      2     14      5
        2      !2     1      3     15      6
        3      !3     2      4      L      7
        4      !4     3      5      0      8
        5      !5     4      6      1      9
    
        6      !6     5      7      2     10
        7      !7     6      8      3     11
        8      !8     7      9      4     12
        9      !9     8     10      5     13
        10     !10    9     11      6     14
        11     !11    10    12      7     15
    
        12     !12    11    13      8      L
        13     !13    12    14      9      0
        14     !14    13    15     10      1
        15     !15    14     0     11      2
         L       L    15     1     12      3
    
           0  1  2  3  4  5   6   7   8   9  10  11  12  13   14  15    16
    ROM0: (0, 1, 2, 3, 4, 5,  6,  7,  8,  9, 13, 14, 15,  L, OP0, OP1, OP2) -> (0, 1, 2, 3, 4, 5)
    ROM1: (2, 3, 4, 5, 6, 7,  8,  9, 10, 11, 12, 13, 14, 15, OP0, OP1, OP2) -> (6, 7, 8, 9, 10, 11)
    ROM2: (0, 1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15, L,      OP0, OP1, OP2) -> (12, 13, 14, 15, L, IS_ROLL)

    IS_ROLL = ~OP2

    IS_ROLL is the same as ALU_L_LATCH, which sets the L register from the ALU_ROLL_OUT signal.

    So, ROMs 00 and 01 are 128k x 8 (1 MBit) and ROM 02 is 64k x 8 (512
    Kbit). It's possibly cheaper and easier to use three 1 MBit or 4 MBit parts
    (the latter are easier to source these days).
    """

    RBL = 0
    RBR = 1
    RNL = 2
    RNR = 3
    NOT1 = 4
    NOT2 = 5
    CS1 = 6
    CS2 = 7
    
    opcodes = ['RBL', 'RBR', 'RNL', 'RNR',
               'NOT', 'NOT', 'CS1', 'CS2']
               

    def __init__(self, tt, a0, a1):
        self.tt = tt
        self.a0 = a0
        self.a1 = a1
        threading.Thread.__init__(self)
        #print "Thread %s: (%d,%d)" % (self.name, a0, a1)


    def run(self):
        """
        Run the thread.
        """
        tt = self.tt
        for op in xrange(8):
            for ints in xrange(2):
                for l in xrange(2):
                    for a in xrange(self.a0, self.a1 + 1):
            
                        # Calculate the result
            
                        al = ((l & 1) << 16) | (a & 0xffff)
                        if op == self.NOT1 or op == self.NOT2:
                            x = a ^ 0xffff
                            x = x | (l << 16) # Embed L in the result
                        elif op == self.CS1 and ints == 0: # ISR return vector
                            x = 0x0002
                        elif op == self.CS1 and ints == 1: # JSR instr return vector
                            x = 0x0000
                        elif op == self.CS2 and ints == 0: # ISR vector
                            x = 0xfff8
                        elif op == self.CS2 and ints == 1: # TRAP instr return vector
                            x = 0x0001
                        elif op == self.RBR:
                            x = (al >> 1) | ((al & 1) << 16)
                        elif op == self.RBL:
                            x = ((al << 1) & 0x1ffff) | ((al >> 16) & 1);
                        elif op == self.RNR:
                            x = (al >> 4) | ((al & 0xf) << 13);
                        elif op == self.RNL:
                            x = ((al << 4) & 0x1ffff) | ((al & 0x1e000) >> 13);
                        else:
                            raise RuntimeError("Should never happen.")
            
                        l_out = (x >> 16) & 1
                        is_roll = ((op & 4) >> 2) ^ 1
                        x = x & 0xffff
                        
                        # Store it in the Function Table.
                        addr = tt.make_vector(tt.inputs, op=op, ints=ints, l=l, a=a)
                        data = tt.make_vector(tt.outputs, l=l_out, x=x, is_roll=is_roll)
                        tt.put(addr, data)
            
                        if debug:
                            print '%s <%d,%04x> %06x %s:%s %s%s' % \
                                (opcodes[op], l, x,
                                 addr,
                                 romtables.mybin(op,3),
                                 romtables.mybin(a,16),
                                 l_out,
                                 romtables.mybin(x,17),
                                 )
                        else:
                            tt.progress(dt=5)



# Order: RBL RBR RNL RNR, 16 = L. Note: in microcode order, not
# order of table above. Microcode order is:
#
# 000 -> RBR
# 001 -> RBL
# 010 -> RNR
# 011 -> RNL
# 1XX -> NOT

# Guess the number of CPUs.
cpus = 1
#if os.path.exists('/proc/cpuinfo'):
#    cpus = len([x for x in open('/proc/cpuinfo') if x.startswith('processor')])
#cpus = os.environ.get('CPUS', os.environ.get('CONCURRENCY_LEVEL', cpus))

#print "Using %d cpu(s)." % cpus

# Set debugging.
debug = False
#debug = True

if debug and cpus > 1:
    cpus = 1
    print "Debugging mode must execute on a single CPU."


# The main Unary ROM, as per the documentation above.
unaryROM = romtables.FunctionTable('op:3 ints l a:16', 'is_roll l x:16')
unaryROM.rom('op ints l a/15,14,13,9,8,7,6,5,4,3,2,1,0', 'x/5-0')
unaryROM.rom('op ints a/15,14,13,12,11,10,9,8,7,6,5,4,3,2', 'x/11-6')
unaryROM.rom('op ints l a/15,14,13,12,11,10,9,8,3,2,1,0', 'is_roll l x/15-12')

if debug:
    print "                    OP  ADDR (in)         DATA (out)"
    print "OP  <L,AAAA> addr   210:LFEDCBA9876543210 LFEDCBA9876543210"
    print "-----------------------------------------------------------"


#ofs, slice = 0, 65536 // cpus
#threads = list()
#for i in xrange(cpus - 1):
#    #print ofs, slice, ofs + slice - 1
#    threads.append(Calculator(ofs, ofs + slice - 1))
#    ofs += slice

# The last thread calculates its slices plus the space left in the
# modulo 65536//cpus.
#threads.append(Calculator(ofs, 65535))
#for thread in threads:
#    thread.start()

#for thread in threads:
#    thread.join()

Unary(unaryROM, 0, 65535).run()

unaryROM.report()
print 'Writing Verilog files.'
unaryROM.writeVerilog('alu-unary')
print 'Writing binary images.'
unaryROM.writeBin('alu-unary')

# End of file.
