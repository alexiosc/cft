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
def test_DSZ(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI       &80
           SMB      mbu.MBP
           LI       &00
           SMB      mbu.MBD
           SMB      mbu.MBS
           SMB      mbu.MBZ

           LI       19
           STORE    R &300
    loop:  dfp.PRINTU
           DSZ      R &300
           JMP      loop
           SUCCESS
           HALT
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS ])
    expected += list([ 340, 'PRINTU', str(x) ] for x in range(19, 0, -1))
    expected += [ SUCCESS, HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
