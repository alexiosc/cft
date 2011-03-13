#!/usr/bin/python2.6
#coding:utf-8

"""
A microcode generator/assembler for Microcode ROMs.

Blank lines are ignored. Comments are marked with a hash (#), which cause
the rest of the line to be ignored. Everything else must be one of three
things, corresponding to these three sections:

* Conditionals: inputs to the Microcode ROM.
* Signals: outputs from the Microcode ROM.
* Microprograms: the contents of the ROM.

==Conditionals==

Conditionals are defined with the 'cond' instruction. E.g:

  cond OP:4

defines an input called OP, and is 4 bits wide. Conditionals form the input of
the MicroROM, and must be defined in order from most-significant to
least-significant address bits.

Conditionals are made up of letters, numbers, and non-whitespace characters
except colons (:) and equal signs (=).

An implicit condition 'uaddr' must always be present. Its bit width may be
freely defined. The uaddr field contains the microinstruction address. This is
also part of the ROM addressing, and is almost always defined to use the
least-significant bits of the full ROM address. (so it will probably be the
last cond encountered in the microcode source)

==Signals==

Signals are the outputs of the microcode ROM. They'll be used to drive the rest
of the CPU. Each signal has a particular bit pattern, which may be defined with
the signal keyword:

  signal /MEMIO        = 0000000000000001
  signal DATA_BUS <- A = 0000000000000010

Signal names may contain any character exept the equals sign (=), notably also
spaces (for legibility). A signal may not start with a minus sign (-).

Each signal is equivalent to a particular bit sring, which is specified in
binary to the right of the equals sign (=). The bitstring may be specified in
traditional form, or with dots (.) or hyphens (-) replacing zeroes (also for
legibility). For example, the above example may be rewritten:

  signal /MEMIO        = ...............1
  signal DATA_BUS <- A = ..............1.

The bitstring can be of arbitrary length, depending on the word width of the
microinstruction.

==Microprograms==

A microprogram starts with the ‘start’ keyword, and a comma-separated list of
conditions.

Each condition is in the form COND=NUM, where COND is one of the CPU's
conditions defined in conds. NUM is the state of that condition signal, which
can be a binary number of appropriate width for the signal (usually just 0 or
1), or X. X is the don't care value.

The microprogram will start at an address in the microcode ROM constructed by
concatenating the values of all the conditions (in their canonical order), plus
a microaddress field of 0. If one or more don't cares are specified as
conditions, the microprogram will repeat in the ROM, to account for the don't
care state. This is a good way to implement the handling of asynchronous
signalling like interrupts, such that the execute part of the instruction works
the same way regardless of the value of IRQ.

Microprogram lines after the 'start' keyword contain one microinstruction per
line. Each microinstruction is specified as a comma-separated list of signals
to set or clear, or the 'hold' keyword.

A signal NAME is set by simply typing NAME. It is cleared by typing -NAME. All
signals set are ORred together, and signals cleared are masked out.

Every microinstruction starts with all signals cleared, so the bitstring is all
zeroes. If the 'hold' keyword is specified, then any signals active in the
previous microinstruction will stay active.

For example:

  cond OP:4
  cond uaadr:3

  signal MEMIO     = ....1
  signal MREAD     = ...1.
  signal MWRITE    = ..1..
  signal MAR <- PC = .1...
  signal IR <- MEM = 1....

  start OP=XXXX # A tiny fetch instruction
    MEMIO, MREAD, MAR <- PC     # 
    hold                        # Same as MEMIO, MREAD, MAR <- PC
    hold, -MREAD, IR <- MEM     # Same as MEMIO, MAR <- PC, IR <- MEM

"""

import re
import os
import sys
import array
import pprint
import StringIO
import optparse
import subprocess

