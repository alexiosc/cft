#!/usr/bin/python
# coding:utf-8

import os
import sys
import array

SIZE = 1<<19

uc = [array.array('c') for x in range(3)]

dirname = sys.argv[1]
for i, x in enumerate(uc):
    x.fromfile(open(os.path.join(dirname or '.', 'microcode-%02d.bin' % i), 'rb'), SIZE)


ctable = {
    0x7d8118: "_0",
    0x7f8000: "_1",
    0xff80cb: "_2",
}

print """// -*- javascript -*-
//
// Automatically generated, please do not edit!

function _Uint32Array(x) {
    if (typeof Uint32Array === 'undefined') return x;
    else return new Uint32Array(x);
}

function getMicrocode()
{
"""

for k, v in ctable.items():
    print "    var %s = %s;" % (v, k)

print """
    return new Uint32Array(["""

hist = dict()
for i in xrange(SIZE):
    vector = sum((ord(uc[x][i]) & 0xff) << (x * 8) for x in xrange(3))
    fmt = ctable.get(vector, "0x%x" % vector)

    try:
        hist[vector] += 1
    except:
        hist[vector] = 1

    if i == 0:
        sys.stdout.write("         %s" % fmt)
    elif (i % 16) == 0:
        sys.stdout.write("\n        ,%s" % fmt)
    else:
        sys.stdout.write(",%s" % fmt)


print """    ]);
}


// End of file."""
    

# Generate the histogram needed to form the compression table (which I
# still do manually for now, it's not like the microcode changes
# much—and even then, the most common vectors have only changed once
# as a result of the Easter 2019 Notes.

# for k, v in hist.items():
#     print "FOO:", hex(k), ctable.get(k, "0x%x" % k), v

# End of file.