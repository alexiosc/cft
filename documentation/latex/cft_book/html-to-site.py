#!/usr/bin/python3

import sys
import re
import os
import time
import shutil
from pprint import pprint
import bs4


TARGET_DIR = '/var/www/static-bedroomlan/src/content/hardware/cft/book'
IMAGE_DIR = '/var/www/static-bedroomlan/src/images/full/hardware/cft/book/converted'
IMAGE_URL = '/images/full/hardware/cft/book/converted/'
KEYWORDS = 'hardware, homebrew computer, homebrew cpu, electronics, ' \
           'discrete logic, 74xxx, instruction set, minicomputer'
TAGS = 'hardware, projects, cpus'

PREAMBLE = """{# -*- jinja2 -*- #}
{# Automatically generated! #}
{# Generator: %(progname)s #}
{# Source file: %(fname)s #}
{# Generated on: %(date)s #}
{%% set bodyclass = "tex4ht" %%}
{%% set title = "%(part)s%(title)s" %%}
{%% set created = "%(date)s" %%} {# the creation date isn't really known #}
{%% set updated = "%(date)s" %%}
{%% set hidden = 0 %%}
{%% set article = 1 %%}
{%% set comments = 1 %%}
{%% set hide_title = 1 %%}
{%% set description = "%(description)s" %%}
{%% set keywords = "%(keywords)s" %%}
{%% set tags = "%(tags)s" %%}
{%% set priority = %(priority)d %%}
{%% set show_when_path = "^/hardware/cft/book/" %%}
# {%% set banner_image = "%(banner)s" %%}
# {%% set banner_3d = 1 %%}
{# {%% set image = "big-maze-narrow.png" %%} #}
{# {%% set tile = dict(w=2, text="left") %%} #}

{%% block summary %%}
%(summary)s
{%% endblock summary %%}

{%% block content %%}{%% filter ct_tex4ht %%}
<div class="caution box">

The conversion from the LaTeX source of the CFT Book is a work in
progress. Things are quite broken for the time being, but I expect them to
improve soon, and by leaps and bounds.

</div>
"""

POSTAMBLE = """
{% endfilter %}{% endblock content %}
"""

PART_TILE = """
{# -*- jinja2 -*- #}
{%% set title = "%(partname)s" %%}
{%% set priority = %(priority)d %%}
{%% set tile=dict(w=1) %%}
{%% set show_when_path="^/hardware/cft/book/$" %%}
{%% set created = "%(date)s" %%} {# the creation date isn't really known #}
{%% set updated = "%(date)s" %%}
{%% set tile_style="tex4ht-part" %%}

{%% block summary %%}
  <h3>Part %(partnum)s</h3>
  <h3>%(partname)s</h3>
{%% endblock %%}
"""


def getAttr(iter, attr):
    return iter.attrs.get(attr, '')


def withAttr(iter, attr, val):
    for x in iter:
        if val in getAttr(x, attr):
            yield x

def wrapTag(to_wrap, wrap_in):
    contents = to_wrap.replace_with(wrap_in)
    wrap_in.append(contents)


def deleteNodes(root, fn):
    """Remove nodes for which fn returns True."""
    # Converting the generator to a list fixes a weird generator/iterator bug
    # in BeautifulSoup, manifesting when nodes are deleted while iterating.
    killList = list(x for x in root.recursiveChildGenerator()
                    if fn(root, x))
    deleteNodeList(killList)


def deleteNodeList(iterable):
    """Remove all the nodes listed in iterable."""
    for x in iterable:
        x.extract()
    

def parseToc():
    b = bs4.BeautifulSoup(open('cft-book-html.html').read())
    toc = list()
    for x in b.findAll('li'):
        datum = dict(
            cls=getAttr(x, 'class'),
            num=x.contents[0],
            href=getAttr(x.contents[1], 'href'),
            text=x.contents[1].contents[0])
        datum['file'] = datum['href'].split('#')[0]
        toc.append(datum)
        #print '*', x.attrs, x.contents
    return toc


def getPartName(fname):
    b = bs4.BeautifulSoup(open(fname).read())
    return b.title.string.split(' ', 1)[1]


def installImages(fname, images):
    #base = os.path.basename(fname).replace('.html.j2', '')
    #imgdir = os.path.join(IMAGE_DIR, base)
    imgdir = IMAGE_DIR

    # Try to make the directory if it doesn't exist
    if not os.path.exists(imgdir):
        os.mkdir(imgdir)

    for i in images:
        if i is None:
            continue
        try:
            shutil.copy(i, imgdir)
        except FileNotFoundError:
            sys.stdout.write("\n\033[0;1;31mERROR: %s not found.\033[0m" % i)
            sys.stdout.flush()

    return


