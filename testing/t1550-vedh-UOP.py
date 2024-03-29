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


data = [
    0, 65535, 8192, 16384, 32768, 32769, 49152,
    16091, 3631, 28738, 19461, 53460, 1603, 59601, 62315, 42198,
    13793, 15337, 48315, 62753, 62359, 38838, 6936, 63577, 15832,
    6575, 41550, 19351, 53311, 33920, 17456, 56916, 7677, 9687, 22523,
    30651, 54977, 13758, 48407, 41289, 16427, 18650, 6673, 47801,
    2275, 40830, 4314, 18307, 34266, 6224, 36428, 7669, 62343, 7305,
    11398, 30898, 45804, 41833, 15487, 24319, 27899, 37813, 11712,
    31088, 48913, 31278, 59345, 9006, 34447, 25959, 21380, 13752,
    61318, 18019, 40657, 45511, 52762, 12306, 31591, 26976, 52825,
    54873, 24749, 14456, 50473, 46003, 57437, 60464, 42335, 61674,
    56165, 60074, 47799, 25853, 25875, 21129, 23948, 52776, 6410,
    34347, 53208, 28314, 48702, 7395, 2697, 10028, 14334, 2507, 26590,
    13290, 22970, 48057, 58605, 22192, 31900, 17194, 28546, 33811,
    55164, 51945, 54638, 49824, 44056, 51995, 45797, 56423, 42281,
    9727, 39253, 25620, 17081, 44193, 54384, 5333, 23487, 56575, 7283,
    62197, 55475, 49094, 43708, 15953, 61810, 59679, 6751, 48439,
    22210, 26500, 30958, 57646, 2080, 62287, 14563, 34110, 59804,
    7815, 60323, 15691, 36710, 27630, 7544, 27513, 43136, 48291,
    40705, 56556, 51101, 1362, 32280, 54123, 17929, 42839, 55345,
    23801, 1795, 33155, 10361, 10226, 37818, 62600, 28210, 772, 9415,
    61086, 64507, 17501, 59953, 28756, 38477, 53765, 57821, 53680,
    23100, 32341, 21606, 41659, 64104, 48605, 3090, 54659, 43400,
    16244, 25625, 51445, 59840, 34385, 24765, 24887, 6399, 54815,
    15570, 52936, 6896, 58350, 29344, 65323, 8135, 6322, 45614, 6463,
    62159, 37847, 55146, 28960, 30940, 35147, 6212, 50826, 4137,
    58435, 59739, 11562, 695, 63880, 781, 36592, 53069, 22291, 983,
    45609, 16982, 15980, 8209, 58130, 19121, 39774, 3189, 57965,
    22166, 34473, 52040, 50593, 15249, 48420, 30214, 8609, 43143,
    18549, 11547, 24289, 34898, 45876, 802, 55297, 2923, 31987, 41591,
    48366, 36636, 46210, 37468, 15454, 33606, 40780, 27396, 1041, 879,
    52476, 44185, 22252, 3423, 3767, 40465, 5399, 34281, 31799, 54617,
    3771, 23762, 49008, 23526, 3424, 52258, 63730, 37833, 2040, 17395,
    30324, 1837, 8152, 43537, 10016, 44484, 63870, 57848, 63089,
    16063, 32455, 16311, 19773, 17132, 827, 26546, 20880, 50622,
    45544, 26556, 12829, 43283, 13574, 63133, 21128, 34796, 57899,
    53851, 391, 21940, 7443, 10347, 9194, 9576, 64659, 53296, 34146,
    20616, 59066, 1167, 61090, 42846, 37403, 23291, 31477, 41789, 533,
    32033, 57064, 24822, 11991, 42992, 38957, 3538, 24730, 45676,
    51700, 64534, 38082, 60623, 47040, 19957, 14493, 40155, 64887,
    46246, 2596, 25745, 38091, 27491, 13908, 40491, 62385, 5653,
    17085, 8663, 56225, 15460, 35612, 32211, 23037, 4263, 1404, 29953,
    14435, 6385, 42599, 60929, 33226, 45847, 32569, 33787, 50657,
    57865, 64073, 27445, 24589, 11387, 19400, 8781, 47982, 61093,
    53709, 18875, 11229, 59865, 18278, 18391, 22782, 27283, 2034,
    21634, 62830, 30421, 1265, 59057, 29258, 2461, 58571, 32384,
    53328, 1413, 57208, 9156, 37494, 14222, 35872, 37302, 54516,
    22773, 16965, 42639, 36022, 59036, 38963, 4069, 39734, 64773,
    55030, 10587, 46465, 25500, 23378, 53287, 9556, 3442, 19429, 6203,
    56569, 20685, 54411, 63410, 61499, 53407, 17183, 62377, 61110,
    56489, 52067, 54086, 50376, 44063, 1826, 1739, 46245, 20043,
    44038, 39660, 51502, 39759, 3876, 48568, 8963, 22909, 63600,
    10341, 52727, 7304, 43915, 44605, 35218, 46321, 4146, 39694,
    64954, 13175, 48453, 5167, 24811, 53113, 13331, 15844, 19674,
    52796, 2929, 65094, 57003, 44348, 53121, 10245, 40055, 7321,
    62283, 18920, 28679, 114, 3230, 31985, 19576, 42531, 56922, 35159,
    6353, 43253, 32870, 43233, 21310, 15793, 14988, 59167, 8973,
    40034, 35904, 6290, 30489, 18002, 25616, 1793, 7873, 11259, 43650,
    1181, 27914, 3135, 14124, 23914, 198, 12082, 3030, 46176, 32302,
    2228, 61122, 44551, 21416, 38138, 29556, 30147, 43809, 29464,
    30320, 20420, 51431, 36129, 29499, 14439, 48760, 54705, 41714,
    3432, 52391, 6323, 50254, 11197, 26011, 13350, 28566, 4329, 52052,
    34006, 52820, 1775, 46646, 27142, 49854, 10223, 45316, 17911,
    59807, 60672, 18878, 53302, 15807, 9833, 36140, 65074, 50660,
    26477, 40299, 18081, 28901, 16409, 37975, 46392, 22769, 38754,
    52365, 30608, 59824, 61763, 50519, 61722, 13459, 15910, 64500,
    43380, 50818, 5758, 59863, 16270, 36996, 50257, 30750, 28051,
    41265, 37777, 33595, 53609, 52981, 34671, 22989, 29001, 52327,
    6931, 58105, 17815, 57118, 35939, 29809, 58629, 29767, 50867,
    55331, 63941, 24089, 18302, 2335, 11866, 43838, 61344, 52506,
    2638, 61014, 56349, 16312, 38058, 52143, 9913, 57487, 13224,
    24619, 59554, 24947, 24522, 23107, 27166, 34605, 7848, 7017,
    46020, 20075, 43655, 14210, 550, 13263, 21118, 58689, 425, 47934,
    60000, 41107, 43388, 27234, 10933, 24881, 57891, 8513, 30746,
    20730, 1014, 12655, 30428, 3175, 16674, 11423, 58839, 22407,
    35325, 25445, 46042, 368, 58706, 59883, 31353, 41904, 9363, 18251,
    44436, 53245, 44078, 46013, 57337, 17693, 19793, 4234, 26490,
    64565, 58708, 64576, 64123, 18199, 38034, 42508, 44461, 739,
    11545, 6500, 60403, 32358, 21239, 34076, 4046, 32756, 22318,
    35501, 28296, 62547, 35868, 61640, 10817, 2646, 6830, 4974, 46954,
    1416, 21084, 29125, 35352, 3646, 33633, 14107, 44855, 27951,
    54197, 36406, 397, 42234, 29318, 25939, 20395, 64351, 55280,
    46923, 4739, 22812, 24827, 50355, 18359, 10595, 1716, 40501,
    29774, 50003, 55995, 10196, 9548, 53880, 34199, 1574, 28028,
    11433, 26206, 15611, 57536, 51606, 42120, 14873, 21517, 26739,
    56482, 17745, 18135, 42613, 37252, 14889, 3129, 52773, 20742,
    34882, 48982, 55532, 3038, 687, 52640, 19500, 13947, 39856, 54657,
    12997, 63359, 7401, 48675, 20980, 45581, 9923, 37130, 14287, 1947,
    13262, 62340, 53120, 13642, 9250, 3673, 41537, 52885, 13785,
    47665, 23105, 55039, 57339, 40000, 28946, 30457, 60394, 63301,
    26903, 11295, 16162, 45530, 29221, 15123, 10430, 9943, 58831,
    36736, 4938, 14533, 62364, 43824, 19130, 45796, 54602, 41644,
    45681, 62555, 47908, 56246, 15948, 46161, 21067, 48361, 24533,
    38762, 34657, 37177, 15466, 39582, 39760, 42048, 22931, 3634,
    52186, 2990, 30881, 8649, 38817, 10254, 54172, 12639, 41718,
    58729, 38714, 10863, 2959, 17454, 22748, 27071, 58141, 16134,
    20251, 35529, 4860, 42503, 23200, 41708, 53586, 36930, 61923,
    39659, 40418, 55147, 30258, 24966, 41477, 49331, 64937, 50701,
    53524, 60993, 28337, 47115, 13158, 16548, 5204, 55803, 5853,
    49626, 40996, 59366, 36957, 47705, 12919, 27350, 54045, 51914,
    60399, 4024, 2884, 28639, 63897, 14098, 47508, 25317, 28154,
    50874, 57753, 1023, 30767, 57448, 45735, 63188, 58552, 60340,
    16035, 24345, 26116, 21627, 62089, 3303, 44750, 56820, 48294,
    58996, 37475, 62948, 64927, 1160, 37528, 2355, 61466, 48323,
    59539, 37283, 2149, 23889, 1804, 6050, 49250, 41732, 39851, 49147,
    28973, 31935, 24699, 62649, 50731, 49635, 30808, 32913, 6968,
    23144, 27173, 5922, 24164, 17352, 54497, 25622, 2760, 2137, 50118,
    56228, 20083, 28329, 61570, 32473, 56234, 52281, 43998, 6388,
    20683, 21886, 15178, 61901, 5756, 61480, 28254, 15828, 6821,
    38799, 44579, 15451, 27860, 31056, 21945, 31856, 7991, 56917,
    29128, 24472, 13641, 53694, 57399, 57179, 51509, 26336, 22271,
    33047, 3815, 46702, 6145, 17048, 7755, 28951, 39711, 48915, 3995,
    59832, 33680, 14880, 5229, 41683, 45571, 52481
]



