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

    halted = True
    result = [ x[0] for x in run_on_verilog_emu(capsys, tmpdir, source) ]
    assert result == [ OK, OK, HALTED ]

    


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
