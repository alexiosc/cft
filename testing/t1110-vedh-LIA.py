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
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LIA
def test_LIA_R(capsys, tmpdir):

    expected = ExpectedData([ SUCCESS ])

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
    """

    for x in range(1024):
        source += "\t\tLIA R &{:>x}\n".format(x)
        source += "\t\tdfp.PRINTU\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "\t\tHALT\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LIA
def test_LIA(capsys, tmpdir):

    expected = ExpectedData([ SUCCESS ])

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:     .fill 65535 HALT
    &0:     JMP I @+1
            .word &1400
    &1400:
    """
    expected = ExpectedData([ SUCCESS ])

    # These will be on page &1400
    for x in range(512):
        source += "\t\tLIA &{:>x}\n".format(x)
        source += "\t\tdfp.PRINTU\n"
        expected.append([ 340, "PRINTU", str(x | 0x1400) ])

    source += "\t\tJMP I @+1\n"
    source += "\t\t.word &3c00\n"
    source += "&3c00:\n"

    # These will be on page &3c00
    for x in range(512):
        source += "\t\tLIA &{:>x}\n".format(x)
        source += "\t\tdfp.PRINTU\n"
        expected.append([ 340, "PRINTU", str(x | 0x3c00) ])

    source += "\t\tHALT\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