"""
.equ    UOP     &0e00            ; UOP bitmap instruction
.equ    IFL     &0e8c            ; IFL bitmap instruction
.equ    IFV     &0f0c            ; IFV bitmap instruction
.equ    NOP9    UOP     #0000000 ; 0000:1:1:100:0000000  No Operation, 9 Cycles
.equ    CLA     UOP     #0100000 ; 0000:1:1:100:-1-----  Clear Accumulator
.equ    CLL     UOP     #0010000 ; 0000:1:1:100:--1----  Clear Link
.equ    SEL     UOP     #0010001 ; 0000:1:1:100:--1---1  Set Link
.equ    NOT     UOP     #0001000 ; 0000:1:1:100:---1---  Complement Accumulator
.equ    NEG     UOP     #0001100 ; 0000:1:1:100:---11--  Negate Accumulator
.equ    INC     UOP     #0000100 ; 0000:1:1:100:----1--  Increment Accumulator
.equ    DEC     UOP     #0000010 ; 0000:1:1:100:-----1-  Decrement Accumulator
.equ    CPL     UOP     #0000001 ; 0000:1:1:100:------1  Complement Link
"""



@pytest.mark.cftasm
@pytest.mark.UOP
@pytest.mark.IFL
@pytest.mark.IFV
@pytest.mark.NEG
def test_00_UOP_opcodes(framework, capsys, tmpdir):
    """I have reason to believe the automatic assembler opcode generator messes up with IFL and IFV,
    so check to make sure the opcodes are correct."""

    code="""
    UOP
    IFL
    IFV
    NEG
    IFL NEG
    IFV NEG
    """.strip()

    assemble(tmpdir, code, args=["--blocksize", "0"])
    correct_num_words = len(code.split("\n"))

    fname = str(tmpdir.join("a.bin"))
    assert os.path.getsize(fname) == correct_num_words * 2, \
        "Wrong object size generated ({}W expected)".format(correct_num_words)

    assembled_data = read_cft_bin_file(fname, correct_num_words)

    print(assembled_data)

    # Data is byte-swapped when Python reads it a 16-bit ints.
    expected_data = [
        "0e00",
        "0e80",
        "0f00",
        "0e0c",
        "0e8c",
        "0f0c",
    ]
    assert len(assembled_data) == correct_num_words
    assert [ "%04x" % x for x in assembled_data ] == expected_data, "CFTASM bitmap builtins may be broken"



