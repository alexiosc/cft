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
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.TAD
@pytest.mark.TDA
def test_TAD(framework, capsys, tmpdir):

    reps = 1024
    
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MB0
            LI &00
            SMB mbu.MBZ

            LOAD reps
            STORE R &200

    loop:   TAD
            LI 42
            TDA
            dfp.PRINTD
            DSZ R &200
            JMP loop

            HALT

    reps:   .data {}
    """.format(reps)

    expected = ExpectedData([ SUCCESS ])
    expected += [ [ 340, "PRINTD", str(x)] for x in range(reps, -1, -1) ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
