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
def test_STORE(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ addr 1

    &0:
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS, ROM_WP0 ])

    MAX = 127                   # 1 to 127
    for x in range(MAX):
        # This is 8 instructions, so 8-word aligned, so all references
        # will always be page-local.
        source += "        LI {}\n".format(x)
        source += "        STORE @+6\n"
        source += "        dfp.PRINTU\n"
        source += "        LI {}\n".format(x ^ 0x3ff)
        source += "        LOAD @+3\n"
        source += "        dfp.PRINTU\n"
        source += "        JMP @+2\n"
        source += "        .word &dead\n"
        expected.append([ 340, "PRINTU", str(x) ])
        expected.append([ 340, "PRINTU", str(x) ])

    source += "        HALT\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source,
                                verilog_args=["+wp=0"])
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
def test_STORE_I(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ addr 1

    &0:
    """
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)

    expected = ExpectedData([ SUCCESS, ROM_WP0 ])

    MAX=255                     # 1-255

    for x in range(MAX):
        source += "        LI {}\n".format(x)
        source += "        STORE I @table+{}\n".format(x)
        source += "        LI {}\n".format(x & 0x3ff)
        source += "        dfp.PRINTH\n"

    source += "        HALT\n"

    # The indirection table
    source += "table:\n"
    for x in range(MAX):
        source += "        .word @data+{}\n".format(x)

    # The data table
    source += "&7800:\n"
    source += "data:\n"
    for x in range(MAX):
        source += "        .word &{:>04x}\n".format(0xe000 + x)
        expected.append([ 340, "PRINTH", "{:>04x}".format(x) ])

    # The halted notification should appear at the end (we've already
    # added the HALT instruction.
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source,
                                verilog_args=["+wp=0"])
    result = list(expected.prepare(result))

    assert result == expected


@pytest.mark.verilog
def test_STORE_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ addr 1

    &0:
    """
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)

    expected = ExpectedData([ SUCCESS ])

    MAX=1017                       # 1-1017

    source += "        JMP start\n".format(MAX)

    # The data table is here
    source += "data:\n"
    for x in range(MAX):
        source += "        .word &{:>04x}\n".format(0xffff ^ x)
        expected.append([ 340, "PRINTH", "{:>04x}".format(x) ])

    # The load/out code is here
    source += "start:\n"
    for x in range(MAX):
        source += "        LI {}\n".format(x)
        source += "        STORE R @data+{}\n".format(x)
        source += "        LI &3ff\n"
        source += "        LOAD R @data+{}\n".format(x)
        source += "        dfp.PRINTH\n"

    source += "        HALT\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    pprint.pprint(expected)
    pprint.pprint(result)

    assert result == expected


@pytest.mark.verilog
def test_STORE_I_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ addr 1

    &0:
    """
    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=1)

    expected = ExpectedData([ SUCCESS ])

    # We can go up to 768 (must avoid autoincrement registers)
    MAX=2

    source += "        JMP start\n".format(MAX)

    # The data table is here
    source += "table:\n"
    for x in range(MAX):
        source += "        .word &{:>04x}\n".format(0x7500 + x)

    # The load/out code is here
    source += "start:\n"
    for x in range(MAX):
        source += "        LI {}\n".format(x)
        source += "        STORE I R @table+{}\n".format(x)
        source += "        LI &3ff\n".format(x)
        source += "        LOAD I R @table+{}\n".format(x)
        source += "        dfp.PRINTU\n"

    source += "        OUT R &11d\n"

    # The actual data is here
    source += "&7500:\n"
    source += "data:\n"
    for x in range(MAX):
        source += "        .word &dead\n"
        # ...but if STORE works, we'll expect to see:
        expected.append([ 340, "PRINTU", str(x) ])

    # The halted notification should appear at the end (we've already
    # added the HALT instruction.
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))

    pprint.pprint(result)

    assert result == expected


# # @pytest.mark.verilog
# # def test_LOAD_I_R_autoinc(capsys, tmpdir):

# #     source = "&340:\n"
# #     source += "        .word data"
# #     expected = ExpectedData([ SUCCESS ])

# #     MAX = 5                   # 1 to 255

# #     source = "&0:\n"
# #     for x in range(MAX):
# #         source += "        LOAD  I R &340\n"
# #         source += "        OUT   R &113\n"
# #         expected.append([ 340, "PRINTU", str(x) ])

# #     source += "        OUT R &11d\n"
# #     expected += [ HALTED ]

# #     # The data table.
# #     source += "&1389:\n"
# #     source += "data:\n"

# #     for x in range(MAX):
# #         source += "        .word {}\n".format(x)
    
# #     result = run_on_verilog_emu(capsys, tmpdir, source)
# #     result = list(expected.prepare(result))
# #     assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
