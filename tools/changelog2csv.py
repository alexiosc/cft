#!/usr/bin/python

import re
import sys
import csv
import sha

allTags = set()

out = csv.writer(sys.stdout)
out.writerow(('UUID', 'Date', 'Name', 'Email', 'Completion', 'Tags', 'Title', 'Text'))

abbrs = {
    'book': 'CFT Book',
    'case': 'Case',
    'changelog': 'Changelog',
    'code': 'Coding',
    'coding': 'Coding',
    'com': 'Common',
    'cons': 'Construction',
    'control_bus': 'Control Bus',
    'controller': 'Controller',
    'cross-assembler': 'Cross-Assembler',
    'ctn': 'Clock/Timer/NVRAM Board',
    'deb': 'Debugging Board',
    'des': 'Design',
    'dfp': 'Debugging Front Panel',
    'doc': 'Documentation',
    'emulator': 'Emulator',
    'extra': 'Extra',
    'fdc': 'Floppy Drive Controller',
    'filesystem': 'Filesystem',
    'firmware': 'Firmware',
    'forth': 'Forth',
    'gallery': 'Gallery',
    'hardware': 'Hardware',
    'iob': 'I/O Board',
    'led_boards': 'LED Boards',
    'light_assembly': 'Light Assembly',
    'mem': 'Memory Board',
    'meta': 'Meta',
    'microcode': 'Microcode',
    'milestone': 'Milestone',
    'milestones': 'Milestone',
    'misc': 'Miscellaneous',
    'orders': 'Orders',
    'pb0': 'Processor Board 0',
    'pb1': 'Processor Board 1',
    'pb2': 'Processor Board 2',
    'pb3': 'Processor Board 3',
    'pfp': 'Programmer\'s Front Panel',
    'prep': 'Preparation',
    'progress': 'Progress',
    'prototyping board': 'Prototyping Board',
    'refcard': 'Reference Card',
    'rom': 'ROM',
    'routing': 'Routing',
    'sch': 'Schematics',
    'schematic': 'Schematics',
    'setback': 'Setbacks',
    'sim': 'Simulation',
    'snd': 'Sound Board',
    'psg': 'AY-3-8912 Sound Board',
    'software': 'Software',
    'spj': 'SpeakJet',
    'switch_assembly': 'Switch Assembly',
    'test': 'Testing',
    'testing': 'Testing',
    'tools': 'Tools',
    'vdu': 'Video Display Board',
    'web': 'Website',
    }

def processTags(tags):
    # Parse completion string
    completion = ''
    try:
        x = re.search('=(\d+)', tags)
        #print "*******", tags, x and x.groups() or '-'
        completion = x.groups()[0]
        tags = re.sub('=\d+', '', tags)
    except AttributeError:
        pass

    tags = tags.replace('/', '>')
        
    x = []
    for tag in re.split('[,>]+', tags):
        tag = tag.strip().lower()
        x.append('CFT>' + ((abbrs.get(tag) or tag)))
    global allTags
    allTags |= set(x)
    return completion, ';'.join(['CFT'] + x)
        

def shipout(sn, date, name, email, tags, descr):
    # if not d:
    #     return
    # d = re.sub('\s+', ' ', d).strip()
    # if re.match('^\s+$', d):
    #     return
    # x = re.match('^\s*\[(.+?)\]\s+(.+?)\s*$', d)
    # #print "%s: (%s)" % (date, d)
    # try:
    #     tags, descr = x.groups()
    # except:
    #     print "***", d
    #     raise
    
    uuid = sha.sha(str((sn, date))).hexdigest()
    #descr = descr.strip().replace('\n\n', '\n\n<p>')
    descr = re.sub('\s+', ' ', descr.strip()).rstrip('.') + '.'
    completion, tags = processTags(tags)

    # Currently using the first tag as the title (which isn't displayed)
    title = 'CFT Progress Log: %s (%s)' % (date, tags.split(';')[1].split('>', 1)[-1])
    out.writerow((uuid, date, name, email, completion, tags, title, descr))
    #print "---"

# Example input:
#
# 2014-03-24  AC <alexios@bedroomlan.org>
#
#	[Des/Hardware/Case] More work on the case design.
#
#	[Orders] Ordered hardware needed to fix the backplane in place (and
#	provide power to it).

date, name, email, tags, descr = [''] * 5
sn = 0

for line in sys.stdin:

    # Beginning of a new date.
    x = re.match('^(2\d\d\d-\d\d-\d\d)\s+(.+?)\s+<(.+?)>\s*', line)
    # Start of entry
    y = re.match('^\s+\[(.+?)\]\s+(.+)$', line)
    # Continuation of entry
    z = re.match('^\s+(.+)\s*$', line)
    if x:
        # Start of new date
        if date and descr:
            shipout(sn, date, name, email, tags, descr)
        sn = 0
        date, name, email = x.groups()
        descr = ''
        #print "1:", line.strip()
    elif y:
        # Start of entry
        sn += 1
        if date and descr:
            shipout(sn, date, name, email, tags, descr)
        tags, descr = y.groups()
        #print "2:", line.strip()
    else:
        if date and descr:
            descr += line
        #print "3:", line.strip()

if date and descr:
    for d in descr.split('\n\n'):
        shipout(sn, date, name, email, tags, descr)

#import pprint
#for a in  sorted(list(allTags)):
#    print "    '%s': ''," % (a)

# End of file.
