#!/usr/bin/python

import glob, pprint, re, os

connectors = [ x.rstrip().split(':')[1:]
               for x in open('local-connectors.txt')
               if x.startswith(':')
               ]
connectors = [(x[0], x[2]) for x in connectors ]
#pprint.pprint(connectors)


netlists = dict()
results = list()
for f in glob.glob('*.netlist'):
    netname = ''
    base = os.path.splitext(f)[0]
    for line in open(f):
        data = re.findall('^(\S+)?\s+(\S+)', line.rstrip())
        #data = line.strip().split(' ')
        if not data or not data[0]:
            continue
        data = data[0]
        if data[0]:
            netname = data[0]
        #print "\n*** %s IN? %s" % ((base, netname), connectors)
        data = (base, netname,) + data[1:]
        key = (base, netname)
        if key in netlists:
            netlists[key] += 1
        else:
            netlists[key] = 1
        if (data[0], data[2]) not in connectors:
            continue
        results.append(data)

totals = dict()
for result in results:
    if netlists[(result[0], result[1])] < 2:
        continue
    key = result[1]
    if key in totals:
        totals[key].append(result[0])
    else:
        totals[key] = [result[0]]

for key, data in totals.items():
    print key, len(data), ','.join(data)
    #print netlists[(result[0], result[1])], " ".join(result)
