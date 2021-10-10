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
    .include "dev/dfp2.asm"

    &800000:
            JMP boot

    &800100:
    boot:
            LI &0         ; Set up context 0 (the reset context, and ours)
            SCT           ; This is possible because the MBU is still disabled
            LI &80        ; &80 is this bank.
            SMB mbu.MBP   ; This enables the MBU, so we must immediately set it up.
            LI &80        ; 
            SMB mbu.MBD   ; 
            LI &01        ; 
            SMB mbu.MBS   ; 
            LI &00        ; 
            SMB mbu.MBZ   ; 

            LI &1
            TAD
            LI &82        ; Set up context 1 (the TRAP context)
            NMB mbu.MBP   ; MBP is &82
            LMB mbu.MBD   ; Share the other banks with this context
            NMB mbu.MBD
            LMB mbu.MBS
            NMB mbu.MBS
            LMB mbu.MBZ
            NMB mbu.MBZ

            LI &42
            dfp.PRINTH
            TRAP 99
            dfp.PRINTH
            FAIL
            HALT

    &820000:
            SENTINEL      ; 82:0002: Reset vector
            SENTINEL      ; 82:0001: Not used
            SENTINEL      ; 82:0002: Don't allow hardware interrupts.
            LJMP @+1      ; 82:0003: Soft interrupts
            .data thr     ; 82:0004: Trap Handler Routine Address
            .data &84     ; 82:0005: THR memory bank

    &848000:
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
    result = run_on_framework(framework, capsys, tmpdir, source, rom_addr=8192, timeout=1000000, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
