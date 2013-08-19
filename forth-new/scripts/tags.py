#!/usr/bin/python

import re, sys, os

istty = os.isatty(1) and os.environ.get('TERM') in ['xterm', 'vt102', 'vt100', 'linux']

for line in sys.stdin:
    x = line.rstrip().split(':', 2)
    if '/.svn/' in line:
        continue
    x[2] = re.sub('^[^A-Z]+', '', x[2])
    c0 = c1 = ''
    if istty:
        if 'FIXME' in x[2]:
            c0 = '\033[0;1;33m'
        elif 'TODO' in x[2]:
            c0 = '\033[0;1;36m'
        c1 = '\033[0m'
    print "%s:%s:%s %s%s" % (x[0], x[1], c0, x[2], c1)
    
