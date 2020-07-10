#!/usr/bin/python3

import re
import os
import sys
import pprint
import pytest
import tempfile
import subprocess

import testing


def convert_result(item):
    if isinstance(item, list):
        return " ".join(str(x) for x in item if x is not None)
    return str(item)


def pytest_assertrepr_compare(op, left, right):
    if isinstance(left, list) and isinstance(right, testing.ExpectedData) and op == "==":
        a_name, b_name = None, None

        try:
            with tempfile.NamedTemporaryFile(mode="wt", delete=False) as a:
                a_name = a.name
                a.write('\n'.join(convert_result(x) for x in left))
            with tempfile.NamedTemporaryFile(mode="wt", delete=False) as b:
                b_name = b.name
                b.write('\n'.join(list(convert_result(x) for x in right)))

            diff = subprocess.getoutput("diff -yt {} {}".format(a_name, b_name))

        finally:
            if a_name is not None:
                os.unlink(a_name)
            if b_name is not None:
                os.unlink(b_name)

        return [ "OUTPUT DIFF (RESULT/EXPECTED)" ] + \
            diff.split('\n') + \
            [ "", "TO RERUN:", testing.last_test_command_ran ]


def pytest_collection_modifyitems(items):
    for item in items:
        if re.search(r"t\d{4}-v...-.+\.py$", str(item.fspath)):
            item.add_marker(pytest.mark.verilog)
        if re.search(r"t\d{4}-.e..-.+\.py$", str(item.fspath)):
            item.add_marker(pytest.mark.emulator)
        # if re.search(r"t\d{4}-..d.-.+\.py$", str(item.fspath)):
        #     print("D?", item.fspath)
        #     item.add_marker(pytest.mark.emulator)
        if re.search(r"t\d{4}-...h-.+\.py$", str(item.fspath)):
            item.add_marker(pytest.mark.hardware)

            
def pytest_addoption(parser):
    parser.addoption(
        "--framework",
        action="append",
        type="choice", choices=["verilog", "emulator", "hardware"],
        default=[],
        help="list of frameworks to test against (default: verilog).",
    )


def pytest_generate_tests(metafunc):
    if "framework" in metafunc.fixturenames:
        params = []
        fspath = metafunc.module.__file__
        if re.search(r"t\d{4}-v...-.+\.py$", str(fspath)):
            params.append("verilog")
        if re.search(r"t\d{4}-.e..-.+\.py$", str(fspath)):
            params.append("emulator")
        # if re.search(r"t\d{4}-..d.-.+\.py$", str(fspath)):
        #     print("D?", fspath)
        #     item.add_marker(pytest.mark.emulator)
        if re.search(r"t\d{4}-...h-.+\.py$", str(fspath)):
            params.append("hardware")

        frameworks = set(params) & set(metafunc.config.getoption("framework"))
        metafunc.parametrize("framework", frameworks)
        pprint.pprint(dir(metafunc.module))
    

# End of file.
