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
@pytest.mark.RMB
def test_mbu_asm(capsys, tmpdir):
    """Verify the mbu.asm file is sane."""

    source = """
    .include "mbu.asm"

    &0:     OUT R &8
            OUT R &9
            OUT R &a
            OUT R &b
            OUT R &c
            OUT R &d
            OUT R &e
            OUT R &f
            SMB 0
            SMB 1
            SMB 2
            SMB 3
            SMB 4
            SMB 5
            SMB 6
            SMB 7
            IN R &8
            IN R &9
            IN R &a
            IN R &b
            IN R &c
            IN R &d
            IN R &e
            IN R &f
            RMB 0
            RMB 1
            RMB 2
            RMB 3
            RMB 4
            RMB 5
            RMB 6
            RMB 7
    """

    assemble(tmpdir, source)
    
    # Expect 32 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 64, \
        "Wrong object size generated (32W expected)"

    assembled_data = read_cft_bin_file(fname, 32)
    
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [
        0x6408, 0x6409, 0x640a, 0x640b, 0x640c, 0x640d, 0x640e, 0x640f,
        0x6408, 0x6409, 0x640a, 0x640b, 0x640c, 0x640d, 0x640e, 0x640f,
        0x5408, 0x5409, 0x540a, 0x540b, 0x540c, 0x540d, 0x540e, 0x540f,
        0x5408, 0x5409, 0x540a, 0x540b, 0x540c, 0x540d, 0x540e, 0x540f,
        ])
    assert len(assembled_data) == 32
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.RMB
@pytest.mark.IN
def test_MBU_reset(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            RMB mbu.MB0
            dfp.PRINTH
            RMB mbu.MB1
            dfp.PRINTH
            RMB mbu.MB2
            dfp.PRINTH
            RMB mbu.MB3
            dfp.PRINTH
            RMB mbu.MB4
            dfp.PRINTH
            RMB mbu.MB5
            dfp.PRINTH
            RMB mbu.MB6
            dfp.PRINTH
            RMB mbu.MB7
            dfp.PRINTH

            HALT
    """

    # Note that the RMB instruction only drives the lower 8 bits of the Data
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

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
