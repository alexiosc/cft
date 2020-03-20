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
def test_LOAD(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    MAX = 255                   # 1 to 255

    # Only up to 255 can be tested using this particular program
    for x in range(MAX):
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

    MAX=255                     # 1-255

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

    MAX=1022                       # We can go up to 1022

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

    pprint.pprint(expected)
    pprint.pprint(result)

    assert result == expected


@pytest.mark.verilog
def test_LOAD_I_R(capsys, tmpdir):

    source = "&0:\n"
    expected = ExpectedData([ SUCCESS ])

    # We can go up to 768 (must avoid autoincrement registers)
    MAX=768

    source += "\t\tJMP start\n".format(MAX)

    # The data table is here
    source += "table:\n"
    for x in range(MAX):
        source += "\t\t.word &{:>04x}\n".format(0x7500 + x)

    # The load/out code is here
    source += "start:\n"
    for x in range(MAX):
        source += "\t\tLOAD I R @table+{}\n".format(x)
        source += "\t\tOUT  R &113\n"

    source += "\t\tOUT R &11d\n"

    # The actual data is here
    source += "&7500:\n"
    source += "data:\n"
    for x in range(MAX):
        source += "\t\t.word &{:>04x}\n".format(x)
        expected.append([ 340, "PRINTU", str(x) ])

    # The halted notification should appear at the end (we've already
    # added the HALT instruction.
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    pprint.pprint(result)

    assert result == expected


@pytest.mark.verilog
def test_LOAD_I_R_autoinc(capsys, tmpdir):

    source = ".equ autoinc &341\n"

    expected = ExpectedData([ SUCCESS ])

    MAX = 2                   # 1 to 255

    source += "&0:\n"
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    source += "\t\tLOAD      @+3\n"
    source += "\t\tSTORE R   autoinc\n"
    source += "\t\tJMP       @+2\n"
    source += "\t\t.word     data\n"

    for x in range(MAX):
        source += "\t\tLOAD I R  autoinc\n"
        source += "\t\tOUT R     &113\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "\t\tOUT R &11d\n"
    expected += [ HALTED ]

    # The data table.
    source += "&1389:\n"
    source += "data:\n"

    for x in range(MAX):
        source += "\t\t.word {}\n".format(x)
    
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    print(source)
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
