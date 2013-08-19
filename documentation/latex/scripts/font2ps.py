#!/usr/bin/python
#coding:utf-8

import sys, os, array

progname = sys.argv[0]

HEADER ="""%!PS-Adobe-a.b

72 25.4 div dup scale
/px { 1.3 mul } def
/xsep { 12 px } def
/ysep { 21 px } def
/cfthl { 0.89 0.698 0.529 setrgbcolor } def
/grid { 0 0.43 0.72 0.53 setcmykcolor } def
/black { 0 0 0 setrgbcolor } def
/cell { 0 0 moveto   8 px 0 rlineto   0 16 px rlineto   -8 px 0 rlineto closepath } def

/c {
    gsave
    /y exch def
    /x exch def

    x xsep mul y ysep mul neg translate
    %cell cfthl fill

    cfthl 0.1 setlinewidth
    1 1 7 { px 0 moveto 0 16 px rlineto stroke } for
    1 1 15 { px 0 exch moveto 8 px 0 rlineto stroke } for

    0 0 0 setrgbcolor
    0.45 setlinewidth cell stroke

    gsave 0 15 px translate
    
} def
/ec {
    /text exch def
    grestore
    0 -2 px moveto text show
    grestore
} def

/rs { gsave } def
/re { grestore 0 -1 px translate } def
/a { 1 px 0 translate } def
/b { 0 0 moveto  1 px 0 rlineto  0 1 px rlineto  -1 px 0 rlineto closepath fill a } def

/Helvetica findfont 2.5 scalefont setfont

20 20 ysep 8 mul add translate
"""



def die(msg):
    sys.stderr.write(("%s: %s" % (progname, msg)).rstrip() + '\n')
    sys.exit(1)
    

def warn(msg):
    sys.stderr.write(("%s: WARNING: %s" % (progname, msg)).rstrip() + '\n')
    

if len(sys.argv) < 3:
    sys.stderr.write("Syntax:\n\t%s FONT-FILE BASE-NAME\n\n" % progname)
    sys.exit(1)

font = sys.argv[1]
base = sys.argv[2]

if not os.path.exists(font):
    die("File %s not found." % font)

def render(out, i, ch):
    out.write("%d %d c\n" % ((i % 64) % 8, ((i % 64) // 8)))
    for x in ch:
        out.write("rs ")
        for bit in bin(x)[2:].zfill(8):
            out.write(r"%s " % ('a', 'b')[int(bit)])
        out.write("re\n")
    out.write("(&%02x/%d) ec\n\n" % (i, i))

try:
    fp = open(font, 'rb')
except Exception, e:
    die("File %s: %s" % (font, e))

fulldata = fp.read()
print "Size of ROM font: %d" % len(fulldata)
sets = len(fulldata) // 4096

for setno in xrange(len(fulldata) // 4096):
    data = fulldata[setno * 4096 : setno * 4096 + 4096 ]

    print "Drawing character set", setno
    for page in xrange(4):
        out = file(base + ('-%02d%s.ps' % (setno, chr(97 + page))), 'w')
        out.write(HEADER)
        for i in xrange(64):
            render(out, i + page * 64, [ord(x) for x in data[i*16:(i+1)*16]])
        data = data[1024:]

# End of file.
