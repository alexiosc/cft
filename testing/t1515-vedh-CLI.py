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
    .include "dev/dfp2.asm"

    &800000:
            JMP start
            SENTINEL
            LJMP addr     ; 00:0002: Hardware interrupts
            SENTINEL      ; 00:0003: Software interrupts

    addr:   .data thr     ; 00:0004: Trap Handler Routine Address
            .data &80     ; 00:0005: THR memory bank

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

    &80F000:
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
    result = run_on_framework(framework, capsys, tmpdir, source, rom_addr=8192,
                              long=True, verilog_args=[ "+wp=0" ])
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
