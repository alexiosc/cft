#!/usr/bin/python3

import os
import re
import sys
import array
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.cftasm
def test_assemble(capsys, tmpdir):
    """Test that basic assembly works."""
    assemble(capsys, tmpdir, "&0: JMP @")

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2, \
        "Wrong object size generated (2 bytes expected)"


@pytest.mark.cftasm
def test_short_model(capsys, tmpdir):
    assemble(capsys, tmpdir, """
    &0:    .fill 32768 &1234
           .fill 32768 &5678
    """, args=["--model", "short"])

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 131072, \
        "Wrong object size generated (64K expected)"

    assembled_data = read_cft_bin_file(fname, 65536)

    expected_data = array.array('H', [0x1234]) * 32768
    expected_data += array.array('H', [0x5678]) * 32768

    assert assembled_data == expected_data


@pytest.mark.cftasm
def test_long_model(capsys, tmpdir):
    assemble(capsys, tmpdir, """
    &000000:     .fill 32768 &1234
                 .fill 32768 &1234
    &ff0000:     .fill 32768 &5678
                 .fill 32768 &5678
    """, args=["--model", "long"])

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2*16777216, \
        "Wrong object size generated (16M expected)"

    assembled_data = read_cft_bin_file(fname, 16777216)
    assert len(assembled_data) == 16777216

    # Expect 64KW of 0x1234, a gap of (16M-128K) full of zeroes, and
    # 64KW of 0x5678 at the very end.
    assert assembled_data[:65536] == array.array('H', [0x1234]) * 65536
    assert assembled_data[65536:-65536] == array.array('H', [0]) * (16777216 - 131072)
    assert assembled_data[-65536:] == array.array('H', [0x5678]) * 65536


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
