#!/usr/bin/python3

"""

To program:

( cd /home/alexios/PROJECTS/minipro/; 
sudo ./minipro -p ATF16V8B -P \
    --write /home/alexios/PROJECTS/HARDWARE/cft/microcode/build/dfp-decode.jed ; 
cd - )

To test:

export MINIPRO_HOME=/home/alexios/PROJECTS/minipro/
sudo $MINIPRO_HOME/minipro --infoic $MINIPRO_HOME/infoic.xml \
   --logicic build/tl866-cft-gal-vectors.xml \
   -T -p ATF16V8B-cft:MBUCTL00

"""


import itertools
import os
import re
import sys
import pprint


HEADER ="""<?xml version="1.0" encoding="utf-8"?>
<infoic>
  <database device="TL866II">
    <manufacturer name="Logic Ic">
"""

FOOTER = """    </manufacturer>
  </database>
</infoic>"""

print(HEADER)

_entry = {}
_name = None
_n = 0

def start_entry(name, pins, voltage="5V", **kwargs):
    global _entry
    global _name
    global _n
    _name = name
    _n = 0
    entry = dict(name=name, pins=pins, voltage=voltage)
    entry.update(kwargs)
    entry['vectors'] = []
    print('      <ic name="{name}" type="5" voltage="{voltage}" pins="{pins}">'.format(**entry))


def addvec(vector):
    global _n
    _n += 1
    print('        <vector id="{:>04d}"> {} </vector>'.format(_n, vector))


def endentry():
    print('      </ic>')


###############################################################################
#
# CTL: RADDR DECODER
#
###############################################################################

def curdec00():
    start_entry("ATF16V8B-cft:CURDEC00", 20)
    for t34 in "10":
        for raddr in range(32):
            for ir6_9 in range(16):
                ir9, ir8, ir7, ir6 = bin(ir6_9)[2:].zfill(4)
                ra4, ra3, ra2, ra1, ra0 = bin(raddr)[2:].zfill(5)

                rdr, rpc, flagoe, ragl, csoe, idxen, idx1, idx0 = "HHHHHHLL"

                if raddr == 0b01001:
                    rdr = "L"
                elif raddr == 0b01000:
                    rpc = "L"
                elif raddr == 0b11110:
                    flagoe = "L"
                elif t34 == "0" and raddr >= 0b00100 and raddr <= 0b00111:
                    csoe = "L"
                elif raddr == 0b01111:
                    ragl = "L"

                if (ir9 + ir8) == "11":
                    idxen = "L"
                if (ir9 + ir8 + ir6) == "111":
                    idx0 = "H"
                if (ir9 + ir8 + ir7) == "111":
                    idx1 = "H"
                    
                vector = "{} {} {} {} {} {} {} {} {} G ".format(
                    t34, ir6, ir7, ir8, ra4, ra3, ra1, ra2, ra0)
                vector += "{} {} {} {} {} {} {} {} {} V".format(
                    ir9, idxen, idx0, idx1, csoe, ragl, flagoe, rpc, rdr)
                addvec(vector)
    endentry()

###############################################################################
#
# CTL: WADDR DECODER
#
###############################################################################

def cuwdec00():
    start_entry("ATF16V8B-cft:CUWDEC00", 20)
    for clk4 in "10":
        for waddr in range(32):
            wa4, wa3, wa2, wa1, wa0 = bin(waddr)[2:].zfill(5)

            wir, wpc, wf, wdr = "HHHH"

            # We don't test the XOR functionality because it's not used on the CFTR.
            xora, xorb, xory = "ZZX"

            if clk4 == "0" and waddr == 0b01000:
                wpc = "L"
            elif clk4 == "0" and waddr == 0b01001:
                wdr = "L"
            elif clk4 == "0" and waddr == 0b01111:
                wir = "L"
            elif clk4 == "0" and (waddr == 0b11110 or waddr == 0b11111):
                wf = "L"

            nc = "X"

            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                wa4, wa3, wa2, wa1, wa0, nc, nc, nc, clk4)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, nc, xora, xorb, xory, wir, wpc, wf, wdr)
            addvec(vector)
    endentry()


###############################################################################
#
# CTL: ISM CONTROL
#
###############################################################################

