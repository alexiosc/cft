# -*- python -*-

import sys
import time
import array

def mybin(x, zf=4):
    """Format a number as a prefix-less binary number padded to zf bits.

    >>> mybin(1, 1)
    '1'
    >>> mybin(5, 6)
    '000101'
    >>> mybin(255, 1)
    '11111111'
    """
    return bin(x)[2:].zfill(zf)


def unpackbits(x, numbits):
    """Unpacks bits into an iterable, where item 0 is the LSB.

    >>> unpackbits(7, 8)
    [1, 1, 1, 0, 0, 0, 0, 0]
    >>> unpackbits(25, 8)
    [1, 0, 0, 1, 1, 0, 0, 0]
    """
    # We cheat here too!
    return list(reversed([ int(x) for x in mybin(x, numbits) ]))
    

def selectbits(x, bits):
    """
    Construct a number made up by contatenating the specified bits of
    x in the order given. The order of bits is MSB-to-LSB.

    >>> mybin(selectbits(25, [0]), 4)
    '0001'
    >>> mybin(selectbits(25, [0, 1, 0, 1]), 4)
    '1010'
    >>> mybin(selectbits(25, [0, 0, 0, 0, 1, 2, 3, 4]), 8)
    '11110011'
    >>> selectbits(25, [0, 0, 0, 0, 1, 2, 3, 4])
    243
    """
    xs = list(reversed(mybin(x, 256)))
    num = ''.join(xs[i] for i in bits)
    return int('0b' + num, 2)


def packbits(spec, args):
    """Packs bits according to spec.

    >>> bin(packbits((1, 2), (0b0, 0b11)))
    '0b11'

    >>> bin(packbits((2, 2), (0b0, 0b11)))
    '0b11'

    >>> bin(packbits((2, 8), (0b11, 0b11001)))
    '0b1100011001'

    >>> bin(packbits((1, 1, 1, 3), (1, 0, 1, 7)))
    '0b101111'
    """
    # We cheat!
    val = '0b'
    for bits, x in zip(spec, args):
        mask = (1 << bits) - 1
        if x > mask:
            raise ValueError('Value %d does not fit in %d bits.' % (x, bits))
        if x < 0:
            raise ValueError('Value %d is negative.' % x)
        val += mybin(x, bits)
    return int(val, 2)


