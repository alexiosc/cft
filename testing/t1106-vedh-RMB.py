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


@pytest.mark.MBU
@pytest.mark.LI
@pytest.mark.SMB
@pytest.mark.LMB
@pytest.mark.STORE
@pytest.mark.LOAD
def test_LMB(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MB0
            LI &ff
            SMB mbu.MB1
            LI &fe
            SMB mbu.MB2
            LI &fd
            SMB mbu.MB3

            LI &11
            SMB mbu.MB4
            LI &22
            SMB mbu.MB5
            LI &33
            SMB mbu.MB6
            LI &44
            SMB mbu.MB7

            LMB mbu.MB0
            dfp.PRINTH
            LMB mbu.MB1
            dfp.PRINTH
            LMB mbu.MB2
            dfp.PRINTH
            LMB mbu.MB3
            dfp.PRINTH
            LMB mbu.MB4
            dfp.PRINTH
            LMB mbu.MB5
            dfp.PRINTH
            LMB mbu.MB6
            dfp.PRINTH
            LMB mbu.MB7
            dfp.PRINTH

            HALT
    """

    # Note that the LMB instruction only drives the lower 8 bits of the Data
    # Bus. On real hardware, Bus Hold would make the MSB equal to the last
    # memory operation, which will almost certainly be an instruction fetch, so
    # &54 would be returned. The Verilog version of the MBU simulates this by
    # driving the DB.
    expected = ExpectedData([
        SUCCESS,
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "54ff" ],
        [ 340, "PRINTH", "54fe" ],
        [ 340, "PRINTH", "54fd" ],
        [ 340, "PRINTH", "5411" ],
        [ 340, "PRINTH", "5422" ],
        [ 340, "PRINTH", "5433" ],
        [ 340, "PRINTH", "5444" ],
        HALTED
    ])

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
