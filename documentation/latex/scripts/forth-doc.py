#!/usr/bin/env python
#coding:utf-8

import os, sys, re, csv, glob

print "% Generated automatically, do not edit.\n"

def texify(word):
    for char in "\\$_&{}%#":
        word = word.replace(char, '\\' + char)
    return word.replace('\\\\', '\\symbol{92}')

def parsenote(x):
    return '\n'.join('    ' + x for x in texify(x).split('\n'))


aliases = {
    '[': 'left-bracket',
    ']': 'right-bracket',
    '(': 'paren',
    '#': 'sharp',
    '#>': 'sharp-greater',
    '<#': 'sharp-greater',
}

def parsealias(name, x):
    try:
        return texify(aliases[name])
    except:
        # alias = name.replace('_', '')
        # alias = alias.replace("'", ' tick ')
        # alias = alias.replace("...", ' wait ')
        # alias = alias.replace(".", ' dot ')
        # alias = alias.replace("?", ' question ')
        # alias = alias.replace("#", ' number ')
        # alias = alias.replace("[", ' bracket ')
        # alias = alias.replace("!", ' store ')
        # alias = alias.replace("@", ' fetch ')
        
        # alias = alias.replace('  ', ' ')
        # alias = alias.strip()
        # alias = alias.replace(' ', '-')
        return texify(x.replace('_', '-'))


def parseflags(x):
    return texify(x)

flagconvert = texify

vocabulary = None


def shipout():
    print '\n\n\n\\forthvocabulary{%s}\n' % texify(vocabulary)
    for key in sorted(defs.keys()):
        data = defs[key]
        word = '\\fw{%s}' % texify(data['word'])
        print '\\forthword{%s}' % texify(data['word'])
        flags = data['flags']
        if 'alias' in data:
            print '\\forthalias{%s}' % parsealias(data['word'], data['alias'])
        else:
            print '\\forthalias{%s}' % parsealias(data['word'], data['word'])
        if 'flags' in data:
            print '\\forthflags{%s}' % parseflags(data['flags'])
        if 'notes' in data:
            try:
                header, notes = data['notes'].split('\n', 1)
            except:
                header, notes = data['notes'], ''
            w, se = re.split('\s', header, 1)
            print "\\forthdoc{%s}{%s}{\n%s\n}" % (texify(w), texify(se), parsenote(notes))
        if 'code' in data:
            defas = 'Defined as'
            if 'CODE' in data.get('flags', ''):
                defas = 'Equivalent to'
            print "\n\\noindent %s:\n\\begin{lstlisting}[numbers=none,breaklines=true]\n%s\n\\end{lstlisting}\n" % \
                (defas, data['code'])
        print "\\forthenddef\n\n"
        #print defs[key]



defs = dict()
wordlist = list()
for fname in sorted(glob.glob('../../../forth/primitives/*.asm')):
    #print "%% File:", fname
    key, data = None, dict()

    for line in open(fname):
        line = line.rstrip()
        
        x = re.findall('\s*;+\s*vocab(ulary):\s*(.+)\s*', line)
        if x:
            #print '***', x, len(defs.keys())
            if vocabulary is not None:
                shipout()
            key, data, defs = None, dict(), dict()
            vocabulary = x[0][1]
            continue

        x = re.findall('\s+;;\s*((\S+):)?\s*(.+)\s*', line)
        if x:
            x = x[0]

            if x[1]:
                key = x[1]

                data[key] = x[2]
                #print key, "-->", data[key]
                continue
            elif key is not None:
                data[key] = data[key] + '\n' + x[2]
                #print key, "==>", data[key]
                continue
        else:
            key = None
            if 'word' in data:
                defs[data['word']] = data
                key, data = None, dict()

# Print out the last vocab        
shipout()

print "% End of file"
