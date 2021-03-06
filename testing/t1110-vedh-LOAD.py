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


@pytest.mark.LOAD
@pytest.mark.JMP
def test_LOAD(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
    """
    
    expected = ExpectedData([ SUCCESS ])

    MAX = 255                   # 1 to 255

    # Only up to 255 can be tested using this particular program
    for x in range(MAX):
        source += "\t\tLOAD  @+3\n"
        source += "\t\tdfp.PRINTU\n"
        source += "\t\tJMP   @+2\n" # This obviously fails at page boundaries
        source += "\t\t.word &{:>x}\n".format(x)
        expected.append([ 340, "PRINTU", str(x) ])

    source += "\t\tHALT\n"
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
def test_LOAD_I(framework, capsys, tmpdir):

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

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))

    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
def test_LOAD_R(framework, capsys, tmpdir):

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

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))

    pprint.pprint(expected)
    pprint.pprint(result)

    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
@pytest.mark.JMP
def test_LOAD_I_R(framework, capsys, tmpdir):

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

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))

    pprint.pprint(result)

    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
@pytest.mark.JMP
@pytest.mark.STORE
def test_LOAD_I_R_autoinc(framework, capsys, tmpdir):

    source = ".equ autoinc &340\n"

    expected = ExpectedData([ SUCCESS ])

    MAX = 255                   # 1 to 255

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
    
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
@pytest.mark.JMP
@pytest.mark.STORE
def test_LOAD_I_R_autodec(framework, capsys, tmpdir):

    source = """
    .include "dfp2.asm"
    .equ autodec &380
    """

    expected = ExpectedData([ SUCCESS ])

    MAX = 255                   # 1 to 255

    source += "&0:\n"
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    source += "\t\tLOAD      @+3\n"
    source += "\t\tSTORE R   autodec\n"
    source += "\t\tJMP       @+2\n"
    source += "\t\t.word     @data-1\n"

    for x in range(MAX):
        source += "\t\tLOAD I R  autodec\n"
        source += "\t\tdfp.PRINTU\n"
        expected.append([ 340, "PRINTU", str(MAX - 1 - x) ])

    source += "\t\tHALT\n"
    expected += [ HALTED ]

    # The data table.
    source += "&1389:\n"

    for x in range(MAX):
        source += "\t\t.word {}\n".format(x)
    source += "data:\n"
    
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.LOAD
@pytest.mark.OUT
@pytest.mark.JMP
@pytest.mark.STORE
def test_LOAD_I_R_stack(framework, capsys, tmpdir):
    """Test stack pointer autoindexing. For LOAD, this behaves just like
    autodecrement except the register is decremented BEFORE use."""

    source = ".equ stack &3c0\n"

    expected = ExpectedData([ SUCCESS ])

    MAX = 255                   # 1 to 255

    source += "&0:\n"
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    source += "\t\tLOAD      @+3\n"
    source += "\t\tSTORE R   stack\n"
    source += "\t\tJMP       @+2\n"
    source += "\t\t.word     data\n"

    for x in range(MAX):
        source += "\t\tLOAD I R  stack\n"
        source += "\t\tOUT R     &113\n"
        expected.append([ 340, "PRINTU", str(MAX - 1 - x) ])

    source += "\t\tLOAD R    stack\n"
    source += "\t\tOUT R     &114\n"
    expected += [ [340, "PRINTH", "1389" ] ]

    source += "\t\tOUT R &11d\n"
    expected += [ HALTED ]

    # The data table.
    source += "&1389:\n"

    for x in range(MAX):
        source += "\t\t.word {}\n".format(x)
    source += "data:\n"
    
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
