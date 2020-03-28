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


class ExpectedData(list):
    """A class representing data expected from the output of a DFP-style test.
    Results can be tested by three-digit code, three-digit code plus status
    word, or code, status word and data.
    """

    def prepare(self, other):
        """Pare down the result from a Verilog simulation run to match
        the specificity of the Expected Data."""
        for x, y in zip(self, other):
            if type(x) == int:
                yield y[0]
            elif len(x) == 1:
                yield [y[0]]
            elif len(x) == 2:
                yield [y[0], y[1]]
            elif len(x) == 3:
                yield [y[0], y[1], y[2]]

        
    # def xxx__eq__(self, other):
    #     try:
    #         if super().__eq__(self, other):
    #             return True
    #         if len(self) != len(other):
    #             return False
    #         for x, y in zip(self, other):
    #             if type(x) == int and x != y[0]:
    #                 return False
    #             if len(x) == 1 and x[0] != y[0]:
    #                 return False
    #             elif len(x) == 2 and (x[0], x[1]) != (y[0], y[1]):
    #                 return False
    #             elif len(x) == 3 and x != y:
    #                 return False

    #     except TypeError:
    #         return False

    #     return True


def pytest_configure(config):
    print("*** CONFIG ***")
    raise RuntimeError()
    config.addinivalue_line(
        "markers", "verilog: this test applies to Verilog emulation.")
    config.addinivalue_line(
        "markers", "emulator: this test applies to testing on the C emulator.")
    config.addinivalue_line(
        "markers", "hardware: this test applies to hardware testing.")

    config.addinivalue_line(
        "markers", "ctl: the CTL Board.")
    config.addinivalue_line(
        "markers", "reg: the REG Board.")
    config.addinivalue_line(
        "markers", "bus: the BUS Board.")
    config.addinivalue_line(
        "markers", "alu: the ALU Board.")

    config.addinivalue_line(
        "markers", "cftasm: the CFT Assembler.")


def findBaseDir():
    """Locate the base directory of the project"""

    # Start with the directory of the calling script.
    d = os.path.abspath(__file__)

    # Files that must all exist for this to be the top project directory
    lookFor = ['LICENSE', 'README.md', 'tools/cftasm']

    while d != '/':
        # How many of the look_for names found?
        nf = len(list(x for x in lookFor if os.path.exists(os.path.join(d, x))))
        if nf == len(lookFor):
            return d

        # Otherwise, go up a directory
        d = os.path.abspath(os.path.join(d, '..'))

    raise RuntimeError('Base directory not found (looked for %s.' % ', '.join(lookFor))


def get_capsys_outerr(capsys): 
    result = capsys.readouterr()
    try:
        return result.out, result.err
    except:
        # This is for older pytest installations
        return result[0], result[1]


