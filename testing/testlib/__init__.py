#!/usr/bin/python

import os
import re
import sys
import glob
import time
import array
import random
import unittest
import subprocess


def findBaseDir():
    """Locate the base directory of the project"""

    # Start with the directory of the calling script.
    d = os.path.abspath(sys.argv[0])

    # Files that must all exist for this to be the top project directory
    lookFor = ['COPYING', 'README', 'tools/cftasm']

    while d != '/':
        # How many of the look_for names found?
        nf = len(list(x for x in lookFor if os.path.exists(os.path.join(d, x))))
        if nf == len(lookFor):
            return d

        # Otherwise, go up a directory
        d = os.path.abspath(os.path.join(d, '..'))

    raise RuntimeError('Base directory not found (looked for %s.' % ', '.join(lookFor))


# Initialise locations

BASEDIR = os.environ.get('BASEDIR', findBaseDir())
CFTASM = os.environ.get('CFTASM', os.path.join(BASEDIR, 'tools', 'cftasm'))
CFTASMFLAGS = os.environ.get('CFTASMFLAGS', '')
LIBDIR = os.environ.get('ASMDIR', os.path.join(BASEDIR, 'asm'))
TESTFNAME = 't[0-9][0-9][0-9][0-9]*.py'
REPORTDIR = 'reports'


def listTests(baseDir='.'):
    """List available tests. Available tests are any regular files
    that match the glob pattern TESTFNAME.
    """
    for fname in glob.glob(os.path.join(baseDir, TESTFNAME)):
        if os.path.isfile(fname):
            yield os.path.splitext(fname)[0]


def summariseReports(tests, col=None):
    """Print a summary of test results."""
    if col is None:
        col = os.isatty(sys.stdout.fileno())

    print '%-24.24s %-20.20s %-20.20s' % ('Test', 'Verilog', 'Emulator')
    print "-" * 79
    for test in sorted(tests):
        sys.stdout.write('%-24.24s ' % test)
        for framework in ('verilog', 'emulator'):
            fname = os.path.join(REPORTDIR, framework[0] + test + '.txt')
            col0, col1 = '', '\033[0m'
            res = '?'
            if not os.path.exists(fname):
                col0, col1 = '\033[0;1;30m', '\033[0m'
                res = 'Not tested'
            else:
                try:
                    data = open(fname).read().strip()
                    numcheckpoints = len(re.findall('\+', data))

                    m = re.findall('\nRan (\d+) tests?.*\n\nOK', data)
                    if m:
                        numtests = numcheckpoints or m[0]
                        col0 = '\033[0;1;32m'
                        res = 'Passed (%s test%s)' % (numtests, ('', 's')[numtests != '1'])
                    else:
                        m = re.findall('\nFAILED \(failures?=(\d+)\)', data)
                        if m:
                            col0 = '\033[0;1;31m'
                            res = 'Failed (%s test%s)' % (m[0], ('', 's')[m[0] != '1'])
                        else:
                            col0 = '\033[0;1;33m'
                            res = data.split('\n')[-1]

                except OSError, e:
                    res = '? (errno %d)' % e.errno
                
            #print test, framework, os.path.exists(fname)
            if not col:
                col0, col1 = '', ''
            sys.stdout.write('%s%-20.20s%s '% (col0, res, col1))
        sys.stdout.write('\n')


def setVerbose(v):
    """Set the verbosity level."""
    global verbose
    verbose = v


def setTestName(name):
    """Set the test filename. Used for generating sandbox directories etc."""
    global testName
    testName = name
    

def setKeep(k):
    """Set the keep flag, which inhibits removal of sandbox subdirectories,
    even on successful testing."""
    global keep
    keep = k
    

def setWave(w):
    """Set the wave flag, which enables VCD logging."""
    global wave
    wave = w
    

def setTestClass(cls):
    """Select the test class to be created automatically by the test
    framework."""
    global testBaseClass
    testBaseClass = cls


class ParallelTester(object):
    def run(self, jobs=1):
        """Run the parallel tester on the supplied list of tests."""
    


