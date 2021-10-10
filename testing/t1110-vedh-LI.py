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


@pytest.mark.MBU
@pytest.mark.LI
def test_LI(framework, capsys, tmpdir):

    expected = ExpectedData([ SUCCESS ])

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
    """

    for x in range(1024):
        source += "\t\tLI &{:>x}\n".format(x)
        source += "\t\tdfp.PRINTU\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "\t\tHALT\n"
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
