#!/usr/bin/python3

import re
import os
import sys
import csv
import pprint

microcode_dir = os.path.abspath(os.path.join(os.path.dirname(sys.argv[0]), "../microcode"))
if not os.path.exists(microcode_dir):
    sys.exit("Couldn't find microcode directory, tried " + microcode_dir)

microcode = os.path.join(microcode_dir, "microcode.mc")
if not os.path.exists(microcode):
    sys.exit("Couldn't find microcode file, tried " + microcode)

text = open(microcode).read()
csvw = csv.writer(sys.stdout)
for instr, conds in re.findall("start ([A-Z]+)(?:,\s*(.+))?\s*;", text, re.MULTILINE):
    data = re.findall("(.+?)\s*=\s*(.+?)\s*,\s*", conds)
    datadict = { k:v for k, v in data
             if k.upper() in ('I', 'R', 'OP', 'SUBOP')}
    print("{:5}  {:40} {}".format(instr, conds, datadict))
    #csvw.writerow([instr, conds, data, datadict])

    
# End of file.
