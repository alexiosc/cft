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


def run_verilog_testbench(capsys, name, *args):
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

    cmd = '{} {} -v {}'.format(RUN_VERILOG_TEST, testbench, ' '.join(args))
    os.system(cmd)
    result = capsys.readouterr()
    try:
        out = result.out
    except:
        # This is for older pytest installations
        out = result[0]

    for line in out.split('\n'):
        m = re.match('^(\d\d\d) (\S+):?(?: (.+))$', line.strip())
        if not m:
            continue
        code, state, comment = m.groups()
        yield((int(code), state, comment))


def assemble(capsys, tmpdir, source, args=None):
    """Assemble some source (a string), and make it available to the CFT
    testbed. If source is not give, use the contents of self.source
    instead.
    """

    dirname = str(tmpdir)
    fname = os.path.join(dirname, 'a.asm')

    with open(fname, "wt") as f:
        f.write(source)
        
    cftasm = os.path.join(BASEDIR, "tools", "cftasm")
    assert os.path.exists(cftasm), "cftasm not found, can't assemble."

    cmd = [cftasm]
    if args is not None:
        assert type(args) in [tuple, list], "args must be a tuple or list"
        cmd += list(args)
    cmd.append(fname)

    # Assemble
    code = subprocess.call(cmd, cwd=tmpdir)
    assert code == 0, "cftasm failed with exit code {}".format(code)
    subprocess.call("ls -la", shell=True, cwd=tmpdir)

    # Make sure we have assembly output
    assert os.path.exists(tmpdir.join('a.bin')), \
        "cftasm did not generate {}/a.bin.".format(tmpdir)

    # Check that the assembly step produced the expected files.
    dir_contents = ['a.asm', 'a.bin', 'a.map', 'a.pasm', 'a.sym']
    for f in dir_contents:
        assert os.path.isfile(tmpdir.join(f)), "file {}/{} was not created".format(tmpdir, f)



def test_paths():
    assert os.path.exists(BASEDIR) and os.path.isdir(BASEDIR), \
        "BASEDIR not found"
    assert os.path.exists(VERILOGDIR) and os.path.isdir(VERILOGDIR), \
        "VERILOGDIR not found"
    assert os.path.exists(RUN_VERILOG_TEST) and os.access(RUN_VERILOG_TEST, os.X_OK), \
        "tools/run-verilog-testbench not found or not executable"


BASEDIR = findBaseDir()
VERILOGDIR = os.path.join(BASEDIR, "verilog")
RUN_VERILOG_TEST = os.path.join(BASEDIR, "tools", "run-verilog-testbench")
SUCCESS = 345
FAIL = 346


# End of file.
