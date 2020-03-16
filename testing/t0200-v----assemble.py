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

    out, err = get_capsys_outerr(capsys)
    cftasm_stderr = get_capsys_outerr(capsys)[0]
    assert "generated 768 word" in err, "slack space warning not issued"


@pytest.mark.cftasm
def test_unpacked_string(capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .str "Hello, world!" 10
    """)

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 28, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 14)
    expected_data = array.array('H', list(ord(x) for x in test))
    assert len(assembled_data) == 14
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_packed_string(capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .strp "Hello, world!" 10
    """)

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x6548, 0x6c6c, 0x2c6f, 0x7720, 0x726f, 0x646c, 0x0a21])
    assert len(assembled_data) == 7
    assert assembled_data == expected_data, "Assembled string did not match"

    # Try reading the file as a byte string too
    print(fname)
    with open(fname, "rt") as fp:
        data = fp.read()
        assert data == test, "Byte stream output did not match."


@pytest.mark.cftasm
def test_longstring(capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .longstring "H"
           .strp       "ello, world!"
           .strp       10
           .endstring
    """)

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x6548, 0x6c6c, 0x2c6f, 0x7720, 0x726f, 0x646c, 0x0a21])
    assert len(assembled_data) == 7
    assert assembled_data == expected_data, "Assembled string did not match"

    # Try reading the file as a byte string too
    print(fname)
    with open(fname, "rt") as fp:
        data = fp.read()
        assert data == test, "Byte stream output did not match."


@pytest.mark.cftasm
def test_macro(capsys, tmpdir):

    assemble(tmpdir, """
    .macro foo(bar)
    .strp  "Hello, world!" %bar
    .endmacro

    &0:    foo(10)
    """)

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x6548, 0x6c6c, 0x2c6f, 0x7720, 0x726f, 0x646c, 0x0a21])
    assert len(assembled_data) == 7
    assert assembled_data == expected_data, "Assembled string did not match"

    # Try reading the file as a byte string too
    print(fname)
    with open(fname, "rt") as fp:
        data = fp.read()
        assert data == test, "Byte stream output did not match."


@pytest.mark.cftasm
def test_at_expressions(capsys, tmpdir):

    assemble(tmpdir, """
    .equ   foo 42

    &0:    .word @              ; 0->0
           .word @              ; 1->1
           .word @              ; 2->2
           .word @*2            ; 3->6
           .word @^1            ; 4->5
           .word @|2            ; 5->7
           .word @>>1           ; 6->3
           .word @<<2           ; 7->28
           .word @foo+10        ; 42->52
           .word @foo*10        ; 42->420
           .word @foo/7         ; 42->6
    """)

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 22, \
        "Wrong object size generated (11W expected)"

    assembled_data = read_cft_bin_file(fname, 11)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0, 1, 2, 6, 5, 7, 3, 28, 52, 420, 6])
    assert len(assembled_data) == 11
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_namespaces(capsys, tmpdir):

    assemble(tmpdir, """
    &0:

    .equ   foo 42
           .data foo

    .pushns ns1
    .equ   foo 43
           .data foo

    .pushns ns2
    .equ   foo 44
           .data foo
    .popns ns2

    .popns ns1

           .word foo
           .word ns1.foo
           .word ns1.ns2.foo
    """)

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 12, \
        "Wrong object size generated (6W expected)"

    assembled_data = read_cft_bin_file(fname, 6)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [42, 43, 44, 42, 43, 44])
    assert len(assembled_data) == 6
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_scope(capsys, tmpdir):

    assemble(tmpdir, """
    &0:

    .equ   foo 42
           .data foo

    .scope
    .equ   foo 43
           .data foo
    .endscope

    .scope
    .equ   foo 44
           .data foo
    .endscope

           .word foo
    """)

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 8, \
        "Wrong object size generated (4W expected)"

    assembled_data = read_cft_bin_file(fname, 4)
    print(assembled_data)
    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [42, 43, 44, 42])
    assert len(assembled_data) == 4
    assert assembled_data == expected_data, "Assembled string did not match"


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
