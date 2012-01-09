#!/usr/bin/env python
#coding:utf-8

import os, sys, re

progname = sys.argv[0]

def die(msg):
    sys.stderr.write(("%s: %s" % (progname, msg)).rstrip() + '\n')
    sys.exit(0)
    

if len(sys.argv) < 2:
    sys.stderr.write("Syntax:\n\t%s EAGLE-FILE-BASENAME\n\n" % progname)
    sys.exit(0)

base = os.path.splitext(sys.argv[1])[0]
bom_parts, bom_values = base + '.bomp', base + '.bomv'

try:
    parts = open(bom_parts).read()
    values = open(bom_values).read()
except IOError, e:
    die(str(e))

# Sanity checks
if not parts.startswith('<b>Partlist exported from '):
    die("file %s is probably not an HTML bill of materials generated from Eagle's bom.ulp" % bom_parts)
if not values.startswith('<b>Partlist exported from '):
    die("file %s is probably not an HTML bill of materials generated from Eagle's bom.ulp" % bom_values)

magic_parts = '<tr><td><b>Part</b></td><td><b>Value</b></td><td><b>Device</b></td><td><b>Package</b></td>'
magic_values = '<tr><td><b>Qty</b></td><td><b>Value</b></td><td><b>Device</b></td><td><b>Parts</b></td>'
magic_cftdb = '<td><b>Order Code</b></td><td><b>Description Override</b></td><td><b>Notes</b></td>'

if magic_parts not in parts:
    die("file %s is probably not an HTML bill of materials generated from Eagle's bom.ulp" % bom_parts)
if magic_values not in values:
    die("file %s is probably not an HTML bill of materials generated from Eagle's bom.ulp" % bom_parts)
if magic_cftdb not in parts:
    die("file %s doesn't seem to include the CFT BOM database fields" % bom_parts)
if magic_cftdb not in values:
    die("file %s doesn't seem to include the CFT BOM database fields" % bom_parts)

# Process Parts

f = open(os.path.basename('%s-bom-parts.tex' % base), 'w')
try:
    parts = re.findall('<tr>(.+?)</tr>', parts)[1:]
except:
    die("parse error reading %s" % bom_parts)

prefix0, suffix0, suffix1 = '', 0, 0
for part in parts:
    try:
        part, value, code, package, desc, partno, descoverride, notes = re.findall('<td>(.*?)</td>', part)

        #x = re.findall('(.+?)(\d+)', part)
        #if x:
        #    prefix, suffix = x[0]
        #    suffix = int(key1)
        #else:
        #    prefix = part
        #    suffix = -999

        f.write(' & '.join([r'\schpt{%s}' % part, value, descoverride or desc,
                            partno and r'\farnell{%s}' % partno, notes]) + ' \\\\\n')

    except IOError,e:
        die(str(e))
    except:
        die("parse error reading %s" % bom_parts)
        

def parse_parts(parts):
    # Massage the part list
    parts = unicode(parts).split(', ')
    partlist = []
    prefix0, suffix0 = '', 0
    prefix1, suffix1 = '', 0
    for part in parts + ['']:
        try:
            x = re.findall('(.+?)(\d+)', part)
            prefix, suffix = x[0][0], int(x[0][1])
        except:
            prefix = part
            suffix = -1
            
        #print '***', prefix, suffix
        if prefix == prefix0 and suffix == suffix1 + 1:
            #print '    1'
            prefix1, suffix1 = prefix, suffix
        else:
            #print '    2'
            if suffix1 != suffix0:
                #print '    2A'
                partlist.append(ur'\schpt{%s%d}–\schpt{%s%d}' % (prefix0, suffix0, prefix1, suffix1))
            elif prefix0:
                #print '    2B'
                if suffix0 > 0:
                    partlist.append(ur'\schpt{%s%d}' % (prefix0, suffix0))
                else:
                    partlist.append(ur'\schpt{%s}' % prefix0)

            prefix0, suffix0 = prefix, suffix
            prefix1, suffix1 = prefix, suffix

    partlist = u', '.join(partlist).replace('_', r'\_')
    return partlist


# Process Values

f = open(os.path.basename('%s-bom-values.tex' % base), 'w')
out = list()
try:
    values = re.findall('<tr>(.+?)</tr>', values)[1:]
except:
    die("parse error reading %s" % bom_values)

for value in values:
    try:
        qty, value, device, parts, partno, descoverride, notes = re.findall('<td>(.*?)</td>',
                                                                            value.decode('utf8'))
        partlist = ur'\raggedright ' + unicode(parse_parts(parts))
        value = ur'\raggedright ' + (descoverride or value)

        x = re.findall('(.+?)(\d+)', partlist)
        if x:
            key0, key1 = x[0]
            key1 = int(key1)
        else:
            key0 = partlist[:30]

        out.append((int(qty), (key0, key1), u' & '.join([qty, value, partlist,
                                partno and ur'\farnell{%s}' % partno, notes])
                   .encode('utf-8')
                   .replace('_', r'\_')
                   + ' \\\\\n'))
        
    except IOError,e:
        die(str(e))
    except:
        raise
        die("parse error reading %s" % bom_values)

out.sort(lambda a, b: cmp(a[1], b[1]) or cmp(b[0], a[0]))
f.write(''.join(x[2] for x in out))


        
#parts = '\n'.join(parts)
#parts = parts.replace('<td>', '')
#parts = parts.replace('</td>', ' & ')
#print parts

# End of file.
