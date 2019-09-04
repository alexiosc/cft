#!/usr/bin/python3
#
# Generate a fairly elaborate CSV BOM using Order codes.
"""
    @package
    Generate a BOM list file (a simple text).
    Components are sorted by ref
    One component per line
    Fields are (if exist)
    Ref, Quantity, value, Part, footprint, Description, Vendor
    Fields are separated by tabs

    Command line:
    python "pathToFile/bom_sorted_by_ref.py" "%I" "%O.txt"
"""

from __future__ import print_function

# Import the KiCad python helper module and the csv formatter
import re
import sys
import csv
import pprint

try:
    sys.path.append('/usr/share/kicad/plugins')
    import kicad_netlist_reader
except:
    raise RuntimeError("Failed to load kicad_netlist_reader module.")


# re_num = re.compile('^.*\D(\d+)$')
# def getnum(s):
#     m = re_num.match(s)
#     return int(m.group(1))
    
    

# Generate an instance of a generic netlist, and load the netlist tree from
# the command line option. If the file doesn't exist, execution will stop
net = kicad_netlist_reader.netlist(sys.argv[1])

# Open a file to write to, if the file cannot be opened output to stdout
# instead
try:
    f = open(sys.argv[2], 'w')
except IOError:
    e = "Can't open output file for writing: " + sys.argv[2]
    print(__file__, ":", e, sys.stderr)
    f = sys.stdout

# Create a new csv writer object to use as the output formatter, although we
# are created a tab delimited list instead!
out = csv.writer(f)

# # override csv.writer's writerow() to support utf8 encoding:
# def writerow( acsvwriter, columns ):
#     utf8row = []
#     for col in columns:
#         txt=str(col);
#         utf8row.append( txt )
#         acsvwriter.writerow( utf8row )

# Read Components from Kicad.
components = net.getInterestingComponents()

# Output a field delimited header line
out.writerow(['Source', net.getSource()] )
out.writerow(['Date', net.getDate()] )
out.writerow(['Tool', net.getTool()] )
out.writerow(['Component Count', len(components)] )
out.writerow([])

header = [ 'Vendor', 'Part Number', 'Part', 'Amount', 'Price', 'Subtotal', 'URL', 'Refs']
out.writerow(header)

bom = dict()

# Output all of the component information
for c in components:
    key = (c.getValue(), c.getLibName(), c.getPartName(), c.getFootprint())

    try:
        bom[key][0] += 1
        bom[key][7].append(c.getRef())
    except KeyError:
        bom[key] = [1,
                    c.getValue(),
                    c.getField("BOM-Mouser"),
                    c.getField("BOM-RS"),
                    c.getField("BOM-Farnell"),
                    c.getField("BOM-What"),
                    key,
                    [c.getRef()]]

bomlist = list(bom.values())
bomlist.sort(key=lambda x: (x[0], x[1]), reverse=True)

for item in bomlist:
    amount, val, bom_mouser, bom_rs, bom_farnell, bom_what, key, refs = item

    part = val or bom_what
    if not (bom_rs or bom_farnell or bom_mouser):
        out.writerow(['', '', part, amount, '', '', '', refs])

pprint.pprint(bomlist, width=200)
