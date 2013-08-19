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

import sys
import array


def mybin(x, zf=4):
    return bin(x)[2:].zfill(zf)


def unpackbits(x, numbits):
    """Unpacks bits into an iterable."""
    # We cheat here too!
    return list(reversed([ int(x) for x in mybin(x, numbits) ]))
    

def selectbits(x, bits):
    """
    Construct a number made up by contatenating the specified bits of x.
    """
    xs = list(reversed(mybin(x, 256)))
    num = ''.join(xs[i] for i in bits)
    return int('0b' + num, 2)


def packbits(spec, args):
    """Packs bits according to spec.

    >>>bin(packbits((1, 2), (0b0, 0b11)))
    '0b011'

    >>>bin(packbits((2, 2), (0b0, 0b11)))
    '0b0011'

    >>>bin(packbits((2, 8), (0b1, 0b11)))
    '0b0100000011'

    >>>bin(packbits((1, 1, 1, 3), (1, 0, 1, 7)))
    '0b101111'
    """
    # We cheat!
    val = '0b'
    for bits, x in zip(spec, args):
        mask = (1 << bits) - 1
        if x > mask:
            raise ValueError('Value %d does not fit in %d bits.' % (x, bits))
        if x < 0:
            raise ValueError('Value %d is negative.' % x)
        val += mybin(x, bits)
    return int(val, 2)


