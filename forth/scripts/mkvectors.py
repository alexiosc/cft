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

&0100:
vector_table:
"""

EQUHEAD = """
	;; Trap definitions for convenience
"""


FOOTER = """
// End of file.
"""


PAT = r'\.word\s+_rom_(\w+)\s+;\s*(.+)\n'

vectors = list()
for source in sys.argv[1:]:
    for vector in re.findall(PAT, open(source).read()):
        vectors.append(vector)

print HEADER

for name, comment in vectors:
    name = 'v_' + name + ':'
    print "%-15s .word  &beef ; %s" % (name, comment)

print EQUHEAD

for name, comment in vectors:
    print "        .equ T_%-12s I R v_%s" % (name.upper(), name)

print FOOTER.rstrip()

# End of file.
