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

page_values = [ 483, 681, 639, 561, 108, 183, 603, 81, 420, 453, 282, 51, 150,
                399, 357, 45, 249, 573, 78, 513, 546, 147, 570, 189, 567, 441,
                252, 699, 258, 651, 576, 531, 336, 489, 687, 369, 417, 633, 261,
                111, 519, 36, 342, 237, 123, 618, 402, 657, 297, 387, 39, 27,
                585, 102, 432, 522, 705, 312, 423, 69, 504, 477, 666, 120, 90,
                285, 156, 99, 486, 372, 612, 48, 315, 459, 525, 162, 648, 15,
                627, 30, 429, 57, 675, 318, 279, 300, 438, 270, 435, 405, 501,
                60, 114, 669, 606, 594, 540, 72, 354, 393 ]

@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.RET
def test_RET(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    LI &80
           NCT
           SMB mbu.MBP
           LI &1
           SMB mbu.MBS
           LI &0
           TAS
    """

    # We need some space for our routine calling code, so leave out
    # some of the values.
    values = [ x for x in page_values if x > 205 ]
    expected = ExpectedData([ SUCCESS ] * (len(values) + 1))

    for value in values:
        source += "           JSR &{:>x}\n".format(value)
        
    source += "           TSA\n"
    source += "           dfp.PRINTD\n"
    source += "           HALT\n"

    # Unlike the JSR tests, we're popping from the SP now. It should end up
    # with the same value as it started with (0).
    expected += [ [ 340, "PRINTD", "0" ], HALTED ]


    # Now the subroutines. Note, we don't use RET because we haven't
    # tested it yet. But we can use PPA and JPA to achieve the same
    # thing.
    for value in values:
        source += "    &{:>04x}:\n".format(value)
        source += "           SUCCESS\n"
        source += "           RET\n"

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
