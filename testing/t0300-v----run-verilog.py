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
def test_verilog_emu(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:     SUCCESS
            HALT
    """

    expected = ExpectedData([OK, OK, HALTED])
    result = expected.prepare(run_on_framework(framework, capsys, tmpdir, source))
    assert expected == list(result)

    
if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