__code = """
# This is an example of microcode.

###############################################################################
#
# Conditions: fields embedded in the MicroROM address.
#
###############################################################################

cond RST:1                    # Resetting
cond IRQ:1                    # IRQ request
cond F:1                      # Fetch mode
cond OP:4                     # The opcode field of the IR.
cond I:1                      # The indirection field of the IR.
cond SKIP:1                   # The skip flag from the skip logic.

# The uaddr field of the address is mandatory. This just sets its width.
cond uaddr:4

###############################################################################
#
# Signals: outputs of the MicroROM
#
###############################################################################

signal pc++           = .......................1 # Step the PC

signal mar <- pc      = ......................1. # Latch: MAR = PC
signal mar <- operand = .....................1.. # Latch: MAR = IR.operand
signal mar <- dr      = ....................1... # Latch: MAR = DR

signal ir <- dbus     = ...................1.... # Latch: IR from data bus
signal dr <- dbus     = ..................1..... # Latch: DR from data bus

signal /dab           = .................1...... # Drive Address bus
signal /mem           = ................1....... # Memory access
signal /io            = ...............1........ # Input/Output enable
signal /mr            = ..............1......... # Memory read
signal /mw            = .............1.......... # Memory write

###############################################################################
#
# The Microcode itself.
#
###############################################################################

start IRQ=X, RST=X, F=1, OP=XXXX, I=X, SKIP=X
  MAR <- PC, /DAB, /MEM, /MR       # Drive address bus with PC
  /DAB, /MEM, /MR                  # Wait state (optional?)
  IR <- DBUS, hold                 # Latch data, keep driving.
  -/DAB, -/MEM, -/MR, PC++         # Stop driving bus. Data is now in IR.
#
  MAR <- OPERAND, /DAB, /MEM, /MR  # Drive address bus with OPERAND
  /DAB, /MEM, /MR                  # Wait state
  DR <- DBUS, hold                 # Latch data, keep driving.
  -/DAB, -/MEM, -/MR               # Stop driving. DR = mem[OPERAND].
#
  MAR <- DR, /DAB, /MEM, /MR       # Drive address bus with DR
  /DAB, /MEM, /MR                  # Wait state
  DR <- DBUS, hold                 # Latch data, keep driving.
  -/DAB, -/MEM, -/MR               # Stop driving. DR = mem[mem[OPERAND]].

"""


