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
@pytest.mark.LI
@pytest.mark.OUT
def test_wait_states(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LOAD a
            OUT &3F0
            LI 0
            IN &3F0
            dfp.PRINTH
            HALT

    a:      .word &9999

    """.format(**locals())

    expected = ExpectedData([ SUCCESS,
                              [ 340, 'PRINTH', '1234' ],
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    # pprint.pprint(result)
    # assert False
    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
