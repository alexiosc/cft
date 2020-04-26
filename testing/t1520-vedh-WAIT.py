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
@pytest.mark.IRET
@pytest.mark.STI
@pytest.mark.WAIT
def test_WAIT(capsys, tmpdir):
    num_waits = 32
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

            LI 1023
            STORE R 1
            STI
            LI &80
            OUT &3ff

            LI @{num_waits}-1
            STORE R 2
    loop:   CLI
            WAIT
            SUCCESS
            DSZ R 2
            JMP loop

            HALT

    &828000:
    thr:    LOAD R 1
            dfp.PRINTD
            SNZ
            IRET
            DSZ R 1
            NOP
            LI &80
            OUT &3ff
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS ])
    for x in range(num_waits):
        expected += [ [ 340, 'PRINTD', str(1023 - x) ], SUCCESS ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
