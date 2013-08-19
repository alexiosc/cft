#!/usr/bin/env python

import re, sys, os

tty = os.isatty(sys.stderr.fileno()) and \
    os.environ.get('TERM', 'dumb') != 'dumb'

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


VOCAB = """

	.equ _voc_%(vocabulary)s %(link)s




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; START NEW VOCABULARY: %(newvocab)s
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

"""


ENTRY_LOCALNAME = """
        ;;   word %(name)s defined in %(source)s:%(linenum)d.
//dwn_%(label)s:
//        .strp "%(namerep)s" 0
dw_%(label)s_head:
        .word %(flags)-17s %(hash)d ; Flags & hash
        .word dwn_%(label)-13s ; Pointer to word name (above)
        .word %(link)-17s ; Link to previous dictionary entry
dw_%(label)s:
        %(handler)-17s ; Code entry point: next instruction
dw_%(label)s_pfa:
"""


ENTRY_NAMETABLE = """
        ;;   word %(name)s defined in %(source)s:%(linenum)d.
//dwn_%(label)s:
//        .strp "%(namerep)s" 0
dw_%(label)s_head:
        .word %(flags)-17s %(hash)d ; Flags & hash
        .word dwn_%(label)-13s ; Pointer to word name (above)
        .word %(link)-17s ; Link to previous dictionary entry
dw_%(label)s:
        %(handler)-17s ; Code entry point: next instruction
dw_%(label)s_pfa:
"""


