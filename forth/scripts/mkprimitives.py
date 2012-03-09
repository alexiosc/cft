#!/usr/bin/env python

import re, sys, os

tty = os.isatty(sys.stdout.fileno())

HEADER = """// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// FORTH PRIMITIVES
//
// WARNING: Generated automatically from primitives/*.asm using
// mkprimitives.py. Do not modify directly.
//
///////////////////////////////////////////////////////////////////////////////

_primitive_dict:
"""

NEWFILE = """

///////////////////////////////////////////////////////////////////////////////
//
// FILE: %(source)s
//
///////////////////////////////////////////////////////////////////////////////

"""


ENTRY_LOCALNAME = """
        ;;   word %(name)s defined in %(source)s:%(linenum)d.
//dwn_%(label)s:
//        .strn "%(namerep)s"
dw_%(label)s_head:
        .word %(flags)-17s ; Flags
        .word dwn_%(label)-13s ; Pointer to word name (above)
        .word %(link)-17s ; Link to previous dictionary entry
dw_%(label)s:
        %(handler)-17s ; Code entry point: next instruction
dw_%(label)s_pfa:
"""


ENTRY_NAMETABLE = """
        ;;   word %(name)s defined in %(source)s:%(linenum)d.
dw_%(label)s_head:
        .word %(flags)-17s ; Flags
        .word dwn_%(label)-13s ; Pointer to word name (above)
        .word %(link)-17s ; Link to previous dictionary entry
dw_%(label)s:
        %(handler)-17s ; Code entry point: next instruction
dw_%(label)s_pfa:
"""


NAME = """dwn_%(label)s:\n\t\t.strn "%(namerep)s"
"""


FOOTER = """
.equ __lastromlink %(link)s

// End of file.
"""


WORDTABLE_HEADER = """
// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// FORTH PRIMITIVES
//
// WARNING: Generated automatically from primitives/*.asm using
// mkprimitives.py. Do not modify directly.
//
///////////////////////////////////////////////////////////////////////////////

_word_dict:
"""


WORDTABLE_FOOTER = """

// End of file.
"""



PAT = r'\.word\s+_rom_(\w+)\s+;\s*(.+)\n'

vectors = list()
link = 'NULL'
primnum = 0
name, flags = None, -1
handler = '@+1'
names = set([])
nametable = list()
print HEADER

def fail(msg, locals):
    sys.stderr.write(("\n%(source)s:%(linenum)d:" + msg + "\n")  % locals)
    sys.exit(1)


vectable = []
for source in sys.argv[1:]:
    print NEWFILE % locals()
    sys.stderr.write('(%s) ' % source)
    for i, line in enumerate(open(source)):
        linenum = i + 1
        print line.rstrip()
        x = re.findall(';+\s*word:\s*(\S+)', line)
        if x:
            name = x[0]
            alias = None
            copyof = None
            primnum += 1
            continue
        x = re.findall(';+\s*alias:\s*(.+)\s*', line)
        if x:
            alias = x[0]
        x = re.findall(';+\s*copy:\s*(.+)\s*', line)
        if x:
            copyof = x[0]
        x = re.findall(';+\s*flags:\s*(.+)\s*', line)
        if x:
            flags = re.sub('([A-Za-z]+)', 'FFL_\\1', x[0])
            flags = re.sub('(FFL_)+', 'FFL_', flags)
            if name:
                if name in names:
                    fail("Primitive '%(name)s' already defined.", locals())
                if re.match('[^A-Za-z0-9_-]', name) and not alias:
                    fail("Name '%(name)s' needs an alias.", locals())
                if alias and re.match('[^A-Za-z0-9_-]', alias):
                    fail("Alias '%(alias)s' is not a valid Assembly identifier." , locals())
                    
                alias = alias or name
                names = names | set([name])
                #label = re.sub('[^A-Za-z0-9_]', '_', alias.upper() or name)
                label = re.sub('[^A-Za-z0-9_]', '_', alias or name)

                if 'FFL_DOCOL' in flags:
                    handler = 'CFA_doCOL'
                elif 'FFL_VARIABLE' in flags:
                    handler = 'CFA_doVAR'
                elif copyof:
                    #handler = '@dw_%s+1' % re.sub('[^A-Za-z0-9_]', '_', copyof.upper() or name)
                    handler = '@dw_%s' % re.sub('[^A-Za-z0-9_]', '_', copyof or name)
                else:
                    #handler = 'JMP dw_%s_pfa' % label
                    handler = '; None (code word -- fall through)'

                # Start a new dictionary entry
                if tty:
                    sys.stderr.write("\033[1m%s\033[0m " % name)
                else:
                    sys.stderr.write("%s " % name)
                #namerep = name.upper().replace('"', '" 34 "')
                namerep = name.replace('"', '" 34 "')
                namerep = re.sub('34 \"$', '34', namerep)
                nametable.append(NAME % locals())
                print ENTRY_NAMETABLE.strip('\n') % locals()
                link = 'dw_%(label)s_head' % locals()
                vectable.append((label, link))
    sys.stderr.write('\n')

print FOOTER.rstrip() % locals()
#sys.stderr.write('\n')

# Output all the strings together.
print ''.join(nametable)


# Output the word vector table

#f = open('_generated_dwtable.asm', 'w')
#f.write(WORDTABLE_HEADER)
#for name, addr in vectable:
#    name = 'DW_' + name + ':'
#    f.write('%(name)-15s .word %(addr)s\n' % locals())
#f.write(WORDTABLE_FOOTER)

# End of file.
