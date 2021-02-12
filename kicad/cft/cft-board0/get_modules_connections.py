#!/usr/bin/python3

import re
import csv
import sys
import pprint


# Parse the schematics.

data = dict()
sighist = dict()
buses = dict()
in_sheet, module = None, None
for line in sys.stdin:
    line = line.strip()
    if line == '$Sheet':
        in_sheet = True
        continue

    if in_sheet:
        if line == '$EndSheet':
            in_sheet = False
            continue
        m = re.search('^F(\d+) "(.+?)" (\S)', line)
        if not m:
            continue
        fn, what, maybe_dir = m.groups()
        fn = int(fn)
        if fn == 0:
            module = what
        elif fn > 1:
            data.setdefault(module, []).append((what, maybe_dir))
            m = re.search('^(.+?)\[(\d+)\.\.(\d+)\]$', what)
            if m:
                bus, n1, n2 = m.groups()
                n1, n2 = int(n1), int(n2)
                what = bus
                try:
                    oldn1, oldn2 = buses[bus]
                    buses[bus] = (min(n1, oldn1), max(n2, oldn2))
                except KeyError:
                    buses[bus] = (n1, n2)

            try:
                sighist[what] += 1
            except:
                sighist[what] = 1

sheets = sorted(data.keys())

# Establish an ordering
def sigorder(x):
    signal, freq = x
    n1, n2 = buses.get(signal, (0, 0))
    return (
        [1, 0][signal in buses],     # Buses first, everything else later.
        n1 - n2,                     # Descending number of bus signals (if it's a bus)
        -freq,                       # Descending frequency of use
        signal.lstrip('~')           # Ascending signal name, ignoring initial tilde
    )
signals = [ (k, v) for k, v in sighist.items() ]
signals.sort(key=sigorder)


csv_writer = csv.writer(sys.stdout)

def make_sigfield(sig, sigdir):
    m = re.search('^(.+?)\[(\d+)\.\.(\d+)\]$', sig)
    if not m:
        return sig, sigdir
    bus, n1, n2 = m.groups()
    n1, n2 = int(n1), int(n2)

    full_n1, full_n2 = buses[bus]
    field = ''
    field += '.' * (full_n2 - n2)
    field += sigdir * (n2 - n1 + 1)
    field += '.' * (n1 - full_n1)
    # if n1 != full_n1 or n2 != full_n2:
    #     print(bus, (n1, n2), (full_n1, full_n2), field)

    return sig, field


def signame(sig):
    # Try a BUS[x..y] name first.
    m = re.search('^(.+?)\[(\d+)\.\.(\d+)\]$', sig)
    if m:
        signame = m.groups()[0]
        if m.groups()[0] in buses:
            return signame

    # Try a BUSn name next.
    m = re.search('^(.+?)(\d+)$', sig)
    if m:
        if m.groups()[0] in buses:
            return sig

    return sig
    

row = ["Module", "Colocation"] + [ x[0] for x in signals ]
csv_writer.writerow(row)
for module, sigs in data.items():
    row = [ module, '' ]
    for column, freq in signals:
        val = ''
        for sig, sigdir in sigs:
            sig, field = make_sigfield(sig, sigdir)
            #print("***", signame(sig), signame(column))
            if signame(sig) == signame(column):
                val = field
                break
        row.append(val)
    csv_writer.writerow(row)

