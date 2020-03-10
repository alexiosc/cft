#!/usr/bin/python3

import os
import re
import sys
import pytest
import inspect
import subprocess

from testing import * 


@pytest.mark.cftasm
def test_assemble(capsys, tmpdir):
    assemble(capsys, tmpdir, "&0: JMP @")


@pytest.mark.cftasm
def test_addrsize(capsys, tmpdir):
    assemble(capsys, tmpdir, """
    .bank &00
    &0:     .fill 65535 &1234
    &ffff:  .data 0xbeef

    .bank &ff
    &0:     .fill 65535 &5678
    &ffff:  .data 0xbeef
    """, args=["--banked"])

    assert os.path.getsize(tmpdir.join("a.bin")) == 16777216, \
        "Wrong object size generated (16M expected)"

if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
