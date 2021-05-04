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
@pytest.mark.STORE
@pytest.mark.LOAD
def test_SMB(framework, capsys, tmpdir):

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
            SCT
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
    
    #sys.exit(0)

    #assembled_data = read_cft_bin_file(fname, 8847617)
    
    expected = ExpectedData([
        SUCCESS,
        ROM_WP0,
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

    result = run_on_framework(framework, capsys, tmpdir, source,
                              rom_addr=0, # For the cftemu
                              verilog_args=["+wp=0"],
                              long=True)
    result = list(expected.prepare(result))
    assert list(result) == expected

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == 17696768, \
        "Wrong object size generated (17,696,768B = 8,848,384W expected)"


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