class Rom(object):
    """
    Define a ROM used as a table.
    """
    def __init__(self, abits, dbits, sentinel=0):
        # Choose the right type
        self.sanity = array.array('B')
        if dbits <= 8:
            self.data = array.array('B')
        elif dbits <= 16:
            self.data = array.array('H')
        elif dbits <= 32:
            self.data = array.array('L')
        else:
            raise ValueError('This ROM is too wide, use dbits <= 32.')

        # Make the entire ROM
        print "Generating a ROM %dx%d bits (%d entries)\n" % (abits, dbits, 1 << abits)
        self.data.fromlist([sentinel] * (1 << abits))
        self.sanity.fromlist([0] * (1 << abits))
        self.dbits = dbits
        self.abits = abits
        self.amax = self.amask = (1 << abits) - 1
        self.dmax = self.dmask = (1 << dbits) - 1
        self.curaddr = 0


    def writeBin(self, f):
        """
        Write the ROM binary image to a filename or file-like object f.
        """
        try:
            f = open(f, 'wb')
        except TypeError:
            pass
        self.data.tofile(f)


    def writeVerilog(self, f):
        """
        Write the ROM image to a Verilog 'bin' file (binary values in
        human-readable form).
        """
        try:
            f = open(f, 'w')
        except TypeError:
            pass
        fmt = '%%0%ds // addr=%%0%ds\n' % (self.dbits, self.abits)
        for addr, datum in enumerate(self.data):
            f.write('%s // addr %s\n' % (mybin(datum, self.dbits), mybin(addr, self.abits)))
        f.close()


    def writeVerilogROMs(self, stem):
        """
        Write multiple ROM images using the file stem stem. Each ROM contains 8
        bits.
        """
        for byte in xrange((self.dbits + 7) // 8):
            shift = 8 * byte
            fname = '%s-%02d.list' % (stem, byte)
            f = open(fname, 'w')

            for addr, datum in enumerate(self.data):
                f.write('%s // addr %x\n' % \
                            (mybin((datum >> shift) & 0xff, 8), addr))
            f.close()


    def put(self, a, d):
        """
        Set a value.
        """
        if a < 0 or a > self.amax:
            raise ValueError('Address %d out of bounds' % a)
        if d < 0 or d > self.dmax:
            raise ValueError('Data %d out of bounds' % d)

        addr = a & self.amask
        
        if self.sanity[addr] and self.data[addr] != d:
            raise ValueError('Overwriting previously defined value at address %d (%d/%d)' % \
                                 (addr, d, self.data[addr]))
        
        self.sanity[addr] = 1
        self.data[addr] = d & self.dmask


    def push(self, d):
        """
        Set a value.
        """
        self.put(self.curaddr, d)
        self.curaddr += 1



"""

==The Unary ROM==

            0      1     2      3      4
  Target   NOT    RBL   RBR    RNL    RNR
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
     L     --     15     1     12      3

       0  1  2  3  4  5   6   7   8   9  10  11  12  13   14  15    16
ROM0: (0, 1, 2, 3, 4, 5,  6,  7,  8,  9, 13, 14, 15,  L, OP0, OP1, OP2) -> (0, 1, 2, 3, 4, 5)
ROM1: (2, 3, 4, 5, 6, 7,  8,  9, 10, 11, 12, 13, 14, 15, OP0, OP1, OP2) -> (6, 7, 8, 9, 10, 11)
ROM2: (0, 1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15,         OP0, OP1, OP2) -> (12, 13, 14, 15, L)

"""

# The main Unary ROM

unaryROM0 = Rom(17, 8)
unaryROM1 = Rom(17, 8)
unaryROM2 = Rom(15, 8)

# Order: RBL RBR RNL RNR, 16 = L. Note: in microcode order, not
# order of table above. Microcode order is:
#
# 000 -> RBR
# 001 -> RBL
# 010 -> RNR
# 011 -> RNL
# 1XX -> NOT

# this table lists one operation per column. Each row is each of the
# 17 bits of <L,A>. The value in each cell is the bit to use from the
# original value.

rolltable = [
    # ROM 2
    # [RBL, RBR, RNL, RNR]
    [0,  15, 3,  12],           # bit 16 (L)
    [16, 14, 2,  11],           # bit 15
    [15, 13, 1,  10],           # bit 14
    [14, 12, 0,   9],           # bit 13
    [13, 11, 16,  8],           # bit 12
    
    # ROM 1
    [12, 10, 15,  7],           # bit 11
    [11, 9,  14,  6],           # bit 10
    [10, 8,  13,  5],           # bit 9
    [9,  7,  12,  4],           # bit 8
    [8,  6,  11,  3],           # bit 7
    [7,  5,  10,  2],           # bit 6
    
    # ROM 0
    [6,  4,  9,   1],           # bit 5
    [5,  3,  8,   0],           # bit 4
    [4,  2,  7,  16],           # bit 3
    [3,  1,  6,  15],           # bit 2
    [2,  0,  5,  14],           # bit 1
    [1,  16, 4,  13],           # bit 0
]

debug = False
#debug = True

L = 16
if debug:
    print "                    OP  ADDR (in)         DATA (out)              addr2             data0"
    print "OP  <L,AAAA> addr   210:LFEDCBA9876543210 LFEDCBA9876543210       EDCBA9876543210 543210"
    print "-------------------------------------------------------------------------------------------------"

ds = open('unary.dat', 'w')

for op in xrange(8):
    if not debug:
        print "op=%d" % op
    for l in xrange(2):
        for x in xrange(65536):
            addr = x | (l << 16)
            a = unpackbits(addr, 17)
            op0, op1, op2 = unpackbits(op, 3)

            addr0 = selectbits(addr, reversed([0, 1, 2, 3, 4, 5, 6,   7,  8, 9,  13, 14, 15, L]))
            addr1 = selectbits(addr, reversed([2, 3, 4, 5, 6, 7, 8,   9, 10, 11, 12, 13, 14, 15]))
            addr2 = selectbits(addr, reversed([0, 1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15]))

            a0 = [op2, op1, op0] + unpackbits(addr0, 14)
            a1 = [op2, op1, op0] + unpackbits(addr1, 14)
            a2 = [op2, op1, op0] + unpackbits(addr2, 12)

            # Sanity check: there shouldn't be more 1s in the individual ROM address than in the full address.
            assert len(list(x for x in a0 if x == '1')) <= len(list(x for x in a if x == '1'))
            assert len(list(x for x in a1 if x == '1')) <= len(list(x for x in a if x == '1'))
            assert len(list(x for x in a2 if x == '1')) <= len(list(x for x in a if x == '1'))

            if op & 4:
                opcode = 'NOT'
                yb = [ str(int(not int(x))) for x in a ]
                #y = (x ^ 0xffff) & 0xffff
            else:
                if op == 0:     # RBR
                    opcode = 'RBR'
                    yb = a[1:] + [a[0]]
                elif op == 1:   # RBL
                    opcode = 'RBL'
                    yb = [a[16]] + a[:16]
                elif op == 2:   # RNR
                    opcode = 'RNR'
                    yb = a[4:] + a[:4]
                elif op == 3:   # RNL
                    opcode = 'RNL'
                    yb = a[13:] + a[:13]

            # Construct the result (and the equivalent results for the
            # three individual ROMs).
            y = packbits([1] * 17, yb)
            y0 = selectbits(y, [5, 4, 3, 2, 1, 0])  # 6 of 8 bits used
            y1 = selectbits(y, [11, 10, 9, 8, 7, 6]) # 6 of 8 again
            y2 = selectbits(y, [L, 15, 14, 13, 12]) # 5 of 8 bits used

            # More sanity checking
            assert y0 == y & 0b111111
            assert y1 == (y >> 6) & 0b111111
            assert y2 == (y >> 12) & 0b11111

            # Add to the ROMs.
            #unaryROM0.put(addr0 | (op << 14), y0)
            #unaryROM1.put(addr1 | (op << 14), y1)
            #unaryROM2.put(addr2 | (op << 12), y1)

            # Output a dataset for use by external tools like rsar(1).
            ds.write('%s %d %d %d     %s\n' % (\
                    ' '.join(str(x) for x in a),
                    op0, op1, op2,
                    ' '.join(str(x) for x in yb),
                    ))

            if debug:
                print '%s <%d,%04x> %06x %d%d%d:%s %s %05x %s %s:%s:%s %s' % \
                    (opcode, l, x,
                     addr,
                     op2,op1,op0,
                     ''.join(str(x) for x in reversed(a)),
                     ''.join(str(x) for x in reversed(yb)),
                     y,
                     ''.join(str(x) for x in reversed(a2)),
                     ''.join(str(x) for x in reversed(unpackbits(y2, 5))),
                     ''.join(str(x) for x in reversed(unpackbits(y1, 6))),
                     ''.join(str(x) for x in reversed(unpackbits(y0, 6))),
                     y2,
                     )

unaryROM.writeVerilogROMs('unary-a')

        

sys.exit(0)


# End of file.