class MicrocodeAssembler(object):

    CPP_LOCATION = '/usr/bin/cpp'

    UINSTR_LENGTH = 24
    
    def __init__(self, options):
        self.options = options

        # Regular expressions
        self.re_comment = re.compile('(#|//).*$')

        # Internal state.
        self.fname = '?'
        self.lnum = 0
        self.want_colour = os.isatty(sys.stdout.fileno())
        self.maxuaddr = 0

        # Where's the C Preprocessor?
        self.cpp = os.environ.get('CPP', self.CPP_LOCATION)


    def ansi(self, s):
        """Mark up in colour, where available."""
        if not self.want_colour:
            return re.sub('\033\[[^m]+m', '', s)
        return s.replace('\n', '\033[0m\n')
    
    
    def pansi(self, *args):
        """Print with colour."""
        print self.ansi(' '.join(args))
        
    
    def wansi(self, *args):
        """Print with colour."""
        sys.stdout.write(self.ansi(' '.join(args)))
        
    
    def error(self, msg):
        sys.stderr.write(self.ansi("%s:%d: \033[0;1;31m%s\n" % (self.fname, self.lnum, msg)))
        sys.exit(1)
    

    def warning(self, msg):
        sys.stderr.write(self.ansi("%s:%d: \033[0;1;33mwarning: %s\n" % (self.fname, self.lnum, msg)))
    

    def proper_bin(self, x, nb=16):
        return bin(x)[2:].zfill(nb)
    

    def permute(self, a):
        if a == '':
            yield ''
        elif a[0] == 'x':
            for rest in self.permute(a[1:]):
                yield '0' + rest
                yield '1' + rest
        else:
            for rest in self.permute(a[1:]):
                yield a[0] + rest
    
    
    def set_microcode(self, addr, data, notes=''):
        addr = ''.join(addr).lower()
        try:
            self.microcode[int(addr, 2)] = (data, addr)
            return
        except ValueError:
            # There are don't-care values (X) in the address.
            for a in self.permute(addr):
                inta = int(a, 2)
                #assert a not in microcode
                if a in self.microcode:
                    self.pansi('\033[0;1;35m Overwriting address %s (0x%x).' % (a, inta))
                self.microcode[inta] = (data, addr + notes)


    def idleinstr(self):
        """Return the 'idle' instruction bitfield, i.e. one that does nothing."""
        uinstr = 0
        for instr, bits in self.signals.items():
            # Is this an active low signal?
            if instr.startswith('/'):
                uinstr |= bits
        return uinstr


    def handle_label(self, line):
        # Is there a label?
        if ':' in line:
            label, line = line.split(':', 1)
            if self.options.verbose:
                self.pansi('\033[0;1;35m%s\033[0m' % label)
        return line


    def getstatement(self, source):
        """Read the source file, yielding complete statements."""
        buf = ''
        self.lnum = 0
        for line in source:
            #print '***', self.lnum, line.rstrip()
            self.lnum += 1
            if not line:
                yield ''
                break

            # Parse line number magic comments from cpp.
            x = re.findall('^# (\d+) ".+"$', line.strip())
            if x:
                self.lnum = int(x[0])
    
            line = self.re_comment.sub('', line)
            line = line.strip()
            
            buf += ' ' + line
            while ';' in buf:
                x = buf.split(';', 1)
                yield x[0].strip()
                buf = x[1].strip()
    
        if buf:
            yield buf

        
    def process(self, fname, outfname):
        self.fname = fname

        # Initialise conditions.
        self.conds = list()
        self.condwidths = dict()
        self.signals = dict()
        self.microcode = dict()
        self.condspecs = []

        uaddr = 0
        state = 0
        uinstr = 0

        used_signals = set()

        # Spawn preprocessor.
        
        cmd = '%s %s' % (self.cpp, fname)
        source = subprocess.Popen(cmd, shell=True, bufsize=4096, stdout=subprocess.PIPE).stdout

        if self.options.preprocess:
            sys.stdout.write(source.read())
            sys.exit(0)

        for line in self.getstatement(source):
            # Skip empty lines.
            if not line:
                continue

            if line.startswith('cond'):
                if not re.match('^cond\s+([^:]+)(\s*:\s*(\d+))$', line):
                    self.error('Syntax error parsing "cond" directive.')

                try:
                    condspec = re.findall('cond\s+([^:]+)(\s*:\s*(\d+))$', line).pop()
                except:
                    error('Expected "cond SOME-COND [:BITS]"')
                condname = condspec[0].strip()
                condbits = int(condspec[2].strip() or '1')
                if condbits < 1:
                    error("Condition '%s' width must be a natural number." % (condname))
                self.conds.append(condname)
                self.condwidths[condname] = condbits
                if self.options.mappings:
                    self.pansi('# cond %s: %d' % (condname, condbits))
        
            elif line.startswith('signal'):
                try:
                    sigspec = re.findall('signal\s+(.*\S)\s*=\s*(\S+)', line).pop()
                    signame = sigspec[0].strip()
                    if signame.startswith('-'):
                        error("Signal name '%s' starts with a '-', which is not allowed." % (signame,))
                    sigbits = sigspec[1].strip()
                except:
                    error('Expected "signal SOME-SIGNAL = BIT-FIELD"')
                    
                try:
                    sigbits = re.sub('[.-]', '0', sigbits)
                    sigbits = int(sigbits, 2)
                except:
                    error('Bit field should be a binary number (. or - are aliases of 0 for readability)')
                    
                self.signals[signame.lower()] = sigbits
                if self.options.mappings:
                    self.pansi('# signal', signame, self.proper_bin(sigbits, 1))
        
            elif line.startswith('start'):
                condre = '(\w+)\s*=\s*([01xX]+)'
                if not re.match('^start\s+' + condre + '(\s*,\s*' + condre + ')*\s*$', line):
                    print line
                    self.error('Syntax error parsing "start" directive.')
                if 'uaddr' not in self.conds:
                    error("The mandatory conditional 'uaddr' has not been defined.")
                #self.pansi("Starting new microprogram.")
                self.condspecs = re.findall(condre, line)
                if not self.condspecs:
                    error('No conditions specified')
                uinstr = self.idleinstr()
                uaddr = 0
                state = 1
                if self.options.verbose:
                    print
        
            else:
                if state == 0:
                    self.error("Microcode seen before first 'start' keyword.")
                sigspec = [x.strip() for x in line.split(',')]
                if 'hold' not in sigspec:
                    uinstr = self.idleinstr()
                else:
                    sigspec = [x for x in sigspec if x != 'hold']
        
                for signal in sigspec:
                    used_signals = used_signals | set([signal.lower()])
                    enable = True
                    if signal.startswith('-'):
                        enable = False
                        signal = signal[1:].strip()

                    # If it's an active-low signal, negate the semantics.
                    if signal.startswith('/'):
                        enable = not enable
                        pass
        
                    try:
                        if enable:
                            uinstr |= self.signals[signal.lower()]
                        else:
                            uinstr &= ~self.signals[signal.lower()]
        
                    except KeyError:
                        self.error("Unknown signal name '%s'." % signal)
        
                # Output the microcode line.
                #self.pansi(condspecs + [('uaddr', bin(uaddr)[2:])], signals)
        
                # Prepare for encoding.
                d = dict()
        
                # Add the microaddress to the conditions.
                self.condspecs.append(('uaddr', self.proper_bin(uaddr, self.condwidths['uaddr'])))
        
                # Turn the conditions into a dictionary.
                for sig, val in self.condspecs:
                    d[sig] = val # self.proper_bin(val, self.condwidths[sig])
                    
                # Order the conditions using the order of conds
                romaddr = list()
                for c in self.conds:
                    try:
                        assert c in d
                        if len(d[c]) != self.condwidths[c]:
                            error("Condition '%s' should specify exactly %d bits, %d seen instead." % (c, self.condwidths[c], len(d[c])))
                        romaddr.append(d[c])
                    except (AssertionError, KeyError):
                        self.error("Missing value for condition '%s'" % c)
        
                # Print out the conditions.
                if self.options.verbose:
                    for c in self.conds:
                        self.wansi('%s:\033[1;32m%s\033[0m ' % (c, d[c]))
                    self.wansi(': \033[1;33m%s\033[0m ; %s' % (bin(uinstr)[2:].zfill(self.UINSTR_LENGTH), line))
                    print
                    
                # Write to the ROM.
                self.set_microcode(romaddr, uinstr, (' %-40s ' % ' '.join(sigspec)))
        
                uaddr += 1
                self.maxuaddr = max(self.maxuaddr, uaddr)
                if uaddr > (1 << self.condwidths['uaddr']):
                    uaddr = uaddr & ((1 << self.condwidths['uaddr']) - 1)
                    self.warning("uaddr wraps around to zero after this microinstruction.")

        unused_signals = set(self.signals.keys()) - used_signals
        if unused_signals:
            for a in unused_signals:
                self.warning('Unused signal "%s".' % a)
        
        self.totalconds = sum(self.condwidths.values())
        self.romsize = 1 << self.totalconds
        self.totalsigs = max(len(bin(x)) for x in self.signals.values()) - 2
        self.numroms = (self.totalsigs + 8) // 8

        if self.options.stats:
            slackbits = 0
            usedbits = 0
            x = self.maxuaddr
            while x:
                usedbits += 1
                x = x >> 1

            self.pansi('\n')
            self.pansi('# Biggest microprogram:      %3d microinstructions' % (self.maxuaddr,))
            self.pansi('# Uaddr width:               %3d bits' % self.condwidths['uaddr'])
            self.pansi('# Uaddr should be:           %3d bits wide' % usedbits)
            self.pansi('# Unneeded uaddr bits:       %3d bits' % (self.condwidths['uaddr'] - slackbits))
            self.pansi('# Total address bits needed: %3d (%d bytes)' % (self.totalconds, self.romsize))
            self.pansi('# Total data bits needed:    %3d (%d ROM ICs in parallel)' % (self.totalsigs, self.numroms))
        
        if self.options.dump:
            self.dump()
        if self.options.vhdl:
            self.vhdl()

        # Write the ROM dumps.
        self.writeroms(outfname)
        if self.options.verilog:
            self.writeroms_verilog(outfname)


    def dump(self):
        """Dump the microcode ROMs."""
        idle = self.idleinstr()
        for addr in range(self.romsize):
            data, pattern = self.microcode.get(addr, (idle, '------------'))
            
            bytedata = list()
            d = data
            for x in range(self.numroms):
                bytedata.insert(0, '%02x' % (d & 0xff))
                d = d >> 8
            bytedata = ' '.join(bytedata)

            self.pansi("%06x: %s ; %s => %s " % (addr, bytedata, pattern,
                                                 self.proper_bin(data, self.totalsigs)))


    def vhdl(self):
        """Dump the microcode ROMs as VHDL."""
        for addr in range(self.romsize):
            data = self.microcode.get(addr, 0)
            
            bytedata = list()
            d = data
            for x in range(self.numroms):
                bytedata.insert(0, '%02x' % (d & 0xff))
                d = d >> 8
            bytedata = ' '.join(bytedata)

            data = self.proper_bin(data, self.totalsigs)
            
            self.pansi("  d <= \"%s\" when a=\"%s\" and oe='0' and ce='0' else" % \
                           (data, self.proper_bin(addr, self.totalconds)))

        self.pansi("  d <= \"%s\";" % ('Z' * self.totalsigs))


    def writeroms(self, outfname):
        """Write one binary file per microcode ROM."""
        for nrom in range(self.numroms):
            fname = '%s-%02d.bin' % (outfname, nrom)
            shift = 8 * nrom
            mask = 0xff << shift
            print "Writing %s... (mask %x)" % (fname, mask)
            outdata = array.array('c')
            idle = self.idleinstr()
            for addr in range(self.romsize):
                data, pattern = self.microcode.get(addr, (idle, '------------'))
                outdata.append(chr((data & mask) >> shift))
            outdata.tofile(open(fname, 'wb'))


    def writeroms_verilog(self, outfname):
        """Write one binary file per microcode ROM in Verilog binary
        (human-readable binary, that is) format."""
        for nrom in range(self.numroms):
            fname = '%s-%02d.list' % (outfname, nrom)
            shift = 8 * nrom
            mask = 0xff << shift
            print "Writing %s... (mask %x)" % (fname, mask)
            outdata = array.array('c')
            f = open(fname, 'w')
            idle = self.idleinstr()
            for addr in range(self.romsize):
                data, pattern = self.microcode.get(addr, (idle, '------------'))
                f.write('%s // addr=%04x\n' % \
                            (bin((data & mask) >> shift)[2:].zfill(8),
                             addr))
            f.close()