def ismctl00():
    start_entry("ATF16V8B-cft:ISMCTL00", 20)
    for idxen, reset, clk4, fi, end in itertools.product("01", repeat=5):
        for action in range(16):
            act3, act2, act1, act0 = bin(action)[2:].zfill(4)

            sti, cli, inh, endcp, idx, incpc, incdr, decdr = "HHHHHHHH"

            if clk4 == "0" and action == 0b0011:
                sti = "L"
            if reset == "0" or (clk4 == "0" and action == 0b0100):
                cli = "L"
            if reset == "0" or fi == "0" or (clk4 == "0" and action == 0b0100):
                inh = "L"
            if clk4 == "0" and end == "0":
                endcp = "L"

            if clk4 == "0" and idxen == "0" and action == 0b0101:
                idx = "L"
            elif clk4 == "0" and action == 0b1000:
                incpc = "L"
            elif clk4 == "0" and action == 0b1010:
                incdr = "L"
            elif clk4 == "0" and action == 0b1011:
                decdr = "L"
                
            nc = "X"

            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                reset, clk4, fi, act0, act1, act2, act3, end, idxen)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, idx, incpc, incdr, decdr, endcp, sti, inh, cli)
            addvec(vector)
    endentry()


###############################################################################
#
# UPC DECODER
#
###############################################################################

def upcgte00():
    start_entry("ATF16V8B-cft:uPCGTE00", 20)
    reg = "ZZZZZZZZ"
    pe, cet, cep = "HHH"
    for oe in "01":
        for clk in "C1":
            for reset, end1, nc4, nc5, nc6, nc7, waiting, end2, halt in itertools.product("01", repeat=9):

                if clk == "C":  # When clock strobes, data is registered
                    pe, cet, cep = "HLL"
                    if (reset == "0") or \
                       (end1 == "0" and waiting == "1") or \
                       (end2 == "0" and waiting == "1"):
                        pe = "L"
                    if reset == "1" and halt == "1" and waiting == "1":
                        cet = "H"
                        cep = "H"
                else:
                    # The last clock pulse left all outputs high.
                    pe, cet, cep = "HHH"

                if oe != "0":
                    pe, cet, cep, hiz = "ZZZZ"
                else:
                    hiz = "H"   # Pulled up
                    
                #qpe, qcep, qcet = "ZZZ"  # Output is at high impedance
                #if oe == "0":
                #    qpe, qcep, qcet = pe, cep, cet
                qpe, qcep, qcet = pe, cep, cet
                
                vector = "{} {} {} {} {} {} {} {} {} G ".format(
                    clk, reset, end1, nc4, nc5, nc6, nc7, waiting, end2)
                vector += "{} {} {} {} {} {} {} {} {} V".format(
                    oe, halt, qpe, qcep, qcet, hiz, hiz, hiz, hiz)
                addvec(vector)
    endentry()


###############################################################################
#
# BUS CONTROL
#
###############################################################################

def busctl00():
    start_entry("ATF16V8B-cft:BUSCTL00", 20)
    for reset, clk3, t34, halt, waiting, wen, ren, mem, io, ws in itertools.product("01", repeat=10):
        dben, aben, dbdir, setw, clrrw, setws, setr, clrws = "HHHHHHHH"

        mode = {
            "01 01": "mem_read",
            "10 01": "mem_write",
            "01 10": "io_read",
            "10 10": "io_write"
        }.get(ren + wen + " " + mem + io, "-")

        if mode in ("mem_read", "io_read") and (clk3 == "0" or waiting == "0"):
            setr = "L"

        if mode in ("mem_write", "io_write") and (clk3 == "0" or waiting == "0"):
            setw = "L"

        if reset == "0" or \
           (mem == "0" and io == "0") or \
           (ren == "0" and wen == "0") or \
           (mem == "1" and io == "1") or \
           (ren == "1" and wen == "1"):
            clrrw = "L"

        if reset == "1" and halt == "1":
            aben = "L"

        # Note: the /WAITING term is really a don't-care value.
        if reset == "1" and mode in ("mem_read", "mem_write", "io_read", "io_write"):
            dben = "L"

        if mode in ("mem_read", "io_read"):
            dbdir = "L"

        # Sanity interlocks (note: the Address bus still always drives)
        if (mode == "-"):
            setr = "H"
            setw = "H"
            clrrw = "L"
            dben, dbdir = "HH" # Both A & B ports of DB driver '248 tri-stated
            

        if ws == "0":
            setws = "L"

        if reset == "0":
            clrws = "L"

        nc = "X"

        vector = "{} {} {} {} {} {} {} {} {} G ".format(
            reset, clk3, t34, halt, waiting, wen, ren, mem, io)
        vector += "{} {} {} {} {} {} {} {} {} V".format(
            ws, dben, aben, dbdir, setw, clrrw, setws, setr, clrws)
        addvec(vector)
    endentry()