@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.UOP
def test_UOP(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 0
            STORE R &340

            LI 0
            ROR 1         ; Initialise L without using UOP
            LI 0
            SCL           ; Make sure L is clear.
            FAIL

            NOP9
            JSR output    ; 1

            LI &3ff
            CLA
            JSR output    ; 2

            CPL
            JSR output    ; 3

            CLL
            JSR output    ; 4

            SEL
            JSR output    ; 5

            NOT
            JSR output    ; 6

            NOT
            JSR output    ; 7

            INC
            JSR output    ; 8

            NEG
            JSR output    ; 9

            NEG
            JSR output    ; 10

            NOT
            JSR output    ; 11

            DEC
            JSR output    ; 12

            HALT

    output: PHA 
            LOAD I R &340
            LOAD R &340
            dfp.PRINTD

            PPA
            dfp.PRINTH
            PHA
            SSL
            JMP no
            LI 1
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    no:     LI 0
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]
    

    _ = [
        (340, 'PRINTD', '1'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '2'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '3'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '1'),
        (340, 'PRINTD', '4'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '1'),
        (340, 'PRINTD', '5'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '6'),  (340, 'PRINTH', 'ffff'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '7'),  (340, 'PRINTH', '0000'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '8'),  (340, 'PRINTH', '0001'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '9'),  (340, 'PRINTH', 'ffff'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '10'), (340, 'PRINTH', '0001'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '11'), (340, 'PRINTH', 'fffe'), (340, 'PRINTU', '0'),
        (340, 'PRINTD', '12'), (340, 'PRINTH', 'fffd'), (340, 'PRINTU', '0'),
        (305, 'Halted', None)]

    
    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTD", "1", ],  [ 340, "PRINTH", "0000" ], L0, # NOP
                              [ 340, "PRINTD", "2", ],  [ 340, "PRINTH", "0000" ], L0, # CLA
                              [ 340, "PRINTD", "3", ],  [ 340, "PRINTH", "0000" ], L1, # CPL
                              [ 340, "PRINTD", "4", ],  [ 340, "PRINTH", "0000" ], L0, # CLL
                              [ 340, "PRINTD", "5", ],  [ 340, "PRINTH", "0000" ], L1, # SEL
                              [ 340, "PRINTD", "6", ],  [ 340, "PRINTH", "ffff" ], L1, # NOT
                              [ 340, "PRINTD", "7", ],  [ 340, "PRINTH", "0000" ], L1, # NOT
                              [ 340, "PRINTD", "8", ],  [ 340, "PRINTH", "0001" ], L1, # INC
                              [ 340, "PRINTD", "9", ],  [ 340, "PRINTH", "ffff" ], L1, # NEG
                              [ 340, "PRINTD", "10", ], [ 340, "PRINTH", "0001" ], L1, # NEG
                              [ 340, "PRINTD", "11", ], [ 340, "PRINTH", "fffe" ], L1, # NOT
                              [ 340, "PRINTD", "12", ], [ 340, "PRINTH", "fffd" ], L1, # DEC
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.NOT
def test_NOT(framework, capsys, tmpdir, numtests=10):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LIA data
            STORE R &340
            LI @{numtests}-1
            STORE R 1

    loop:   LOAD I R &340
            CLL
            dfp.PRINTH
            NOT
            dfp.PRINTH
            SCL
            HALT
            SUCCESS

            SEL
            dfp.PRINTH
            NOT
            dfp.PRINTH
            SSL
            HALT
            SUCCESS

            DSZ R 1
            JMP loop
            HALT

    data:
    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]
    
    expected = ExpectedData([ SUCCESS ] )
    for x in data[:numtests]:
        source += "\n            .word &{:>04x}".format(x)
        expected += [
            [ 340, "PRINTH", "{:>04x}".format(x) ], 
            [ 340, "PRINTH", "{:>04x}".format(x ^ 0xffff) ], 
            SUCCESS,
            [ 340, "PRINTH", "{:>04x}".format(x ^ 0xffff) ], 
            [ 340, "PRINTH", "{:>04x}".format(x) ], 
            SUCCESS ]
    expected += [ HALTED ]
    
    result = run_on_framework(framework, capsys, tmpdir, source, timeout=30000000)
    # pprint.pprint(list(result))
    # pprint.pprint(list(expected))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.NOT
