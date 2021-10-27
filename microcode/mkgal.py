#!/usr/bin/python3

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

        if (mem == "0" and ren == "0" and clk3 == "0") or \
           (io == "0" and ren == "0" and clk3 == "0") or \
           (ren == "0" and waiting == "0"):
            setr = "L"

        if (mem == "0" and wen == "0" and clk3 == "0") or \
           (io == "0" and wen == "0" and clk3 == "0") or \
           (wen == "0" and waiting == "0"):
            setw = "L"

        if reset == "0" or \
           clk3 == "0" and waiting == "1" and wen == "1" and ren == "1" or \
           clk3 == "0" and mem == "1" and io == "0":
            clrrw = "L"

        if reset == "1" and halt == "1":
            aben = "L"

        if (reset == "1") and (mem == "0" or io == "0" or waiting == "0"):
            dben = "L"

        if (ren == "0" and mem == "0") or (ren == "0" and io == "0"):
            dbdir = "L"

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
                    nrctx = "L"

                if waddr == 0b11011:
                    wmbn = "L"
                if waddr == 0b11100:
                    wmbp = "L"
                if waddr == 0b11101 or waddr == 0b11110:
                    wctx = "L"

                if clk4 == "0" and (waddr >= 0b00100 and waddr <= 0b00111):
                    war = "0"

                nc = "X"

                vector = "{} {} {} {} {} {} {} {} {} G ".format(
                    ra0, ra1, ra2, ra3, ra4, wa0, wa1, wa2, wa3)
                vector += "{} {} {} {} {} {} {} {} {} V".format(
                    wa4, clk4, wctx, rctx, wmbp, rmbp, rmbn, wmbn, war)
                addvec(vector)
    endentry()


    """
   assign #delay ibusen = ((war == 1'b0)) || 
			  ((wmbn == 1'b0)) || 
			  ((wmbp == 1'b0)) || 
			  ((rmbp == 1'b0) && (rmbn == 1'b0)) || 
			  ((rmbp == 1'b1) && (rmbn == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1));

   assign #delay oe = ((dis == 1'b0)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b0) && (wmbn == 1'b1)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0));

   assign #delay we = ((dis == 1'b0)) || 
		      ((war == 1'b0)) || 
		      ((rmbn == 1'b0)) || 
		      ((rmbp == 1'b0)) || 
		      ((wmbp == 1'b0) && (wmbn == 1'b0)) || 
		      ((rmbp == 1'b1) && (rmbn == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1));

   assign #delay a0 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir0 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr0 == 1'b1));

   assign #delay a1 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir1 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (addr1 == 1'b1));

   assign #delay a2 = ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b0) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b1) && (wmbp == 1'b1) && (wmbn == 1'b0) && (ir2 == 1'b1)) || 
		      ((dis == 1'b1) && (rmbp == 1'b1) && (rmbn == 1'b1) && (war == 1'b0) && (iden == 1'b0) && (wmbp == 1'b1) && (wmbn == 1'b1) && (ir2 == 1'b1));
"""

def mbuctl00():

    start_entry("ATF16V8B-cft:MBUCTL00", 20)
    for inputs in itertools.product("01", repeat=7):
        dis, rmbp, rmbn, war, idxen, wmbp, wmbn = inputs
        for ir in range(8):
            for waddr in range(4):

                nc = "X"
        
                # The default state is to be reading MB0.
                ra = 0
                ibusen, we, oe = "HHL"
        
                # Simplify test creation by decoding MBU operations
                if dis == "1" and rmbp == "0" and rmbn == "1" and war == "1" and wmbp == "1" and wmbn == "1":
                    mode = "read_mbp"
                elif dis == "1" and rmbp == "1" and rmbn == "0" and war == "1" and wmbp == "1" and wmbn == "1":
                    mode = "read_mbn"
                elif dis == "1" and rmbp == "1" and rmbn == "1" and war == "0" and wmbp == "1" and wmbn == "1":
                    mode = "write_ar"
                elif dis == "1" and rmbp == "1" and rmbn == "1" and war == "1" and wmbp == "0" and wmbn == "1":
                    mode = "write_mbp"
                elif dis == "1" and rmbp == "1" and rmbn == "1" and war == "1" and wmbp == "1" and wmbn == "0":
                    mode = "write_mbn"
                else:
                    mode = "?"
        
                # IBUS only enabled during register reads
                if mode in ("read_mbp", "read_mbn"):
                    ibusen = "L"
        
                # OE disabled during writes
                if dis == "0" or mode in ("write_mbp", "write_mbn"):
                    oe = "H"
        
                # WE enabled during writes
                if mode in ("write_mbp", "write_mbn"):
                    we = "L"
        
                # IR references MBR
                if mode in ("read_mbn", "write_mbn"):
                    ra = ir
                elif mode == "write_ar" and idxen == "0":
                    # write_ar_mbz. WADDR[1:0] selects register.
                    ra = waddr
                elif mode == "write_ar" and idxen == "1":
                    # write_ar_mbz with autoindexing enabled. IR selects register
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
                    import pprint
                    pprint.pprint(locals())
                    raise

                
    endentry()


curdec00()
cuwdec00()
ismctl00()
upcgte00()
busctl00()
mbudec00()
mbuctl00()


print(FOOTER)

# End of file.
