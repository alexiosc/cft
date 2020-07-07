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
            TRAP 99
            dfp.PRINTH
            FAIL
            HALT

    isr0:   LJMP 4        ; 00:0002:
            HALT          ; 00:0003: Don't allow hardware interrupts.
            .data thr     ; 00:0004: Trap Handler Routine Address
            .data &82     ; 00:0005: THR memory bank

    &828000:
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
    result = run_on_framework(framework, capsys, tmpdir, source, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