###############################################################################
#
# MEMORY BANKING UNIT
#
###############################################################################

def mbudec00():
    start_entry("ATF16V8B-cft:MBUDEC00", 20)
    for raddr in range(32):
        ra4, ra3, ra2, ra1, ra0 = bin(raddr)[2:].zfill(5)
        for waddr in range(32):
            wa4, wa3, wa2, wa1, wa0 = bin(waddr)[2:].zfill(5)
            for clk4 in "01":
                wctx, rctx, wmbp, rmbp, rmbn, wmbn, war = "HHHHHHH"

                if raddr == 0b11011:
                    rmbn = "L"
                if raddr == 0b11100:
                    rmbp = "L"
                if raddr == 0b11101 or raddr == 0b11110:
                    rctx = "L"

                if clk4 == "0" and waddr == 0b11011:
                    wmbn = "L"
                if clk4 == "0" and waddr == 0b11100:
                    wmbp = "L"
                if clk4 == "0" and (waddr == 0b11101 or waddr == 0b11110):
                    wctx = "L"

                if clk4 == "0" and (waddr >= 0b00100 and waddr <= 0b00111):
                    war = "L"

                nc = "X"

                vector = "{} {} {} {} {} {} {} {} {} G ".format(
                    ra0, ra1, ra2, ra3, ra4, wa0, wa1, wa2, wa3)
                vector += "{} {} {} {} {} {} {} {} {} V".format(
                    wa4, clk4, wctx, rctx, wmbp, rmbp, rmbn, wmbn, war)
                addvec(vector)
    endentry()


def mbuctl00():

    start_entry("ATF16V8B-cft:MBUCTL00", 20)
    for inputs in itertools.product("01", repeat=7):
        dis, rmbp, rmbn, war, idxen, wmbp, wmbn = inputs
        for ir in range(8):
            for waddr in range(4):

                nc = "X"
        
                # The default state is to be reading MB0.
                ra = 0
                ibusen, we, oe = "HHH" # Idle by default

                # WAR=1  WMBN=1  RMBN=1  RMBP=1  DIS=1  WMBP=1  IDXEN=0  ADDR0=0  ADDR1=0
                
                mode = {
                    "0 1 1 1 1": "read_mbp",
                    "1 0 1 1 1": "read_mbn",
                    "1 1 0 1 1": "write_ar",
                    "1 1 1 0 1": "write_mbp",
                    "1 1 1 1 0": "write_mbn",
                    "1 1 1 1 1": "idle",
                }.get(" ".join([rmbp, rmbn, war, wmbp, wmbn]), "-")
        
                # RMBP=0 RMBN=1 WAR=1 WMBP=1 WMBN=1   DIS=0   IDXEN=0 ADDR=00

                # MBU disabled: always reading MBP, but really it's the
                # hardware memory map (pull-down resistors).
                if dis == "0" and mode in ("read_mbp", "read_mbn"):
                    ibusen = "L"  # Enable the IBUS
                    oe = "H"      # But disable the register file
                    we = "H"
                    ra = 0

                # MBU enabled and idle: output MBP.
                if dis == "1" and mode == "idle":
                    ibusen = "H"
                    oe = "H"
                    we = "H"
                    ra = 0
                    
                # MBU enabled: MBP reads
                if dis == "1" and mode == "read_mbp":
                    ibusen = "L"  # We're putting values on the IBUS
                    oe = "L"      # Enable reads from the register file
                    we = "H"      # Disable writes
                    ra = 0

                # MBU enabled: MBn reads (the register number is in the IR)
                if dis == "1" and mode == "read_mbn":
                    ibusen = "L"  # We're putting values on the IBUS
                    oe = "L"      # Enable reads from the register file
                    we = "H"      # Disable writes
                    ra = ir

                # MBU enabled: write_ar_xx signals (reading from MB0-3, address
                # in low order two bits of waddr).
                if dis == "1" and mode == "write_ar":
                    if idxen == "1":
                        # Not using an autoindex location. (address in low order
                        # bits of waddr)
                        ibusen = "H"  # This isn't an IBUS read
                        oe = "L"      # Enable reads from the register file
                        we = "H"      # Disable writes
                        ra = waddr & 3
                    else:
                        # Using an autoindex location. (address in IR)
                        ibusen = "H"  # This isn't an IBUS read
                        oe = "L"      # Enable reads from the register file
                        we = "H"      # Disable writes
                        ra = ir
                        
                # MBU enabled: MBP writes
                if dis == "1" and mode == "write_mbp":
                    we = "L"      # Enable writes
                    oe = "H"      # Disable register file reads
                    ibusen = "H"  # Disable read drivers
                    ra = 0

                # MBU enabled: MBn writes (register in IR)
                if dis == "1" and mode == "write_mbn":
                    we = "L"      # Enable writes
                    oe = "H"      # Disable register file reads
                    ibusen = "H"  # Disable read drivers
                    ra = ir

                waddr1, waddr0 = bin(waddr)[2:].zfill(2)
                ir2, ir1, ir0 = bin(ir)[2:].zfill(3)
                a2, a1, a0 = bin(ra)[2:].zfill(3).replace("0", "L").replace("1", "H")

                vector = "{} {} {} {} {} {} {} {} {} G ".format(
                    war, wmbn, rmbn, rmbp, dis, wmbp, idxen, waddr0, waddr1)
                vector += "{} {} {} {} {} {} {} {} {} V".format(
                    ir0, ir1, ir2, ibusen, a0, a1, a2, we, oe)
                addvec(vector)

                # Sanity checks
                try:
                    assert not (ibusen == "L"  and we == "L")
                    assert not (oe == "L"  and we == "L")
                except:
                    print("Sanity check failed")
                    import pprint
                    pprint.pprint(locals())
                    raise

                
    endentry()


