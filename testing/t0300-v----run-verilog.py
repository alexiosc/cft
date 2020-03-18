#!/usr/bin/python3

import os
import re
import sys
import array
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.verilog
def test_verilog_experiment(capsys, tmpdir):

    source = """
    &0:     OUT R &11e     ; SUCCESS
            OUT R &11d     ; Halt immediately.
    """

    expected = ExpectedData([OK, OK, HALTED])
    result = expected.prepare(run_on_verilog_emu(capsys, tmpdir, source))
    assert expected == list(result)

    
@pytest.mark.verilog
def test_LI(capsys, tmpdir):

    source, expected = "&0:\n", ExpectedData([ SUCCESS ])

    for x in range(1024):
        source += "LI &{:>x}\n".format(x)
        source += "OUT R &113\n"
        expected.append([ 340, "PRINTU", str(x) ])

    source += "OUT R &11d\n"
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
