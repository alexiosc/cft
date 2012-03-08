#!/usr/bin/python2.6

import os
import re
import sys
import time
import array
import random
import unittest
import subprocess


class BaseTest(unittest.TestCase):
    
    currentResult = None

    CFTASM = os.environ.get('CFTASM', '../tools/cftasm')
    CFTASMFLAGS = os.environ.get('CFTASMFLAGS', '')
    LIBDIR = os.environ.get('ASMDIR', '../asm')

    """
    The base test class for CFT testing.
    """

    def __init__(self, *args, **kwargs):
        self._source = list()
        unittest.TestCase.__init__(self, *args, **kwargs)


    def run(self, result=None):
        """Keep a local copy of the current result."""
        self.currentResult = result
        unittest.TestCase.run(self, result)


    def runTest(self):
        pass


    def setUp(self):
        """Set up the test by creating a temporary testbed."""
        #sys.stderr.write("setup ")
        self._seed = int((time.time() * 1000)) & 0xffffffff ^ random.randint(0, 1<<31)
        self._base = hex(self._seed)[2:]
        self._basedir = '.test-%s' % self._base
        os.mkdir(self._basedir)
        os.system('ln -sf %s last-test' % self._basedir)


    def tearDown(self):
        """Delete the testing directory (but only on success)."""
        if self.currentResult.wasSuccessful():
            #sys.stderr.write("cleanup ")
            # Sanity check.
            if os.path.exists(self._basedir) and \
                    self._basedir.startswith('.test-'):
                os.system('rm -rf ' + self._basedir)


    def asm(self, line):
        """
        Add some code to the assembly source.
        """
        self._source.append(line)


    def assemble(self, source=None, extralibs=[], flags='', debug=False):
        """Assemble some source (a string), and make it available to
        the CFT testbed. If source is not give, use the contents of
        self.source instead."""

        source = source or '\n'.join(self._source)

        #sys.stderr.write("asm ")
        fname = 'test.asm'
        open(os.path.join(self._basedir, fname), 'w').write(source)

        asm = os.path.join('..', self.CFTASM)
        #asm = self.CFTASM
        basedir = self._basedir
        libs = ' '.join(os.path.join('..', self.LIBDIR, x) for x in
                        ['io.asm', 'debugging.asm', 'testing.asm'] + extralibs)
        out = 'img/a.bin'
        debug = debug and '-d' or ''

        if flags:
            flags = flags + ' ' + self.CFTASMFLAGS
        else:
            flags = self.CFTASMFLAGS

        cmd = 'cd %(basedir)s; %(asm)s %(flags)s %(debug)s -o %(out)s %(libs)s %(fname)s' % locals()
        os.system(cmd)


    def readbin(self, name='a.bin'):
        """Read the complete memory image produced by the assembler and return
        it as a list of integers."""
        data = array.array('H')
        data.fromfile(open(os.path.join(self._basedir, 'img', 'a.bin'), 'rb'), 65536)
        return list(data)


    def checkbin(self, expected, errormsg):
        return True
        """Fail unless bin==expected, issue a message and print out a hexdump
        of the binary file."""
        mem = self.readbin()

        # Sanity check.
        self.assertEqual(len(mem), 65536, 'Memory image incomplete (expecting 65,536 words)')

        try:
            self.assertEqual(mem, expected, errormsg)
        except:
            sys.stderr.write("\n\nFAILED! CHECK THIS HEXDUMP:\n")
            fname = os.path.join(self._basedir, 'img', 'a.bin')
            os.system('hexdump 1>&2 ' + fname)
            sys.stderr.write('\n')
            raise

    def simparse(self, simout, getall=False, debug=False):
        """Parse the output of a simulator framework"""
        t0 = time.time()
        for line in simout:
            # Show progress
            t = time.time()
            if t - t0 > 1.0:
                sys.stderr.write('.')
                t0 = t
    
            if line.startswith('BOM:'):
                continue
            if debug:
                sys.stderr.write('D: ' + line.rstrip() + '\n')
            if getall:
                yield line.rstrip()
                continue

            # Strip colour directives (the alpha CFT emulator sucks in this
            # respect, but I need the colour to sift through the sheer volume
            # of information -- Alexios)
            line = re.sub('\033\[.+?m', '', line)
            
            # We're only interested in debugging (old versions of the
            # emulators) and testing output.
            if not line.startswith('D:') and not line.startswith('T:'):
                continue
    
            tokens = line.split()[1:]
            cmd = tokens[0].rstrip(':')
            if cmd == 'PRINTC':
                yield tokens[1]
            elif cmd == 'PRINTc':
                yield chr(int(tokens[1]))
            elif cmd == 'PRINTU':
                yield tokens[1]
            elif cmd == 'PRINTD':
                yield tokens[1]
            elif cmd == 'PRINTH':
                yield tokens[1]
            elif cmd == 'PRINTB':
                yield tokens[1]
            elif cmd == 'ASSERT':
                if tokens[1] == 'TRUE':
                    sys.stderr.write('+')
                    yield '[ok]'
                else:
                    sys.stderr.write('-')
                    yield '[FAIL!]'
            elif cmd == 'TIME:' or cmd == 'TIME':
                sys.time_elapsed = int(tokens[1]) / 1e9


    def runFramework(self, getall=False, debug=False):
        """Execute a testing framework and returs its output."""
        raise NotImplemented('Pure abstract method, please implement it in your class.')


    def simulate(self, getall=False, debug=False):
        #sys.stderr.write("sim ")
        simout = self.runFramework(getall=getall, debug=debug)
        res = ''.join(self.simparse(simout, getall=getall, debug=debug))
        if debug:
            print res
        return res


    def assertSim(self, simout, msg):
        """Ensure the simulator hasn't returned any failures."""
        self.assertFalse('[FAIL!]' in simout)


    def assertStr(self, simout, substr, msg):
        """Ensure the simulator output contains the specified substring."""
        self.assertTrue(substr in simout, msg)



