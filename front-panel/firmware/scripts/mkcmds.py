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
    #strtable += 'helpstring_t _cmdhelp%(i)d[] PROGMEM = "%(help)s";\n' % locals()
    #strtable += 'helpstring_t _cmdhelp%(i)d[] = "%(help)s";\n' % locals()
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

#helpstr = "201 Available commands:\n";
helpstr = ''

helpstr += '|'.join(x[2] for x in data)
helpstr = helpstr.replace(r'\n', '\n')
helpstr = helpstr.replace('-- ', '\\1')
helpstr = helpstr.replace('[ WORD ] ', '\\002')
helpstr = helpstr.replace('[ BOOL ] ', '\\003')
helpstr = helpstr.replace('Get/set ', '\\004')
helpstr = helpstr.replace('\n201', '\\005')
helpstr = helpstr.replace(' (default: ', '\\006')
helpstr_len = len(helpstr) + 1

#print helpstr \
#    .replace('\001', '\033[7m -- \033[0m') \
#    .replace('\002', '\033[7m[ WORD ]\033[0m') \
#    .replace('\003', '\033[7m[ BOOL ]\033[0m') \
#    .replace('\004', '\033[7mGet/set \033[0m') \
#    .replace('\005', '\033[7m201   \033[0m') \

helpstr = helpstr.replace('\n', '\\n').replace('|', '\\0')

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

#define _HELPSTR "%(helpstr)s";

const static const struct {
	char cmd[CMD_SIZE];
	void (*handler)();
//#ifdef AVR
//	PGM_P help;
//#else
//      char * help;
//#endif
} cmds[] PROGMEM = {""" % locals()

for i, datum in enumerate(data):
    #print '        {"%s", %s, _cmdhelp%d},' % (datum[0], datum[1], i)
    #print '        {"%s", %s, "%s"},' % (datum[0], datum[1], datum[2])
    print '        {"%s", %s},' % (datum[0], datum[1])

print """        {"\\0", (void*)-1}
};

#endif // __PROTO_CMDS_H""" % locals()

#pprint.pprint(ofsdata)
# End of file.
