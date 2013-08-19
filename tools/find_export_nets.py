#!/usr/bin/env python
#coding:utf-8

import os, sys, re, pprint, textwrap
import cPickle as pickle

IGNORE = (1, 5, 6, 23, 40, 44, 46)

BOARDS = {
    '0 Processor Board A': (2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12),
    '1 Processor Board B': (13, 14, 15, 16),
    '2 Processor Board C': (17, 18, 19, 20, 21),
    '3 INT Board':         (22,),
    '4 MEM Board':         (24,),
    '5 TTY Board':         (25,),
    '6 IDE Board':         (26,),
    '7 CTN Board':         (27,),
    '8 ETH Board':         (28,),
    '9 KBD Board':         (29,),
    
    'a SND Board':         (30, 31),
    'b PFP Light board':   (32, 38),
    'c PFP Switch board':  (33, 36),
    'd PFP Controller':    (34, 35, 41, 42, 43, ),

    'x DEB Board':         (45,)
    }

CBUS = 'Control Bus'
PFP = 'PFP Controller'
NONBOARDS = [
    'z ' + CBUS
    ]

BOARDS['z ' + CBUS] = \
    BOARDS['0 Processor Board A'] + \
    BOARDS['1 Processor Board B'] + \
    BOARDS['2 Processor Board C'] #+ \
#    BOARDS['d PFP Controller']

EXPBUS = 44

nets = dict()
sheets = dict()

# First, parse the netlist

if os.isatty(sys.stdin.fileno()):
    sys.stderr.write("Reading from stdin...\n")

signal = None
for line in sys.stdin:
    data = re.split('\s+', line.decode('utf-8'))
    if len(data) != 6 or line.startswith('Net '):
        continue
    if data[0]:
        signal = data[0]
    sheet = int(data[4])
    try:
        sheets[sheet] |= set([signal])
    except:
        sheets[sheet] = set([signal])

#pprint.pprint(sheets)

# Then, find intersections of signals between boards.

EXPSIGNALS = sheets[EXPBUS]

def getsigs(it, butnot=None, force=False):
    """Get the set of all signals in the iterable of sheet numbers `it`."""
    retval = set([])
    for s in it:
        if butnot and s in butnot:
            continue
        if not force and s not in IGNORE:
            retval |= sheets[s]
    return retval

INDENT = '    '
tw = textwrap.TextWrapper(width=75, initial_indent=INDENT,
                          subsequent_indent=INDENT)


def listify(l):
    """List signals with ranges."""
    
    sigs = []
    siglist = []
    prefix0, suffix0 = '', 0
    prefix1, suffix1 = '', 0
    for sig in l:
        try:
            x = re.findall('^(.+?)(\d+)$', sig)
            prefix, suffix = x[0][0], int(x[0][1])
            sigs.append((prefix, suffix))

        except:
            sigs.append((sig, -1111))
            #prefix = sig
            #suffix = -1

    sigs.sort(cmp)
    #return [("%s%d" % x).replace('-1111', '') for x in sigs]

    for prefix, suffix in sigs + [('', -1111)]:
        #print '***', prefix, suffix
        if prefix == prefix0 and suffix == suffix1 + 1:
            #print '    1'
            prefix1, suffix1 = prefix, suffix
        else:
            #print '    2'
            if suffix1 != suffix0:
                #print '    2A'
                siglist.append('%s%d-%d' % (prefix0, suffix0, suffix1))
            elif prefix0:
                #print '    2B'
                if suffix0 > 0:
                    siglist.append('%s%d' % (prefix0, suffix0))
                else:
                    siglist.append(prefix0)

            prefix0, suffix0 = prefix, suffix
            prefix1, suffix1 = prefix, suffix

    #siglist = u', '.join(siglist).replace('_', r'\_')
    return siglist

        
cb = set([])
cbpfp = set([])
delimit = False
for bn in sorted(BOARDS.keys()):
    if bn in NONBOARDS:
        continue

    bs = BOARDS[bn]
    bn1 = bn.split(' ', 1)[1]
    print "\nBoard:", bn1
    print "On sheets:", ', '.join(str(x) for x in bs)

    # Get the full set of signals on this board.
    bsigs = getsigs(bs)
    nonbussigs = bsigs - EXPSIGNALS
    localsigs = set(x for x in nonbussigs) # if not x.startswith('N$'))]

    print "Expansion bus signals: %d (of %d)" % (len(bsigs & EXPSIGNALS), len(EXPSIGNALS))
    print "Other signals: %d" % (len(nonbussigs), )
    #print "Of which named: %d" % (nnamedlocalsigs, )

    for othbn in sorted(BOARDS.keys()):
        othbs = BOARDS[othbn]
        othbn1 = othbn.split(' ', 1)[1]
        if othbn == bn:
            continue
        sharedsigs = sorted(list(getsigs(othbs, bs) & set(localsigs)))
        if not sharedsigs:
            continue
        if not delimit:
            delimit = True
            print

        # Calculate signals for the Control Bus
        if othbn1 == CBUS and 'Processor Board' in bn1:
            cb |= set(sharedsigs)
        if othbn1 in (PFP,) and 'Processor Board' in bn1:
            cbpfp |= set(sharedsigs)

        print "To %s: %d signal(s)" % (othbn1, len(sharedsigs))
        print tw.fill(', '.join(listify(sharedsigs)))
        print

print "-"*79

print "\nExpansion bus (backplane) signals:", len(EXPSIGNALS)
print tw.fill(', '.join(listify(EXPSIGNALS)))

print "\nControl bus signals:", len(cb)
print tw.fill(', '.join(listify(cb)))

print "\nAdditional PFP signals:", len(cbpfp - cb)
print tw.fill(', '.join(listify(cbpfp - cb)))

pickle.dump(sheets, open('sheets.bin', 'wb'), -1)

# End of file.