def getTeXMetadata(body, tagId):
    nodes = list(withAttr(body.findAll('div'), 'id', tagId))
    if not nodes:
        return ''

    retval = list(nodes)[0].string
    deleteNodeList(nodes)
    return retval


def processLongTable(body, table):
    """Process a long table, removing empty rows etc."""

    thead, tbody = '', ''
    rows = []
    state = 0
    for i, row in enumerate(table.findAll('tr')):
        empty = sum(list(len(''.join(map(str, x.contents)).strip()) for x in row.findAll('td'))) == 0
        rows.append(row)

        if state == 0 and empty:
            state = 1
        elif state == 1 and not empty:
            state = 2

        if state == 0 and not empty:
            for td in row.findAll('td'):
                td.name = 'th'
            thead += '\n' + str(row)
            
        if state == 2 and not empty:
            tbody += '\n' + str(row)

        #pprint(empty)
        #print(row.contents[0].contents)
        #print("state", state, "row", i, "id", row.attrs.get('id', '?'), "empty", empty)

    # Delete the old rows
    deleteNodeList(rows)
    
    # Recreate the table from scratch.
    table.append(bs4.BeautifulSoup('<thead>' + thead + '</thead>\n<tbody>' + tbody + '</tbody>'))
    #print(table.prettify())
    

def processPart(partnum, partname, priority):
    partname = partname.strip()
    progname = sys.argv[0]
    date = time.strftime("%Y-%m-%d %T")

    outfname = '%s.tile.j2' % re.sub('[^A-Za-z0-9-]+', '-', partname).lower()
    outfname = os.path.join(TARGET_DIR, outfname)
    sys.stdout.write('Writing %s...' % os.path.basename(outfname))
    sys.stdout.flush()

    with open(outfname, 'wt') as f:
        f.write(PART_TILE % locals())


def addSections(s):
    # Algorithm:
    # for n in 2..6:
    #   split article by <hi>, where i <= n.
    #   for each section of text found, wrap in <section class="hn">
    # end loop
    
    levels = {
        2: 'chapter',
        3: 'section',
        4: 'subsection',
        5: 'subsubsection',
        6: 'paragraph',
    }

    for x in [6, 5, 4, 3, 2]:
        sections = re.split('(<h[1-%d][^>]*?>)' %  x, s)
        expected = '<h%d' % x
        out, sections = sections[0], sections[1:]
        in_wrap = False
        if x == 2 and out:
            out = '\n<section>\n%s</section>\n' % out
        while sections:
            h, t, sections = sections[0], sections[1], sections[2:]
            if in_wrap:
                out += '</section>\n'
                in_wrap = False
            if not h.startswith(expected):
                out += h + t
                continue
            h = h.replace(' class="%sHead"' % levels[x], '')

            # While we're at it, massage some stuff in the section heading
            m = re.search(r'<a id="(.+?)"></a>', t)
            sid = ''
            if m:
                sid = 'id="%s" ' % m.groups()[0]
                t = re.sub(r'\s*<a id="%s">\s*</a>' % m.groups()[0], '', t)

            out += '\n<section %sclass="h%s %s">\n  %s%s' % (sid, x, levels[x], h, t)
            in_wrap = True

        s = out

    if in_wrap:
        out += '</section>'

    return out


