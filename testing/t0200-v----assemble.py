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
    assemble(tmpdir, "&0: JMP @")

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2, \
        "Wrong object size generated (2 bytes expected)"


@pytest.mark.cftasm
def test_short_model(capsys, tmpdir):
    assemble(tmpdir, """
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
def test_verilog_output(capsys, tmpdir):
    assemble(tmpdir, """
    &0:    .fill 256 &1234
    """, args=["--model", "short", "--verilog", "--debug-pokes"])

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 512, \
        "Wrong object size generated (256W expected)"

    assembled_data = read_cft_bin_file(fname, 256)
    expected_data = array.array('H', [0x1234]) * 256
    assert assembled_data == expected_data

    for f in ("a-00.list", "a-01.list"):
        fname = str(tmpdir.join(f))
        assert os.path.exists(fname)
        with open(fname, "rt") as verilog_list_file:
            lines = verilog_list_file.readlines()
            assert len(lines) == 256, "Expected 256 lines in {}".format(fname)


@pytest.mark.cftasm
def test_long_model(capsys, tmpdir):
    assemble(tmpdir, """
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



@pytest.mark.cftasm
def test_page_directive(capsys, tmpdir):
    assemble(tmpdir, """
    &0:    .fill 256 &1234
           .page
           .word &5678
    """, args=["-p", "512"])

    # Expect 1025 words = 2050 bytes
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2050, \
        "Wrong object size generated (256W expected)"

    assembled_data = read_cft_bin_file(fname, 1025)
    assert len(assembled_data) == 1025
    assert assembled_data[:256] == array.array('H', [0x1234]) * 256
    assert assembled_data[256:1024] == array.array('H', [0]) * 768
    assert assembled_data[1024] == 0x5678

    fname = str(tmpdir.join("a.pasm"))
    assert os.path.exists(fname)
    with open(fname, "rt") as pasm_file:
        lines = pasm_file.readlines()
        assert len(lines) == 257, "Expected 257 lines in {}".format(fname)

    # Check the warning. -- this isn't working on my machine right now, skipping.
    # print(capsys.readouterr())
    # assert False
    # cftasm_stderr = get_capsys_outerr(capsys)[0]
    # assert "generated 768 word" in cftasm_stderr


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
