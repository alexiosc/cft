#!/usr/bin/python 

import os, sys, array

SIZE = 524288

# try:
#     SIZE = os.stat(sys.argv[1]).st_size
#     assert (SIZE % 16384) == 0
# except AssertionError:
#     sys.stderr.write('ROM file should be a multiple of 8 KW (16 KB)')
#     sys.exit(1)
# except (IOError, OSError), e:
#     sys.stderr.write(str(e) + "\n")
#     sys.exit(1)

rom = array.array('h')

data = open(sys.argv[1], 'rb').read()
try:
    if len(sys.argv) >= 3:
        SIZE = int(sys.argv[2])
except:
    print "Syntax: rom.py FILENAME [ NUM-WORDS ]"
    sys.exit(0)

imageSize = len(data) >> 1
rom.fromstring(data)
sys.stderr.write("ROM size is %d kW. ROM image contains %d kW.\n" %
                 (SIZE >> 10, imageSize >> 10))

print """// -*- javascript -*-
//
// Automatically generated, please do not edit!

function getROM()
{
    var _ = 0x57ef;
    return new _Uint16Array(["""

for i in xrange(SIZE):
    x = rom[i] if i < imageSize else i & 3
    if x == 0x550f:
        fmt = '_'
    elif len(hex(x)) < len(str(x)):
        fmt = "0x%x" % (x & 0xffff)
    else:
            fmt = "%d" % (x & 0xffff)

    if i == 0:
        sys.stdout.write("         %s" % fmt)
    elif (i % 16) == 0:
        sys.stdout.write("\n        /* %04x: */ ,%s" % (i, fmt))
    else:
        sys.stdout.write(",%s" % fmt)


print """    ]);
}


// End of file."""
