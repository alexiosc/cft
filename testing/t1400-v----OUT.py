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
@pytest.mark.IN
def test_IN_I(capsys, tmpdir):
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
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            IN I R addr8
            dfp.PRINTH
            IN I R addr9
            dfp.PRINTH
            IN I R addra
            dfp.PRINTH
            IN I R addrb
            dfp.PRINTH
            IN I R addrc
            dfp.PRINTH

            HALT

    addr8:  .data &3f8
    addr9:  .data &3f9
    addra:  .data &3fa
    addrb:  .data &3fb
    addrc:  .data &3fc

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.IN
def test_IOT_I_R(capsys, tmpdir):
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

            LOAD addr8
            STORE R &100
            LOAD addr9
            STORE R &101
            LOAD addra
            STORE R &102
            LOAD addrb
            STORE R &103
            LOAD addrc
            STORE R &104

            IN I R &100
            dfp.PRINTH
            IN I R &101
            dfp.PRINTH
            IN I R &102
            dfp.PRINTH
            IN I R &103
            dfp.PRINTH
            IN I R &104
            dfp.PRINTH

            HALT

    addr8:  .data &3f8
    addr9:  .data &3f9
    addra:  .data &3fa
    addrb:  .data &3fb
    addrc:  .data &3fc

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.JSR
@pytest.mark.RET
@pytest.mark.JMP
@pytest.mark.OUT
@pytest.mark.IN
def test_IN_I_R_autoinc(capsys, tmpdir):
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

            IN I R &341
            dfp.PRINTH
            IN I R &341
            dfp.PRINTH
            IN I R &341
            dfp.PRINTH
            IN I R &341
            dfp.PRINTH
            IN I R &341
            dfp.PRINTH

            HALT

    addr:   .data &3f8

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.JSR
@pytest.mark.RET
@pytest.mark.JMP
@pytest.mark.OUT
@pytest.mark.IN
def test_IN_I_R_autodec(capsys, tmpdir):
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
            STORE R &381

            IN I R &381
            dfp.PRINTH
            IN I R &381
            dfp.PRINTH
            IN I R &381
            dfp.PRINTH
            IN I R &381
            dfp.PRINTH
            IN I R &381
            dfp.PRINTH

            HALT

    addr:   .data &3fc

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "4321" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "1234" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.JSR
@pytest.mark.RET
@pytest.mark.JMP
@pytest.mark.OUT
@pytest.mark.IN
def test_IN_I_R_autodec(capsys, tmpdir):
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
            STORE R &3c1

            IN I R &3c1
            dfp.PRINTH
            IN I R &3c1
            dfp.PRINTH
            IN I R &3c1
            dfp.PRINTH
            IN I R &3c1
            dfp.PRINTH
            IN I R &3c1
            dfp.PRINTH

            HALT

    addr:   .data &3fd

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "4321" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "1234" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
