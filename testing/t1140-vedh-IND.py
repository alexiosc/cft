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
@pytest.mark.STORE
@pytest.mark.DSZ
@pytest.mark.LOAD
@pytest.mark.JMP
def test_IND(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
           LI           &80
           SMB          mbu.MBP

    """

    for x in range(7):
        source += """
           LI           &{:>02x}
           SMB          mbu.MBZ
           LOAD         @data+{}
           STORE        R &123
           dfp.PRINTH
        """.format(x, x)

    source += """
           LI           &00
           SMB          mbu.MBD
           LI           &01
           SMB          mbu.MBS
           LI           &02
           SMB          mbu.MBZ
           LI           &03
           SMB          mbu.MB4
           LI           &04
           SMB          mbu.MB5
           LI           &05
           SMB          mbu.MB6
           LI           &06
           SMB          mbu.MB7
    """

    for x in range(8):
        source += """
           LI           &123
           IND          {}
           dfp.PRINTH
        """.format(x)

    source += """
           HALT

    data:  .data &1111 &2222 &3333 &4444 &5555 &6666 &7777 &8888
    &123:  .word &beef
    """

    source += asm_memory_banks(mbp=0x80, mbd=0, mbz=0)
    
    expected = ExpectedData([ SUCCESS ])
    expected += [ [ 340, "PRINTH", "1111" ],
                  [ 340, "PRINTH", "2222" ],
                  [ 340, "PRINTH", "3333" ],
                  [ 340, "PRINTH", "4444" ],
                  [ 340, "PRINTH", "5555" ],
                  [ 340, "PRINTH", "6666" ],
                  [ 340, "PRINTH", "7777" ],
                  [ 340, "PRINTH", "beef" ],
                  [ 340, "PRINTH", "1111" ],
                  [ 340, "PRINTH", "2222" ],
                  [ 340, "PRINTH", "3333" ],
                  [ 340, "PRINTH", "4444" ],
                  [ 340, "PRINTH", "5555" ],
                  [ 340, "PRINTH", "6666" ],
                  [ 340, "PRINTH", "7777" ],
                  HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # print(source)
    # pprint.pprint(expected)
    # pprint.pprint(result)
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
