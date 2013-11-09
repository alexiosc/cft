#!/usr/bin/python

import sys, re
import pprint

source = sys.stdin.read()
data = re.findall('\n\s*\{"(.+?)",\s*(\w+),\s*\"(.+?)\"\}', source)
#pprint.pprint(data)

source = source.split('\n')

fullhelp = ''
len0 = 0
ofsdata = dict()
i = 0
strtable = ''
for datum in data:
    cmd, fn, help = datum
    len0 += len(help) + 1
    strtable += 'helpstring_t _cmdhelp%(i)d[] PROGMEM = "%(help)s";\n' % locals()
    ofsdata[cmd] = (i, len(fullhelp), len(help))
    i += 1
    fullhelp += help

#print "Total length of help before:", len0
#print "Total length of help after concat:", len(fullhelp)

len1 = len(fullhelp) + 1

words = list([x + ' ' for x in re.split('\s', fullhelp)])
freqtable = dict()
for w in words:
    try:
        freqtable[w] += 1
    except:
        freqtable[w] = 1

# dictionary = list()
# for w, f in freqtable.items():
#     if len(w) > 1 and f > 1:
#         s = (len(w) * f) - f
#         #print "%-20s: %d (potential savings: %d)" % (w, f, s)
#         dictionary.append((w, f, s))

# dictionary.sort(cmp=lambda a, b: cmp(b[2], a[2]))
# #pprint.pprint(dictionary)


fullhelp = fullhelp.replace("\t", r'\t')
fullhelp = fullhelp.replace("\n", r'\n')
fullhelp = fullhelp.replace("-- ", r'\1')
len2 = len(fullhelp) + 1

print """
#ifndef __PROTO_CMDS_H
#define __PROTO_CMDS_H

#include "hwcompat.h"

#define CMD_SIZE 8

#ifdef AVR
#define helpstring_t static const char
#else
#define helpstring_t char
#endif


%(strtable)s

const static const struct {
	char cmd[CMD_SIZE];
	void (*handler)();
#ifdef AVR
	PGM_P help;
#else
        char * help;
#endif
} cmds[] PROGMEM = {""" % locals()

for i, datum in enumerate(data):
    print '        {"%s", %s, _cmdhelp%d},' % (datum[0], datum[1], i)

print """        {"\\0", (void*)-1}
};

#endif // __PROTO_CMDS_H""" % locals()

#pprint.pprint(ofsdata)
# End of file.