###############################################################################
#
# DFP: ADDRESS DECODER & DATA BUS ENABLE
#
###############################################################################

def dfpdec00():
    start_entry("ATF16V8B-cft:DFPDEC00", 20)
    for a5, a6, a7, iodev1, dbreq, r, fpa6, fpa5, fpa4, fpa3 in itertools.product("01", repeat=10):

        dfpsel, dboe = 'H', 'H'
        
        # Test DFP bus address (&100-&11f), 32 addresses. iodev1 means addresses &1xx.
        if iodev1 == "0" and a7 == "0" and a6 == "0" and a5 == "0":
            dfpsel = "L"
            # Also enable the Data Bus driver if we're being read from.
            if r == "0":
                dboe = "L"

        # Enable the data bus if DBREQ is low
        if dbreq == "0":
            dboe = "L"

        # Also decode FPA addresses.
        en0, en1 = 'H', 'H'
        if fpa6 == '1' and fpa5 == '0' and fpa4 == '0' and fpa3 == '0':
            en0 = 'L'
        if fpa6 == '1' and fpa5 == '0' and fpa4 == '0' and fpa3 == '1':
            en1 = 'L'


        nc = 'X'
                    
        vector = "{} {} {} {} {} {} {} {} {} G ".format(
            a5, a6, a7, iodev1, dbreq, r, fpa6, fpa5, fpa4)
        vector += "{} {} {} {} {} {} {} {} {} V".format(
            nc, fpa3, dboe, nc, nc, en1, en0, nc, dfpsel)
        addvec(vector)
    endentry()


###############################################################################
#
# DFP: FOUR DFP I/O ADDRESS DECODERS (FOR PODS AND ONBOARD DEVICES)
#
###############################################################################

def dfpioa00():
    start_entry("ATF16V8B-cft:DFPIOA00", 20)
    for en0, en1, wr, rd, autoscan in itertools.product("01", repeat=5):
        for fpa in range(8):
            fpa2, fpa1, fpa0 = bin(fpa)[2:].zfill(3)

            write_0 = en0 == "0" and en1 == "1" and wr == "0" and rd == "1"
            wab0 = "HL"[write_0 and fpa == 0]
            wab1 = "HL"[write_0 and fpa == 1]
            wab2 = "HL"[write_0 and fpa == 2]
            wdb0 = "HL"[write_0 and fpa == 3]
            wdb1 = "HL"[write_0 and fpa == 4]
            wib0 = "HL"[write_0 and fpa == 5]
            wib1 = "HL"[write_0 and fpa == 6]
            # Address 7 not decoded

            # Panel light enables. This implements a safety interlock.
            
            rowen = "L"
            # Enable front panel light driver when bus writes are on and
            # autoscan is inactive. (the light row decoder further decodes
            # FPA[7:6] using a '138).
            if wr == "0" and rd == "1" and autoscan == "1":
                rowen = "H"

            # Also enable the front panel when the MCU is idle and autoscan is
            # active.
            if wr == "1" and rd == "1" and autoscan == "0":
                rowen = "H"

            nc = 'X'
            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                fpa0, fpa1, autoscan, fpa2, en0, en1, nc, wr, rd)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, wdb1, wib1, wdb0, wab2, wib0, wab1, wab0, rowen)
            addvec(vector)
            print(write_0, fpa, wib0, vector, file=sys.stderr)
    endentry()


