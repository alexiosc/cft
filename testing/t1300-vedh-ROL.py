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
@pytest.mark.LI
@pytest.mark.ROL
def test_ROL(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:        LI &80
               SMB mbu.MBP
               CLL CLA
    
               LOAD data
               dfp.PRINTH
               ROL 1
               dfp.PRINTH
               ROL 8
               dfp.PRINTH
               HALT

    data:      .word &8000
    """.rstrip(" ")

    expected = ExpectedData([ SUCCESS ])
    # expected += [ [ 340, "PRINTH", "0123" ],
    #               [ 340, "PRINTH", "0246" ] ]
    # expected += [ [ 340, "PRINTH", "0123" ],
    #               [ 340, "PRINTH", "1230" ] ]
    expected += [ [ 340, "PRINTH", "8000" ],
                  [ 340, "PRINTH", "0000" ],
                  [ 340, "PRINTH", "0001" ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
