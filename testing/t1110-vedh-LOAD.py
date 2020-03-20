#!/usr/bin/python3

import os
import re
import sys
import array
import pprint
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.verilog
def test_verilog_experiment(capsys, tmpdir):

    source = """
    &0:     OUT R &11e     ; SUCCESS
            OUT R &11d     ; Halt immediately.
    """

    expected = ExpectedData([OK, OK, HALTED])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_LI(capsys, tmpdir):

    source, expected = "&0:\n", ExpectedData([ SUCCESS ])

    for x in range(1024):
        source += "LI &{:>x}\n".format(x)
        source += "OUT R &113\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
def test_LIA_R(capsys, tmpdir):

    source, expected = "&0:\n", ExpectedData([ SUCCESS ])

    for x in range(1024):
        source += "LIA R &{:>x}\n".format(x)
        source += "OUT R &113\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
def test_LIA(capsys, tmpdir):

    source = """
    &0:     .fill 65535 OUT R &11d
    &0:     JMP I @+1
            .word &1400
    &1400:
    """
    expected = ExpectedData([ SUCCESS ])

    # These will be on page &1400
    for x in range(512):
        source += "LIA &{:>x}\n".format(x)
        source += "OUT R &113\n"
        expected.append([ 340, "PRINTU", str(x | 0x1400) ])

    source += "JMP I @+1\n"
    source += ".word &3c00\n"
    source += "&3c00:\n"

    # These will be on page &3c00
    for x in range(512):
        source += "LIA &{:>x}\n".format(x)
        source += "OUT R &113\n"
        expected.append([ 340, "PRINTU", str(x | 0x3c00) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
def test_LOAD(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    # Only up to 255 can be tested using this particular program
    for x in range(255):
        source += "LOAD  @+3\n"
        source += "OUT   R &113\n"
        source += "JMP   @+2\n" # This obviously fails at page boundaries
        source += ".word &{:>x}\n".format(x)
        expected.append([ 340, "PRINTU", str(x) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]
    print(source)

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
def test_LOAD_I(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    MAX=255

    # Only up to 255 can be tested using this particular program
    for x in range(MAX):
        source += "LOAD I @table+{}\n".format(x)
        source += "OUT  R &114\n"

    source += "OUT R &11d\n"

    # The indirection table
    source += "table:\n"
    for x in range(MAX):
        source += ".word @data+{}\n".format(x)

    # The data table
    source += "&7800:\n"
    source += "data:\n"
    for x in range(MAX):
        source += ".word &{:>04x}\n".format(0xe000 + x)
        expected.append([ 340, "PRINTH", "{:>04x}".format(0xe000 + x) ])

    # The halted notification should appear at the end (we've already
    # added the HALT instruction.
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    assert result == expected


@pytest.mark.verilog
def test_LOAD_R(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    MAX=255                       # We can go up to 1023

    source += "\t\tJMP start\n".format(MAX)

    # The data table is here
    source += "data:\n"
    for x in range(MAX):
        source += "\t\t.word &{:>04x}\n".format(0xffff ^ x)
        expected.append([ 340, "PRINTH", "{:>04x}".format(0xffff ^ x) ])

    # The load/out code is here
    source += "start:\n"
    for x in range(MAX):
        source += "\t\tLOAD R @data+{}\n".format(x)
        source += "\t\tOUT  R &114\n"

    source += "\t\tOUT R &11d\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    assert result == expected


@pytest.mark.verilog
def test_LOAD_I_R(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    MAX=255                       # We can go up to 1023

    source += "\t\tJMP start\n".format(MAX)

    # The data table is here
    source += "table:\n"
    for x in range(MAX):
        source += "\t\t.word &{:>04x}\n".format(0x7500 + x)

    # The load/out code is here
    source += "start:\n"
    for x in range(MAX):
        source += "\t\tLOAD I R @table+{}\n".format(x)
        source += "\t\tOUT  R &114\n"

    source += "\t\tOUT R &11d\n"

    # The actual data is here
    source += "&7500:\n"
    source += "data:\n"
    for x in range(MAX):
        source += "\t\t.word &{:>04x}\n".format(0xffff - x)
        expected.append([ 340, "PRINTH", "{:>04x}".format(0xffff - x) ])

    # The halted notification should appear at the end (we've already
    # added the HALT instruction.
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
