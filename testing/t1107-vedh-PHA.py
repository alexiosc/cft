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
@pytest.mark.LOAD
@pytest.mark.PHA
@pytest.mark.TAS
def test_PHA(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MB0
            LI &07
            SMB mbu.MBS
            SMB mbu.MBZ   ; Makes reading the stack easier

            LI 0          ; Clear the stack pointer
            TAS

            LOAD @data+0
            PHA
            LOAD @data+1
            PHA
            LOAD @data+2
            PHA
            LOAD @data+3
            PHA

            LOAD R 0
            dfp.PRINTH
            LOAD R 1
            dfp.PRINTH
            LOAD R 2
            dfp.PRINTH
            LOAD R 3
            dfp.PRINTH

            HALT

    data:   .data &ff00 &ee11 &dd22 &cc33
    """

    expected = ExpectedData([
        SUCCESS,
        [ 340, "PRINTH", "ff00" ],
        [ 340, "PRINTH", "ee11" ],
        [ 340, "PRINTH", "dd22" ],
        [ 340, "PRINTH", "cc33" ],
        HALTED
    ])

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LOAD
@pytest.mark.PHA
@pytest.mark.TAS
@pytest.mark.TSA
@pytest.mark.slow
def test_PHA_long(framework, capsys, tmpdir):

    reps = 10
    
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MB0
            LI &07
            SMB mbu.MBS
            LI &00
            SMB mbu.MBZ

            LI 0          ; Clear the stack pointer
            TAS

            LOAD count
            STORE R 0
    loop:   PHA
            dfp.PRINTD
            DSZ R 0
            JMP loop

            SUCCESS
            LI 0
            STORE R &342  ; Stack-relative auto-increment
            LOAD count
            STORE R 0

    verify: LOAD I R &342
            dfp.PRINTD
            DSZ R 0
            JMP verify

            SUCCESS

            TSA
            dfp.PRINTD

            HALT

    data:   .data &cafe
    count:  .word {}
    """.format(reps)

    expected = ExpectedData([ SUCCESS ])
    expected += [ [340, "PRINTD", str(x) ] for x in range(reps, -1, -1) ]
    expected += [ SUCCESS ]
    expected += [ [340, "PRINTD", str(x) ] for x in range(reps, -1, -1) ]

    # The SP points to the first free slot on the stack, so it should
    # be reps+1 at the end.
    expected += [ SUCCESS, [340, "PRINTD", str(reps + 1) ], HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    pprint.pprint(result, width=200)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
