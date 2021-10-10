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
@pytest.mark.IN
def test_IN(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            IN R &3f8
            dfp.PRINTH
            IN R &3f9
            dfp.PRINTH
            IN R &3fa
            dfp.PRINTH
            IN R &3fb
            dfp.PRINTH
            IN R &3fc
            dfp.PRINTH

            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.IN
def test_IN_I(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            IN I addr8
            dfp.PRINTH
            IN I addr9
            dfp.PRINTH
            IN I addra
            dfp.PRINTH
            IN I addrb
            dfp.PRINTH
            IN I addrc
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
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.IN
def test_IN_I_R(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
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
def test_IN_I_R_autoinc(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
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
def test_IN_I_R_autodec(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
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
def test_IN_I_R_autodec(framework, capsys, tmpdir):
    """This test makes use of a fake Verilog test card that provides a
    rudimentary timer interrupt and a ‘hardware’ multiplier that can
    be used with the IOT instruction. This does not exist on actual
    hardware, hence this test can only run on the Verilog framework.
    """

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    .equ PORTA R &3fd
    .equ PORTB R &3fe
    .equ TIMER R &3ff

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
