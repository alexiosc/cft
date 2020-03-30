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
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.LOAD
@pytest.mark.JMP
def test_DSZ(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI           &80
           SMB          mbu.MBP
           LI           &00
           SMB          mbu.MBD
           SMB          mbu.MBS
           SMB          mbu.MBZ

           LI          19
           STORE       &100
    loop:  dfp.PRINTU
           LI          0        ; This helps detect premature if-z
           DSZ         &100
           JMP         loop
           SUCCESS
           dfp.PRINTD
           LOAD        &100
           dfp.PRINTD
           HALT
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS, ROM_WP0 ])
    expected += list([ 340, 'PRINTU', str(x) ] for x in range(19, -1, -1))
    expected += [ SUCCESS,
                  [ 340, "PRINTD", "-1" ], # The AC
                  [ 340, "PRINTD", "-1" ], # The loop register location
                  HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source,
                                verilog_args=["+wp=0"])
    result = list(expected.prepare(result))
    pprint.pprint(result)
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.LOAD
@pytest.mark.JMP
def test_DSZ_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI           &80
           SMB          mbu.MBP
           LI           &00
           SMB          mbu.MBD
           SMB          mbu.MBS
           SMB          mbu.MBZ

           LI          19
           STORE       R &100
    loop:  dfp.PRINTU
           LI          0        ; This helps detect premature if-z
           DSZ         R &100
           JMP         loop
           SUCCESS
           dfp.PRINTD
           LOAD        R &100
           dfp.PRINTD
           HALT
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS ])
    expected += list([ 340, 'PRINTU', str(x) ] for x in range(19, -1, -1))
    expected += [ SUCCESS,
                  [ 340, "PRINTD", "-1" ], # The AC
                  [ 340, "PRINTD", "-1" ], # The loop register location
                  HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.LOAD
@pytest.mark.JMP
def test_DSZ_I(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI           &80
           SMB          mbu.MBP
           SMB          mbu.MBD
           SMB          mbu.MBS
           SMB          mbu.MBZ

           LI          &100
           STORE       &300 ; Use a MBP-relative register
           LI          19
           STORE       &100
    loop:  dfp.PRINTU
           LI          0        ; This helps detect premature if-z
           DSZ         I &300
           JMP         loop
           SUCCESS
           dfp.PRINTD
           LOAD        I &300
           dfp.PRINTD
           HALT
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS, ROM_WP0 ])
    expected += list([ 340, 'PRINTU', str(x) ] for x in range(19, -1, -1))
    expected += [ SUCCESS,
                  [ 340, "PRINTD", "-1" ], # The AC
                  [ 340, "PRINTD", "-1" ], # The loop register location
                  HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source,
                                verilog_args=["+wp=0"])
    result = list(expected.prepare(result))
    pprint.pprint(result)
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.LOAD
@pytest.mark.JMP
def test_DSZ_I_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI           &80
           SMB          mbu.MBP
           LI           &0
           SMB          mbu.MBD
           SMB          mbu.MBS
           SMB          mbu.MBZ

           LI          &100
           STORE       R &304 ; Use a MBP-relative register
           LI          19
           STORE       R &100
    loop:  dfp.PRINTU
           LI          0        ; This helps detect premature if-z
           DSZ         I R &304
           JMP         loop
           SUCCESS
           dfp.PRINTD
           LOAD        I R &304
           dfp.PRINTD
           HALT
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS ])
    expected += list([ 340, 'PRINTU', str(x) ] for x in range(19, -1, -1))
    expected += [ SUCCESS,
                  [ 340, "PRINTD", "-1" ], # The AC
                  [ 340, "PRINTD", "-1" ], # The loop register location
                  HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    pprint.pprint(result)
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
