#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.verilog
@pytest.mark.alu
def test_alu_decoder(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
@pytest.mark.alu
def test_alu_porta(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
@pytest.mark.alu
def test_alu_portb(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL

@pytest.mark.slow
@pytest.mark.verilog
@pytest.mark.alu
def test_alu_rom(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL

@pytest.mark.slow
@pytest.mark.verilog
@pytest.mark.alu
def test_alu_sru(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.alu
def test_reg_l(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL

@pytest.mark.verilog
@pytest.mark.alu
def test_reg_v(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
