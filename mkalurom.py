#!/usr/bin/python2.6

"""
Create the truth table of an ALU ROM.
"""

import sys

ops = {
    0b00: lambda a,b,c: a + b + c,    # ADD
    0b01: lambda a,b,c: a & b,    # AND
    0b10: lambda a,b,c: a | b,    # OR
    0b11: lambda a,b,c: a ^ b,    # XOR
}

NBITS = 4

mask = (1 << NBITS) - 1

def strbin(x, nbits=None):
    return bin(x)[2:].zfill(nbits or NBITS)

# Print header
fmt = "%%-%ds  " % NBITS
sys.stdout.write('Addr          ')
sys.stdout.write('OP  ')
sys.stdout.write(fmt % 'A')
sys.stdout.write(fmt % 'B')
sys.stdout.write('Ci  ')
sys.stdout.write(fmt % 'Y')
sys.stdout.write('Co  ')
sys.stdout.write('Z  ')
sys.stdout.write('\n')
sys.stdout.write('-' * 79)
sys.stdout.write('\n')

for op in xrange(0, 4):
    for a in xrange(0, 1<<NBITS):
        for b in xrange(0, 1<<NBITS):
            for c in [0, 1]:
                strop = strbin(op, 2)
                stra = strbin(a)
                strb = strbin(b)
                strc = strbin(c, 1)

                addr = strop + stra + strb + strc

                y = ops[op](a, b, c) & mask
                stry = strbin(y)

                cout = int((a + b + c) > mask)
                strcout = strbin(cout, 1)

                zout = int(y == 0)
                strzout = strbin(zout, 1)

                sys.stdout.write(addr + ':  ')

                sys.stdout.write(strop + '  ')
                sys.stdout.write(stra + '  ')
                sys.stdout.write(strb + '  ')
                sys.stdout.write(strc + '   ')

                sys.stdout.write(stry + '  ')
                sys.stdout.write(strcout + '   ')
                sys.stdout.write(strzout + '   ')
                sys.stdout.write('\n')

