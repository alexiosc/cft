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
@pytest.mark.LI
@pytest.mark.OUT
def test_OUT(capsys, tmpdir):
    """We've already extensively tested the OUT instruction via DFP
    extended instructions, so this test can be trivial."""
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 42
            dfp.PRINTA
            dfp.PRINTC
            dfp.PRINTD
            dfp.PRINTU
            dfp.PRINTH
            dfp.PRINTB
            dfp.PRINTSP
            dfp.PRINTNL
            dfp.PRINTH
            SUCCESS

            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTA', '002a' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTC', '10' ],
                              [ 340, 'PRINTH', '002a' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.OUT
def test_OUT_I(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 42
            OUT I addr
            OUT I @addr+1
            OUT I @addr+2
            OUT I @addr+3
            OUT I @addr+4
            OUT I @addr+5
            OUT I @addr+6
            OUT I @addr+7
            OUT I @addr+8
            SUCCESS
            HALT

    addr:   .data @dfp.PRINTA&0x3ff
            .data @dfp.PRINTC&0x3ff
            .data @dfp.PRINTD&0x3ff
            .data @dfp.PRINTU&0x3ff
            .data @dfp.PRINTH&0x3ff
            .data @dfp.PRINTB&0x3ff
            .data @dfp.PRINTSP&0x3ff
            .data @dfp.PRINTNL&0x3ff
            .data @dfp.PRINTH&0x3ff

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTA', '002a' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTC', '10' ],
                              [ 340, 'PRINTH', '002a' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.OUT
def test_OUT_I_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LOAD addr
            STORE R &100
            LOAD @addr+1
            STORE R &101
            LOAD @addr+2
            STORE R &102
            LOAD @addr+3
            STORE R &103
            LOAD @addr+4
            STORE R &104
            LOAD @addr+5
            STORE R &105
            LOAD @addr+6
            STORE R &106
            LOAD @addr+7
            STORE R &107
            LOAD @addr+8
            STORE R &108

            LI 42
            OUT I R &100
            OUT I R &101
            OUT I R &102
            OUT I R &103
            OUT I R &104
            OUT I R &105
            OUT I R &106
            OUT I R &107
            OUT I R &108
            SUCCESS
            HALT

    addr:   .data @dfp.PRINTA&0x3ff
            .data @dfp.PRINTC&0x3ff
            .data @dfp.PRINTD&0x3ff
            .data @dfp.PRINTU&0x3ff
            .data @dfp.PRINTH&0x3ff
            .data @dfp.PRINTB&0x3ff
            .data @dfp.PRINTSP&0x3ff
            .data @dfp.PRINTNL&0x3ff
            .data @dfp.PRINTH&0x3ff

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTA', '002a' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTC', '10' ],
                              [ 340, 'PRINTH', '002a' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.OUT
def test_OUT_I_R_autoinc(capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LOAD addr     ; Destination I/O address, autoinc
            STORE R &341

            LI 42
            OUT I R &341
            OUT I R &341
            OUT I R &341
            OUT I R &341
            OUT I R &341
            OUT I R &341
            OUT I R &341
            OUT I R &341
            SUCCESS
            HALT

    addr:   .data @dfp.PRINTA&0x3ff

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTA', '002a' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTC', '10' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.OUT
def test_OUT_I_R_autodec(capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI &117
            STORE R &381

            LI 42
            OUT I R &381
            OUT I R &381
            OUT I R &381
            OUT I R &381
            OUT I R &381
            OUT I R &381
            OUT I R &381
            OUT I R &381
            SUCCESS
            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTC', '10' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTA', '002a' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.STORE
@pytest.mark.OUT
def test_OUT_I_R_stack(capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI &118
            STORE R &3c1

            LI 42
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            OUT I R &3c1
            SUCCESS
            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTC', '10' ],
                              [ 340, 'PRINTC', '32' ],
                              [ 340, 'PRINTB', '0000000000101010' ],
                              [ 340, 'PRINTH', '002a' ],
                              [ 340, 'PRINTU', '42' ],
                              [ 340, 'PRINTD', '42' ],
                              [ 340, 'PRINTC', '42' ],
                              [ 340, 'PRINTA', '002a' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
