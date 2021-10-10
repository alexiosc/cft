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
@pytest.mark.CLL
@pytest.mark.STI
@pytest.mark.PPA
@pytest.mark.PPF
@pytest.mark.PHF
@pytest.mark.PHA
@pytest.mark.SHL
@pytest.mark.TAS
def test_PPF(framework, capsys, tmpdir):

    maxval = 255
    
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00
            SMB mbu.MBS
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier

            LI 0          ; Clear the stack pointer
            TAS
            CLL           ; L = 0
            CLI           ; I = 0

            LI {maxval}
            STORE R &200
     loop:  dfp.PRINTD
            SHL 8
            PHA
            PPF
            PHF
            PPA
            dfp.PRINTH
            DSZ R &200
            JMP loop
            SUCCESS
            HALT
    """.format(**locals())

    expected = ExpectedData([ SUCCESS ])
    for x in range(maxval, -1, -1):
        flags = ((x << 8) & 0xb000) | 0x80
        # This is complex. FN and FZ are not modified by loading
        # flags. They depend on the value of the AC. They *are* pushed
        # to the stack by PHF though.
        if x == 0:
            flags |= 0x0800
        if x & 0x80:
            flags |= 0x0400
        expected += [[ 340, "PRINTD", str(x) ],
                     [ 340, "PRINTH", "{:>04x}".format(flags) ]]
    expected += [ SUCCESS, HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))

    # pprint.pprint(result)
    # pprint.pprint(expected)
    # assert False

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
