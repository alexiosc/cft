#!/usr/bin/python

import sys, os

try:
    fname, ident = sys.argv[1:]
except:
    sys.stderr.write('Syntax: %s BIN-FILENAME C-IDENTIFIER\n' % sys.argv[0])
    sys.exit(1)

try:
    f = open(fname, 'rb')
except IOError, e:
    sys.stder.write('Failed to open file %s: %s\n' % fname, str(e));
    sys.exit(1)

size = os.stat(fname).st_size


HEADER = """/* -*- c -*- */

/* Generated automatically, do not edit */

#ifndef _BIN2H_%(IDENT)s
#define _BIN2H_%(IDENT)s


unsigned char %(ident)s[%(size)d] = {
"""


FOOTER = """
};

#endif /* _BIN2H_%(IDENT)s */

/* End of file. */
"""


IDENT = ident.upper()
sys.stdout.write(HEADER % locals())

first = True
while True:
    buf = f.read(16)
    if not buf:
        break
    line = ''.join(",0x%02x" % ord(x) for x in buf)
    if first:
        line = ' ' + line.lstrip(',')
        first = False
    print "   ", line
    


sys.stdout.write(FOOTER % locals())

# End of file.
