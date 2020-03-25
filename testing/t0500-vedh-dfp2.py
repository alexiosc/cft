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
def test_sentinel(capsys, tmpdir):

    source = """
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL
    """

    expected = ExpectedData([ OK, SENTINEL ])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_halt(capsys, tmpdir):

    source = """
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL

    &0:     HALT
    """

    expected = ExpectedData([ OK, HALTED ])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_success(capsys, tmpdir):

    source = """
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL

    &0:     SUCCESS
            SUCCESS
            HALT
    """

    expected = ExpectedData([ OK, SUCCESS, SUCCESS, HALTED ])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_fail(capsys, tmpdir):

    source = """
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL

    &0:     FAIL
            SENTINEL
            HALT
    """

    expected = ExpectedData([ OK, FAIL ])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_print(capsys, tmpdir):
    """We haven't formally checked the LI instruction yet, but we'll try
    it out here anyway. We've been informally testing the OUT instruction,
    after all!"""

    source = """
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL

    &0:     LI &3ff
            dfp.PRINTA
            dfp.PRINTC
            dfp.PRINTD
            dfp.PRINTU
            dfp.PRINTH
            dfp.PRINTB
            dfp.PRINTSP
            dfp.PRINTNL
            dfp.PRINTHI
            dfp.PRINTLO
            HALT
    """

    expected = ExpectedData([
        OK,
        [ 340, "PRINTA", "03ff" ],
        [ 340, "PRINTC", "255" ],
        [ 340, "PRINTD", "1023" ],
        [ 340, "PRINTU", "1023" ],
        [ 340, "PRINTH", "03ff" ],
        [ 340, "PRINTB", "0000001111111111" ],
        [ 340, "PRINTC", "32" ],
        [ 340, "PRINTC", "10" ],
        [ 340, "PRINTL", "03ff03ff" ],
        HALTED
    ])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
