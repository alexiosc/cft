#!/usr/bin/env python
#coding:utf-8

import os, sys, re, csv

progname = sys.argv[0]

def die(msg):
    sys.stderr.write(("%s: %s" % (progname, msg)).rstrip() + '\n')
    sys.exit(1)
    

def warn(msg):
    sys.stderr.write(("%s: WARNING: %s" % (progname, msg)).rstrip() + '\n')
    

if len(sys.argv) < 2:
    sys.stderr.write("Syntax:\n\t%s EAGLE-FILE-BASENAME\n\n" % progname)
    sys.exit(1)

base = os.path.splitext(sys.argv[1])[0]
bom_parts, bom_values = base + '.bomp', base + '.bomv'

bom_csv = csv.writer(open(os.path.basename(base) + '-bom.csv', 'w'))
bom_csv.writerow(['', '', '', '', '',
                 'Farnell', '', '',
                 'Farnell US', '', '',
                 'RS Online', '', ''])
bom_csv.writerow(['Qty', 'Part', 'Eagle Part', 'Description', 'Notes',
                 'Order Code', 'Price', 'Unit',
                 'Order Code', 'Price', 'Unit',
                 'Order Code', 'Price', 'Unit'])

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

# Ordering URLs
def ordering(x):
    retval = list()
    try:
        for partno in re.split('\s*[;,+]\s*', x):
            house, ordercode = re.split('\s+', partno)
            if house.lower() == 'farnell':
                url = 'http://uk.farnell.com/jsp/search/productdetail.jsp?_dyncharset=UTF-8&' + \
                    'searchTerms=' + ordercode + '&_D%3AsearchTerms=+&%2Fpf%2F' + \
                    'search%2FTextSearchFormHandler.search=GO&_D%3A%2Fpf%2Fsearch%2F' + \
                    'TextSearchFormHandler.search=+&s=&%2Fpf%2Fsearch%2FTextSearchFormHandler' + \
                    '.suggestions=false&_D%3A%2Fpf%2Fsearch%2FTextSearchFormHandler.suggestions' + \
                    '=+&%2Fpf%2Fsearch%2FTextSearchFormHandler.ref=globalsearch&_D%3A%2Fpf%2F' + \
                    'search%2FTextSearchFormHandler.ref=+&_D%3ArohsVal=+&%2Fpf%2Fsearch%2FText' + \
                    'SearchFormHandler.onlyRoHSProductsActive=true&_D%3A%2Fpf%2Fsearch%2FText' + \
                    'SearchFormHandler.onlyRoHSProductsActive=+&_DARGS=%2Fjsp%2Fcommonfragments' + \
                    '%2FglobalsearchE14.jsp'.replace('%', r'\%').replace('&', r'\&')
                retval.append(r'\href{%s}{%s %s}' % (url, house, ordercode))
            elif house.lower() == 'rs':
                url = 'http://uk.rs-online.com/web/p/products/' + ordercode.replace('-', '') + '/'
                retval.append(r'\href{%s}{%s %s}' % (url, house, ordercode))
            else:
                warn("Unknown component house '%s'\n" % house)
    
        return ', '.join(retval)
    except ValueError:
        return x

# Process Parts

f = open(os.path.basename('%s-bom-parts.tex' % base), 'w')
try:
    parts = re.findall('<tr>(.+?)</tr>', parts)[1:]
except:
    die("parse error reading %s" % bom_parts)

prefix0, text0, suffix0, suffix1 = '', '', 0, 0
dummy = '<tr>' + ('<td>ignore</td>' * 8) + '</tr>'

packages = dict()
not_output = False
for part in parts + [dummy]:
    try:
        part, value, code, package, desc, partno, descoverride, notes = re.findall('<td>(.*?)</td>', part.decode('utf-8'))
        packages[package] = packages.get(package, 0) + 1

        text = ' & '.join([r'\schpt{%s}' % part, descoverride or desc,
                           partno and ordering(partno) or '',
                           notes and notes or '']) + ' \\\\\n'

        if '$' in part or 'ignore' in partno.lower():
            continue

        not_output = False
        #print '-'*80

        x = re.findall('(.+?)(\d+)', part)
        if x:
            prefix, suffix = x[0]
            suffix = int(suffix)
        else:
            prefix = part
            suffix = -999

        if prefix == prefix0 and text.split(' & ')[1:] == text0.split(' & ')[1:] \
                and suffix == suffix1 + 1:
            #print '++++++', text.split(' & ')[1:]
            suffix1 = suffix
            not_output = True
        else:
            #print '------', text0
            if text0:
                if suffix1 == suffix0:
                    f.write(text0.encode('utf-8'))
                else:
                    text0 = unicode(text0)
                    f.write((u'\schpt{%s%s}–\schpt{%s%s} & %s' % \
                                (prefix0, suffix0 > 0 and suffix0 or '',
                                 prefix0, suffix1 > 0 and suffix1 or '',
                                 u' & '.join(text0.split(' & ')[1:]))).encode('utf-8'))
                         
            prefix0 = prefix
            text0 = text
            suffix0 = suffix
            suffix1 = suffix

    except IOError,e:
        die(str(e))
    except:
        raise
        die("parse error reading %s" % bom_parts)

