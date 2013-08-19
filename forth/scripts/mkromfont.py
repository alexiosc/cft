#!/usr/bin/python

import sys

def process(n, x):
    out = None
    print "_romfont%d:" % n

    for i, c in enumerate(x):
        c = ord(c)
    
        if out is None:
            out = [(1, c)]
            continue
    
        reps, prev = out[-1]
        
        if prev == c and ((i % 128) != 0):
            out[-1] = (reps + 1, prev)
        else:
            out.append((1, c))
    
    len0 = len(x)
    len1 = len(out)
    print "        .word %d ; Number of words following, negated" % -len1
    for i, (reps, c) in enumerate(out):
        if i % 12 == 0:
            sys.stdout.write("\n        .str ")
        sys.stdout.write("&%02x%02x " % (reps - 1, c))
    print "\n\n        ;; Length before: %d. Length after: %d\n" % (len0, len1)


print ";;; Generated automatically, do not edit!\n"

try:
    x = open(sys.argv[1]).read()
except IOError, e:
    sys.stderr.write('%s: %s: %s\n' % (sys.argv[0], sys.argv[1], e))
    sys.exit(1)

process(0, x[:4096])

print ";;; End of file."

# end of file.