p = optparse.OptionParser()
p.add_option('-d', '--dump', action='store_true',
             help='Print out raw hex values for the entire microcode ROM.')
p.add_option('-m', '--mappings', action='store_true',
             help='Print out the symbol to bit mappings for conditions and signals.')
p.add_option('-o', '--out', metavar='FILENAME',
             help='Output object file to FILENAME.')
p.add_option('-p', '--preprocess', action='store_true',
             help='Preprocess to standard output and stop. Useful for debugging preprocessing bugs.')
p.add_option('-s', '--stats', action='store_true',
             help='Print out statistics about the assembled microcode ROM.')
p.add_option('-V', '--vhdl', action='store_true',
             help='Print out the ROM as a VHDL code fragment.')
p.add_option('-e', '--verilog', action='store_true',
             help='Print out the ROM as one or more verilog binary list files.')
p.add_option('-v', '--verbose', action='store_true',
             help='Print out assembled microcode in human-readable format.')

(options, args) = p.parse_args()

#code = StringIO.StringIO(code)
#fname = 'example.ucode'

def die(x):
    sys.stderr.write('%s: %s\n' % (sys.argv[0], x))
    sys.exit(1)
    
if not args:
    die('An input file must be provided.')
    
for arg in args:
    try:
        outname = options.out or os.path.splitext(arg)[0]
        MicrocodeAssembler(options).process(arg, outname)

    except IOError, e:
        die('reading %s: %s' % (arg, e))
    
# End of file.
