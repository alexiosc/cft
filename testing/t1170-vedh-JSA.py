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
@pytest.mark.TSA
@pytest.mark.JSA
def test_JSA(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    LI &80
           SMB mbu.MBP
    """.rstrip(" ")

    expected = ExpectedData([ SUCCESS ])

    for value in long_values:
        source += "           LOAD @+3\n"
        source += "           JSA\n"
        source += "           SENTINEL\n"
        source += "           .data &{:>04x}\n".format(value)
        source += "    &{:>04x}:\n".format(value)
        source += "           dfp.PRINTH\n"

        expected.append([ 340, "PRINTH", "{:>04x}".format(value) ])

    source += "           TSA\n"
    source += "           dfp.PRINTD\n"
    source += "           HALT\n"
    expected += [ [ 340, "PRINTD", str(len(long_values)) ] ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
