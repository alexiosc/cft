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
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.TRAP
def test_TRAP(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:
            JMP boot

    &800100:
    boot:
            LI &1         ; Set up context 1 (the TRAP context)
            SCT
            LI &82
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI &0         ; Set up context 0 (the reset context, and ours)
            SCT
            LI &80
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI &42
            dfp.PRINTH
            TRAP 99
            dfp.PRINTH
            FAIL
            HALT

    &820000:
            NOP           ; Reset vector
            NOP           ; 
            LJMP 4        ; 00:0002: Soft interrupts
            HALT          ; 00:0003: Don't allow hardware interrupts.
            .data thr     ; 00:0004: Trap Handler Routine Address
            .data &82     ; 00:0005: THR memory bank

    &821000:
    thr:    dfp.PRINTH
            PPA
            dfp.PRINTH
            LI 1
            PPA
            SUCCESS
            HALT

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0063" ],
                              [ 340, "PRINTH", "0042" ],
                              SUCCESS,
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source, rom_addr=8192, timeout=10000, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
