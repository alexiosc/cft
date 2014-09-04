#!/usr/bin/python

import sys, re, array

data = None
psize = 0
size = 0

PITCH = 16
MAX = 4096

"""

00  A 10  d=
01  A 09  d=
02  A 08  d=
03  A 07  d=
04  A 06  d=
05  A 05  d=
06  A 04  d=
07  A 03  d=
08  A 02  d=
09  A 01  d=
10  B 00  d=
11  D -1  d=
12  D -2  d=
13  D -3  d=

"""

state = 0
ofs = 0
codepoint = 0
for linenum, line in enumerate(open(sys.argv[1]) or sys.stdin):
    line = line.strip()
    if not line:
        continue
    if line.startswith('//'):
        continue

    if line == 'BITMAP':
        state = 1
        ofs = codepoint * PITCH + pad
        continue
    elif line == 'ENDCHAR':
        state = 0
        continue

    if state == 0:
        x = re.findall('(\w+)\s+(.+)', line)
        #print x
        if x:
            key, val = x[0]
    
            if key == 'PIXEL_SIZE':
                psize = int(val)
                sys.stderr.write("I: %d rows per character.\n" % psize)
            elif key == 'CHARS':
                size = int(val)
                sys.stderr.write("I: %d characters in font.\n" % size)
                data = array.array('B', [0] * (65536 * PITCH))
                continue
            elif key == 'ENCODING':
                if val.lower() in ('++', 'next'):
                    codepoint += 1
                else:
                    codepoint = int(val)
            elif key == 'BBX':
                bbx = map(int, val.split(' '))
                _a, bbh, shift, bbo = bbx
                pad = 11 - bbh - bbo
                #sys.stderr.write('*** %s => h=%d, o=%d, pad_top=%d, shift=%d\n' % (str(bbx), bbh, bbo, pad, shift))
    else:
        if len(line) == 9 and line.startswith(':') and set(line[1:]) < set('xX#.01'):
            val = int(line[1:].replace('x', '1').replace('X', '1').replace('#', '1').replace('.', '0'), 2)
        elif len(line) == 2:
            val = int(line, 16) >> shift
        else:
            raise RuntimeError('line %d: invalid binary data or more than 8 pixels of width found.' % linenum)
        #sys.stderr.write('%8d: %s\n' % (ofs, bin(val)[2:].zfill(8).replace('0', ' ')))
        data[ofs + 1] = val
        ofs += 1

# Patch the font with 256 bitmap patterns at 48K-52K.
sys.stderr.write('I: Patching font to add bitmap patterns at 48K-52K.\n')
ofs = 49152
for pat in xrange(256):
    for height in xrange(16):
        data[ofs] = pat
        ofs += 1

sys.stderr.write('I: Writing %d character, %d byte binary.\n' % (MAX, MAX * PITCH))
data[:(MAX * PITCH)].tofile(sys.stdout)

# End of file.
