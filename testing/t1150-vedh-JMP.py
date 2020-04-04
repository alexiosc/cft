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

page_values = [ 483, 681, 639, 561, 108, 183, 603, 81, 420, 453, 282, 51, 150,
                399, 357, 45, 249, 573, 78, 513, 546, 147, 570, 189, 567, 441,
                252, 699, 258, 651, 576, 531, 336, 489, 687, 369, 417, 633, 261,
                111, 519, 36, 342, 237, 123, 618, 402, 657, 297, 387, 39, 27,
                585, 102, 432, 522, 705, 312, 423, 69, 504, 477, 666, 120, 90,
                285, 156, 99, 486, 372, 612, 48, 315, 459, 525, 162, 648, 15,
                627, 30, 429, 57, 675, 318, 279, 300, 438, 270, 435, 405, 501,
                60, 114, 669, 606, 594, 540, 72, 354, 393 ]


long_values = [ 5480, 35648, 60652, 33532, 11468, 28996, 14536, 60576, 52836,
                46928, 36636, 23352, 1864, 59356, 34956, 39252, 22068, 31876,
                31472, 47736, 64776, 52860, 55672, 50468, 26544, 16116, 31004,
                6616, 48604, 58684, 9528, 14064, 38828, 20796, 4240, 31948,
                35176, 55244, 35916, 55412, 18988, 28880, 20520, 49840, 33716,
                15252, 37812, 46180, 11884, 38392, 15568, 11500, 44536, 30992,
                34920, 27104, 33832, 1668, 54188, 52936, 33820, 22020, 54648,
                20204, 32132, 46300, 54272, 9364, 33172, 63536, 35892, 44084,
                2004, 44544, 23632, 28780, 63816, 46004, 55348, 28416, 19636,
                61420, 60084, 64832, 41768, 52024, 21956, 15352, 24320, 8548,
                16912, 63480, 55220, 46612, 3016, 24064, 59164, 37796, 2300,
                19948 ]

