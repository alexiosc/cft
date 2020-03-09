#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.verilog
@pytest.mark.ctl
def test_clock(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_agl(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_ail(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_control_store(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_flag_unit(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_ism(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_microcode_sequencer(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_reg_ir(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_sbu(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


@pytest.mark.verilog
@pytest.mark.ctl
def test_card_ctl(capsys):
    name = inspect.stack()[0][3].replace('test_', '')
    for code, state, comment in run_verilog_test(capsys, name):
        assert code != FAIL


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
