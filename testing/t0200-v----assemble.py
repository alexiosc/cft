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
def test_assemble(framework, capsys, tmpdir):
    """Test that basic assembly works."""
    assemble(tmpdir, "&0: JMP @", args=["--blocksize", "0"])

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 2, \
        "Wrong object size generated (2 bytes expected)"


@pytest.mark.cftasm
def test_short_model(framework, capsys, tmpdir):
    assemble(tmpdir, """
    &0:    .fill 32768 &1234
           .fill 32768 &5678
    """, args=["--model", "short", "--blocksize", "0"])

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 131072, \
        "Wrong object size generated (64K expected)"

    assembled_data = read_cft_bin_file(fname, 65536)

    expected_data = array.array('H', [0x1234]) * 32768
    expected_data += array.array('H', [0x5678]) * 32768

    assert assembled_data == expected_data


@pytest.mark.cftasm
def test_short_model_memsize_warning(framework, capsys, tmpdir):
    assemble(tmpdir, """
    &123456:    .data &feed &cafe
    """, args=["--model", "short", "--blocksize", "0"])

    out, err = get_capsys_outerr(capsys)
    assert ":2: warning: Address &123456 is beyond the maximum address for this model (&ffff)" in err


@pytest.mark.cftasm
def test_verilog_output(framework, capsys, tmpdir):
    assemble(tmpdir, """
    &0:    .fill 256 &1234
    """, args=["--model", "short", "--verilog", "--debug-pokes", "--blocksize", "0"])

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
def test_long_model(framework, capsys, tmpdir):
    assemble(tmpdir, """
    &000000:     .fill 32768 &1234
                 .fill 32768 &1234
    &ff0000:     .fill 32768 &5678
                 .fill 32768 &5678
    """, args=["--model", "long", "--blocksize", "0"])

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
def test_page_directive(framework, capsys, tmpdir):
    assemble(tmpdir, """
    &0:    .fill 256 &1234
           .page
           .word &5678
    """, args=["-p", "512", "--blocksize", "0"])

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
    assert "generated 768 word" in err, "slack space warning not issued"


@pytest.mark.cftasm
def test_unpacked_string(framework, capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .str "Hello, world!" 10
    """, args=["--blocksize", "0"])

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
def test_packed_string(framework, capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .strp "Hello, world!" 10
    """, args=["--blocksize", "0"])

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)

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
def test_longstring(framework, capsys, tmpdir):

    assemble(tmpdir, """
    &0:    .longstring "H"
           .strp       "ello, world!"
           .strp       10
           .endstring
    """, args=["--blocksize", "0"])

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x6548, 0x6c6c, 0x2c6f, 0x7720, 0x726f, 0x646c, 0x0a21])
    assert len(assembled_data) == 7
    assert assembled_data == expected_data, "Assembled string did not match"

    # Try reading the file as a byte string too
    with open(fname, "rt") as fp:
        data = fp.read()
        assert data == test, "Byte stream output did not match."


@pytest.mark.cftasm
def test_macro(framework, capsys, tmpdir):

    assemble(tmpdir, """
    .macro foo(bar)
    .strp  "Hello, world!" %bar
    .endmacro

    &0:    foo(10)
    """, args=["--blocksize", "0"])

    test = "Hello, world!\n"

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 14, \
        "Wrong object size generated (14W expected)"

    assembled_data = read_cft_bin_file(fname, 7)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x6548, 0x6c6c, 0x2c6f, 0x7720, 0x726f, 0x646c, 0x0a21])
    assert len(assembled_data) == 7
    assert assembled_data == expected_data, "Assembled string did not match"

    # Try reading the file as a byte string too
    with open(fname, "rt") as fp:
        data = fp.read()
        assert data == test, "Byte stream output did not match."


