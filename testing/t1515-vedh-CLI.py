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
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.STI
@pytest.mark.CLI
@pytest.mark.IRET
def test_CLI_int(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &000000:
            SUCCESS
            SUCCESS
            HALT
            LJMP 4
            .data thr
            .data &82

    &800000:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 30
            STORE R 1
            STI
            LI &10
            OUT &3ff

    wait:   LOAD R 1
            SNP
            JMP wait
            SUCCESS

            CLI
            LI 30
            STORE R 1
            LI &100
            STORE R 2

    wait2:  dfp.PRINTD
            DSZ R 2
            JMP wait2
            SUCCESS
            HALT

    &828000:
    thr:    LOAD R 1
            SNZ
            IRET
            DSZ R 1
            NOP
            dfp.PRINTH
            LI &10
            OUT &3ff
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS, ROM_WP0,
                              [ 340, 'PRINTH', '001d' ],
                              [ 340, 'PRINTH', '001c' ],
                              [ 340, 'PRINTH', '001b' ],
                              [ 340, 'PRINTH', '001a' ],
                              [ 340, 'PRINTH', '0019' ],
                              [ 340, 'PRINTH', '0018' ],
                              [ 340, 'PRINTH', '0017' ],
                              [ 340, 'PRINTH', '0016' ],
                              [ 340, 'PRINTH', '0015' ],
                              [ 340, 'PRINTH', '0014' ],
                              [ 340, 'PRINTH', '0013' ],
                              [ 340, 'PRINTH', '0012' ],
                              [ 340, 'PRINTH', '0011' ],
                              [ 340, 'PRINTH', '0010' ],
                              [ 340, 'PRINTH', '000f' ],
                              [ 340, 'PRINTH', '000e' ],
                              [ 340, 'PRINTH', '000d' ],
                              [ 340, 'PRINTH', '000c' ],
                              [ 340, 'PRINTH', '000b' ],
                              [ 340, 'PRINTH', '000a' ],
                              [ 340, 'PRINTH', '0009' ],
                              [ 340, 'PRINTH', '0008' ],
                              [ 340, 'PRINTH', '0007' ],
                              [ 340, 'PRINTH', '0006' ],
                              [ 340, 'PRINTH', '0005' ],
                              [ 340, 'PRINTH', '0004' ],
                              [ 340, 'PRINTH', '0003' ],
                              [ 340, 'PRINTH', '0002' ],
                              [ 340, 'PRINTH', '0001' ],
                              [ 340, 'PRINTH', '0000' ],
                              SUCCESS,
    ])
    expected += [ [ 340, "PRINTD", str(x) ] for x in range(256, -1, -1) ]
    expected += [ SUCCESS,
                  HALTED ]
    result = run_on_framework(framework, capsys, tmpdir, source,
                              long=True, verilog_args=[ "+wp=0" ])
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
