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
@pytest.mark.NOP
def test_NOP(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SKIP
def test_SKIP(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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
    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


def _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken):

    maxval = 63
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(expected)
    # pprint.pprint(result)
    # assert False
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SNA
def test_SNA(framework, capsys, tmpdir):
    instr = "SNA"
    skip_taken = lambda x: x & 0x8000
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SZA
def test_SZA(framework, capsys, tmpdir):
    instr = "SZA"
    skip_taken = lambda x: x == 0
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SNP
def test_SNP(framework, capsys, tmpdir):
    instr = "SNP"
    skip_taken = lambda x: (x & 0x8000) or (x == 0)
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SNN
def test_SNN(framework, capsys, tmpdir):
    instr = "SNN"
    skip_taken = lambda x: not (x & 0x8000)
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SPA
def test_SPA(framework, capsys, tmpdir):
    instr = "SPA"
    skip_taken = lambda x: not ((x & 0x8000) or (x == 0))
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SNZ
def test_SNZ(framework, capsys, tmpdir):
    instr = "SNZ"
    skip_taken = lambda x: not (x == 0)
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SSL
def test_SSL(framework, capsys, tmpdir):
    # Trick: shift the AC's MSB into the L register to check this instruction.
    instr = "SHL 1\n    SSL"
    skip_taken = lambda x: x & 0x8000
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SCL
def test_SCL(framework, capsys, tmpdir):
    # Trick: shift the AC's MSB into the L register to check this instruction.
    instr = "SHL 1\n    SCL"
    skip_taken = lambda x: not(x & 0x8000)
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SSV
def test_SSV(framework, capsys, tmpdir):
    # Trick: transfer the AC to the Flags, and then FV = AC & 0x2000.
    instr = "PHA\n    PPF\n    SSV"
    skip_taken = lambda x: x & 0x2000
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)




@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SCV
def test_SCV(framework, capsys, tmpdir):
    # Trick: transfer the AC to the Flags, and then FV = AC & 0x2000.
    instr = "PHA\n    PPF\n    SCV"
    skip_taken = lambda x: not(x & 0x2000)
    _test_SKP_subinstr(framework, capsys, tmpdir, instr, skip_taken)




 




@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.SHL
@pytest.mark.SKIP
@pytest.mark.SNP
@pytest.mark.slow
def _test_SNP_long(framework, capsys, tmpdir):

    maxval = 65535
    instr = "SNP"
    skip_taken = lambda x: (x & 0x8000) or (x == 0)
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
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

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
