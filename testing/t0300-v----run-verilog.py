#!/usr/bin/python3

import os
import re
import sys
import array
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

    # These will be on page &1400
    for x in range(2):
        source += "LOAD  @+3\n"
        source += "OUT   R &113\n"
        source += "JMP   @+2\n"
        source += ".word &{:>x}\n".format(x)
        expected.append([ 340, "PRINTU", str(x) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]
    print(source)

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