NAME = """dwn_%(label)s:\n\t\t.strp "%(namerep)s" 0
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
aliases = set([])
nametable = list()
print HEADER

def fail(msg, locals):
    sys.stderr.write(("\n%(source)s:%(linenum)d:" + msg + "\n")  % locals)
    sys.exit(1)

HASHBITS = 3
hashes = [0] * (1 << HASHBITS)

vocabulary = ''
vectable = []
numfiles = 0
numwords = 0
numcopies = 0

try:
    maxnum = int(os.environ['MAXNUM'])
except:
    maxnum = 9999

for source in sys.argv[1:]:
    try:
        num = int(os.path.basename(source).split('_')[0])
        if num > maxnum:
            continue
    except:
        pass
    print NEWFILE % locals()
    sys.stderr.write('(%s) ' % source)
    numfiles += 1
    for i, line in enumerate(open(source)):
        linenum = i + 1
        print line.rstrip()
        x = re.findall(';+\s*vocab(ulary)?:\s*(\S+)', line)
        if x:

            # if vocabulary:
            #     hash = (len(vocabulary) ^ ord(vocabulary[0])) & ((1 << HASHBITS) - 1)
            #     hashes[hash] = hashes[hash] + 1
            #     print ENTRY_NAMETABLE % dict(
            #         name=vocabulary,
            #         source=source,
            #         linenum=linenum,
            #         label=vocabulary,
            #         namerep=vocabulary,
            #         flags='FFL_T_VAR FFL_ROM',
            #         link=link,
            #         handler='CFA_doVOC()',
            #         )
            #     print '\t.word %s' % link
                   
            newvocab = x[0][1]
            print VOCAB % locals()
            vocabulary = x[0][1]
            link = 'NULL'

            if tty:
                sys.stderr.write("\033[0;1m Vocab: %s \033[0m " % vocabulary)
            else:
                sys.stderr.write("%s " % vocabulary)

            continue

        x = re.findall(';+\s*word:\s*(\S+)', line)
        if x:
            numwords += 1
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
            flags = flags.replace('FFL_CODE', 'FFL_T_CODE')
            flags = flags.replace('FFL_DOCOL', 'FFL_T_DOCOL')
            flags = flags.replace('FFL_VARIABLE', 'FFL_T_VAR')
            flags = flags.replace('FFL_VAR', 'FFL_T_VAR')
            flags = flags.replace('FFL_CONST', 'FFL_T_CONST')
            flags = flags.replace('FFL_USER', 'FFL_T_USER')
            flags = flags.replace('FFL_DATA', 'FFL_T_DATA')

            if name:
                if name in names:
                    fail("Primitive '%(name)s' already defined.", locals())
                if alias in aliases:
                    fail("Primitive alias '%(alias)s' already defined.", locals())
                if re.match('[^A-Za-z0-9_-]', name) and not alias:
                    fail("Name '%(name)s' needs an alias.", locals())
                if alias and re.match('[^A-Za-z0-9_-]', alias):
                    fail("Alias '%(alias)s' is not a valid Assembly identifier." , locals())

                # A simple 4-bit hash used to speed up dictionary searches.
                hash = (len(name) ^ ord(name[0])) & ((1 << HASHBITS) - 1)
                hashes[hash] = hashes[hash] + 1
                    
                alias = alias or name
                names = names | set([name])
                aliases = aliases | set([alias])
                #label = re.sub('[^A-Za-z0-9_]', '_', alias.upper() or name)
                label = re.sub('[^A-Za-z0-9_]', '_', alias or name)

                if 'FFL_T_CODE' in flags:
                    handler = '; None (code word -- fall through)'
                    col = '1;32'
                elif 'FFL_T_DOCOL' in flags:
                    handler = 'CFA_doCOL()'
                    col = '1;35'
                elif 'FFL_T_VAR' in flags:
                    handler = 'CFA_doVAR()'
                    col = '1;33'
                elif 'FFL_T_CONST' in flags:
                    handler = 'CFA_doCONST()'
                    col = '1;34'
                elif 'FFL_T_USER' in flags:
                    handler = 'CFA_doUSER()'
                    col = '1;36'
                elif 'FFL_VOCAB' in flags:
                    flags = flags.replace('FFL_VOCABULARY', 'FFL_T_VAR')
                    flags = flags.replace('FFL_VOCAB', 'FFL_T_VAR')
                    handler = 'CFA_doVOC()'
                    col = '0;7'
                    
                if copyof:
                    #handler = '@dw_%s+1' % re.sub('[^A-Za-z0-9_]', '_', copyof.upper() or name)
                    handler = 'JMP dw_%s' % re.sub('[^A-Za-z0-9_]', '_', copyof or name)
                    col = '1;31'
                    numcopies += 1

                # Start a new dictionary entry
                if tty:
                    sys.stderr.write("\033[0;%sm%s\033[0m " % (col, name))
                else:
                    sys.stderr.write("%s " % name)
                namerep = name.upper()
                #namerep = name.upper().replace('"', '" 34 "')
                #namerep = name.replace('"', '" 34 "')
                #namerep = re.sub('34 \"$', '34', namerep)
                namerep = namerep.upper()
                namerep = namerep.replace('\\', '\\\\')
                namerep = namerep.replace('"', '\\"')
                nametable.append(NAME % locals())
                print ENTRY_NAMETABLE.strip('\n') % locals()
                link = 'dw_%(label)s_head' % locals()
                vectable.append((label, link))
    sys.stderr.write('\n')

if vocabulary:
    newvocab = 'EOF'
    print VOCAB % locals()

print FOOTER.rstrip() % locals()
#sys.stderr.write('\n')

# Output all the strings together.
print ''.join(nametable)
sys.stderr.write('\nOutput:\n')
sys.stderr.write('  Source files parsed: %5d\n' % numfiles)
sys.stderr.write('  Words parsed:        %5d\n' % numwords)
sys.stderr.write('  Of which copies:     %5d\n' % numcopies)
sys.stderr.write('  Hash bucket counts:        (%s)\n' % (', '.join(str(x) for x in hashes),))
sys.stderr.write('\n')


# Output the word vector table

#f = open('_generated_dwtable.asm', 'w')
#f.write(WORDTABLE_HEADER)
#for name, addr in vectable:
#    name = 'DW_' + name + ':'
#    f.write('%(name)-15s .word %(addr)s\n' % locals())
#f.write(WORDTABLE_FOOTER)

# End of file.
