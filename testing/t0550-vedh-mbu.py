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
@pytest.mark.cftasm
@pytest.mark.MBU
@pytest.mark.OUT
@pytest.mark.IN
@pytest.mark.SMB
@pytest.mark.LMB
def test_mbu_asm(framework, capsys, tmpdir):
    """Verify the mbu.asm file is sane."""

    source = """
    .include "mbu.asm"

    &0:     SMB 0
            SMB 1
            SMB 2
            SMB 3
            SMB 4
            SMB 5
            SMB 6
            SMB 7
            LMB 0
            LMB 1
            LMB 2
            LMB 3
            LMB 4
            LMB 5
            LMB 6
            LMB 7
            SMB mbu.MB0
            SMB mbu.MB1
            SMB mbu.MB2
            SMB mbu.MB3
            SMB mbu.MB4
            SMB mbu.MB5
            SMB mbu.MB6
            SMB mbu.MB7
            LMB mbu.MB0
            LMB mbu.MB1
            LMB mbu.MB2
            LMB mbu.MB3
            LMB mbu.MB4
            LMB mbu.MB5
            LMB mbu.MB6
            LMB mbu.MB7
    """

    assemble(tmpdir, source)
    
    # Expect 32 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2048, \
        "Wrong object size generated (2048W expected)"

    # Only read the first 32W.
    assembled_data = read_cft_bin_file(fname, 32)
    
    expected_data = array.array('H', [
        0x0a80, 0x0a81, 0x0a82, 0x0a83, 0x0a84, 0x0a85, 0x0a86, 0x0a87,
        0x0a00, 0x0a01, 0x0a02, 0x0a03, 0x0a04, 0x0a05, 0x0a06, 0x0a07,
        0x0a80, 0x0a81, 0x0a82, 0x0a83, 0x0a84, 0x0a85, 0x0a86, 0x0a87,
        0x0a00, 0x0a01, 0x0a02, 0x0a03, 0x0a04, 0x0a05, 0x0a06, 0x0a07,
        ])
    # assert len(assembled_data) == 32
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LMB
@pytest.mark.IN
def test_MBU_reset(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
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
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        [ 340, "PRINTH", "5480" ],
        HALTED
    ])

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
