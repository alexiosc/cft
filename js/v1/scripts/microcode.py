#!/usr/bin/python 

import sys, array

SIZE = 32768

uc = [array.array('c') for x in range(3)]

for i, x in enumerate(uc):
    x.fromfile(open('../../microcode/microcode-%02d.bin' % i, 'rb'), SIZE)

print """// -*- javascript -*-
//
// Automatically generated, please do not edit!

function _Uint32Array(x) {
    if (typeof Uint32Array === 'undefined') return x;
    else return new Uint32Array(x);
}

function getMicrocode()
{
    var _0 = 0x7ff800;
    var _1 = 0x7fb83e;
    return new Uint32Array(["""

for i in xrange(SIZE):
    vector = sum((ord(uc[x][i]) & 0xff) << (x * 8) for x in xrange(3))
    if vector == 0x7ff800:
        fmt = '_0'
    elif vector == 0x7fb83e:
        fmt = '_1'
    else:
        fmt = "0x%x" % vector

    if i == 0:
        sys.stdout.write("         %s" % fmt)
    elif (i % 16) == 0:
        sys.stdout.write("\n        ,%s" % fmt)
    else:
        sys.stdout.write(",%s" % fmt)


print """    ]);
}


// End of file."""
    