def dfpiob00():
    start_entry("ATF16V8B-cft:DFPIOB00", 20)
    for en0, en1, wr, rd in itertools.product("01", repeat=4):
        for fpa in range(8):
            fpa2, fpa1, fpa0 = bin(fpa)[2:].zfill(3)

            write_1 = en0 == "1" and en1 == "0" and wr == "0" and rd == "1"
            read_1  = en0 == "1" and en1 == "0" and wr == "1" and rd == "0"

            wor0 = "HL"[write_1 and fpa == 0] # &48
            wor1 = "HL"[write_1 and fpa == 1] # &49
            w4a  = "HL"[write_1 and fpa == 2] # &4a
            w4b  = "HL"[write_1 and fpa == 3] # &4b

            wcv0 = "HL"[write_1 and fpa == 5] # &4d
            wcv1 = "HL"[write_1 and fpa == 6] # &4e
            wcv2 = "HL"[write_1 and fpa == 7] # &4f

            rdsr0 = "HL"[read_1 and fpa == 0] # read from &48
            
            nc = 'X'
            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                fpa0, fpa1, fpa2, en0, en1, nc, nc, wr, rd)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, wcv2, wcv1, wcv0, rdsr0, w4b, w4a, wor1, wor0)
            addvec(vector)
    endentry()


def dfpioc00():
    start_entry("ATF16V8B-cft:DFPIOC00", 20)
    for en0, en1, wr, rd in itertools.product("01", repeat=4):
        for fpa in range(8):
            fpa2, fpa1, fpa0 = bin(fpa)[2:].zfill(3)

            read_0  = en0 == "0" and en1 == "1" and wr == "1" and rd == "0"

            rab0 = "HL"[read_0 and fpa == 0]
            rab1 = "HL"[read_0 and fpa == 1]
            rab2 = "HL"[read_0 and fpa == 2]
            rdb0 = "HL"[read_0 and fpa == 3]
            rdb1 = "HL"[read_0 and fpa == 4]
            rib0 = "HL"[read_0 and fpa == 5]
            rib1 = "HL"[read_0 and fpa == 6]
            r47  = "HL"[read_0 and fpa == 7] 
            
            nc = 'X'
            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                fpa0, fpa1, fpa2, en0, en1, nc, nc, wr, rd)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, r47, rib1, rib0, rdb1, rab2, rab1, rab0, rdb0)
            addvec(vector)
    endentry()


def dfpiod00():
    start_entry("ATF16V8B-cft:DFPIOD00", 20)
    for en0, en1, wr, rd in itertools.product("01", repeat=4):
        for fpa in range(8):
            fpa2, fpa1, fpa0 = bin(fpa)[2:].zfill(3)

            write_1 = en0 == "1" and en1 == "0" and wr == "0" and rd == "1"
            read_1  = en0 == "1" and en1 == "0" and wr == "1" and rd == "0"

            # rdsr0 is in dfp-io-b.
            rdsr1 = "HL"[read_1 and fpa == 1] # &49
            rdsr2 = "HL"[read_1 and fpa == 2] # &4a
            r4b   = "HL"[read_1 and fpa == 3] # &4b
            r4c   = "HL"[read_1 and fpa == 4] # &4c
            rcv0  = "HL"[read_1 and fpa == 5] # &4d
            rcv1  = "HL"[read_1 and fpa == 6] # &4e
            rcv2  = "HL"[read_1 and fpa == 7] # &4f

            w4c = "HL"[write_1 and fpa == 4] # write to &4c
            
            nc = 'X'
            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                fpa0, fpa1, fpa2, en0, en1, nc, nc, wr, rd)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                nc, rcv1, w4c, rcv0, rcv2, r4c, r4b, rdsr2, rdsr1)
            addvec(vector)
    endentry()