def processFile(fname, data=dict()):
    progname = sys.argv[0]
    date = time.strftime("%Y-%m-%d %T")
    description = ''            # For now
    keywords = ''               # For now
    tags = ''                   # For now

    # Preprocess the file as a string.
    f = open(fname)
    # f.readline()                # Skip the DOCTYPE declaration
    # f.readline()                # Skip the DOCTYPE declaration
    text = f.read()
    # text = addSections(text)

    # Now parse it into a bs4 object
    b = bs4.BeautifulSoup(text)

    # Get the title. Strip out the chapter mark (first ‘word’)
    title = b.title.string.split(' ', 1)[1]
    outfname = '%s.html.j2' % re.sub('[^A-Za-z0-9-]+', '-',
                                     data['part'] + b.title.string).lower()
    outfname = os.path.join(TARGET_DIR, outfname)
    sys.stdout.write('Writing %s...' % os.path.basename(outfname))
    sys.stdout.flush()

    # Add sections and re-parse
    b = bs4.BeautifulSoup(addSections(str(b.body)))

    body = b.body

    # Get the meta DIVs from the HTML. Remove them.
    summary = getTeXMetadata(body, 'HtmlMetaDescription')
    description = getTeXMetadata(body, 'HtmlMetaGoogleDescription') or summary
    keywords = getTeXMetadata(body, 'HtmlMetaKeywords') or KEYWORDS
    tags = getTeXMetadata(body, 'HtmlMetaTags') or TAGS
    banner = getTeXMetadata(body, 'HtmlMetaBanner')
    
    # Remove comments
    deleteNodes(body, lambda root, x: isinstance(x, bs4.Comment))

    # Remove navigation links
    deleteNodeList(withAttr(body.findAll('div'), 'class', 'crosslinks'))

    # Remove explicit breaks
    deleteNodeList(body.findAll('br'))

    # Remove horizontal rules
    for c in ['figure', 'float']:
        deleteNodeList(withAttr(body.findAll('hr'), 'class', c))
        deleteNodeList(withAttr(body.findAll('hr'), 'class', 'end' + c))

    # Remove fake paragraphs (what are these?)
    #deleteNodeList(withAttr(body.findAll('p'), 'class', 'nopar'))

    # Remove line numbers from minted output, strip out tabular stuff,
    # simulate site's source output.
    for listing in withAttr(body.findAll('div', recursive=True), 'class', 'minted'):
        # Only listings with line numbers are tabular. Skip those, they're
        # already fine.
        if listing.table is None:
            continue

        hl = listing.table.tr.findAll('div', recursive=True)[1]
        hl.attrs['class'] = ['highlight'] +  listing.attrs['class']
        listing.insert_before(str(hl))

    #deleteNodeList(withAttr(body.findAll('div'), 'class', 'minted'))

    # Replace spans with TeX fonts with better tags
    for tag in withAttr(body.findAll('span', recursive=True), 'class', 'cmtt-10x-x-109'):
        tag.name = 'code'
    for tag in withAttr(body.findAll('span', recursive=True), 'class', 'cmtt-9'):
        tag.name = 'code'
    for tag in withAttr(body.findAll('span', recursive=True), 'class', 'cmbx-10x-x-109'):
        tag.name = 'strong'

    # Process all longtables
    for lt in withAttr(body.findAll('table', recursive=True), 'class', 'longtable'):
        processLongTable(body, lt)
    b = bs4.BeautifulSoup(str(b))
    body = b.body
    
    # Temporary: disable all links
    for a in body.findAll('a', recursive=True):
        if 'href' in a.attrs:
            a.name = 'span'
            a.attrs['data-href'] = a.attrs['href']
            del a.attrs['href']

    # Locate (and install) all images
    images = b.findAll('img', recursive=True)
    if images:
        installImages(outfname, sorted(set(x.attrs.get('src') for x in images)))
        sys.stdout.write(' (with %d images)' % len(images))
        sys.stdout.flush()
        
        for i in images:
            try:
                src = os.path.basename(i.attrs['src'])
                src = '../converted/' + src
                i.attrs['src'] = '{{ "%s" | image_style("figure") }}' % src
                i.parent.attrs['class'].append('white-bg')
            except KeyError:
                pass


    # Generate output (and massage that)
    output = ''.join(str(x) for x in body.contents)
    #output = body.prettify()
    
    output = re.sub(r'<p>\s+', '<p>', output)
    output = re.sub(r'\s+</p>\s*', '</p>\n\n', output)
    output = re.sub(r'\s+</li>\s*', '</li>\n', output)
    output = re.sub(r'<section>\s*</section>', '', output)
    output = re.sub('<ul class="itemize\d+">', '\n<ul class="compact">', output)
    output = output.replace('<p class="indent">', '<p>')
    output = output.replace('\ufb00', 'ff') # ff ligature
    output = output.replace('\ufb01', 'fi') # fi ligature
    output = output.replace('<p class="noindent"></p>', '')
    output = output.replace('<p', '\n<p')
    output = output.replace('<li class="itemize">', '\n<li>')
    output = output.replace('</li></ul>', '</li>\n\n</ul>')
    output = output.replace('</section>', '</section>\n')

    data.update(locals())
    with open(outfname, 'wt') as f:
        f.write(PREAMBLE % data)
        f.write(output)
        f.write(POSTAMBLE)

    sys.stdout.write('\n')


toc = parseToc()
#pprint(set(x['file'] for x in toc if 'toc-chapter' in x['cls']))
#pprint(toc)
#sys.exit(0)

processed = set()
priority = 250
part = ''
for entry in toc:
    fname = entry['file']
    if 'toc-part' in entry['cls']:
        processPart(entry['num'], entry['text'], priority)
        part = getPartName(fname) + ' — '
        priority = max(priority - 1, 0)
        continue

    if 'toc-chapter' not in entry['cls']:
        continue

    if fname in processed:
        continue
    processed |= set([fname])

    if not fname:
        sys.stderr.write('\033[0;1;31m*** Filename missing from TOC. Rerun LaTeX.\033[0m\n')
        exit(1)
    processFile(fname, data=dict(part=part, priority=priority))
    priority = max(priority - 1, 0)


# End of file.
