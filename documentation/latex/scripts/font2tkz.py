#!/usr/bin/python
#coding:utf-8

import sys, os, array

progname = sys.argv[0]

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
    out.write("\\begin{Char}{%d}{%02x}{%d}{%d}%%\n" % (i, i, i // 8, i % 8))
    for i, x in enumerate(ch):
        out.write("  \\begin{Row}{%d}" % i)
        for bit in bin(x)[2:].zfill(8):
            out.write(r"\b{%s}" % bit)
        out.write("\\end{Row}\n")
    out.write("\\end{Char}\n\n")

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
        out = file(base + ('-%02d%s.tex' % (setno, chr(97 + page))), 'w')
        for i in xrange(64):
            render(out, i + page * 64, [ord(x) for x in data[i*16:(i+1)*16]])
        data = data[1024:]

# End of file.