@pytest.mark.slow
def test_NOT_long(framework, capsys, tmpdir):
    test_NOT(framework, capsys, tmpdir, numtests=1000)


def neg(x):
    """Two's Complement negation of 16-bit signed integer X"""
    return ((x ^ 0xffff) + 1) & 0xffff


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.NEG
def test_NEG(framework, capsys, tmpdir, numtests=10):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ;
            SMB mbu.MBZ   ;
            LI &01        ;
            SMB mbu.MBS   ;

            LIA data
            STORE R &340
            LI @{numtests}-1
            STORE R 1

    loop:   LOAD I R &340
            STORE R 2
            CLL
            dfp.PRINTH
            NEG
            dfp.PRINTH

            SEL
            LOAD R 2
            dfp.PRINTH
            NEG
            dfp.PRINTH

            DSZ R 1
            JMP loop
            HALT

    data:
    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]

    expected = ExpectedData([ SUCCESS ] )
    for x in data[:numtests]:
        source += "\n            .word &{:>04x}".format(x)
        expected += [
            [ 340, "PRINTH", "{:>04x}".format(x) ], 
            [ 340, "PRINTH", "{:>04x}".format(neg(x)) ], 
            [ 340, "PRINTH", "{:>04x}".format(x) ], 
            [ 340, "PRINTH", "{:>04x}".format(neg(x)) ], 
        ]
    expected += [ HALTED ]
    
    result = run_on_framework(framework, capsys, tmpdir, source, timeout=30000000)
    # pprint.pprint(list(result))
    # pprint.pprint(list(expected))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.NEG
