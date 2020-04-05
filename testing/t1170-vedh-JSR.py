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
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    LI &80
           SMB mbu.MBP
           LI &1
           SMB mbu.MBS
           LI &0
           TAS
    """

    # We need some space for our routine calling code, so leave out
    # some of the values.
    values = [ x for x in page_values if x > 205 ]
    expected = ExpectedData([ SUCCESS ] * (len(values) + 1))

    for value in values:
        source += "           JSR &{:>x}\n".format(value)
        
    source += "           TSA\n"
    source += "           dfp.PRINTD\n"
    source += "           HALT\n"
    expected += [ [ 340, "PRINTD", str(len(values)) ], HALTED ]

    # Now the subroutines. Note, we don't use RET because we haven't
    # tested it yet. But we can use PPA and JSA to achieve the same
    # thing. Note: JSA is jump to subroutine, so the stack pointer is
    # incremented TWICE per call, hence we expect it to be equal to
    # len(values) at the end of execution.
    for value in values:
        source += "    &{:>04x}:\n".format(value)
        source += "           SUCCESS\n"
        source += "           PPA\n"
        source += "           JSA\n"

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_R(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:    .fill 32768 SENTINEL
    &0:    JMP I @+1
           .word &1000

    &1000: LI &80
           SMB mbu.MBP
           SMB mbu.MBZ
           LI &1
           SMB mbu.MBS
           LI &0
           TAS

    """.rstrip(" ")

    # Generate multiples of four words where 4 ≤ n < &300.
    values = [ x*4 for x in range(1, 192) ]
    expected = ExpectedData([ SUCCESS ] * (len(values) + 1))

    for value in values:
        source += "           JSR R &{:>x}\n".format(value)
    source += "           TSA\n"
    source += "           dfp.PRINTD\n"
    source += "           HALT\n"
    expected += [ [ 340, "PRINTD", str(len(values)) ], HALTED ]

    # Now the subroutines. Note, we don't use RET because we haven't
    # tested it yet. But we can use PPA and JPA to achieve the same
    # thing.
    for value in values:
        source += "    &{:>04x}:\n".format(value)
        source += "           SUCCESS\n"
        source += "           PPA\n"
        source += "           JSA\n"

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I(capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:     .fill 32768 SENTINEL
            .fill 32768 SENTINEL
    &0:     LI &80
            SMB mbu.MBP
            LI &1
            SMB mbu.MBS
            LI &0
            TAS

    """.rstrip(" ")

    for value in long_values:
        source += "             LOAD I @+3\n".format(value)
        source += "             JSR I @+2\n".format(value)
        source += "             JMP @+2\n"
        source += "             .word &{:>04x}\n".format(value)

    source += "            TSA\n"
    source += "            dfp.PRINTD\n"
    source += "            HALT\n"

    for value in long_values:
        source += "    &{:>04x}:\n".format(value)
        source += "           SUCCESS\n"
        source += "           PPA\n"
        source += "           JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTD", str(len(long_values)) ], HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I_R(capsys, tmpdir):
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
                LI &1
                SMB mbu.MBS
                LI &0
                TAS

    """.rstrip(" ")

    for i, value in enumerate(long_values, 0x100):
        source += "                JSR I R &{:>x}\n".format(i)

    source += "                TSA\n"
    source += "                dfp.PRINTD\n"
    source += "                HALT\n"
    # 0x1234 allows us to jump to test termination at &80100
    for i, value in enumerate(long_values, 0x100):
        source += "     &{:>06x}:  .word &{:>04x}\n".format(i, value)

    # And now the subroutines themselves.
    for i, value in enumerate(long_values, 0x100):
        source += "     &80{:>04x}:\n".format(value, i)
        source += "               SUCCESS\n"
        source += "               PPA\n"
        source += "               JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTD", str(len(long_values)) ], HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.MBU
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I_R_bank_relative(capsys, tmpdir):
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

    """.rstrip(" ")

    # Note, the jump table is split among 4 MBRs: MB4-7. So for every eight
    # auto-index MBR-relative addresses, we only use four (for a maximum of 128
    # subroutines).
    i = 0x204
    for value in long_values:
        source += "                JSR I R &{:>04x}\n".format(i)
        i += 1
        if (i & 7) == 0:
            i += 4

    source += "                TSA\n"
    source += "                dfp.PRINTD\n"
    source += "                HALT\n"

    # Now do the subroutine pointers
    i = 0x204
    for value in long_values:
        source += "     &{:>06x}:  .word &{:>04x}\n".format(i, value)
        i += 1
        if (i & 7) == 0:
            i += 4

    # And the subroutines themselves
    for value in long_values:
        source += "     &80{:>04x}:\n".format(value)
        source += "               SUCCESS\n"
        source += "               PPA\n"
        source += "               JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTD", str(len(long_values)) ], HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I_R_autoinc_double_indirect(capsys, tmpdir):
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
                LI &117
                STORE R &341 ; Write MB1-relative autoinc register
    """.rstrip(" ")

    # The JSRs. It's just the same repeating instruction using &341 as an
    # instruction pointer.
    for value in long_values:
        source += "                JSR I R &341\n"

    source += """
                LOAD R &341
                dfp.PRINTH
                TSA
                dfp.PRINTD
                HALT
    """.strip(" ")

    # The list of subroutines, stored in MBD (&03):
    for i, value in enumerate(long_values, 0x30117):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    # The subroutines themselves.
    for value in long_values:
        source += "    &80{:>04x}:   SUCCESS\n".format(value)
        source += "               PPA\n"
        source += "               JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "{:>04x}".format(0x117 + len(long_values)) ] ]
    expected += [ [ 340, "PRINTD", str(len(long_values)) ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I_R_autodec_double_indirect(capsys, tmpdir):
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
                LI &{:x}
                STORE R &381 ; Write MB1-relative autoinc register
    """.rstrip(" ").format(0x117 + len(long_values) -1)

    # The JSRs. It's just the same repeating instruction using &381 as an
    # instruction pointer.
    for value in long_values:
        source += "                JSR I R &381\n"

    source += """
                LOAD R &381
                dfp.PRINTH
                TSA
                dfp.PRINTD
                HALT
    """.strip(" ")

    # The list of subroutines, stored in MBD (&03):
    for i, value in enumerate(long_values, 0x30117):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    # The subroutines themselves.
    for value in long_values:
        source += "    &80{:>04x}:   SUCCESS\n".format(value)
        source += "               PPA\n"
        source += "               JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "0116" ] ]
    expected += [ [ 340, "PRINTD", str(len(long_values)) ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.JSR
@pytest.mark.TSA
@pytest.mark.TAS
@pytest.mark.PPA
@pytest.mark.JSA
def test_JSR_I_R_stack(capsys, tmpdir):
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
                LI &{:x}
                STORE R &3c1 ; Write MB1-relative autoinc register
    """.rstrip(" ").format(0x117 + len(long_values) - 1 + 1)
    #                                                   ^^^
    # Adding one because a stack pointer is decremented before use.

    # The JSRs. It's just the same repeating instruction using &3c1 as an
    # instruction pointer.
    for value in long_values:
        source += "                JSR I R &3c1\n"

    source += """
                LOAD R &3c1
                dfp.PRINTH
                TSA
                dfp.PRINTD
                HALT
    """.strip(" ")

    # The list of subroutines, stored in MBD (&03):
    for i, value in enumerate(long_values, 0x30117):
        source += "    &{:>06x}:   .word &{:>04x}\n".format(i, value)

    # The subroutines themselves.
    for value in long_values:
        source += "    &80{:>04x}:   SUCCESS\n".format(value)
        source += "               PPA\n"
        source += "               JSA\n"

    expected = ExpectedData([ SUCCESS ] * (len(long_values) + 1))
    expected += [ [ 340, "PRINTH", "0117" ] ]
    expected += [ [ 340, "PRINTD", str(len(long_values)) ] ]
    expected += [ HALTED ]

    result = run_on_verilog_emu(capsys, tmpdir, source, long=True, timeout=30000000)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