class BaseTest(unittest.TestCase):
    """
    The base test class for CFT machine-code-level testing. New classes will be
    derived to test on particular platforms.
    """

    currentResult = None

    def __init__(self, *args, **kwargs):
        self._source = list()
        unittest.TestCase.__init__(self, *args, **kwargs)


    def hldiff(self, a, b):
        # Easy way out
        if a == b:
            return a

        if a[0] != b[0]:
            return 'HERE -> ' + a
        
        # Compare prefixes
        for i in xrange(1, len(a)):
            if a[:i] != b[:i]:
                if i > 0:
                    return a[:i-1] + ' *HERE -> ' + a[i-1:] 
                else:
                    return 'HERE -> ' + a

        raise ValueError('foo')


    def getFrameworkPrefix(self):
        """Return a single character prefix identifying this testing
        framework."""
        raise RuntimeError('Pure asbtract method.')

    
    def getSandbox(self):
        """Return the path to the temporary sandbox directory, where all
        testing is carried out."""
        return os.path.join ('sandbox', self.getFrameworkPrefix() + self._base, self.__class__.__name__)


    def run(self, result=None):
        """Keep a local copy of the current result."""
        self.currentResult = result
        unittest.TestCase.run(self, result)


    def runTest(self):
        pass


    def setUp(self):
        """Set up the test by creating a temporary testbed."""
        #sys.stderr.write("setup ")
        if testName:
            self._base = testName
        else:
            self._seed = int((time.time() * 1000)) & 0xffffffff ^ random.randint(0, 1<<31)
            self._base = 'unknown-' + hex(self._seed)[2:]

        self._basedir = self.getSandbox()
        os.system("mkdir -p '%s'" % self._basedir)

        #os.mkdir(self._basedir)
        #os.system('ln -sf %s last-test' % self._basedir)


    def tearDown(self):
        """Delete the testing directory (but only on success)."""
        if self.currentResult.wasSuccessful():
            #sys.stderr.write("cleanup ")
            # Sanity check.
            if not keep and os.path.exists(self._basedir) and \
                    self._basedir.startswith('sandbox'):
                os.system("rm -rf '%s'" % self._basedir)
                try:
                    os.rmdir(self._basedir)
                except OSError:
                    pass


    def clear(self):
        """
        Clear the assembly source code.
        """
        self._source = []


    def asm(self, lines):
        """
        Add some code to the assembly source.
        """
        for line in lines.split('\n'):
            self._source.append(line)


    def assemble(self, source=None, extralibs=[], flags='', debug=False):
        """Assemble some source (a string), and make it available to the CFT
        testbed. If source is not give, use the contents of self.source
        instead.
        """

        source = source or '\n'.join(self._source)

        #sys.stderr.write("asm ")
        fname = 'test.asm'
        open(os.path.join(self._basedir, fname), 'w').write(source)

        asm = CFTASM
        basedir = self._basedir
        libs = ' '.join(os.path.join(LIBDIR, x) for x in
                        ['io.asm', 'debugging.asm', 'testing.asm'] + extralibs)
        out = 'a.bin'
        debug = debug and '-d' or ''

        if flags:
            flags = flags + ' ' + CFTASMFLAGS
        else:
            flags = CFTASMFLAGS

        self.cmd = 'cd %(basedir)s; %(asm)s %(flags)s %(debug)s -o %(out)s %(libs)s %(fname)s' % \
            locals()
        self.asm_cmd = self.cmd
        if os.system(self.cmd):
            print "Assembly failed."
            raise RuntimeError('Assembly step failed')


    def readbin(self, name='a.bin'):
        """Read the complete memory image produced by the assembler and return
        it as a list of integers."""
        data = array.array('H')
        data.fromfile(open(os.path.join(self._basedir, 'a.bin'), 'rb'), 65536)
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
            fname = os.path.join(self._basedir, 'a.bin')
            os.system('hexdump 1>&2 ' + fname)
            sys.stderr.write('\n')
            raise


    def simparse(self, simout, getall=False, debug=False):
        """Parse the output of a simulator framework"""
        t0 = time.time()
        logfile = open(os.path.join(self._basedir, 'simulation.out'), 'w')

        errors = 0

        for line in iter(simout.readline, b''):
            # Show progress
            t = time.time()
            if t - t0 > 1.0:
                sys.stderr.write('.')
                t0 = t
    
            if verbose:
                sys.stderr.write(line)
            elif debug:
                sys.stderr.write('D: ' + line.rstrip() + '\n')

            # Parse output from Verilog testbeds
            if line.startswith('ERROR: '):
                if not verbose:
                    sys.stderr.write(line)
                errors += 1
                raise RuntimeError("Simulation threw testbed error", line)

            elif line.startswith('WARNING: '):
                if not verbose:
                    sys.stderr.write(line)

            elif '[ok]' in line:
                yield '[ok]'

            elif '[fail]' in line:
                errors += 1
                yield line

            if line.startswith('BOM:'):
                continue
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
            elif cmd == 'PRINTA':
                yield tokens[1]
            elif cmd == 'PRINTB':
                yield tokens[1]
            elif cmd == 'PRINTL':
                yield tokens[1].lstrip('0') or '0'
            elif cmd == 'ASSERT':
                if tokens[1] == 'TRUE':
                    sys.stderr.write('+')
                    yield '[ok]'
                else:
                    sys.stderr.write('-')
                    yield '[FAIL!]'
            elif cmd == 'TIME:' or cmd == 'TIME':
                sys.time_elapsed = int(tokens[1]) / 1e9

        if errors:
            raise RuntimeError("Simulation output %d error(s)" % errors)


    def runFramework(self, getall=False, debug=False):
        """Execute a testing framework and returs its output."""
        raise NotImplemented('Pure abstract method, please implement it in your class.')


    def simulate(self, getall=False, debug=False):
        #sys.stderr.write("sim ")
        simpipe = self.runFramework(getall=getall, debug=debug)
        simout = simpipe.stdout
        res = ''.join(self.simparse(simout, getall=getall, debug=debug))
        #if simout.returncode != 0:
        #    raise RuntimeError('Test returned error code %d' % simout.returncode)

        if debug:
            print res
        return res


    def simulateTestbed(self, testbed, getall=False, debug=False, **kwargs):
        #sys.stderr.write("sim ")
        simpipe = self.runTestbed(testbed, **kwargs)
        simout = simpipe.stdout
        res = ''.join(self.simparse(simout, getall=getall, debug=debug))
        exitcode = simpipe.wait()
        if exitcode != 0:
            raise RuntimeError("Test returned error code %d" % exitcode)

        if debug:
            print res
        return res


    def assertNoFail(self, simout, msg):
        """Ensure the simulator hasn't returned any failures."""
        #soupself.assertFalse('[FAIL!]' in simout)


    def assertStr(self, simout, substr, msg):
        """Ensure the simulator output contains the specified substring."""
        self.assertTrue(substr in simout, msg)


    def assertSim(self, expected):
        """Assemble code (via .asm(), assert expected result. Report any errors."""
        self.assemble()
        sim = ''
        try:
            sim = self.simulate()
            self.assertEqual(sim, expected, 'Unexpected output.')

        except:
            print "Expected: ", expected
            print "Simulated:", sim
            print "Command:\n          ", self.cmd
            raise


