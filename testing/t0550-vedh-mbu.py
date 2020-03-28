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
def test_SMB(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0: .word &dead
    &000100: .word &0000
    &010100: .word &1111
    &020100: .word &2222
    &030100: .word &3333
    &040100: .word &4444
    &050100: .word &5555
    &060100: .word &6666
    &070100: .word &7777

    &800100: .word &8888
    &810100: .word &9999
    &820100: .word &aaaa
    &830100: .word &bbbb
    &840100: .word &cccc
    &850100: .word &dddd
    &860100: .word &eeee
    &870100: .word &ffff

    &800000:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBZ

            LI &100       ; Set up reading
            STORE R &304
            STORE R &305
            STORE R &306
            STORE R &307

            LI &00
            SMB mbu.MB4
            LI &01
            SMB mbu.MB5
            LI &02
            SMB mbu.MB6
            LI &03
            SMB mbu.MB7
 
            LOAD I R &304 ; Expect: 0000
            dfp.PRINTH
            LOAD I R &305 ; Expect: 1111
            dfp.PRINTH
            LOAD I R &306 ; Expect: 2222
            dfp.PRINTH
            LOAD I R &307 ; Expect: 3333
            dfp.PRINTH

            LI &04
            SMB mbu.MB4
            LI &05
            SMB mbu.MB5
            LI &06
            SMB mbu.MB6
            LI &07
            SMB mbu.MB7

            LOAD I R &304 ; Expect: 4444
            dfp.PRINTH
            LOAD I R &305 ; Expect: 5555
            dfp.PRINTH
            LOAD I R &306 ; Expect: 6666
            dfp.PRINTH
            LOAD I R &307 ; Expect: 7777
            dfp.PRINTH

            LI &80
            SMB mbu.MB4
            LI &81
            SMB mbu.MB5
            LI &82
            SMB mbu.MB6
            LI &83
            SMB mbu.MB7

            LOAD I R &304 ; Expect: 8888
            dfp.PRINTH
            LOAD I R &305 ; Expect: 9999
            dfp.PRINTH
            LOAD I R &306 ; Expect: aaaa
            dfp.PRINTH
            LOAD I R &307 ; Expect: bbbb
            dfp.PRINTH

            LI &84
            SMB mbu.MB4
            LI &85
            SMB mbu.MB5
            LI &86
            SMB mbu.MB6
            LI &87
            SMB mbu.MB7

            LOAD I R &304 ; Expect: cccc
            dfp.PRINTH
            LOAD I R &305 ; Expect: dddd
            dfp.PRINTH
            LOAD I R &306 ; Expect: eeee
            dfp.PRINTH
            LOAD I R &307 ; Expect: ffff
            dfp.PRINTH

            HALT
    """

    assemble(tmpdir, source, long=True)
    
    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 0x10e0202, \
        "Wrong object size generated (1,7695,234B = 8,847,617W expected)"

    #sys.exit(0)

    #assembled_data = read_cft_bin_file(fname, 8847617)
    
    expected = ExpectedData([
        SUCCESS,
        [ 340, "PRINTH", "0000" ],
        [ 340, "PRINTH", "1111" ],
        [ 340, "PRINTH", "2222" ],
        [ 340, "PRINTH", "3333" ],
        [ 340, "PRINTH", "4444" ],
        [ 340, "PRINTH", "5555" ],
        [ 340, "PRINTH", "6666" ],
        [ 340, "PRINTH", "7777" ],
        [ 340, "PRINTH", "8888" ],
        [ 340, "PRINTH", "9999" ],
        [ 340, "PRINTH", "aaaa" ],
        [ 340, "PRINTH", "bbbb" ],
        [ 340, "PRINTH", "cccc" ],
        [ 340, "PRINTH", "dddd" ],
        [ 340, "PRINTH", "eeee" ],
        [ 340, "PRINTH", "ffff" ],
        HALTED
    ])

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
def test_RMB(capsys, tmpdir):

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

    assemble(tmpdir, source, long=True)

    # Note that the RMB instruction only drives the lower 8 bits of the Data
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

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    result = list(expected.prepare(result))
    pprint.pprint(result)
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
