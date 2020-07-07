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
@pytest.mark.PPA
@pytest.mark.TAS
@pytest.mark.TSA
def test_PPA(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
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

            SUCCESS
            TSA
            dfp.PRINTD
 
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH

            SUCCESS
            TSA
            dfp.PRINTD

            PPA           ; Pop from empty stack (wrap around to ffff!)
            dfp.PRINTH
            TSA
            dfp.PRINTH
 
            HALT

    data:   .data &ff00 &ee11 &dd22 &cc33
    """

    expected = ExpectedData([
        SUCCESS,
        SUCCESS,
        [ 340, "PRINTD", "4" ],
        [ 340, "PRINTH", "cc33" ],
        [ 340, "PRINTH", "dd22" ],
        [ 340, "PRINTH", "ee11" ],
        [ 340, "PRINTH", "ff00" ],
        SUCCESS,
        [ 340, "PRINTD", "0" ],
        [ 340, "PRINTH", "0f0f" ], # uninitialised memory
        [ 340, "PRINTH", "ffff" ], # wrapped around stack
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
@pytest.mark.PPA
@pytest.mark.TAS
@pytest.mark.TSA
@pytest.mark.slow
def test_PPA_long(framework, capsys, tmpdir):

    reps = 1024
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
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
            LOAD count
            STORE R 0
    verify: PPA
            dfp.PRINTD
            LI 1
            DSZ R 0
            JMP verify

            SUCCESS
            TSA
            dfp.PRINTD

            SUCCESS
            PPA
            dfp.PRINTH
            TSA
            dfp.PRINTH

            HALT

    count:  .word {}
    """.format(reps)

    expected = ExpectedData([ SUCCESS ])
    expected += [ [340, "PRINTD", str(x) ] for x in range(reps, -1, -1) ]
    expected += [ SUCCESS ]

    # Popping yields the values in reverse order
    expected += [ [340, "PRINTD", str(x) ] for x in range(reps + 1) ]
    expected += [ SUCCESS ]
    # The extra pop underflows the stack and yields unwritten to memory
    expected += [ [340, "PRINTD", "0" ] ]
    expected += [ SUCCESS ]
    expected += [ [340, "PRINTH", "0f0f" ] ]
    expected += [ [340, "PRINTH", "ffff" ] ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    pprint.pprint(result, width=200)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
