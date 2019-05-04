#!/usr/bin/python

import sys, re
from pprint import pprint

try:
    base = sys.argv[1]
except:
    sys.stderr.write('syntax: %s BASE-NAME\n' % sys.argv[0])
    sys.exit(0)

# Read the table of contents.
data = open(base + '.html').read().replace('\n', ' ')

toc = re.findall('(<li class="(.+?)"\s*>\s*([A-Z])[A-Z0-9.-]+\s*(<a.+?</a>))', data)
pprint(toc)[:9]
sys.exit(0)
partfiles = [ x + '.html' for x in re.findall(base + 'pa\d', data) ]
parts = dict()
for x in toc:
    tocentry, level, part, link = x
    parts.setdefault(part, []).append(tocentry)

# Now replace the mini TOCs in each part file.
for part, toc in parts.items():
    fname = partfiles[ord(part) - 65]
    print toc

# End of file.