@pytest.mark.slow
def test_NEG_long(framework, capsys, tmpdir):
    test_NEG(framework, capsys, tmpdir, numtests=1000)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.INC
def test_INC(framework, capsys, tmpdir, numtests=10, numops=5):

    numops -= 1                 # We use DSZ, so it's off by one

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ;
            SMB mbu.MBZ   ;
            LI &01        ;
            SMB mbu.MBS   ;

            LIA data
            STORE R &340
            LI @{numtests}-1
            STORE R 1

    loop:   LOAD I R &340
            STORE R 2
            CLL
            dfp.PRINTH
            STORE R 4

            LI {numops}
            STORE R 3
    loop2:  LOAD R 4
            INC
            STORE R 4
            dfp.PRINTH
            DSZ R 3
            JMP loop2

            CLL
            LI {numops}
            STORE R 3
    loop3:  LOAD R 4
            INC
            STORE R 4
            dfp.PRINTH
            DSZ R 3
            JMP loop3
            ;SUCCESS

            DSZ R 1       ; outer loop
            JMP loop
            HALT

    data:
    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]

    inc = lambda a, b: (a + b) & 0xffff

    expected = ExpectedData([ SUCCESS ] )
    for x in data[:numtests]:
        source += "\n            .word &{:>04x}".format(x)
        expected += [
            [ 340, "PRINTH", "{:>04x}".format(x) ] ]
        expected += [ [ 340, "PRINTH", "{:>04x}".format(inc(x, i)) ] for i in range(1, 2 * numops + 3) ]
    expected += [ HALTED ]
    
    result = run_on_framework(framework, capsys, tmpdir, source, timeout=300000000)
    # pprint.pprint(list(result))
    # pprint.pprint(list(expected))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.INC
