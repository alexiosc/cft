#!/usr/bin/python3

import re
import pprint
import fnmatch

regexps = []
with open(".gitignore") as f:
    for line in f:
        line = line.strip()
        if not line or line[0] == '#':
            continue
        regexps.append(re.compile(fnmatch.translate(line)))

#pprint.pprint(regexps)

# This is generated by:
#
# git ls-tree --full-tree -r HEAD >/tmp/blobs
with open('/tmp/blobs') as f:
    for line in f:
        line = line.strip()
        mode, item_type, blobhash, fname = re.split('\s+', line, 3)
        #print(fname)
        for r in regexps:
            if r.search(fname):
                print(blobhash, fname)
            
# End of file.