@pytest.mark.cftasm
def test_equ_and_fields(framework, capsys, tmpdir):

    assemble(tmpdir, """
    .equ foo2 foo1 1
    .equ foo1 42
    .equ foo3 foo2 0x100

    &0:    .word 42             ; 42
           .word &2a            ; 42 (hex)
           .word #101010        ; 42 (bin)
           .word #0010:1010     ; 42 (bin)
           .word 0 42           ; 42
           .word 0xff00 42      ; 65322
           .word 0x100 42       ; 298
           .word 42 1           ; 43
           .word 42 #1          ; 43
           .word 42 &f          ; 47
           .word IRET           ; 0
           .word IRET 42        ; 42
           .word #101010 IRET   ; 42
           .word foo1           ; 42
           .word foo2           ; 43
           .word foo3           ; 299
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 32, \
        "Wrong object size generated (16W expected)"

    assembled_data = read_cft_bin_file(fname, 16)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [42, 42, 42, 42, 42, 65322, 298, 43, 43, 47, 0, 42, 42, 42, 43, 299])
    assert len(assembled_data) == 16
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_at_expressions(framework, capsys, tmpdir):

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
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 22, \
        "Wrong object size generated (11W expected)"

    assembled_data = read_cft_bin_file(fname, 11)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0, 1, 2, 6, 5, 7, 3, 28, 52, 420, 6])
    assert len(assembled_data) == 11
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_basic_assembly(framework, capsys, tmpdir):

    assemble(tmpdir, """
    .equ    counter 0

    &0:    JMP start

    start: LI 0
           SMB MBP
           SMB MBD
           SMB MBS
           SMB MBZ

           LI 666
           STORE R counter

    loop:  DSZ R counter
           JMP loop
           
    halt:  JMP @
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 22, \
        "Wrong object size generated (11W expected)"

    assembled_data = read_cft_bin_file(fname, 11)

    print(assembled_data)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [0x4001, 0x1400, 0x0a80, 0x0a81, 0x0a82, 0x0a83,
                                      0x169a, 0x9400, 0xa400, 0x4008, 0x400a])
    assert len(assembled_data) == 11
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_field_bits(framework, capsys, tmpdir):

    assemble(tmpdir, """
    ; Note: this is NOT a working program, we only examine the
    ; patterns output to verify how cftasm assembles instruction fields.

    .equ      foo &ffff
    .reg      bar &fff0

    &1400:    JMP I @+1
              .word @0+&3c00

    &3c00:    JMP I baz
              JMP I foo
              JMP I bar

    &ff0f:    JMP @
    baz:      JMP @
    """, args=["--blocksize", "0"])

    # For this program, we'll parse the a.pasm file.
    pasm = read_pasm(tmpdir)
    assert pasm == [
        "&1400: &4801",
        "&1401: &3c00",
        "&3c00: &4b10",
        "&3c01: &ffff",         # foo is an .equ. It's used unmasked.
        "&3c02: &4bf0",         # this label is off-page.
        "&ff0f: &430f",
        "&ff10: &4310",
    ], "unexpected assembled code"


@pytest.mark.cftasm
def test_namespaces(framework, capsys, tmpdir):

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
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 12, \
        "Wrong object size generated (6W expected)"

    assembled_data = read_cft_bin_file(fname, 6)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [42, 43, 44, 42, 43, 44])
    assert len(assembled_data) == 6
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_scope(framework, capsys, tmpdir):

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
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 8, \
        "Wrong object size generated (4W expected)"

    assembled_data = read_cft_bin_file(fname, 4)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [42, 43, 44, 42])
    assert len(assembled_data) == 4
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_include(framework, capsys, tmpdir):
    """Also checks for the existence and sanity of dfp2.asm and mbu.asm,
    which we really need to have for subsequent testing!"""

    assemble(tmpdir, """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:     SMB
            LMB
            SCT
            LCT
            mbu.MBP
            mbu.MBD
            mbu.MBS
            mbu.MBZ
            mbu.MB0
            mbu.MB1
            mbu.MB2
            mbu.MB3
            mbu.MB4
            mbu.MB5
            mbu.MB6
            mbu.MB7

            HALT
            LSR
            SOR
            SENTINEL
            SUCCESS
            FAIL
    """, args=["--blocksize", "0"])

    # Expect 14 words
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 44, \
        "Wrong object size generated (22W expected)"

    assembled_data = read_cft_bin_file(fname, 22)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = array.array('H', [ 0x0a80, 0xa00, 0x0980, 0x0900, 0, 1, 2, 3, 0, 1, 2, 3, 4, 5, 6, 7,
                                       0x651d, 0x5500, 0x6500, 0x650f, 0x651e, 0x651f ])
    assert len(assembled_data) == 22
    assert assembled_data == expected_data, "Assembled string did not match"


@pytest.mark.cftasm
def test_assemble_bin_blocksize(framework, capsys, tmpdir):
    """Test that binary blocksizes work."""
    for bs, size in [[0, 2], [1, 2048], [8, 16384], [64, 131072]]:
        assemble(tmpdir, "&0: JMP @", args=["--blocksize", str(bs)])

        fname = str(tmpdir.join("a.bin"))
        assert os.path.getsize(fname) == size, \
            "Wrong object size generated ({} bytes expected)".format(size)


@pytest.mark.cftasm
def test_assemble_bin_long_model_blocksize(framework, capsys, tmpdir):
    """Test that binary blocksizes work."""
    for bs, size in [[0, 2], [1, 2048], [8, 16384], [64, 131072]]:
        assemble(tmpdir, "&0: JMP @",
                 args=["--model", "long", "--blocksize", str(bs)])

        fname = str(tmpdir.join("a.bin"))
        assert os.path.getsize(fname) == size, \
            "Wrong object size generated ({} bytes expected)".format(size)


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