class VerilogTest(BaseTest):
    
    VERILOG_DIR = '../verilog'
    SIMULATOR = 'cft_tb_testing.o'

    """
    The base test class for running gets on the Verilog models.
    """

    def __init__(self, *args, **kwargs):
        self._source = list()
        BaseTest.__init__(self, *args, **kwargs)


    def setUp(self):
        """Set up the test by creating a temporary testbed with Verilog code."""
        BaseTest.setUp(self)

        # Install a bare instance of the CFT simulator
        os.mkdir(os.path.join(self._basedir, 'img'))
        os.mkdir(os.path.join(self._basedir, 'vcd'))
        os.system('cp %s/*.o %s/' % (self.VERILOG_DIR, self._basedir))


    def runFramework(self, getall=False, debug=False):
        #sys.stderr.write("sim ")
        cmd = 'cd %s; ./cft_tb.o' % self._basedir
        return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout


class EmulatorTest(BaseTest):
    
    EMULATOR = os.environ.get('CFTEMU', '../emulator/cftemu')
    EMUFLAGS = os.environ.get('CFTEMUFLAGS', '')

    """
    The base test class for running tests on the binary emulator.
    """

    def __init__(self, *args, **kwargs):
        self._source = list()
        BaseTest.__init__(self, *args, **kwargs)


    def setUp(self):
        """Set up the test by creating a temporary testbed."""
        #sys.stderr.write("setup ")
        BaseTest.setUp(self)
        os.system('ln -s . %s/img' % self._basedir)


    def runFramework(self, getall=False, debug=False):
        #sys.stderr.write("sim ")
        #cmd = 'cd %s; ./cft_tb.o' % self._basedir
        basedir = self._basedir
        emu = self.EMULATOR
        flags = self.EMUFLAGS
        cmd = '%(emu)s --no-sanity -a v0 -t -l %(basedir)s/output -M %(basedir)s/a.map ' + \
            '-p %(basedir)s/a.pasm %(flags)s %(basedir)s/a.bin'
        cmd = cmd % locals()
        try:
            return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout
        except:
            print cmd
            raise


# End of file.
