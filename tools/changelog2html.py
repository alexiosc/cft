#!/usr/bin/python

import re
import sys

def shipout(date, name, email, descr):
    descr = re.sub('\s+', ' ', descr)
    print date, name, email, descr.strip()

date, name, email, descr = '', '', '', ''

for line in sys.stdin:
    x = re.match('^(2\d\d\d-\d\d-\d\d)\s+(.+?)\s+<(.+?)>\s*', line)
    if x:
        if date:
            for d in descr.split('\n\n'):
                shipout(date, name, email, d)
        date, name, email = x.groups()
    else:
        descr += line

if date:
    for d in descr.split('\n\n'):
        shipout(date, name, email, d)

# End of file.
