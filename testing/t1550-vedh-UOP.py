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


"""
.equ    UOP     &0e00            ; UOP bitmap instruction
.equ    IFL     &0e8c            ; IFL bitmap instruction
.equ    IFV     &0f0c            ; IFV bitmap instruction
.equ    NOP9    UOP     #0000000 ; 0000:1:1:100:0000000  No Operation, 9 Cycles
.equ    CLA     UOP     #0100000 ; 0000:1:1:100:-1-----  Clear Accumulator
.equ    CLL     UOP     #0010000 ; 0000:1:1:100:--1----  Clear Link
.equ    SEL     UOP     #0010001 ; 0000:1:1:100:--1---1  Set Link
.equ    NOT     UOP     #0001000 ; 0000:1:1:100:---1---  Complement Accumulator
.equ    NEG     UOP     #0001100 ; 0000:1:1:100:---11--  Negate Accumulator
.equ    INC     UOP     #0000100 ; 0000:1:1:100:----1--  Increment Accumulator
.equ    DEC     UOP     #0000010 ; 0000:1:1:100:-----1-  Decrement Accumulator
.equ    CPL     UOP     #0000001 ; 0000:1:1:100:------1  Complement Link
"""



@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.TRAP
def test_UOP(capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 0
            STORE R &340

            LI 0
            ROL 1         ; Initialise L without using UOP
            LI 0

            NOP9
            JSR output    ; 1

            LI &3ff
            CLA
            JSR output    ; 2

            CPL
            JSR output    ; 3

            CLL
            JSR output    ; 4

            SEL
            JSR output    ; 5

            NOT
            JSR output    ; 6

            NOT
            JSR output    ; 7

            INC
            JSR output    ; 8

            NEG
            JSR output    ; 9

            NEG
            JSR output    ; 10

            NOT
            JSR output    ; 11

            DEC
            JSR output    ; 12

            HALT

    output: PHA 
            LOAD I R &340
            LOAD R &340
            dfp.PRINTD

            PPA
            dfp.PRINTH
            PHA
            SSL
            JMP no
            LI 1
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    no:     LI 0
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]
    

    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTD", "1", ],  [ 340, "PRINTH", "0000" ], L0, # NOP
                              [ 340, "PRINTD", "2", ],  [ 340, "PRINTH", "0000" ], L0, # CLA
                              [ 340, "PRINTD", "3", ],  [ 340, "PRINTH", "0000" ], L1, # CPL
                              [ 340, "PRINTD", "4", ],  [ 340, "PRINTH", "0000" ], L0, # CLL
                              [ 340, "PRINTD", "5", ],  [ 340, "PRINTH", "0000" ], L1, # SEL
                              [ 340, "PRINTD", "6", ],  [ 340, "PRINTH", "ffff" ], L1, # NOT
                              [ 340, "PRINTD", "7", ],  [ 340, "PRINTH", "0000" ], L1, # NOT
                              [ 340, "PRINTD", "8", ],  [ 340, "PRINTH", "0001" ], L0, # INC
                              [ 340, "PRINTD", "9", ],  [ 340, "PRINTH", "ffff" ], L0, # NEG
                              [ 340, "PRINTD", "10", ], [ 340, "PRINTH", "0001" ], L0, # NEG
                              [ 340, "PRINTD", "11", ], [ 340, "PRINTH", "fffe" ], L0, # NOT
                              [ 340, "PRINTD", "12", ], [ 340, "PRINTH", "fffd" ], L0, # DEC
                              HALTED ])
    result = run_on_verilog_emu(capsys, tmpdir, source, long=True)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