@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    LI &80
           SMB mbu.MBP
    """

    for value in page_values:
        source += "           JMP &{:>x}\n".format(value)
        source += "     &{:>03x}: SUCCESS\n".format(value)

    source += "           HALT"

    expected = ExpectedData([ SUCCESS ] * (len(page_values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_R(capsys, tmpdir):
    """Test JMP R. NOTA BENE: JMP R is always relative to the MBP so 'R' here
    refers to page 0 of the current bank, not The Page Zero referenced to PBZ."""

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    JMP &3FF
    &3FF:  LI &80 ; Also skips to page 1
           SMB mbu.MBP
           LI 0
           SMB mbu.MBZ
           JMP R 5
    &5:
    """.format(page_values[0]).rstrip(" ")
               
    for value in page_values:
        source += "           JMP &{:>x}\n".format(value)
        source += "     &{:>03x}: SUCCESS\n".format(value)

    source += "           HALT"

    expected = ExpectedData([ SUCCESS ] * (len(page_values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL
    &0:     LI &80
            SMB mbu.MBP
    """.rstrip(" ")

    for value in long_values:
        source += "             JMP I @+1\n".format(value)
        source += "             .word &{:>03x}\n".format(value)
        source += "      &{:>04x}: SUCCESS\n".format(value)

    source += "            HALT"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I_R(capsys, tmpdir):
    """NOTE: when we're not using MBR-relative addressing, the address of the jump
    comes from Page Zero (relative to MBZ), but the jump itself is performed
    relative to MBP, as always!
    """

    source =  """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:         SENTINEL   ; Easier debugging, and also forces start RAM address to zero.
    &800000:    .fill 32768 SENTINEL
    &800000:    LI &80
                SMB mbu.MBP
                LI &0
                SMB mbu.MBZ
                JMP I R &100
    &801234:    HALT

    """.rstrip(" ")

    for i, value in enumerate(long_values, 0x100):
        source += "     &80{:>04x}:  SUCCESS\n".format(value)
        source += "               JMP I R &{:>x}\n".format(i + 1)

    source += "               HALT\n"
    # 0x1234 allows us to jump to test termination at &80100
    for i, value in enumerate(long_values + [ 0x1234 ], 0x100):
        source += "     &{:>06x}:  .word &{:>04x}\n".format(i, value)

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.MBU
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I_R_bank_relative(capsys, tmpdir):
    """Remember: JMP always jumps relative to MBP, no matter where the indirection
    happens from. In this test, we'll load jump addresses from different banks,
    but we'll always jump to MBP:<16-bit address>.
    """

    source =  """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:         SENTINEL   ; Easier debugging, and also forces start RAM address to zero.
    &800000:    .fill 32768 SENTINEL
    &800000:    LI &80
                SMB mbu.MBP
                LI &0
                SMB mbu.MBZ
                LI &4
                SMB mbu.MB4
                LI &5
                SMB mbu.MB5
                LI &6
                SMB mbu.MB6
                LI &7
                SMB mbu.MB7
                JMP I R &204
    &801234:    HALT

    """.rstrip(" ")

    i = 0x205
    for value in long_values:
        source += "     &80{:>04x}:  SUCCESS\n".format(value)
        source += "               JMP I R &{:>x}\n".format(i)
        i += 1
        if (i & 7) == 0:
            i += 4


    source += "               HALT\n"
    # Note, the jump table is split among 4 MBRs: MB4-7. So for every eight
    # auto-index MBR-relative addresses, we only use four. 0x1234 allows us to
    # jump to test termination at &80100
    i = 0x204
    for value in long_values + [ 0x1234 ]:
        source += "     &{:>04x}:  .word &{:>04x}\n".format(i, value)
        i += 1
        if (i & 7) == 0:
            i += 4

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I_R_autoinc_double_indirect(capsys, tmpdir):
    """NOTE: when we're not using MBR-relative addressing, the address of the jump
    comes from Page Zero (relative to MBZ), but the jump itself is performed
    relative to MBP, as always!
    """

    source =  """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:         SENTINEL   ; Easier debugging, and also forces start RAM address to zero.
    &800000:    .fill 32768 SENTINEL
    &800000:    LI &80
                SMB mbu.MBP
                LI &0
                SMB mbu.MBZ
                LI &3
                SMB mbu.MBD  ; We'll reference MBD (MB1) for this one.
                LI &17
                STORE R &341 ; Write MB1-relative autoinc register
                JMP I R &341 ; And away we go
    &801234:    LOAD R &341
                dfp.PRINTH
                HALT

    """.rstrip(" ")

    # The jumped-to code. This is very much like a Forth library, which
    # makes sense since I made JMPII *for* Forth originally.
    for value in long_values:
        source += "    &80{:>04x}:    SUCCESS\n".format(value)
        source += "                JMP I R &341\n"

    source += "                HALT\n"

    # Generate the jump table. Again, this is very much like a Forth compiled
    # program.

    # 0x1234 allows us to jump to test termination at &80100 source
    for i, value in enumerate(long_values + [ 0x1234 ], 0x30017):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "{:>04x}".format(0x17 + len(long_values) + 1) ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I_R_autodec_double_indirect(capsys, tmpdir):
    """Reminder: Autodecrement registers decrement after use, same as autoincrement
    registers.
    """

    source =  """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:         SENTINEL   ; Easier debugging, and also forces start RAM address to zero.
    &800000:    .fill 32768 SENTINEL
    &800000:    LI &80
                SMB mbu.MBP
                LI &0
                SMB mbu.MBZ
                LI &3
                SMB mbu.MBD  ; We'll reference MBD (MB1) for this one.
                LI &{:x}
                STORE R &381 ; Write MB1-relative autoinc register
                JMP I R &381 ; And away we go
    &801234:    LOAD R &381
                dfp.PRINTH
                HALT

    """.rstrip(" ").format(0x17 + len(long_values))

    # The jumped-to code. This is very much like a Forth library, which
    # makes sense since I made JMPII *for* Forth originally.
    for value in long_values:
        source += "    &80{:>04x}:    SUCCESS\n".format(value)
        source += "                JMP I R &381\n"

    source += "                HALT\n"

    # Generate the jump table. Again, this is very much like a Forth compiled
    # program.

    # 0x1234 allows us to jump to test termination at &80100 source
    for i, value in enumerate(reversed(long_values + [ 0x1234 ]), 0x30017):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "0016" ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JMP
def test_JMP_I_R_stack(capsys, tmpdir):
    """Works just like autodecrement, but the value is decremented *before* use.
    """

    source =  """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:         SENTINEL   ; Easier debugging, and also forces start RAM address to zero.
    &800000:    .fill 32768 SENTINEL
    &800000:    LI &80
                SMB mbu.MBP
                LI &0
                SMB mbu.MBZ
                LI &3
                SMB mbu.MBD  ; We'll reference MBD (MB1) for this one.
                LI &{:x}
                STORE R &3c1 ; Write MB1-relative autoinc register
                JMP I R &3c1 ; And away we go
    &801234:    LOAD R &3c1
                dfp.PRINTH
                HALT

    """.rstrip(" ").format(0x17 + len(long_values) + 1)
    #                                              ^^^
    # Adding one because a stack pointer is decremented before use.

    # The jumped-to code. This is very much like a Forth library, which
    # makes sense since I made JMPII *for* Forth originally.
    for value in long_values:
        source += "    &80{:>04x}:    SUCCESS\n".format(value)
        source += "                JMP I R &3c1\n"

    source += "                HALT\n"

    # Generate the jump table. Again, this is very much like a Forth compiled
    # program.

    # 0x1234 allows us to jump to test termination at &80100 source
    for i, value in enumerate(reversed(long_values + [ 0x1234 ]), 0x30017):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "0017" ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
