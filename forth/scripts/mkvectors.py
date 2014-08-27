#!/usr/bin/env python

import re, sys


HEADER = """
// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// ROM VECTOR TABLE
//
// WARNING: Generated automatically from vectable.asm. Please do not modify.
//
///////////////////////////////////////////////////////////////////////////////

;; System vector and trap table

.pushns vt

"""

CONSTHEAD = """
;;; Constant definitions
"""


EQUHEAD = """
;;; Vector definitions
"""


FOOTER = """

.popns

// End of file.
"""


PATv = r'\.word\s+(\w+)\s+; vector: \s*(.+)\n'
PATc = r'\.word\s+(.+)\s+; const: \s*(.+)\n'

vectors = list()
const = list()
for source in sys.argv[1:]:
    data = open(source).read()
    for vector in re.findall(PATv, data):
        vectors.append(vector)
    for c in re.findall(PATc, data):
        const.append(c)

print HEADER

for name, comment in vectors:
    name = 'v_' + name + ':'
    print "%-20s .word  &beef ; %s" % (name, comment)

print CONSTHEAD

for i, (name, comment) in enumerate(const):
    equ = comment
    print ".equ\t%-12s R @_const_table+%d" % (equ, i)

print EQUHEAD

for name, comment in vectors:
    equ = name
    #equ = name.replace('_trap', '')
    equ = 'vec_' + equ
    equ = equ.replace('vec__', 'vec_')
    print ".equ\t%-20s I R v_%s" % (equ, name)

print FOOTER.rstrip()

# End of file.