@pytest.mark.slow
def test_INC_long(framework, capsys, tmpdir):
    test_INC(framework, capsys, tmpdir, numtests=200, numops=20)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.DEC
def test_DEC(framework, capsys, tmpdir, numtests=10, numops=5):

    numops -= 1                 # We use DSZ, so it's off by one

    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ;
            SMB mbu.MBZ   ;
            LI &01        ;
            SMB mbu.MBS   ;

            LIA data
            STORE R &340
            LI @{numtests}-1
            STORE R 1

    loop:   LOAD I R &340
            STORE R 2
            CLL
            dfp.PRINTH
            STORE R 4

            LI {numops}
            STORE R 3
    loop2:  LOAD R 4
            DEC
            STORE R 4
            dfp.PRINTH
            DSZ R 3
            JMP loop2

            CLL
            LI {numops}
            STORE R 3
    loop3:  LOAD R 4
            DEC
            STORE R 4
            dfp.PRINTH
            DSZ R 3
            JMP loop3
            ;SUCCESS

            DSZ R 1       ; outer loop
            JMP loop
            HALT

    data:
    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]

    dec = lambda a, b: (a - b) & 0xffff

    expected = ExpectedData([ SUCCESS ] )
    for x in data[:numtests]:
        source += "\n            .word &{:>04x}".format(x)
        expected += [
            [ 340, "PRINTH", "{:>04x}".format(x) ] ]
        expected += [ [ 340, "PRINTH", "{:>04x}".format(dec(x, i)) ] for i in range(1, 2 * numops + 3) ]
    expected += [ HALTED ]
    
    result = run_on_framework(framework, capsys, tmpdir, source, timeout=300000000)
    # pprint.pprint(list(result))
    # pprint.pprint(list(expected))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.DEC
