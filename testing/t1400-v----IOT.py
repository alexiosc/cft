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
@pytest.mark.IOT
def test_IOT(capsys, tmpdir):
    """These tests makes use of a fake Verilog test card that provides a
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
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 293
            OUT PORTA
            LI 123
            IOT PORTB
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            OUT PORTA
            LI 0
            IOT PORTB
            FAIL
            dfp.PRINTU

            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTU", "36039" ],
                              [ 340, "PRINTU", "0" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.IOT
def test_IOT_I(capsys, tmpdir):
    """These tests makes use of a fake Verilog test card that provides a
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

            LI 293
            OUT PORTA
            LI 123
            IOT I R addr
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            OUT PORTA
            LI 0
            IOT I R addr
            FAIL
            dfp.PRINTU

            HALT

    addr:   .data &3fe

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTU", "36039" ],
                              [ 340, "PRINTU", "0" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.IOT
def test_IOT_I_R(capsys, tmpdir):
    """These tests makes use of a fake Verilog test card that provides a
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

            LOAD addr
            STORE R &100

            LI 293
            OUT PORTA
            LI 123
            IOT I R &100
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            OUT PORTA
            LI 0
            IOT I R &100
            FAIL
            dfp.PRINTU

            HALT

    addr:   .data &3fe

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTU", "36039" ],
                              [ 340, "PRINTU", "0" ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
