#!/usr/bin/python

import sys, os

try:
    (fname,) = sys.argv[1:]
except:
    sys.stderr.write('Syntax: %s BIN-FILENAME\n' % sys.argv[0])
    sys.exit(1)

try:
    f = open(fname, 'rb')
except IOError, e:
    sys.stder.write('Failed to open file %s: %s\n' % fname, str(e));
    sys.exit(1)

HEADER = """// Generated automatically, do not edit.
"""


FOOTER = """
// End of file
"""


sys.stdout.write(HEADER % locals())

while True:
    buf = f.read(4096)
    if not buf:
        break
    print '\n'.join(bin(ord(x))[2:].zfill(8) for x in buf)

sys.stdout.write(FOOTER % locals())

# End of file.
