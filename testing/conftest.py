#!/usr/bin/python3

import re
import pprint
import pytest


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