@pytest.mark.slow
def test_DEC_long(framework, capsys, tmpdir):
    test_DEC(framework, capsys, tmpdir, numtests=200, numops=20)


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.IFL
def test_IFL(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"

    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 0
            STORE R &340

            LI 0
            ROR 1         ; Clear L without using UOP
            LI 0
            SCL           ; Make sure L is clear.
            HALT

            LI &3ff
            IFL CLA
            JSR output    ; 2

            IFL NOT
            JSR output    ; 6

            IFL NOT
            JSR output    ; 7

            IFL INC
            JSR output    ; 8

            IFL NEG
            JSR output    ; 9

            IFL NEG
            JSR output    ; 10

            IFL NOT
            JSR output    ; 11

            IFL DEC
            JSR output    ; 12

            ; Test 2, with L set.

            LI 1
            ROR 1         ; Set L without using UOP
            LI 0
            SSL           ; Make sure L is set
            HALT

            LI &3ff
            IFL CLA
            JSR output    ; 2

            IFL NOT
            JSR output    ; 6

            IFL NOT
            JSR output    ; 7

            IFL INC
            JSR output    ; 8

            IFL NEG
            JSR output    ; 9

            IFL NEG
            JSR output    ; 10

            IFL NOT
            JSR output    ; 11

            IFL DEC
            JSR output    ; 12


            HALT

    output: PHA 
            LOAD I R &340
            LOAD R &340
            dfp.PRINTD

            PPA
            dfp.PRINTH
            PHA
            SSL
            JMP no
            LI 1
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    no:     LI 0
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]
    
    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTD", "1", ],  [ 340, "PRINTH", "03ff" ], L0, # CLA
                              [ 340, "PRINTD", "2", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "3", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "4", ],  [ 340, "PRINTH", "03ff" ], L0, # INC
                              [ 340, "PRINTD", "5", ],  [ 340, "PRINTH", "03ff" ], L0, # NEG
                              [ 340, "PRINTD", "6", ],  [ 340, "PRINTH", "03ff" ], L0, # NEG
                              [ 340, "PRINTD", "7", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "8", ],  [ 340, "PRINTH", "03ff" ], L0, # DEC

                              [ 340, "PRINTD", "9", ],  [ 340, "PRINTH", "0000" ], L1, # CLA
                              [ 340, "PRINTD", "10", ], [ 340, "PRINTH", "ffff" ], L1, # NOT
                              [ 340, "PRINTD", "11", ], [ 340, "PRINTH", "0000" ], L1, # NOT
                              [ 340, "PRINTD", "12", ], [ 340, "PRINTH", "0001" ], L1, # INC
                              [ 340, "PRINTD", "13", ], [ 340, "PRINTH", "ffff" ], L1, # NEG
                              [ 340, "PRINTD", "14", ], [ 340, "PRINTH", "0001" ], L1, # NEG
                              [ 340, "PRINTD", "15", ], [ 340, "PRINTH", "fffe" ], L1, # NOT
                              [ 340, "PRINTD", "16", ], [ 340, "PRINTH", "fffd" ], L1, # DEC
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


