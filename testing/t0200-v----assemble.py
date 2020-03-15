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

    assert os.path.getsize(tmpdir.join("a.bin")) == 2, \
        "Wrong object size generated (2 bytes expected)"


@pytest.mark.cftasm
def test_addrsize_short(capsys, tmpdir):
    assemble(capsys, tmpdir, """
    &:     .fill 32768 &1234
           .fill 32768 &5678
    """, args=["--model", "short"])

    assert os.path.getsize(tmpdir.join("a.bin")) == 131072, \
        "Wrong object size generated (64K expected)"

    with open(tmpdir.join("a.bin"), "rb") as f:
        assembled_data = array.array('H')
        assembled_data.fromfile(f, 65536)
        expected_data = array.array('H', [0x1234]) * 32768
        expected_data += array.array('H', [0x5678]) * 32768
        assert assembled_data == expected_data


@pytest.mark.cftasm
def test_addrsize_long(capsys, tmpdir):
    assemble(capsys, tmpdir, """
    &000000:     .fill 32768 &1234
                 .fill 32768 &1234
    &ff0000:     .fill 32768 &5678
                 .fill 32768 &5678
    """, args=["--model", "long"])

    assert os.path.getsize(tmpdir.join("a.bin")) == 2*16777216, \
        "Wrong object size generated (16M expected)"

    with open(tmpdir.join("a.bin"), "rb") as f:
        assembled_data = array.array('H')
        assembled_data.fromfile(f, 16777216)
        # assert len(assembled_data) == 16777216
        expected_data = array.array('H', [0x1234]) * 65536
        expected_data += array.array('H', [0]) * (16777216 - 131072)
        expected_data += array.array('H', [0x5678]) * 65536
        assert assembled_data == expected_data


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
