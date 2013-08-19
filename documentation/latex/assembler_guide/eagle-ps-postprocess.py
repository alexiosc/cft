#!/usr/bin/env python

import re, optparse, sys, os

p = optparse.OptionParser()
p.add_option('-i', '--info', action='store_true',
             help='Print out information on the Eagle Postscript file(s).')
p.add_option('-C', '--color', action='store_true',
             help='Add some colour to the information printout.')
p.add_option('-l', '--line', action='append', default=[],
             metavar='OLDSPEC:NEWSPEC',
             help='Change the line style specified by OLDSPEC to the NEWSPEC. ' \
                 'Both OLDSPEC and NEWSPEC are in the format R,G,B[,WIDTH]. ' \
                 'R, G and B may be specified as floating point values (0.0-1.0; ' \
                 'decimal points MUST be specified) ' \
                 'or byte values (0-255). The width is always a decimal number ' \
                 'expressed in Eagle\'s Postscript output native units.')
p.add_option('-t', '--text', action='append', default=[],
             metavar='OLDSPEC:NEWSPEC',
             help='Change the text style specified by OLDSPEC to the NEWSPEC. ' \
                 'OLDSPEC and NEWSPEC are in the same format as for --line, ' \
                 'but the width specification is ignored.')

(options, args) = p.parse_args()

COLSPEC = '^([0-9.+-]+),([0-9.+-]+),([0-9.+-]+)(,([0-9.+-]+))?:' \
    '([0-9.+-]+),([0-9.+-]+),([0-9.+-]+)(,([0-9.+-]+))?$'
SCNPAT = '([0-9.e+-]+)\s+([0-9.e+-]+)\s+([0-9.e+-]+)\s+(scn|SCN)'

# Check arguments
def convert(r1, g1, b1, w1, r2, g2, b2, w2):
    """Canonicalise the colspec"""
    def _convert(x):
        if '.' in x:
            return int(float(x) * 256)
        val = int(x)
        if val not in xrange(256):
            sys.stderr.write('%s: component must be between 0 and 255 (or use a decimal point)' % \
                                 sys.argv[0])
            sys.exit(1)
        return val

    r1 = _convert(r1)
    g1 = _convert(g1)
    b1 = _convert(b1)
    if w1 != '':
        w1 = float(w1)
    else:
        w1 = None

    r2 = _convert(r2)
    g2 = _convert(g2)
    b2 = _convert(b2)
    if w2 != '':
        w2 = float(w2)
    else:
        w2 = None

    return (r1, g1, b1, w1), (r2, g2, b2, w2)
    

linestyles = []
for opt in options.line:
    x = re.findall(COLSPEC, opt)
    try:
        assert x[0]
        r1, g1, b1, dummy1, w1, r2, g2, b2, dummy2, w2 = x[0]
        linestyles.append(convert(r1, g1, b1, w1, r2, g2, b2, w2))

    except:
        sys.stderr.write('%s: unable to parse style specification "%s".\n' % (sys.argv[0], opt))
        sys.exit(1)


textstyles = []
for opt in options.text:
    x = re.findall(COLSPEC, opt)
    try:
        assert x[0]
        r1, g1, b1, dummy1, w1, r2, g2, b2, dummy2, w2 = x[0]
        textstyles.append(convert(r1, g1, b1, w1, r2, g2, b2, w2))

    except:
        sys.stderr.write('%s: unable to parse style specification "%s".\n' % (sys.argv[0], opt))
        sys.exit(1)



# Print info.

def info(options, args):
    """Output information on the line styles used in the supplied files."""
    for fname in args[0:1]:
        cols = set()
        inf = open(fname)
        for line in inf:
            x = re.findall(SCNPAT, line)
            if x:
                r, g, b, col = x[0]
                w = -1
                # Read the next line, see if we have a width specification.
                x = re.findall('([0-9.e+-]+)\s+w\s+', inf.next().strip())
                if x:
                    w = x[0]
    
                cols |= set([(r,g,b,w,col)])
                continue
            #print line.strip()
    
        #print "File:", fname, "\n"
        print "PS Line style"
        print "Red   Green Blue    Width  Command line argument"
        print "-" * 80
        for col in cols:
            try:
                r, g, b, w, t = col
                r, g, b, w = float(r), float(g), float(b), float(w)
                rh, gh, bh = int(r * 256), int(g * 256), int(b * 256)
            except:
                raise

            colspec, colreset = '', ''
            if options.color:
                n = 30 + int(bool(r)) + (int(bool(g)) << 1) + (int(bool(b)) << 2)
                if n != 30:
                    colspec = "\033[0;%dm" % n
                else:
                    colspec = "\033[0;7m"
                colreset = "\033[0m"

            t = dict(scn='text', SCN='line')[t]
            if w >= 0.0:
                spec = '--%(t)s %(r)5.3f,%(g)5.3f,%(b)5.3f,%(w)5.3f:R,G,B,Width' % locals()
            else:
                spec = '--%(t)s %(r)5.3f,%(g)5.3f,%(b)5.3f:R,G,B' % locals()
    
            fmt1 = '%(r)5.3f %(g)5.3f %(b)5.3f '
            fmt2 = '%(colspec)s%(spec)s%(colreset)s'
            if w >= 0.0:
                print (fmt1 + "%(w)7.3f  " + fmt2) % locals()
            else:
                print (fmt1 + "    N/A  " + fmt2) % locals()
        
if options.info:
    info(options, args)
    sys.exit(0)


# Process files.

if len(args) != 2:
        sys.stderr.write('%s: run with INPUT-FILE OUTPUT-FILE as arguments.\n' % (sys.argv[0],))
        sys.exit(1)


#tmpname = args[1] + '~'
tmpname = args[1]
outf = open(tmpname, 'w')

inf = open(args[0])
for line in inf:
    outf.write(line)

    x = re.findall(SCNPAT, line)
    if x:
        r, g, b, col = x[0]
        w = None
        # Read the next line, see if we have a width specification.
        line = inf.next()
        outf.write(line)
        x = re.findall('([0-9.e+-]+)\s+w\s+', line.strip())
        if x:
            w = x[0]

        r = int(float(r) * 256)
        g = int(float(g) * 256)
        b = int(float(b) * 256)
        domain = col == 'scn' and textstyles or linestyles
        for (r1, g1, b1, w1), (r2, g2, b2, w2) in domain:
            if r1 == r and g1 == g and b1 == b and ((w1 is None) or (w1 == w)):
                #print r, g, b, w, col
                print "*MATCH*", w1
                outf.write(" %f %f %f %s %% added\n" % (r2 / 255., g2 / 255., b2 / 255., col))
                if w2 is not None:
                    outf.write(" %f w %% added\n" % w2)

        #cols |= set([(r,g,b,w,col)])
        continue

# Rename the temporary file to the final destination
#os.rename(tmpname, args[1])


# End of file.
