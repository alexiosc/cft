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
def test_paths():
    assert os.path.exists(BASEDIR) and os.path.isdir(BASEDIR), \
        "BASEDIR not found"
    assert os.path.exists(VERILOGDIR) and os.path.isdir(VERILOGDIR), \
        "VERILOGDIR not found"
    assert os.path.exists(RUN_VERILOG_TEST) and os.access(RUN_VERILOG_TEST, os.X_OK), \
        "tools/run-verilog-testbench not found or not executable"

    # Check for the Verilog emulator
    cft2019_tb = os.path.join(BASEDIR, "verilog/cft2019_tb.o")
    assert os.path.exists(cft2019_tb) and os.access(cft2019_tb, os.X_OK), \
        cft2019_tb + " has not been compiled"

    # Check for compiled microcode
    for f in ["microcode-00.bin", "microcode-01.bin",
              "microcode-00.list", "microcode-01.list"]:
        pn = os.path.join(BASEDIR, "microcode", "build", f)
        assert os.path.exists(pn), "Microcode has not been compiled."


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
