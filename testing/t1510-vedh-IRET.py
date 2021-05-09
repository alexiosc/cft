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
@pytest.mark.TRAP
@pytest.mark.IRET
def test_IRET(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:
            LI &0         ; Set up context 0 (the reset context, and ours)
            SCT           ; This is possible because the MBU is still disabled
            LI &80        ; &80 is this bank.
            SMB mbu.MBP   ; This enables the MBU, so we must immediately set it up.
            LI &80        ; 
            SMB mbu.MBD   ; 
            LI &01        ; 
            SMB mbu.MBS   ; 
            LI &00        ; 
            SMB mbu.MBZ   ; 

            LI &1
            TAD
            LI &82        ; Set up context 1 (the TRAP context)
            NMB mbu.MBP   ; MBP is &82
            LMB mbu.MBD   ; Share the other banks with this context
            NMB mbu.MBD
            LMB mbu.MBS
            NMB mbu.MBS
            LMB mbu.MBZ
            NMB mbu.MBZ

            LI &42
            dfp.PRINTH
            TRAP 0
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 1
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 2
            dfp.PRINTH
            SUCCESS

            LI &42
            dfp.PRINTH
            TRAP 127
            dfp.PRINTH
            SUCCESS

            HALT

    &820000:
            SENTINEL
            SENTINEL
            SENTINEL      ; 00:0002: Soft interrupts
            LJMP addr     ; 00:0003: Don't allow hardware interrupts.
    addr:   .data thr     ; 00:0004: Trap Handler Routine Address
            .data &82     ; 00:0005: THR memory bank

    &828000:
    thr:    dfp.PRINTH
            PPA
            dfp.PRINTH
            LI 666
            PHA
            IRET

    """.format(**locals())

    expected = ExpectedData([ SUCCESS, ROM_WP0,
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0000" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0001" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "0002" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,
                              
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "007f" ],
                              [ 340, "PRINTH", "0042" ],
                              [ 340, "PRINTH", "029a" ],
                              SUCCESS,

                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source, rom_addr=8192,
                              long=True, verilog_args=[ "+wp=0" ])
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.IRET
@pytest.mark.STI
def test_IRET_int(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &800000:
            JMP start     ; 82:0000: Reset vector
            SENTINEL      ; 82:0001: Not used
            LJMP isr      ; 82:0002: Hardware interrupts
            SENTINEL      ; 82:0003: Don't allow soft interrupts.
    isr:    .data thr
            .data &80
    start:  LI &0
            SCT
            LI &80        ; Configure essential MBRs and enable.
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
            HALT

    &808000:
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

    expected = ExpectedData([ SUCCESS,
                              ROM_WP0,
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
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source,
                              long=True,
                              rom_addr=0, verilog_args=["+wp=0"],
                              cftemu_args=["--writeable-rom"])
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))
    assert list(result) == expected
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
