#!/usr/bin/env python
#coding:utf-8

import os, sys, re, csv, glob

wordlist = list()
for fname in glob.glob('../../../forth/primitives/*.asm'):
    wordlist = wordlist + re.findall('\n\s+[;/]+\s+word:\s+(\S+)', open(fname).read())

def texify(x):
    for word in x:
        for char in "\\$_&{}%#":
            word = word.replace(char, '\\' + char)
        yield word.replace('\\\\', '\\symbol{92}')

print '\n'.join(r'\fw{%s}' % x for x in texify(sorted(wordlist)))

