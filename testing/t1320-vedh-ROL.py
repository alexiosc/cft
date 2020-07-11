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
@pytest.mark.LI
@pytest.mark.ROL
def test_ROL(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:        LI &80
               SMB mbu.MBP
               CLL CLA
    
               LOAD data
               dfp.PRINTH
               ROL 0
               dfp.PRINTH
               ROL 1
               dfp.PRINTH
               ROL 1
               dfp.PRINTH
               ROL 4
               dfp.PRINTH
               ROL 8
               dfp.PRINTH
               ROL 3
               dfp.PRINTH
               HALT

    data:      .word &8080
    """.rstrip(" ")

    expected = ExpectedData([ SUCCESS ])
    expected += [ [ 340, "PRINTH", "8080" ],
                  [ 340, "PRINTH", "8080" ],
                  [ 340, "PRINTH", "0100" ],
                  [ 340, "PRINTH", "0201" ],
                  [ 340, "PRINTH", "2010" ],
                  [ 340, "PRINTH", "1010" ],
                  [ 340, "PRINTH", "8080" ],

    ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)

    # print(">"*78)
    # pprint.pprint(list(expected))
    # print("-"*78)
    # pprint.pprint(list(result))
    # print("<"*78)
    # assert False, "FOO"

    result = list(expected.prepare(result))
    assert result == expected


values = [
    0x8080, 0xf0f0, 0x0000, 0x1111, 0x2222, 0x4444, 0x8888, 0x5555,
    0x0707, 0x0f0f, 0xffff, 0xeeee, 0xdddd, 0xbbbb, 0x7777, 0xaaaa,
    0x0001, 0x0002, 0x0004, 0x0008, 0x0010, 0x0020, 0x0040, 0x0080,
    0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000,

    0xbe62, 0xefae, 0x1734, 0xeac0, 0x0839, 0x002f, 0x6d45, 0x07cf,
    0x8790, 0x8ba7, 0x58b3, 0x7f00, 0xcdcc, 0x5e53, 0x9e4e, 0x1bba,
    0x82b7, 0x2683, 0x8a6b, 0xc9bf, 0x9f34, 0x4f43, 0x11f6, 0x2d6c,
    0x0c14, 0x3f22, 0xcb8c, 0x6a4e, 0x1f2b, 0x8134, 0xa1b3, 0xb66d,
    0xf612, 0xac82, 0x6b31, 0xc0a1, 0xc769, 0x0130, 0x37ef, 0x5e4c,
    0x21bb, 0x5583, 0xbd84, 0x2b64, 0x2b16, 0x3d2c, 0xe700, 0xfbdf,
    0xd6ab, 0x5927, 0x3a18, 0x72db, 0x4057, 0x8070, 0x1264, 0xa6be,
    0x454e, 0xe679, 0x27ab, 0xcbf3, 0x1813, 0x22b0, 0xa536, 0x9880,
    0xcb65, 0x01db, 0x9477, 0x8bb3, 0x4c13, 0x940a, 0x8290, 0x24fc,
    0x7e04, 0x1912, 0x7fca, 0x9c9a, 0xcbd0, 0xbcb7, 0x2e0f, 0x6203,
    0x723c, 0x0fb2, 0xf975, 0x2a01, 0xeb3d, 0xfb7b, 0x4369, 0x4f53,
    0x0294, 0xf0d5, 0x434f, 0x26d8, 0x1e46, 0xe8de, 0xfd89, 0xc7dd,
    0xc7ed, 0xa6c7, 0x801c, 0x9572, 0x57d7, 0x1293, 0x76d3, 0xfce3,
    0x8a86, 0x3a75, 0xab0b, 0xd330, 0xb283, 0xa007, 0x62ae, 0x0de7,
    0x8b7d, 0x26cf, 0xf4ff, 0xf8b7, 0xf4d7, 0x5fdc, 0xa069, 0xd11f,
    0x352c, 0x159c, 0xacdf, 0xaff9, 0xae24, 0xf198, 0x0d97, 0xdfcf,
    0x6a0e, 0x2594, 0x926b, 0x3c01, 0xda44, 0x1eb7, 0x85a7, 0x8b91,
    0x9d06, 0x1700, 0xc299, 0x4d73, 0xb650, 0x00e2, 0x25ea, 0x735a,
    0x1b40, 0x0cf6, 0xced9, 0xd3dc, 0xbf5f, 0xfb5b, 0x06b3, 0x7e9a,
    0x6649, 0xb609, 0xc5d8, 0xca5e, 0x7891, 0x8247, 0xa179, 0x7817,
    0x044c, 0xc48c, 0x98af, 0xe24e, 0x6178, 0xbea1, 0xf2a8, 0xb4f7,
    0xc376, 0xfdf3, 0x877a, 0x2026, 0x3654, 0x0f09, 0x8fb2, 0xf4cd, 
    0x20a7, 0x879b, 0xa78e, 0x70e8, 0xb3b0, 0x63bf, 0xd95d, 0xc393,
    0x8896, 0x2f65, 0xcde8, 0x1750, 0x4c21, 0xe316, 0xd0b1, 0x8f1e,
    0x8441, 0xb4f5, 0x8365, 0x937c, 0x2d4b, 0x3a15, 0x7d03, 0x49e4,
    0x3fd1, 0xa6d1, 0x7b02, 0x3301, 0xe118, 0xe3cd, 0xf7b8, 0xc054,
    0xa6f2, 0x2477, 0xfbd4, 0x76ec, 0x0bf2, 0x082b, 0x0278, 0xab14,
    0xf2e9, 0x2121, 0x82d8, 0x5908, 0xda19, 0xa8ed, 0x4489, 0x3095,
    0x48c6, 0x87c3, 0x8cdb, 0xdd4f, 0x2876, 0xa844, 0x417e, 0xda83,
    0xaba9, 0x25e9, 0x656a, 0x99cc, 0xabcc, 0x3016, 0x4246, 0xa9dd,
    0x4663, 0xd926, 0xe779, 0x40b8, 0x7db9, 0x7ec9, 0xcaa9, 0x5dcb,
    0xc012, 0x2ca0, 0x3510, 0x5cde, 0x1526, 0xb592, 0xef04, 0xdf39,
    0xcc3d, 0x00d5, 0xa575, 0xc8d1, 0xf514, 0xaf1a, 0x2071, 0xd5cc,
    0xf556, 0x8529, 0x5eaf, 0x67aa, 0xf65e, 0x7ab4, 0x093a, 0xccde,
    0x729f, 0x52e6, 0x7376, 0x853e, 0xc415, 0xfb1e, 0x749b, 0xadbd,
    0x830a, 0x6a77, 0xb14d, 0x8f59, 0x6290, 0x3e0c, 0x1109, 0x7dc8,
    0x4be2, 0x3407, 0x7479, 0x555e, 0x90f0, 0xebfd, 0xe7b4, 0xd2b9,
    0x7a0b, 0x93aa, 0x3cdf, 0x9b6e, 0x6b7e, 0x6fa7, 0xa7ca, 0x40aa,
    0xc824, 0x8caf, 0xd124, 0x5bec, 0x1872, 0x6970, 0xc96e, 0x01e7,
    0x6c80, 0x9586, 0x2f3f, 0x8772, 0x31c7, 0x0d56, 0xe9a3, 0x7af2,
    0x9b43, 0x60cc, 0x5d82, 0xf93a, 0xd3be, 0xe12a, 0x8e22, 0xea1a,
    0xa603, 0x650c, 0x46c5, 0x18c0, 0xff42, 0xc59c, 0x73e1, 0x26ee,
    0xaa2e, 0x3f71, 0x4eb8, 0x8b0e, 0x7b8e, 0x72df, 0x00b0, 0xc890,
    0xe8ee, 0x4814, 0xa998, 0x1c50, 0x774d, 0x73c5, 0x3799, 0x571b,
    0xa2ce, 0xfb78, 0xd4f4, 0x0fc3, 0x7d2a, 0x53cb, 0x7bde, 0x07b7,
    0xcaf3, 0x4df9, 0xd646, 0x697b, 0x13d8, 0x8481, 0xc647, 0xbd60,
    0x61d9, 0x4bb6, 0xa9aa, 0x9e6d, 0x362d, 0xf022, 0x0abf, 0x7e92,
    0x5d13, 0x8132, 0xf52e, 0x282d, 0xda7e, 0x16e9, 0x6d19, 0x167d,
    0x7a6f, 0xf50e, 0x21c5, 0x930a, 0x3595, 0x20ea, 0x2b79, 0x9f98,
    0x3898, 0x7d62, 0x3514, 0x6156, 0x5b5c, 0xe536, 0x305a, 0xab29
]

shifts = [ 0, 1, 1, 4, 8, 3, 15, 2 ]


def calc_ROL(x, d):
    """This is very lazy, but we'll be rolling by an arbitrary number of bits
    possibly larger than the word length."""
    xs = bin(x)[2:].zfill(17)
    for i in range(d):
        xs = xs[1:] + xs[0]
    return int(xs, 2) & 0xffff



def test_calc_ROL():
    """Test the ROL calculation function itself, since it's not trivial."""
    assert calc_ROL(0x8080, 0) == 0x8080
    assert calc_ROL(0x8080, 1) == 0x0100
    assert calc_ROL(0x8080, 2) == 0x0201
    assert calc_ROL(0x8080, 6) == 0x2010
    assert calc_ROL(0x8080, 14) == 0x1010
    assert calc_ROL(0x8080, 17) == 0x8080


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LIA
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.JSR
@pytest.mark.RET
@pytest.mark.ROL
@pytest.mark.slow
def test_ROL_slow(framework, capsys, tmpdir):

    source = """
    .include "mbu.asm"
    .include "dfp2.asm"

    &0:        LI &80
               SMB mbu.MBP
               LI 0
               SMB mbu.MBZ
               LI 1
               SMB mbu.MBS
               CLL CLA
    
               LIA data
               STORE R &340 ; MBP-relative autoinc
    """.rstrip(" ")

    for x in values:
        source += "               LOAD I R &340 ; test with &{:04x}\n".format(x)
        source += "               JSR test\n"

    source += "               HALT\n\n"
    source += "test:          dfp.PRINTH\n"

    # Build the test routine.
    for shift in shifts:
        source += "               ROL {}\n".format(shift)
        source += "               dfp.PRINTH\n"

    source += "               SUCCESS\n"
    source += "               RET\n"
    source += "\ndata:\n"

    expected = ExpectedData([ SUCCESS ])

    for x in values:
        source += "               .data &{:>04x}\n".format(x)
        expected += [ [ 340, "PRINTH", "{:>04x}".format(x) ] ]

        # The test routine tries a number of operations, we don't have direct
        # access to L so we can't check that, but since we're rolling, we can
        # fake it by remembering what the original value was.
        total_shift = 0
        for shift in shifts:
            total_shift += shift
            val = calc_ROL(x, total_shift)
            expected += [ [ 340, "PRINTH", "{:>04x}".format(val) ] ]
        expected += [ SUCCESS ]
    expected += [ HALTED ]

    result = run_on_framework(framework, capsys, tmpdir, source)
    result = list(expected.prepare(result))
    assert result == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
