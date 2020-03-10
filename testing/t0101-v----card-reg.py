#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.slow
@pytest.mark.verilog
@pytest.mark.reg
def test_reg_major(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL


@pytest.mark.slow
@pytest.mark.verilog
@pytest.mark.reg
def test_card_reg(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_testbench(capsys, name):
        assert code != FAIL


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
