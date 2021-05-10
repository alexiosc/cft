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
@pytest.mark.IRET
@pytest.mark.STI
@pytest.mark.WAIT
def test_WAIT(framework, capsys, tmpdir):
    num_waits = 32
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:
            JMP start
            SENTINEL
            LJMP addr     ; 00:0002: Hardware interrupts
            SENTINEL      ; 00:0003: Software interrupts
    addr:   .data thr
            .data &80

    start:  LI &0         ; Set up context 0 (the reset context, and ours)
            SCT           ; This is possible because the MBU is still disabled
            LI &80        ; &80 is this bank.
            SMB mbu.MBP   ; This enables the MBU, so we must immediately set it up.
            LI &80        ; 
            SMB mbu.MBD   ; 
            LI &01        ; 
            SMB mbu.MBS   ; 
            LI &00        ; 
            SMB mbu.MBZ   ; 

            LI 1023
            STORE R 1
            STI
            LI &80
            OUT &3ff

            LI @{num_waits}-1
            STORE R 2
    loop:   CLI
            WAIT
            SUCCESS
            DSZ R 2
            JMP loop

            HALT

    &80f000:
    thr:    LOAD R 1
            dfp.PRINTD
            SNZ
            IRET
            DSZ R 1
            NOP
            LI &80
            OUT &3ff
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS, ROM_WP0 ])
    for x in range(num_waits):
        expected += [ [ 340, 'PRINTD', str(1023 - x) ], SUCCESS ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source,
                              verilog_args=[ "+wp=0" ], long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
