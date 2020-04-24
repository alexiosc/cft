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
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.TRAP
@pytest.mark.IRET
def test_IRET(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LOAD isr0     ; Install the THR
            STORE R 2
            LOAD @isr0+1
            STORE R 3
            LOAD @isr0+2
            STORE R 4
            LOAD @isr0+3
            STORE R 5

            LI &42
            dfp.PRINTH
            TRAP 0
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 1
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 2
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 127
            dfp.PRINTH
            SUCCESS

            HALT

    isr0:   LJMP 4        ; 00:0002:
            HALT          ; 00:0003: Don't allow hardware interrupts.
            .data thr     ; 00:0004: Trap Handler Routine Address
            .data &82     ; 00:0005: THR memory bank

    &828000:
    thr:    dfp.PRINTH
            PPA
            dfp.PRINTH
            LI 666
            PHA
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0000" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0001" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0002" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "007f" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,

                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    #pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.TRAP
@pytest.mark.IRET
def test_IRET_int(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &000000:
            SUCCESS
            SUCCESS
            HALT
            LJMP 4
            .data thr
            .data &82

    &800000:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 30
            STORE R 1
            STI
            LI &10
            OUT &3ff

    wait:   LOAD R 1
            SNP
            JMP wait
            SUCCESS
            HALT

    &828000:
    thr:    LOAD R 1
            SNZ
            IRET
            DSZ R 1
            NOP
            dfp.PRINTH
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTH', '001d' ],
                              [ 340, 'PRINTH', '001c' ],
                              [ 340, 'PRINTH', '001b' ],
                              [ 340, 'PRINTH', '001a' ],
                              [ 340, 'PRINTH', '0019' ],
                              [ 340, 'PRINTH', '0018' ],
                              [ 340, 'PRINTH', '0017' ],
                              [ 340, 'PRINTH', '0016' ],
                              [ 340, 'PRINTH', '0015' ],
                              [ 340, 'PRINTH', '0014' ],
                              [ 340, 'PRINTH', '0013' ],
                              [ 340, 'PRINTH', '0012' ],
                              [ 340, 'PRINTH', '0011' ],
                              [ 340, 'PRINTH', '0010' ],
                              [ 340, 'PRINTH', '000f' ],
                              [ 340, 'PRINTH', '000e' ],
                              [ 340, 'PRINTH', '000d' ],
                              [ 340, 'PRINTH', '000c' ],
                              [ 340, 'PRINTH', '000b' ],
                              [ 340, 'PRINTH', '000a' ],
                              [ 340, 'PRINTH', '0009' ],
                              [ 340, 'PRINTH', '0008' ],
                              [ 340, 'PRINTH', '0007' ],
                              [ 340, 'PRINTH', '0006' ],
                              [ 340, 'PRINTH', '0005' ],
                              [ 340, 'PRINTH', '0004' ],
                              [ 340, 'PRINTH', '0003' ],
                              [ 340, 'PRINTH', '0002' ],
                              [ 340, 'PRINTH', '0001' ],
                              [ 340, 'PRINTH', '0000' ],
                              SUCCESS,
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