for package, num in sorted(packages.items(), lambda a, b: cmp(a[1], b[1])):
    if not re.match('(DI[LP]\d+|PLCC\d+|SO(IC)?\d+)', package):
        continue
    print "%(num)3dx %(package)s" % locals()
    
if not_output:
    if text0:
        if suffix1 == suffix0:
            f.write(text0.encode('utf-8'))
        else:
            text0 = unicode(text0)
            f.write((u'\schpt{%s%s}–\schpt{%s%s} & %s' % \
                        (prefix0, suffix0 > 0 and suffix0 or '',
                         prefix0, suffix1 > 0 and suffix1 or '',
                         u' & '.join(text0.split(' & ')[1:]))).encode('utf-8'))
        

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


def pricing(qty, value, partno):
    sources = [ x.strip() for x in partno.split(',') ]
    if u'£' not in partno:
        print 'Warning: NO PRICING for: %(qty)sx %(value)s (%(partno)s)' % locals()
        return ['' * 9]

    s = dict()
    for source in sources:
        data = re.findall(u'(.+)\s+(\d.\S*)\s+(\(£([0-9.+]+)(@(\d+))?\))?', source)
        if not data:
            continue
        source, ordercode, _, price, _, unit = data[0]
        if not unit:
            unit = '1'
        unit = int(unit)
        price = float(price)

        qty_pack = ((qty + unit) // unit) * unit
        price_pack = price * qty_pack

        qty1 = ((qty + (unit - 1)) / unit) * unit
        extra = (qty / 10) or 2
        qty2 = ((qty + extra + (unit - 1)) / unit) * unit
        total = qty1 * price
        #print qty, qty1, qty2, source, ordercode, price, unit, total

        if source in s:
            if s[source][3] <= price_pack:
                # What we already have is cheaper
                continue
        s[source] = (ordercode, price, unit, price_pack)

    return list(s.get('Farnell', ('', '', '', ''))[:3] + 
                s.get('Farnell US', ('', '', '', ''))[:3] + 
                s.get('RS', ('', '', '', ''))[:3])


# Process Values

csvout = list()
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
        if 'ignore' in partno.lower():
            continue

        partlist = unicode(parse_parts(parts))
        value = descoverride or value

        x = re.findall('(.+?)(\d+)', partlist)
        if x:
            key0, key1 = x[0]
            key1 = int(key1)
        else:
            key0 = partlist[:30]

        key1 = device
        key = key0 + ':' + key1
        #print "***", key

        # List of 9 items.
        prdata = pricing(int(qty), value, partno)
        csvout.append([qty.encode('utf-8'),
                       value.encode('utf-8'),
                       device.encode('utf-8'),
                       #partno.encode('utf-8'),
                       descoverride.encode('utf-8'),
                       notes.encode('utf-8'),
                       key] + prdata);

        out.append((int(qty), key, u' & '.join([qty + r'$\times$', value, partlist,
                                                         partno and ordering(partno) or '', 
                                                         notes and notes or ''])
                   .encode('utf-8')
                   .replace('_', r'\_')
                   + ' \\\\\n'))
        
    except IOError,e:
        die(str(e))
    except:
        raise
        die("parse error reading %s" % bom_values)

out.sort(lambda a, b: cmp(a[1], b[1]) or cmp(b[0], a[0]))
#for i, x in enumerate(out):
#    oddeven = i & 1 and r'\oddrowcolor' or '\evenrowcolor'
#    f.write(oddeven + x[2])
f.write(''.join(x[2] for x in out))


#for x in sorted(csvout, lambda a, b: cmp(int(b[0]),int(a[0]))):
for x in sorted(csvout, lambda a, b: cmp(a[5],b[5])):
    bom_csv.writerow(x[:5] + x[6:])


        
#parts = '\n'.join(parts)
#parts = parts.replace('<td>', '')
#parts = parts.replace('</td>', ' & ')
#print parts

# End of file.
