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

long_values = [ 5480, 35648, 60652, 33532, 11468, 28996, 14536, 60576, 52836,
                46928, 36636, 23352, 1864, 59356, 34956, 39252, 22068, 31876,
                31472, 47736, 64776, 52860, 55672, 50468, 26544, 16116, 31004,
                6616, 48604, 58684, 9528, 14064, 38828, 20796, 4240, 31948,
                35176, 55244, 35916, 55412, 18988, 28880, 20520, 49840, 33716,
                15252, 37812, 46180, 11884, 38392, 15568, 11500, 44536, 30992,
                34920, 27104, 33832, 1668, 54188, 52936, 33820, 22020, 54648,
                20204, 32132, 46300, 54272, 9364, 33172, 63536, 35892, 44084,
                2004, 44544, 23632, 28780, 63816, 46004, 55348, 28416, 19636,
                61420, 60084, 64832, 41768, 52024, 21956, 15352, 24320, 8548,
                16912, 63480, 55220, 46612, 3016, 24064, 59164, 37796, 2300,
                19948 ]

@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LJMP
@pytest.mark.LJSR
@pytest.mark.LRET
def test_LRET(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &000000:   SENTINEL ; Set minimum memory address for cftasm

               ; Fill 512K with SENTINEL instructions
    &800000:   .fill 32768 SENTINEL
    &808000:   .fill 32768 SENTINEL
    &810000:   .fill 32768 SENTINEL
    &818000:   .fill 32768 SENTINEL
    &820000:   .fill 32768 SENTINEL
    &828000:   .fill 32768 SENTINEL
    &830000:   .fill 32768 SENTINEL
    &838000:   .fill 32768 SENTINEL
    &840000:   .fill 32768 SENTINEL
    &848000:   .fill 32768 SENTINEL
    &850000:   .fill 32768 SENTINEL
    &858000:   .fill 32768 SENTINEL
    &860000:   .fill 32768 SENTINEL
    &868000:   .fill 32768 SENTINEL
    &870000:   .fill 32768 SENTINEL
    &878000:   .fill 32768 SENTINEL

    &800000:   LI &80
               SMB mbu.MBP
               LI &0
               SMB mbu.MBZ
               LI &1
               SMB mbu.MBS
               LI &2
               SMB mbu.MBD
    """.rstrip(" ")

    # Subroutine calls first
    for i, value in enumerate(long_values):
        # Put test code in the first 512K of ROM, i.e. banks &80–&87.
        bank = 0x80 | (i & 7)
        source += "               LJSR @+2\n".format(value)
        source += "               JMP @+3\n".format(value)
        source += "               .data &{:>04x} &{:>04x}\n\n".format(value, bank)
    source += "               HALT\n"

    # Then, the subroutines themselves. We haven't tested LRET yet,
    # but LJMP works. So we pop the return addresses off the stack and
    # do it the slow way.
    for i, value in enumerate(long_values):
        # Put test code in the first 512K of ROM, i.e. banks &80–&87.
        bank = 0x80 | (i & 7)
        source += "     &{:>02x}{:>04x}:\n".format(bank, value)
        source += "               SUCCESS\n"
        source += "               LRET\n"

    expected = ExpectedData([ SUCCESS, ROM_WP0 ])
    expected += [ SUCCESS ] * len(long_values)
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source,
                              verilog_args=[ "+wp=0" ],
                              long=True)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
