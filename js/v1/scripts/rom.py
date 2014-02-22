#!/usr/bin/python 

import sys, array

SIZE = 65536

rom = array.array('h')

rom.fromfile(open(sys.argv[1], 'rb'), SIZE)

print """// -*- javascript -*-
//
// Automatically generated, please do not edit!

function _Uint16Array(x) {
    if (typeof Uint16Array === 'undefined') return x;
    else return new Uint16Array(x);
}

function getROM()
{
    var _ = 0x57ef;
    return new _Uint16Array(["""

for i in xrange(SIZE):
    if rom[i]:
        fmt = "0x%x" % (rom[i] & 0xffff)
    elif rom[i] == 0x57ef:
        fmt = '_'
    else:
        fmt = '0'

    if i == 0:
        sys.stdout.write("         %s" % fmt)
    elif (i % 16) == 0:
        sys.stdout.write("\n        /* %04x: */ ,%s" % (i, fmt))
    else:
        sys.stdout.write(",%s" % fmt)


print """    ]);
}


// End of file."""
    
