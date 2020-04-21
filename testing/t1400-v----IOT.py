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
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 293
            IOT PORTA     ; Need just OUT, but IOT won't hurt here.
            LI 123
            IOT PORTB
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            IOT PORTA     ; Need just OUT, but IOT won't hurt here.
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

            LI 293
            IOT I R addra ; Need just OUT, but IOT won't hurt here.
            LI 123
            IOT I R addrb
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            IOT I R addra ; Need just OUT, but IOT won't hurt here.
            LI 0
            IOT I R addrb
            FAIL
            dfp.PRINTU

            HALT

    addra:  .data &3fd
    addrb:  .data &3fe

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

            LOAD addra
            STORE R &100
            LOAD addrb
            STORE R &101

            LI 293
            IOT I R &100 ; Need just OUT, but IOT won't hurt here.
            LI 123
            IOT I R &101
            dfp.PRINTU

            LI 666        ; Test SKIPEXT
            IOT I R &100 ; Need just OUT, but IOT won't hurt here.
            LI 0
            IOT I R &101
            FAIL
            dfp.PRINTU

            HALT

    addra:  .data &3fd
    addrb:  .data &3fe

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
def test_IOT_I_R_autoinc(capsys, tmpdir):
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

            LIA data1
            JSR work

            LIA data2
            JSR work

            SUCCESS
            HALT

    work:   STORE R &340  ; Source address, autoincrement
            LI 1          ; Initialise the two test registers
            OUT PORTA
            OUT PORTB
            LOAD addr     ; Destination I/O address, autoinc
            STORE R &341
            LI 6          ; 7 repetitions
            STORE R &100  ; Loop counter
    loop:   LOAD I R &340 ; Load from data table
            IOT I R &341  ; IOT to test card
            dfp.PRINTH    ; The test card skips this if the result is zero!
            DSZ R &100
            JMP loop
            SUCCESS
            RET

    addr:   .data &3f8
    data1:  .data &dead &beef &dead &fa77 &beef &0193 &007b
    data2:  .data &dead &beef &dead &fa77 &beef &0666 &0000

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              [ 340, "PRINTH", "0193" ],
                              [ 340, "PRINTH", "c1a1" ],
                              SUCCESS,
                              [ 340, "PRINTH", "1234" ],
                              [ 340, "PRINTH", "5678" ],
                              [ 340, "PRINTH", "9abc" ],
                              [ 340, "PRINTH", "def0" ],
                              [ 340, "PRINTH", "4321" ],
                              [ 340, "PRINTH", "0666" ],
                              # [ 340, "PRINTH", "0000" ], # <-- this is skipped the second time!
                              SUCCESS,
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
