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
def test_TAS(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MB0
            LI &00
            SMB mbu.MBS

            LI 0          ; Clear the stack pointer
            TAS

            LI 42
            TSA
            dfp.PRINTD
            
            LI 666
            PHA
            PHA
            PHA
            PHA
            PHA

            TSA
            dfp.PRINTD

            PHA
            PHA
            PHA
            PHA
            PHA

            TSA
            dfp.PRINTD

            HALT
    """

    expected = ExpectedData([
        SUCCESS,
        [ 340, "PRINTD", "0" ],
        [ 340, "PRINTD", "5" ],
        [ 340, "PRINTD", "10" ],
        HALTED
    ])

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