class Rom(object):
    """
    Define a ROM used as a table.
    """
    def __init__(self, abits, dbits, sentinel=0):
        # Choose the right type
        self.sanity = array.array('B')
        if dbits <= 8:
            self.data = array.array('B')
        elif dbits <= 16:
            self.data = array.array('H')
        elif dbits <= 32:
            self.data = array.array('L')
        else:
            raise ValueError('This ROM is too wide, use dbits <= 32.')

        # Make the entire ROM
        #print "Generating a ROM %dx%d bits (%d entries)\n" % (abits, dbits, 1 << abits)
        self.sentinel = sentinel
        self.data.fromlist([self.sentinel] * (1 << abits))
        self.sanity.fromlist([0] * (1 << abits))
        self.dbits = dbits
        self.abits = abits
        self.amax = self.amask = (1 << abits) - 1
        self.dmax = self.dmask = (1 << dbits) - 1
        self.curaddr = 0

        self.checksum = 0xffff


    @property
    def part(self):
        """
        Return an approximate part type for this ROM.
        """
        width = (self.dbits + 7) // 8
        if width == 1:
            return {
                10:'2x08',
                11:'2x16',
                12:'2x32',
                13:'2x64',
                14:'2x128',
                15:'2x256',
                16:'2x512',
                17:'2x010',
                18:'2x020',
                19:'2x040',
                20:'2x080',
                }.get(self.abits, 'unknown part')
        return 'unknown part'

    
    def __repr__(self):
        return '[ROM: %d x %d bits (%s), checksum %04x]' % \
            (self.abits, self.dbits, self.part, self.checksum & 0xffff)


    def writeBin(self, f):
        """
        Write the ROM binary image to a filename or file-like object f.
        """
        try:
            f = open(f, 'wb')
        except TypeError:
            pass
        self.data.tofile(f)


    def writeVerilog(self, f):
        """
        Write the ROM image to a Verilog 'bin' file (binary values in
        human-readable form).
        """
        dbits = 8 * ((self.dbits + 7) >> 3)
        try:
            f = open(f, 'w')
        except TypeError:
            pass
        fmt = '%%0%ds // addr=%%0%ds\n' % (dbits, self.abits)
        for addr, datum in enumerate(self.data):
            f.write('%s // addr %s\n' % (mybin(datum, dbits), mybin(addr, self.abits)))
        f.close()


    def writeVerilogROMs(self, stem):
        """
        Write multiple ROM images using the file stem stem. Each ROM contains 8
        bits.
        """
        for byte in range((self.dbits + 7) // 8):
            shift = 8 * byte
            fname = '%s-%02d.list' % (stem, byte)
            f = open(fname, 'w')

            for addr, datum in enumerate(self.data):
                f.write('%s // addr %x\n' % \
                            (mybin((datum >> shift) & 0xff, 8), addr))
            f.close()


    def put(self, a, d):
        """
        Set a value.
        """
        if a < 0 or a > self.amax:
            raise ValueError('Address %d out of bounds' % a)
        if d < 0 or d > self.dmax:
            raise ValueError('Data %d out of bounds' % d)

        addr = a & self.amask
        
        if self.sanity[addr] and self.data[addr] != d:
            raise ValueError('Overwriting previously defined value at address %d (%d/%d)' % \
                                 (addr, d, self.data[addr]))

        self.sanity[addr] = 1
        self.data[addr] = d & self.dmask


    def push(self, d):
        """
        Set a value.
        """
        self.put(self.curaddr, d)
        self.curaddr += 1


    def calc_checksum(self):
        """
        Calculate the checksum.
        """
        self.checksum = 0
        for i in range(self.amax):
            self.checksum = self.checksum + (self.data[i] << (i % 8))
        return self.checksum


class FunctionTable(object):
    """
    Store a function in one or more ROMs.
    
    The inputs and outputs are specified as strings in the form 'name:bits
    name:bits name:bits' in MSB to LSB order. The ':bits' part may be left out,
    in which case ':1' is implied.
    """
    def __init__(self, inputs, outputs, singleROM=False):
        self.inputspec = inputs
        self.outputspec = outputs
        self.inputs = self.parse_bitspec(inputs)
        self.outputs = self.parse_bitspec(outputs)
        self.roms = []
        self.created = time.time()
        self.reported = time.time()
        self.puts = 0

        self.ibits = sum(x[1] for x in self.inputs)
        self.obits = sum(x[1] for x in self.outputs)

        # Make a ROM big enough for everything.
        if singleROM:
            self.rom(' '.join(x[0] for x in self.inputs),
                     ' '.join(x[0] for x in self.outputs))


    def rom(self, inputs=None, outputs=None):
        """
        Add a ROM to hold a subset of this function's inputs and outputs. The
        dafault is to use the entire input and output domain/range.

        If either argument 'inputs' or 'outputs' is provided, it must be in
        bitlist format (e.g. "op a b/1-3").

        >>> f = FunctionTable('op:3 a:16', 'y:16')
        >>> f.rom()
        >>> f.roms
        [([ROM: 19 x 16 bits], 'op a', 'y')]

        >>> f = FunctionTable('op:3 a:16', 'y:16')
        >>> f.rom('op a/7-0', 'y/7-0')
        >>> f.rom('op a/15-8', 'y/15-8')
        >>> len(f.roms)
        2
        >>> f.roms[0]
        ([ROM: 11 x 8 bits], 'op a/7-0', 'y/7-0')
        >>> f.roms[1]
        ([ROM: 11 x 8 bits], 'op a/15-8', 'y/15-8')
        """
        # Provide defaults
        if not inputs:
            inputs = ' '.join(x[0] for x in self.inputs)
        if not outputs:
            outputs = ' '.join(x[0] for x in self.outputs)

        # Check the ROM domain and range.
        rominp = list(self._expand_bitlist(self.inputs, inputs))
        romoutp = list(self._expand_bitlist(self.outputs, outputs))

        # Sum up the bits.
        numinbits = sum([len(x[1]) for x in list(rominp)])
        numoutbits = sum([len(x[1]) for x in list(romoutp)])
        
        # Instantiate the ROM, and keep the bitlists for later.
        self.roms.append((Rom(numinbits, numoutbits), inputs, outputs))


    def bin(self, s):
        """
        Convert a binary string in ASCII form to a number. The string is given
        MSB-first.

        >>> f = FunctionTable('op:3 a:16', 'y:16')
        >>> f.bin(23)
        '10111'
        """
        try:
            return bin(s)[2:]
        except NameError:
            # Provide pre-2.6 compatibility
            retval = 0
            for bit in s:
                if s == '1':
                    retval = (retval << 1) | 1
                elif s != '0':
                    raise ValueError("Binary string expected (should only contain '0' and '1'.")
            return retval


    def get_field(self, domain, name_to_find):
        """
        Return the 4-tuple of a field of a domain, specified by its name.

        >>> f = FunctionTable('op:3 a:16', 'y:16')
        >>> f.get_field(f.inputs, 'op')
        ('op', 3, 7, 16)
        >>> f.get_field(f.outputs, 'y')
        ('y', 16, 65535, 0)
        >>> f.get_field(f.outputs, 'spam')
        Traceback (most recent call last):
        ...
        KeyError: "Field 'spam' not found"
        """
        for name, bits, mask, shift in domain:
            if name_to_find == name:
                return name, bits, mask, shift
        raise KeyError("Field '%s' not found" % name_to_find)


    def parse_bitspec(self, bitspec):
        """
        Parse a bitspec and return it as a list of 4-tuples (name, bits, shift,
        mask).

        A bitspec looks like "op:3 a:8 b:8 c": a space-delimited collection of
        name:width pairs. The name is the name of a variable or bus and the
        width is in bits. If the width (and colon) is left out, the default
        width is one bit.

        BITSPEC :== SPEC | SPEC " " BITSPEC
        SPEC :== NAME ":" BITS
        NAME :== Any alphanumeric sequence
        BITS :== Positive integeree

        >>> f = FunctionTable('', '')
        >>> f.parse_bitspec('op:3 a b:15')
        [('op', 3, 7, 16), ('a', 1, 1, 15), ('b', 15, 32767, 0)]
        """
        def parse(bitspec):
            for spec in bitspec.split():
                try:
                    name, bits = spec.split(':', 1)
                    yield name, int(bits)
                except ValueError:
                    yield spec, 1
                except TypeError:
                    raise ValueError('Bit specs should be integers.')

        def calcshifts(parsed):
            shift = 0
            # Process in reversed order
            for name, bits in reversed(list(parsed)):
                mask = (1 << bits) - 1
                yield name, bits, mask, shift
                shift += bits

        # Calcshifts returns the result in reverse order: reverse it back so
        # it's in MSB-to-LSB order.
        return list(reversed(list(calcshifts(parse(bitspec)))))


    def parse_vector(self, domain, partial, **kwargs):
        """
        Parse a list of names in the input or output domain.
        
        >>> f = FunctionTable('op:3 a:16', 'y:16')
        >>> hex(f.parse_vector(f.inputs, True, op=5, a=0x1234))
        '0x51234'
        """
        # Sanity checks
        fields = set(kwargs.keys())
        domain_fields = set(x[0] for x in domain)
        if not fields.issubset(domain_fields):
            raise ValueError('Some of the specified fields do not exist in this domain.')
        if partial and fields != domain_fields:
            raise ValueError('All fields in the domain must be specified!')
        retval = 0
        for name, bits, mark, shift in domain:
            val = 0
            val = kwargs.get(name, 0)

            # Sanity check
            if val & ~((1 << bits) - 1):
                raise ValueError('Value %d for field %s does not fit in %d bits.' % (val, name, bits))
            
            retval = (retval << bits) | kwargs.get(name, 0)

        return retval


    def _parse_range(self,maxbits, bitlist):
        retval = []
        for item in bitlist.split(','):
            # Parse a single bit.
            if '-' not in item:
                try:
                    x = int(item)
                    # Sanity check
                    if x < 0 or x >= maxbits:
                        raise ValueError("Bit '%s' is out of range (should be 0 to %d).",
                                         item, maxbits-1)

                    retval.append(x)
                        
                except TypeError:
                    raise ValueError("Bit specification '%s' is invalid.", item)

                continue

            try:
                high, low = item.split('-')
                high = int(high)
                low = int(low)
            except TypeError:
                raise ValueError("Range specification '%s' is invalid.", item)

            # Sanity check
            if low < 0 or high < 0 or low >= maxbits or high >= maxbits:
                raise ValueError("Range specification '%s' is out of range.", item)
            if high < low:
                raise ValueError("The high bit number must come first in range '%s'.", item)

            retval += [x for x in range(high, low - 1, -1)]

        return retval
            

    def _expand_bitlist(self, domain, bits):
        """
        Expand a list of signal names to the full list of
        signals/bits.

        >>> f = FunctionTable('op:3 l a:8 b:8', 'l y:16')
        >>> list(f._expand_bitlist(f.inputs, 'op'))
        [(('op', 3, 7, 17), [2, 1, 0])]
        >>> list(f._expand_bitlist(f.inputs, 'op/0 l'))
        [(('op', 3, 7, 17), [0]), (('l', 1, 1, 16), [0])]
        >>> list(f._expand_bitlist(f.inputs, 'a/7 b/7'))
        [(('a', 8, 255, 8), [7]), (('b', 8, 255, 0), [7])]
        >>> list(f._expand_bitlist(f.inputs, 'spam/1'))
        Traceback (most recent call last):
        ...
        KeyError: "Field 'spam' not found"
        >>> list(f._expand_bitlist(f.inputs, 'op/15'))
        Traceback (most recent call last):
        ...
        KeyError: "Field 'op/15' not found"
        """
        for bitspec in bits.split(' '):
            try:
                name, bitlist = bitspec.split('/')
                field = self.get_field(domain, name)
                if not field:
                    raise KeyError('Unknown field name.')
                bitlist = self._parse_range(field[1], bitlist)
                yield (field, bitlist)
            except ValueError:
                field = self.get_field(domain, bitspec)
                if not field:
                    raise KeyError('Unknown field name.')
                yield field, [x for x in range(field[1] - 1, -1, -1)]


    def make_vector(self, domain, **kwargs):
        """
        Construct a binary vector using the specified domain, with named
        arguments matching the names of fields/signals in the domain. All
        fields must be provided.

        >>> f = FunctionTable('op:3 l a:8 b:8', 'l y:16')
        >>> f.make_vector(f.inputs)
        Traceback (most recent call last):
        ...
        ValueError: All domain fields (a, b, l, op) must be specified as keyword arguments.

        >>> mybin(f.make_vector(f.inputs, op=5, l=0, a=255, b=0), 20)
        '10101111111100000000'
        """
        kwset = set(kwargs.keys())
        allkws = set(x[0] for x in domain)

        # Sanity check.
        if kwset != allkws:
            raise ValueError('All domain fields (%s) must be specified as keyword arguments.' % \
                                 (', '.join(allkws)))
        
        retval = 0
        for field, bits, mask, shift in domain:
            retval = retval | (kwargs.get(field, 0) << shift)
            
        return retval
    

    def subvector(self, domain, x, bits):
        """
        Return the value of a subvector of the vector x (expressed as an
        integer) made up of the specified bits.

        The bit specification looks like 'op/2,1,0 x a/15,7-0'. The field name
        goes first. If it's followed by a slash, then the bits specified after
        the slash are used. If the slash part is mising, all the bits are
        used. If bits are specified, they may be individual bit indexes
        (zero-based), or hyphen-separated ranges of bits. As always, the order
        is MSB to LSB.  The bits are concatenated, so they may appear multiple
        times in the subvector.

        >>> f = FunctionTable('op:3 l a:8 b:8', 'l y:16')
        >>> mybin(f.subvector(f.inputs, -1, 'op'), 3)
        '111'
        >>> mybin(f.subvector(f.inputs, -1, 'l'), 3)
        '001'
        >>> mybin(f.subvector(f.inputs, -1, 'l l'), 4)
        '0011'
        >>> mybin(f.subvector(f.inputs, 0x42424242, 'op l a/7,6,3-0 b/1'), 11)
        '00100100101'
        >>> mybin(f.subvector(f.inputs, -1, 'op op op'), 9)
        '111111111'
        """
        retval = 0
        for field, bitlist in self._expand_bitlist(domain, bits):
            name, bits, mask, shift = field
            for bitpos in bitlist:
                retval = (retval << 1) | ((x >> (shift + bitpos)) & 1)
                #print "%s%d (=%d): retval=%08x" % (name, bitpos, bitpos+shift, retval)

        return retval


    def put(self, inp, out):
        """
        Register an input -> output pair with the function. This will also
        register the value with all the ROMs attached to the function table.
        """
        self.puts += 1
        for rom, inbits, outbits in self.roms:
            addr = self.subvector(self.inputs, inp, inbits)
            data = self.subvector(self.outputs, out, outbits)
            rom.put(addr, data)

        
    def push(self, d):
        """Not implemented"""
        raise RuntimeError('Not implemented, use put(addr, data).')


    def writeBin(self, stem):
        """
        Write ROM binary images nemed STEM-xx.bin.
        """
        for i, (rom, inp, outp) in enumerate(self.roms):
            rom.writeBin(open('%s-%02d.bin' % (stem, i), 'wb'))


    def writeVerilog(self, stem):
        """
        Write all ROM images to Verilog 'binary' files named STEM-xx.list.
        """
        for i, (rom, inp, outp) in enumerate(self.roms):
            rom.writeVerilog(open('%s-%02d.list' % (stem, i), 'w'))


    def writeVerilogROMs(self, stem):
        """
        Write multiple ROM images using the file stem stem. Each ROM contains 8
        bits. Since we may be using multiple ROMs, this is a two-dimensional
        scheme which will produce files named STEM-XX-YY.list.
        """
        for i, (rom, inp, outp) in enumerate(self.roms):
            rom.writeVerilogROMs('%s-%02d' % (stem, i))


    def progress(self, fmt=None, f=sys.stdout, dt=1):
        """
        Print a progress report.
        
        A progress report is printed every 10 seconds (the dt argument
        overrides this) and is based on the assumption that every possible
        value in the Function Table will be filled. If a file-like objcet f is
        specified, the output will be written to it. Otherwise, sys.stdout is
        used. The optional format may contain args:
        
        %(puts)d (number of executions of FunctionTable.put() so far)
        %(maxaddrs)d (total number of addresses),
        %(percent)d (percent done)
        %(elh)d, %(elm)d, %(els)d (elapsed hours, minutes, seconds)
        %(esh)d, %(esm)d, %(ess)d (estimated hours, minutes, seconds).
        """
        t = time.time()
        if t < self.reported + dt:
            return
        self.reported = t
        
        maxaddrs = 1 << self.ibits

        dt = t - self.created
        totalt = self.created + (dt * maxaddrs / self.puts)
        estimate = totalt - t
        
        data = dict(
            puts=self.puts,
            maxaddrs=maxaddrs,
            percent=100 * self.puts // maxaddrs,
            esh=estimate // 3600,
            esm=(estimate % 3600) // 60,
            ess=(estimate % 60),
            elh=dt // 3600,
            elm=(dt % 3600) // 60,
            els=(dt % 60),
            )

        fmt = fmt or '%(percent)d%% done, finished in %(esh)02d:%(esm)02d:%(ess)02d\n'
        f.write(fmt % data)

            
    def report(self, f=sys.stdout):
        """
        Print out a report on what's been generated.
        """
        dt = time.time() - self.created
        elh = dt // 3600
        elm = (dt % 3600) // 60
        els = (dt % 60)
        
        f.write('Addresses set: %d / %d\n' % (self.puts, 1<<self.ibits))
        f.write('Time elapsed:  %02d:%02d:%02d (%d calcs per second)\n' %
                (elh, elm, els, self.puts // dt))
        f.write('ROMS:\n')
        for i, rom in enumerate(self.roms):
            rom[0].calc_checksum()
            f.write('\tROM %02d: %s\n' % (i, str(rom)))


if __name__ == '__main__':
    import doctest
    doctest.testmod()