def dfpoe(unit):
    start_entry("ATF16V8B-cft:DFPOE{}00".format(unit), 20)
    for panelen, mfd2, mfd1, mfd0 in itertools.product("01", repeat=4):
        for fpa in range(64):
            fpa5, fpa4, fpa3, fpa2, fpa1, fpa0 = bin(fpa)[2:].zfill(6)

            p = panelen == "0"

            if unit == "A":
                pin12 = "HL"[fpa == 0b0000_00 and p and mfd2 == "0"]                   # 1A: µCV2
                pin13 = "HL"[fpa == 0b0011_10 and p]                                   # 4C: AC lo
                pin14 = "HL"[fpa == 0b0100_10 and p and mfd1 == "1" and mfd0 == "0"]   # 5C: SP lo
                pin15 = "HL"[fpa == 0b0000_01 and p and mfd2 == "0"]                   # 1B: µCV1
                
                pin16 = "HL"[fpa == 0b0000_10 and p]                                   # 1C: µCV0
                pin17 = "HL"[fpa == 0b0001_11 and p]                                   # 2D: UAV lo (µA)
                pin18 = "HL"[fpa == 0b0001_10 and p]                                   # 2C: IR lo
                pin19 = "HL"[fpa == 0b0010_00 and p]                                   # 3A: CTX

            elif unit == "B":
                pin12 = "HL"[fpa == 0b0101_00 and p]                                   # SCANCLR
                pin13 = "HL"[fpa == 0b0011_01 and p]                                   # 4B: AC hi
                pin14 = "HL"[fpa == 0b0100_01 and p and mfd1 == "1" and mfd0 == "0"]   # 5B: SP hi
                pin15 = "HL"[fpa == 0b0010_01 and p]                                   # 3B: PC hi
                
                pin16 = "HL"[fpa == 0b0010_10 and p]                                   # 3C: PC lo
                pin17 = "HL"[fpa == 0b0101_11 and p]                                   # --: AEXT
                pin18 = "HL"[fpa == 0b0011_00 and p]                                   # 4A: FLAGS
                pin19 = "HL"[fpa == 0b0001_01 and p and mfd2 == "0"]                   # 2B: IR hi

            elif unit == "C":
                pin12 = "X"
                pin13 = "X"
                pin14 = "X"
                pin15 = "X"
                
                pin16 = "HL"[fpa == 0b0010_11 and p]                                   # 3D: IRF?
                pin17 = "HL"[fpa == 0b0000_11 and p]                                   # 1D: IEN
                pin18 = "HL"[fpa == 0b0100_01 and p and mfd1 == "0" and mfd0 == "1"]   # 5B: DR hi
                pin19 = "HL"[fpa == 0b0100_10 and p and mfd1 == "0" and mfd0 == "1"]   # 5C: DR lo

            elif unit == "D":
                pin12 = "HL"[fpa == 0b0001_00 and p]                                   # 2A: STATE
                pin13 = "HL"[fpa == 0b0100_01 and p and mfd1 == "1" and mfd0 == "1"]   # 5B: OR hi
                pin14 = "HL"[fpa == 0b0100_10 and p and mfd1 == "1" and mfd0 == "1"]   # 5C: OR lo
                pin15 = "HL"[fpa == 0b0001_01 and p and mfd2 == "1"]                   # 2B: DB hi
                
                pin16 = "HL"[fpa == 0b0000_00 and p and mfd2 == "1"]                   # 1A: AB hi
                pin17 = "HL"[fpa == 0b0000_01 and p and mfd2 == "1"]                   # 1B: AB mid
                pin18 = "HL"[fpa == 0b0000_10 and p]                                   # 1C: AB lo
                pin19 = "HL"[fpa == 0b0001_10 and p]                                   # 2C: DB lo

            else:
                assert False, "Unknown unit {}".format(unit)
                
            nc = 'X'
            vector = "{} {} {} {} {} {} {} {} {} G ".format(
                fpa0, fpa1, fpa2, fpa3, fpa4, fpa5, mfd0, mfd1, mfd2)
            vector += "{} {} {} {} {} {} {} {} {} V".format(
                panelen, pin12, pin13, pin14, pin15, pin16, pin17, pin18, pin19)
            addvec(vector)
    endentry()


###############################################################################
#
# MAIN PROGRAM
#
###############################################################################


# Processor Board 0
curdec00()
cuwdec00()
ismctl00()
upcgte00()
busctl00()
mbudec00()
mbuctl00()

# Processor Board 1

# DFP
dfpdec00()
dfpioa00()
dfpiob00()
dfpioc00()
dfpiod00()
dfpoe("A")
dfpoe("B")
dfpoe("C")
dfpoe("D")


print(FOOTER)

# End of file.
