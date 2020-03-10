#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess

from testing import *

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


# Buffers

# IC not used
# def test_buffer_244(capsys):
#     name = inspect.stack()[0][3].replace('test_', '')
#     for code, state, comment in run_verilog_testbench(capsys, name):
#         assert code != FAIL

@pytest.mark.verilog
def test_buffer_245(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_buffer_541(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# Comparators

@pytest.mark.verilog
def test_comparator_688(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_comparator_85(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# Counters

@pytest.mark.verilog
def test_counter_191(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_counter_193(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_counter_590(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# Demultiplexers

@pytest.mark.verilog
def test_demux_138(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_demux_139(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_demux_139h(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_demux_238(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# Multiplexers

@pytest.mark.verilog
def test_mux_157(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_mux_1g157(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_mux_2g157(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_mux_253(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# Flip-Flops

# IC not used!
# def test_flipflop_112(capsys):
#     name = inspect.stack()[0][3].replace('test_', '')
#     for code, state, comment in run_verilog_testbench(capsys, name):
#         assert code != FAIL

@pytest.mark.verilog
def test_flipflop_74(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# IC not used!
# def test_flipflop_174(capsys):
#     name = inspect.stack()[0][3].replace('test_', '')
#     for code, state, comment in run_verilog_testbench(capsys, name):
#         assert code != FAIL

@pytest.mark.verilog
def test_flipflop_574(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# IC not used!
# def test_flipflop_564(capsys):
#     name = inspect.stack()[0][3].replace('test_', '')
#     for code, state, comment in run_verilog_testbench(capsys, name):
#         assert code != FAIL

# Latches

@pytest.mark.verilog
def test_latch_373(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_latch_1g373(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

# The '670 register file (not used any more, but check anyway)

@pytest.mark.verilog
def test_regfile_670(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL


# Memory

@pytest.mark.verilog
def test_ram(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
def test_rom(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
