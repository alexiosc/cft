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
@pytest.mark.LJMP
@pytest.mark.LJSR
@pytest.mark.LRET
def test_LRET(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:   LI &80
               SMB mbu.MBP


               LI &123
               dfp.PRINTH
               SHL 1
               dfp.PRINTH

               HALT
    """.rstrip(" ")

    expected = ExpectedData([ SUCCESS ])
    expected += [ [ 345, "PRINTH", "0123" ],
                  [ 345, "PRINTH", "0091" ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