@pytest.mark.verilog
@pytest.mark.emulator
@pytest.mark.hardware
@pytest.mark.LI
@pytest.mark.LOAD
@pytest.mark.STORE
@pytest.mark.LJMP
@pytest.mark.IFV
def test_IFV(framework, capsys, tmpdir):
    source = """
    .include "mbu.asm"
    .include "dev/dfp2.asm"


    &0:
            LI &80        ; Configure essential MBRs and enable.
            SCT
            SMB mbu.MBP
            LI &00        ; Configure essential MBRs and enable.
            SMB mbu.MBZ   ; MBZ=MBS makes reading the stack easier
            LI &01        ; Configure essential MBRs and enable.
            SMB mbu.MBS   ; MBZ=MBS makes reading the stack easier

            LI 0
            STORE R &340
            
            LI 0
            ADD large     ; 0 + &7fff = &7fff, positive. No overflow.
            SCV           ; Make sure V is clear.
            HALT

            LI &3ff
            IFV CLA
            JSR output    ; 2
            SCV           ; Make sure V was not modified.
            FAIL

            IFV NOT
            JSR output    ; 6
            SCV           ; Make sure V was not modified.
            FAIL

            IFV NOT
            JSR output    ; 7
            SCV           ; Make sure V was not modified.
            FAIL

            IFV INC
            JSR output    ; 8
            SCV           ; Make sure V was not modified.
            FAIL

            IFV NEG
            JSR output    ; 9
            SCV           ; Make sure V was not modified.
            FAIL

            IFV NEG
            JSR output    ; 10
            SCV           ; Make sure V was not modified.
            FAIL

            IFV NOT
            JSR output    ; 11
            SCV           ; Make sure V was not modified.
            FAIL

            IFV DEC
            JSR output    ; 12
            SCV           ; Make sure V was not modified.
            FAIL

            ; Test 2, with L set.

            LOAD large
            ADD large     ; &7fff + &7fff = &fffe, negative. Overflow.
            SSV           ; Make sure V is set
            FAIL

            LI &3ff
            IFV CLA
            JSR output    ; 2
            SSV           ; Make sure V was not modified
            FAIL

            IFV NOT
            JSR output    ; 6
            SSV           ; Make sure V was not modified
            FAIL

            IFV NOT
            JSR output    ; 7
            SSV           ; Make sure V was not modified
            FAIL

            IFV INC
            JSR output    ; 8
            SSV           ; Make sure V was not modified
            FAIL

            IFV NEG
            JSR output    ; 9
            SSV           ; Make sure V was not modified
            FAIL

            IFV NEG
            JSR output    ; 10
            SSV           ; Make sure V was not modified
            FAIL

            IFV NOT
            JSR output    ; 11
            SSV           ; Make sure V was not modified
            FAIL

            IFV DEC
            JSR output    ; 12
            SSV           ; Make sure V was not modified
            FAIL

            HALT

    large:  .data &7fff

    output: PHA 
            LOAD I R &340
            LOAD R &340
            dfp.PRINTD

            PPA
            dfp.PRINTH
            PHA
            SSL
            JMP no
            LI 1
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    no:     LI 0
            dfp.PRINTU   ; Use it to signify ‘yes’
            PPA
            RET

    """.format(**locals())

    L1, L0 = [ 340, "PRINTU", '1' ], [ 340, "PRINTU", '0' ]
    
    expected = ExpectedData([ SUCCESS,
                              [ 340, "PRINTD", "1", ],  [ 340, "PRINTH", "03ff" ], L0, # CLA
                              [ 340, "PRINTD", "2", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "3", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "4", ],  [ 340, "PRINTH", "03ff" ], L0, # INC
                              [ 340, "PRINTD", "5", ],  [ 340, "PRINTH", "03ff" ], L0, # NEG
                              [ 340, "PRINTD", "6", ],  [ 340, "PRINTH", "03ff" ], L0, # NEG
                              [ 340, "PRINTD", "7", ],  [ 340, "PRINTH", "03ff" ], L0, # NOT
                              [ 340, "PRINTD", "8", ],  [ 340, "PRINTH", "03ff" ], L0, # DEC

                              [ 340, "PRINTD", "9", ],  [ 340, "PRINTH", "0000" ], L0, # CLA
                              [ 340, "PRINTD", "10", ], [ 340, "PRINTH", "ffff" ], L0, # NOT
                              [ 340, "PRINTD", "11", ], [ 340, "PRINTH", "0000" ], L0, # NOT
                              [ 340, "PRINTD", "12", ], [ 340, "PRINTH", "0001" ], L0, # INC
                              [ 340, "PRINTD", "13", ], [ 340, "PRINTH", "ffff" ], L0, # NEG
                              [ 340, "PRINTD", "14", ], [ 340, "PRINTH", "0001" ], L0, # NEG
                              [ 340, "PRINTD", "15", ], [ 340, "PRINTH", "fffe" ], L0, # NOT
                              [ 340, "PRINTD", "16", ], [ 340, "PRINTH", "fffd" ], L0, # DEC
                              HALTED ])
    result = run_on_framework(framework, capsys, tmpdir, source)
    # pprint.pprint(list(result))
    # assert False
    result = list(expected.prepare(result))

    assert list(result) == expected


if __name__ == "__main__":
    print("Run this with pytest-3!")

# End of file.