def run_verilog_testbench(capsys, name, args=None):
    m = re.match("^(.+?)(_tb)?(\.[ov])?$", name)
    testbench = m.group(0) + "_tb.v"
    binary = m.group(0) + "_tb.o"

    curdir = os.getcwd()
    os.chdir(VERILOGDIR)

    with open(testbench, "rt") as f:
        if 'OK/FAIL OUTPUT' not in f.read():
            assert False, "Testbench {}/{} does not use OK/FAIL output. Modernise it!".format(
                os.getcwd(), testbench)

    if not os.path.exists(binary):
        if os.path.exists(testbench):
            assert False, "Source file {}/{} has not been compiled.".format(os.getcwd(), testbench)
        else:
            assert False, "Testbench {}/{} does not exist!".format(os.getcwd(), binary)
        assert False

    # Note: the test tool (RUN_VERILOG_TEST) expects the .v file, not the .o file.
    #cmd = '{} {} -v -a "{}"'.format(RUN_VERILOG_TEST, testbench, ' '.join(args))
    #cmd = './{} {}'.format(binary, ' '.join(args))

    if args is None:
        args = []

    pipe = subprocess.Popen([os.path.abspath(binary)] + args, cwd=str(VERILOGDIR),
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (out, err) = pipe.communicate()
    code = pipe.wait()

    sys.stdout.write(out.decode('utf-8'))
    sys.stderr.write(err.decode('utf-8'))

    result = capsys.readouterr()
    try:
        out = result.out
    except:
        # This is for older pytest installations
        out = result[0]

    for line in out.split('\n'):
        #print("*** Line:", line)
        m = re.match('^(\d\d\d) ([^: ]+)(?::?\s*(.+))?$', line.strip())
        if not m:
            #print("Ignored line:", line)
            continue
        code, state, comment = m.groups()
        yield((int(code), state, comment))


def assemble(tmpdir, source, long=False, args=None):
    """Assemble some source (a string), and make it available to the CFT
    testbed. If source is not given, use the contents of self.source
    instead. If long is True, use the long model.
    """

    dirname = str(tmpdir)
    fname = os.path.join(dirname, 'a.asm')

    with open(fname, "wt") as f:
        f.write(source)
        
    cftasm = os.path.join(BASEDIR, "tools", "cftasm")
    asmdir = os.path.join(BASEDIR, "asm")
    assert os.path.exists(cftasm), "cftasm not found, can't assemble."

    cmd = [ cftasm, "-I", asmdir ]
    if long:
        cmd += [ '--model', 'long' ]
    if args is not None:
        assert type(args) in [tuple, list], "args must be a tuple or list"
        cmd += list(args)
    cmd.append(fname)

    # Assemble
    pipe = subprocess.Popen(cmd, cwd=str(tmpdir),
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    (out, err) = pipe.communicate()
    code = pipe.wait()

    sys.stdout.write(out.decode('utf-8'))
    sys.stderr.write(err.decode('utf-8'))
    
    assert code == 0, "cftasm failed with exit code {}".format(code)

    # subprocess.call("ls -la", shell=True, cwd=str(tmpdir))

    # Make sure we have assembly output
    assert os.path.exists(str(tmpdir.join('a.bin'))), \
        "cftasm did not generate {}/a.bin.".format(tmpdir)

    # Check that the assembly step produced the expected files.
    dir_contents = ['a.asm', 'a.bin', 'a.map', 'a.pasm', 'a.sym']
    for f in dir_contents:
        assert os.path.isfile(str(tmpdir.join(f))), "file {}/{} was not created".format(tmpdir, f)


def read_pasm(tmpdir):
    """Read and return the a.pasm file of a completed assembly run. An
    iterable of strings is returned, one per line.  Comments are
    stripped out.
    """
    fname = str(tmpdir.join("a.pasm"))
    assert os.path.exists(fname), "a.pasm file not generated"
    with open(fname) as f:
        pasm = re.findall("^&[0-9a-f]{4}: &[0-9a-f]{4}", f.read(), re.MULTILINE)
    return pasm


def run_on_verilog_emu(capsys, tmpdir, source, timeout=20000000,
                       cftasm_args=None, verilog_args=None):
    """Assemble a program and run it using the verilog emulator."""

    # First, assemble the script.
    asm_args = ["--verilog"]
    if cftasm_args is not None:
        asm_args += cftasm_args
    assemble(tmpdir, source, asm_args)

    out, err = get_capsys_outerr(capsys)
    sys.stdout.write(out)
    sys.stderr.write(err)

    # Ensure we have verilog output.
    for f in ("a-00.list", "a-01.list"):
        fname = str(tmpdir.join(f))
        assert os.path.exists(fname), "Verilog image {} missing".format(fname)

    # Okay, now run it with Verilog.
    args = [ "+rom={}".format(tmpdir.join("a")), "+timeout={}".format(timeout) ]
    if verilog_args is not None:
        args += verilog_args

    return run_verilog_testbench(capsys, 'cft2019', args)


def read_cft_bin_file(fname, size):
    with open(fname, "rb") as f:
        data = array.array('H')
        data.fromfile(f, size)
        return data


def test_paths():
    assert os.path.exists(BASEDIR) and os.path.isdir(BASEDIR), \
        "BASEDIR not found"
    assert os.path.exists(VERILOGDIR) and os.path.isdir(VERILOGDIR), \
        "VERILOGDIR not found"
    assert os.path.exists(RUN_VERILOG_TEST) and os.access(RUN_VERILOG_TEST, os.X_OK), \
        "tools/run-verilog-testbench not found or not executable"


###############################################################################
#
# ASSEMBLER HELPERS
#
###############################################################################

def asm_memory_banks(mbp=None, mbd=None, mbs=None, mbz=None,
                     mb4=None, mb5=None, mb6=None, mb7=None):
    """Generate CFT Assembly to set the specified memory banks."""
    mbrs = [ [mbp, "MBP"], [mbd, "MBD"], [mbs, "MBS"], [mbz, "MBZ"],
             [mb4, "4"],   [mb5, "5"],   [mb6, "6"],   [mb7, "7"] ]
    source = ""
    ac = None
    for arg, name in mbrs:
        if arg is not None:
            if ac != arg:
                ac = arg
                source += "        LI        &{:>02x}\n".format(arg)
            source += "        SMB       {}\n".format(name)

    return source



BASEDIR = findBaseDir()
VERILOGDIR = os.path.join(BASEDIR, "verilog")
RUN_VERILOG_TEST = os.path.join(BASEDIR, "tools", "run-verilog-testbench")
HALTED = 305
SENTINEL = 341
SUCCESS = 345
OK = SUCCESS
FAIL = 346
ROM_WP0 = [ 345, "ROM", "is writeable" ]
ROM_WP1 = [ 345, "ROM", "is write protected" ]


# End of file.
