#!/usr/bin/python

import os
import re
import sys
import sha
import csv
import pprint

try:
    FILE = sys.argv[1]
except:
    sys.stderr.write('Syntax: %s DOCUMENT-ROOT-FILE.html\n' % sys.argv[0])
    sys.exit(1)
    #'/home/alexios/PROJECTS/HARDWARE/cft/documentation/latex/cft_book/cft-book-html.html'

BASEDIR = os.path.dirname(FILE)

data = open(FILE).read().replace('\n', ' ')

toc = re.findall('<a\s+href="(.+?)#.*?000+([0-9A-Z].*?)"\s+id="(.+?)">', data)

def parseTitles(toc):
    for fname, sec, id in toc:
        fname = os.path.join(BASEDIR, fname)
        # Ignore non-chapters
        if '.' in sec:
            continue
        with file(fname) as f:
            title = re.findall('<title>(.+?)</title>', f.read(1024))[0]
            yield title, fname, sec, id

toc = list(parseTitles(toc))

out = csv.writer(sys.stdout)
out.writerow(('Marker', 'UUID', 'Path', 'Title', 'Text'))

for title, fname, sec, id in toc:
    try:
        uuid = sha.sha(title).hexdigest()
        text = open(fname).read()
        # Form the path
        path = 'hardware/cft/cft-book/' + re.sub('[^a-z0-9]+', '-', title.lower())
        # Remove sectioning from the title
        title = 'The CFT Book: ' + re.sub('^[A-Z0-9.]+\s*', '', title)
        # Get the body
        text = re.split('<body\s*>', text)[1]
        text = re.split('<\s*/body\s*>', text)[0]
        text = text.strip()
        out.writerow(('NODE-START', uuid, path, title, text))
    except Exception, e:
        sys.stderr.write("Processing file %s: %s\n\n" % (fname, str(e)))
        raise



# End of file.
