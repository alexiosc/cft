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
def test_JMP(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 FAIL
    &0:    LI &80
           SMB mbu.MBP
    """

    values = [ 35, 65, 630, 575, 347, 437, 898, 308, 462, 33, 590, 498, 144,
               867, 435, 142, 112, 607, 123, 87, 681, 158, 207, 586, 489, 664, 817, 198,
               169, 89, 471, 706, 901, 851, 767, 51, 534, 434, 774, 452, 544, 92, 281, 74,
               813, 259, 95, 397, 14, 574, 218, 190, 863, 272, 116, 376, 849, 280, 677,
               861, 47, 274, 702, 715, 756, 597, 726, 484, 659, 161, 883, 872, 641, 288,
               895, 146, 386, 873, 712, 168, 517, 761, 371, 48, 501, 560, 564, 121, 416,
               622, 606, 820, 179, 165, 592, 82, 541, 683, 53, 384, 278 ]
               
    for value in values:
        source += "           JMP &{:>x}\n".format(value)
        source += "     &{:>03x}: SUCCESS\n".format(value)

    source += "           HALT"

    expected = ExpectedData([ SUCCESS ] * (len(values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
