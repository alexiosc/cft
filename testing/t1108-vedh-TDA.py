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
@pytest.mark.LIA
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.TAD
@pytest.mark.TDA
def test_TAD(capsys, tmpdir):

    reps = 1000
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MB0
            LI &00
            SMB mbu.MBZ

            LIA data
            STORE R &300
            LOAD I R &300

            LOAD reps
            STORE R &200

    loop:   dfp.PRINTD
            LOAD I R &300
            TDA
            dfp.PRINTH
            DSZ R &200
            JMP loop

            HALT

    &69:
    data:   .data &cafe
    reps:   .data {}
    """.format(reps)

    expected = ExpectedData([ SUCCESS ])
    for x in range(reps, -1, -1):
        expected += [ [340, "PRINTD", str(x) ], [ 340, "PRINTH", "0069"] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
