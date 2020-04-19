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
@pytest.mark.LOAD
@pytest.mark.UOP
@pytest.mark.CLI
@pytest.mark.STI
@pytest.mark.PHF
@pytest.mark.PPA
@pytest.mark.TAS
@pytest.mark.TSA
def test_PPF(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 0          ; Clear the stack pointer
            TAS
            CLL           ; L = 0
            CLI           ; I = 0

            LOAD @data+0
            PHF
            LOAD @data+1
            PHF
            LOAD @data+2
            PHF
            LOAD @data+3
            PHF

            SUCCESS
            TSA
            dfp.PRINTD
 
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH

            SUCCESS
            TSA
            dfp.PRINTD

            CLL CPL       ; L = 1

            LOAD @data+0
            PHF
            LOAD @data+1
            PHF
            LOAD @data+2
            PHF
            LOAD @data+3
            PHF

            SUCCESS
            TSA
            dfp.PRINTD
 
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH

            SUCCESS
            TSA
            dfp.PRINTD

            STI           ; I = 1

            LOAD @data+0
            PHF
            LOAD @data+1
            PHF
            LOAD @data+2
            PHF
            LOAD @data+3
            PHF

            SUCCESS
            TSA
            dfp.PRINTD
 
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH
            PPA
            dfp.PRINTH

            SUCCESS
            TSA
            dfp.PRINTD

            PPA           ; Pop from empty stack (wrap around to ffff!)
            dfp.PRINTH
            TSA
            dfp.PRINTH
 
            HALT

    data:   .data &0000 &7fff &8000 &ffff
    """

    expected = ExpectedData([
        SUCCESS,
        SUCCESS,
        [ 340, "PRINTD", "4" ],
        [ 340, "PRINTH", "0480" ], # FFFF Z=0 N=1
        [ 340, "PRINTH", "0480" ], # 8000 Z=0 N=1
        [ 340, "PRINTH", "0080" ], # 7FFF Z=0 N=0
        [ 340, "PRINTH", "0880" ], # 0000 Z=1 N=0
        SUCCESS,
        [ 340, "PRINTD", "0" ],

        SUCCESS,
        [ 340, "PRINTD", "4" ],
        [ 340, "PRINTH", "1480" ], # FFFF Z=0 N=1
        [ 340, "PRINTH", "1480" ], # 8000 Z=0 N=1
        [ 340, "PRINTH", "1080" ], # 7FFF Z=0 N=0
        [ 340, "PRINTH", "1880" ], # 0000 Z=1 N=0
        SUCCESS,
        [ 340, "PRINTD", "0" ],

        SUCCESS,
        [ 340, "PRINTD", "4" ],
        [ 340, "PRINTH", "9480" ], # FFFF Z=0 N=1
        [ 340, "PRINTH", "9480" ], # 8000 Z=0 N=1
        [ 340, "PRINTH", "9080" ], # 7FFF Z=0 N=0
        [ 340, "PRINTH", "9880" ], # 0000 Z=1 N=0
        SUCCESS,
        [ 340, "PRINTD", "0" ],

        [ 340, "PRINTH", "0f0f" ], # uninitialised memory
        [ 340, "PRINTH", "ffff" ], # wrapped around stack
        HALTED
    ])

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
