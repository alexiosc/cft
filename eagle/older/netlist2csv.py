#!/usr/bin/python

import glob, pprint, re, os, sys

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
        # Skip unnamed nets
        if data[1].startswith('N$'):
            continue
        results.append(data)

#x = results.items()
#x.sort(cmp=lambda a, b: -cmp(len(a[1]), len(b[1])))

#pprint.pprint(results)

# Get a set of all the netlists.
netlists = list(sorted(list(set(x[0] for x in results))))

# Get a list of all the nets.
nets = set(x[1] for x in results)

# Get a histogram of all the instances of a net per file (how many times does each card use a signal?)
nethist = dict()
for fname, netname, part in results:
    nethist.setdefault((fname, netname), list()).append(part)
for key, val in nethist.items():
    num = len(val)
    if num > 1:
        nethist[key] = len(val)
    else:
        del nethist[key]

# Get a histogram of all the nets per file (how many cards use a signal?)
cardhist = dict()
for (fname, netname), numinst in nethist.items():
    cardhist.setdefault(netname, []).append(fname)

x = cardhist.items()
def netcmp(a, b):
    if len(a[1]) == len(b[1]):
        # Compare the netlists. First, split them into letters and digits.
        anl = re.findall('(.*\D)(\d*)', a[0].lstrip('-').lower())
        bnl = re.findall('(.*\D)(\d*)', b[0].lstrip('-').lower())
        if not anl or not bnl:
            return cmp(a[0], b[0])
        if anl[0][0] == bnl[0][0] and anl[0][1] and bnl[0][1]:
            return cmp(int(anl[0][1]), int(bnl[0][1]))
        return cmp(anl[0][0], bnl[0][0])
    return -cmp(len(a[1]), len(b[1]))
x.sort(cmp=netcmp)

filelist = list(sorted(netlists))

def mkcol(netlists, filelist):
    for fname in netlists:
        if fname in filelist:
            yield '"X"'
        else:
            yield '""'

# Print the header
print '"", "", "Files"'
print '"Netname", "Usage",', ', '.join('"%s"' % x for x in netlists), ', "Notes"'
for netname, filelist in sorted(cardhist.items(), cmp=netcmp):
    print '"%s", %d, %s' % (netname, len(filelist), ', '.join(mkcol(netlists, filelist)))

sys.exit(0)

#print "Netlists read:    %5d" % len(netlists)
#print "Total nets found: %5d (excluding unnamed nets)" % len(nets)
#print "Total nets found: %5d (excluding unnamed nets and singletons)" % len(used_nets)

sys.exit(0)

# End of file.
