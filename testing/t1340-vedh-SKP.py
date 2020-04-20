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


"""
.equ    IRET    &0000            ; 0000:0:0:000:-------  Interrupt Return
.equ    ISR     &0400            ; 0000:0:1:000:LLLLLLL  Software Interrupt
.equ    STI     &0680            ; 0000:0:1:101:-------  Set Interrupt Flag
.equ    CLI     &0700            ; 0000:0:1:110:-------  Clear Interrupt Flag
.equ    WAIT    &0780            ; 0000:0:1:111:LLLLLLL  Wait for Interrupt
.equ    HCF     &0d80            ; 0000:1:1:011:-------  Halt and Catch Fire

.equ    UOP     &0e00            ; UOP bitmap instruction
.equ    IFL     &0e8c            ; IFL bitmap instruction
.equ    IFV     &0f0c            ; IFV bitmap instruction
.equ    NOP9    UOP     #0000000 ; 0000:1:1:100:0000000  No Operation, 9 Cycles
.equ    CLA     UOP     #0100000 ; 0000:1:1:100:-1-----  Clear Accumulator
.equ    CLL     UOP     #0010000 ; 0000:1:1:100:--1----  Clear Link
.equ    SEL     UOP     #0010001 ; 0000:1:1:100:--1---1  Set Link
.equ    NOT     UOP     #0001000 ; 0000:1:1:100:---1---  Complement Accumulator
.equ    NEG     UOP     #0001100 ; 0000:1:1:100:---11--  Negate Accumulator
.equ    INC     UOP     #0000100 ; 0000:1:1:100:----1--  Increment Accumulator
.equ    DEC     UOP     #0000010 ; 0000:1:1:100:-----1-  Decrement Accumulator
.equ    CPL     UOP     #0000001 ; 0000:1:1:100:------1  Complement Link

.equ    IN      &5000            ; 0101:I:R:mmmmmmmmmm   Input from I/O Space
.equ    OUT     &6000            ; 0110:I:R:mmmmmmmmmm   Output to I/O Space
.equ    IOT     &7000            ; 0111:I:R:mmmmmmmmmm   I/O Transaction

.equ    ADD     &c000            ; 1100:I:R:mmmmmmmmmm   Add To Accumulator
.equ    AND     &d000            ; 1101:I:R:mmmmmmmmmm   Bitwise AND With Accumulator
.equ    OR      &e000            ; 1110:I:R:mmmmmmmmmm   Bitwise OR With Accumulator
.equ    XOR     &f000            ; 1111:I:R:mmmmmmmmmm   Bitwise XOR With Accumulator
"""



@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.NOP
def test_NOP(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            NOP
            SUCCESS
            NOP
            SUCCESS
            NOP
            SUCCESS
            NOP
            SUCCESS
            HALT
    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              SUCCESS, SUCCESS, SUCCESS, SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
def test_SKIP(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            SKIP
            FAIL
            SUCCESS

            SKIP
            FAIL
            SUCCESS

            SKIP
            FAIL
            SUCCESS

            SKIP
            FAIL
            SUCCESS

            HALT
    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              SUCCESS, SUCCESS, SUCCESS, SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


def _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken):

    maxval = 63
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LOAD max
            STORE R &300
    loop:   SHL 10
            dfp.PRINTH
            {instr}
            JMP false
            JMP true
    back:   DSZ R &300
            JMP loop
            SUCCESS
            HALT

    false:  FAIL
            JMP back

    true:   SUCCESS
            JMP back

    max:    .data {maxval}

    """.format(**locals())

    expected = ExpectedData([ SUCCESS ])
    for x in range(maxval, -1, -1):
        # For this test, SUCCESS means skip taken; FAIL means skip not taken.
        expected += [ [ 340, "PRINTH", "{:>04x}".format(x << 10) ] ]
        if skip_taken(x << 10):
            expected += [ SUCCESS ]
        else:
            expected += [ FAIL ]

    expected += [ SUCCESS, HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(expected)
    # pprint.pprint(result)
    # assert False
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SNA
def test_SNA(capsys, tmpdir):
    instr = "SNA"
    skip_taken = lambda x: x & 0x8000
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SZA
def test_SZA(capsys, tmpdir):
    instr = "SZA"
    skip_taken = lambda x: x == 0
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SNP
def test_SNP(capsys, tmpdir):
    instr = "SNP"
    skip_taken = lambda x: (x & 0x8000) or (x == 0)
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SNN
def test_SNN(capsys, tmpdir):
    instr = "SNN"
    skip_taken = lambda x: not (x & 0x8000)
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SPA
def test_SPA(capsys, tmpdir):
    instr = "SPA"
    skip_taken = lambda x: not ((x & 0x8000) or (x == 0))
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SNZ
def test_SNZ(capsys, tmpdir):
    instr = "SNZ"
    skip_taken = lambda x: not (x == 0)
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SSL
def test_SSL(capsys, tmpdir):
    # Trick: shift the AC's MSB into the L register to check this instruction.
    instr = "SHL 1\n    SSL"
    skip_taken = lambda x: x & 0x8000
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SCL
def test_SCL(capsys, tmpdir):
    # Trick: shift the AC's MSB into the L register to check this instruction.
    instr = "SHL 1\n    SCL"
    skip_taken = lambda x: not(x & 0x8000)
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SSV
def test_SSV(capsys, tmpdir):
    # Trick: transfer the AC to the Flags, and then FV = AC & 0x2000.
    instr = "PHA\n    PPF\n    SSV"
    skip_taken = lambda x: x & 0x2000
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)




@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SCV
def test_SCV(capsys, tmpdir):
    # Trick: transfer the AC to the Flags, and then FV = AC & 0x2000.
    instr = "PHA\n    PPF\n    SCV"
    skip_taken = lambda x: not(x & 0x2000)
    _test_SKP_subinstr(capsys, tmpdir, instr, skip_taken)




 




@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
@pytest.mark.SNP
@pytest.mark.slow
def _test_SNP_long(capsys, tmpdir):

    maxval = 65535
    instr = "SNP"
    skip_taken = lambda x: (x & 0x8000) or (x == 0)
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LOAD max
            STORE R &300
    loop:   dfp.PRINTH
            {instr}
            JMP false
            JMP true
    back:   DSZ R &300
            JMP loop
            SUCCESS
            HALT

    false:  FAIL
            JMP back

    true:   SUCCESS
            JMP back

    max:    .word {maxval}
    """.format(**locals())

    expected = ExpectedData([ SUCCESS ])
    for x in range(maxval, -1, -1):
        # For this test, SUCCESS means skip taken; FAIL means skip not taken.
        expected += [ [ 340, "PRINTH", "{:>04x}".format(x) ] ]
        if skip_taken(x):
            expected += [ SUCCESS ]
        else:
            expected += [ FAIL ]

    expected += [ SUCCESS, HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
