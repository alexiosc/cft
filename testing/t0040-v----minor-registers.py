#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess


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


BASEDIR = findBaseDir()
VERILOGDIR = os.path.join(BASEDIR, "verilog")
RUN_VERILOG_TEST = os.path.join(BASEDIR, "tools", "run-verilog-testbench")
SUCCESS = 345
FAIL = 346

def test_paths():
    assert os.path.exists(BASEDIR) and os.path.isdir(BASEDIR), \
        "BASEDIR not found"
    assert os.path.exists(VERILOGDIR) and os.path.isdir(VERILOGDIR), \
        "VERILOGDIR not found"
    assert os.path.exists(RUN_VERILOG_TEST) and os.access(RUN_VERILOG_TEST, os.X_OK), \
        "tools/run-verilog-testbench not found or not executable"


def run_verilog_test(capsys, name, *args):
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
    for line in capsys.readouterr().out.split('\n'):
        m = re.match('^(\d\d\d) (\S+):?(?: (.+))$', line.strip())
        if not m:
            continue
        code, state, comment = m.groups()
        yield((int(code), state, comment))


def test_reg_ar(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


def test_reg_ir(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


def test_reg_l(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


def test_reg_v(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