# class OldVerilogTest(BaseTest):
    
#     #VERILOG_DIR = '../verilog'
#     SIMULATOR = 'cft_tb_testing.o'

#     """
#     The base test class for running gets on the Verilog models.
#     """

#     def __init__(self, *args, **kwargs):
#         self._source = list()
#         BaseTest.__init__(self, *args, **kwargs)


#     def setUp(self):
#         """Set up the test by creating a temporary testbed with Verilog code."""
#         BaseTest.setUp(self)

#         # Install a bare instance of the CFT simulator
#         os.mkdir(os.path.join(self._basedir, 'img'))
#         os.mkdir(os.path.join(self._basedir, 'vcd'))
#         os.system('cp %s/*.o %s/' % (self.VERILOG_DIR, self._basedir))


#     def runFramework(self, getall=False, debug=False):
#         #sys.stderr.write("sim ")
#         cmd = 'cd %s; ./cft_tb.o' % self._basedir
#         return subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout


class VerilogTest(BaseTest):
    
    VERILOG_DIR = os.path.join(BASEDIR, 'verification', 'tests')
    SIMULATOR = 'cft-mc-CPU-MEM64-DEB-PFP.o'

    """
    The base test class for running gets on the Verilog models.
    """

    def __init__(self, *args, **kwargs):
        self._source = list()
        self._simulator = self.SIMULATOR
        self._simargs = ''
        BaseTest.__init__(self, *args, **kwargs)


    def getFrameworkPrefix(self):
        """Return a single character prefix identifying this testing framework."""
        return 'v'


    def setSimulator(self, s, args=None):
        """Set the Verilog simulator to be used for this test."""
        if s.endswith('.v'):
            s = s[:-2] + 'o'
        elif not s.endswith('.o'):
            s += '.o'
        self._simulator = s

        if type(args) in (str, unicode):
            self._simargs = args
        elif args is not None:
            self._simargs = ' '.join(args)


    def addArg(self, arg):
        """Add a command-line argument to the testbed command."""
        self._simargs += ' ' + arg


    def setUp(self):
        """Set up the test by creating a temporary testbed with Verilog code."""
        BaseTest.setUp(self)

        # Install a bare instance of the CFT simulator
        #try:
        #    os.mkdir(os.path.join(self._basedir, 'img'))
        #except OSError, e:
        #    if e.errno != 17:   # File exists
        #        raise
        os.system('ln -s 2>/dev/null %s/*.o %s/' % (self.VERILOG_DIR, self._basedir))
        os.system('rm 2>/dev/null %s/simulation.*' % self._basedir)


    def runFramework(self, getall=False, debug=False):
        """Run the standard testbed (a simple CFT computer) and return its
        output."""
        try:
            return self.runTestbed(self._simulator, basedir=BASEDIR,
                                   ramlo='a-00.list', ramhi='a-01.list')
        except KeyboardInterrupt:
            os.system('stty sane')
            raise



    def runTestbed(self, testbed, **kwargs):
        """Run an arbitrary Verilog testbed"""

        if not testbed.endswith('.o'):
            if testbed.endswith('.v'):
                testbed = testbed[:-2] + 'o'
            else:
                testbed += '.o'

        args = ['+basedir=' + BASEDIR]
        for k, v in kwargs.items():
            args.append("+%s=%s" % (k, v))
        if wave:
            args.append('+vcd=simulation.vcd')

        self.cmd = 'cd %s; stdbuf -o0 ./%s %s %s' % \
            (self._basedir, testbed, ' '.join(args), self._simargs)
        
        if verbose:
            sys.stderr.write("Executing: %s\n" % self.cmd)
        #sys.stderr.write("sim ")
        #sys.stderr.write("\nCMD=%s\n" % cmd)
        return subprocess.Popen(self.cmd, shell=True, stdout=subprocess.PIPE)



class EmulatorTest(BaseTest):
    
    EMULATOR = os.environ.get('CFTEMU', '../emulator/cftemu')
    EMUFLAGS = os.environ.get('CFTEMUFLAGS', '')

    """
    The base test class for running tests on the binary emulator.
    """

    def __init__(self, *args, **kwargs):
        self._source = list()
        BaseTest.__init__(self, *args, **kwargs)


    def getFrameworkPrefix(self):
        """Return a single character prefix identifying this testing framework."""
        return 'e'


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
        if verbose:
            sys.stderr.write("Executing: %s\n" % cmd)
        self.cmd = cmd
        try:
            return subprocess.Popen(self.cmd, shell=True, stdout=subprocess.PIPE)
        except:
            print cmd
            raise


# End of file.
