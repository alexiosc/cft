///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// FUNCTION: the Memory Bank Register File.
//
// NOTES:
//
// 8 8-bit registers responsible for extending addresses from 16 bits
// to 24.
//
// WADDR   REG   
// 00100   00   MB0   Program Bank
// 00101   01   MB1   Data Bank
// 00110   10   MB2   Stack Bank
// 00111   11   MB3   Page 0 Bank (conditionally overridden by address)
//
//                        ______
// WADDR I R IR           SYSDEV  IBUS      SEL  Notes
// ---vv-------------------------------------vv--------------------
// 00100 X X XX XXXX XXXX    X    XXXXXXXX  000   MB0 (program bank)
// 00101 X X XX XXXX XXXX    X    XXXXXXXX  001   MB1 (data bank)
// 00110 X X XX XXXX XXXX    X    XXXXXXXX  010   MB2 (stack bank)
// ---vv-------------------------------------vv--------------------
// 00111 0 0 XX XXXX XXXX    X    XXXXXXXX  011   MB3 (P0 bank)
// 00111 0 1 XX XXXX XXXX    X    XXXXXXXX  011   MB3 
// 00111 1 0 XX XXXX XXXX    X    XXXXXXXX  011   MB3 
// 00111 1 1 0X XXXX XXXX    X    XXXXXXXX  011   MB3 
// 00111 1 1 10 XXXX XXXX    X    XXXXXXXX  011   MB3 
// -------------------vvv-------------------vvv--------------------
// 00111 1 1 11 XXXX X000    X    XXXXXXXX  000   MB0 P0 index regs
// 00111 1 1 11 XXXX X001    X    XXXXXXXX  001   MB1 
// 00111 1 1 11 XXXX X010    X    XXXXXXXX  010   MB2 
// 00111 1 1 11 XXXX X011    X    XXXXXXXX  011   MB3 
// 00111 1 1 11 XXXX X100    X    XXXXXXXX  100   MB4 
// 00111 1 1 11 XXXX X101    X    XXXXXXXX  101   MB5 
// 00111 1 1 11 XXXX X110    X    XXXXXXXX  110   MB6 
// 00111 1 1 11 XXXX X111    X    XXXXXXXX  111   MB7 
// ------------------------------------vvv--vvv----------------------
// XXXXX X X XX XXXX XXXX    0    00000000  000   MB0 IN/OUT register
// XXXXX X X XX XXXX XXXX    0    00000001  001   MB1 
// XXXXX X X XX XXXX XXXX    0    00000010  010   MB2 
// XXXXX X X XX XXXX XXXX    0    00000011  011   MB3 
// XXXXX X X XX XXXX XXXX    0    00000100  100   MB4 
// XXXXX X X XX XXXX XXXX    0    00000101  101   MB5 
// XXXXX X X XX XXXX XXXX    0    00000110  110   MB6 
// XXXXX X X XX XXXX XXXX    0    00000111  111   MB7
// -----------------------------------------------------------------
//
// WADDR I R IR           SYSDEV  IBUS      USE-WADDR   USE-IR
// ----------------------------------------------------------------
// 00100 X X XX XXXX XXXX    X    XXXXXXXX      1
// 00101 X X XX XXXX XXXX    X    XXXXXXXX      1
// 00110 X X XX XXXX XXXX    X    XXXXXXXX      1
// 00111 0 0 XX XXXX XXXX    X    XXXXXXXX      1
// 00111 0 1 XX XXXX XXXX    X    XXXXXXXX      1
// 00111 1 0 XX XXXX XXXX    X    XXXXXXXX      1
// 00111 1 1 0X XXXX XXXX    X    XXXXXXXX      1
// 00111 1 1 10 XXXX XXXX    X    XXXXXXXX      1
// 
// 00111 1 1 11 XXXX X000    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X001    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X010    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X011    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X100    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X101    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X110    X    XXXXXXXX                1
// 00111 1 1 11 XXXX X111    X    XXXXXXXX                1
// 
// XXXXX X X XX XXXX XXXX    0    00000000                1
// XXXXX X X XX XXXX XXXX    0    00000001                1
// XXXXX X X XX XXXX XXXX    0    00000010                1
// XXXXX X X XX XXXX XXXX    0    00000011                1
// XXXXX X X XX XXXX XXXX    0    00000100                1
// XXXXX X X XX XXXX XXXX    0    00000101                1
// XXXXX X X XX XXXX XXXX    0    00000110                1
// XXXXX X X XX XXXX XXXX    0    00000111                1
// -----------------------------------------------------------------
//
// if waddr == 0010X:
//     sel = {1'b0, waddr[1:0]}
// elif waddr = 00110:
//     sel = {1'b0, waddr[1:0]}
// elif waddr = 00111 and ir[11:8] = {1,1,11}:
//     sel = {1'b0, waddr[1:0]}
// else:
//     sel = ir[2:0]
//
// .i 8
// .o 1
// .ilb waddr4 waddr3 waddr2 waddr1 waddr0 I R iosel
// .ob use_waddr
// .p 4
// 001---01 1
// 0010---1 1
// 001-0--1 1
// 001--0-1 1
// .e
//
// waddr[4:2] == 001 && (waddr1 == 0 || waddr0 == 0 || ir11 == 0 || ir10 == 0) && iosel == 1
// waddr[4:2] == 001 && iosel == 1 && (waddr1 == 0 || waddr0 == 0 || ir11 == 0 || ir10 == 0) && iosel == 1
//
// WADDR I R IR            USE-WADDR   USE-IR    USE-ZERO    OUTPUT TO IBUS
// ------------------------------------------------------------------------
// 00100 X X XX XXXX XXXX      1
// 00101 X X XX XXXX XXXX      1
// 00110 X X XX XXXX XXXX      1
// 00111 0 0 XX XXXX XXXX      1
// 00111 0 1 XX XXXX XXXX      1
// 00111 1 0 XX XXXX XXXX      1
// 00111 1 1 0X XXXX XXXX      1
// 00111 1 1 10 XXXX XXXX      1
// 
// 00111 1 1 11 XXXX X000                1
// 00111 1 1 11 XXXX X001                1
// 00111 1 1 11 XXXX X010                1
// 00111 1 1 11 XXXX X011                1
// 00111 1 1 11 XXXX X100                1
// 00111 1 1 11 XXXX X101                1
// 00111 1 1 11 XXXX X110                1
// 00111 1 1 11 XXXX X111                1
// 
// 01111 X X XX XXXX XXXX                1          X              1
// 0110X X X XX XXXX XXXX                           1              1
// ------------------------------------------------------------------------
// 
// .i 14
// .o 4
// .ilb raddr4 raddr3 raddr2 raddr1 raddr0 waddr4 wadd4 waddr2 waddr1 waddr0 ir11 ir10 ir9 ir8
// .ob nmb0 nuse_ir nw nr
// .p 11
// -----001---0-- 0100
// -----0010----- 0100
// -----0-111---- 1001
// -----0-10----- 0001
// -----001-0---- 0101
// -----001--0--- 0100
// 01111--------- 1010
// -----001-----0 0100
// 0110---------- 0010
// -----001----0- 0100
// -----001------ 1010
// .e
//
//
// ----- 0010- ---- 0 1 0 0
// ----- 0-111 ---- 1 0 0 1
// ----- 0-10- ---- 0 0 0 1
// ----- 001-0 ---- 0 1 0 1
// ----- 001-- 0--- 0 1 0 0
// ----- 001-- -0-- 0 1 0 0
// ----- 001-- --0- 0 1 0 0
// ----- 001-- ---0 0 1 0 0
// ----- 001-- ---- 1 0 1 0
// 01111 ----- ---- 1 0 1 0
// 0110- ----- ---- 0 0 1 0

// ----- 0010- ---- 0 0 0 1 => 0 0----- -> WADDR
// ----- 001-0 ---- 0 1 0 1 => 0 -0---- -> WADDR
// ----- 001-- 0--- 0 1 0 0 => 0 --0--- -> WADDR
// ----- 001-- -0-- 0 1 0 0 => 0 ---0-- -> WADDR
// ----- 001-- --0- 0 1 0 0 => 0 ----0- -> WADDR
// ----- 001-- ---0 0 1 0 0 => 0 -----0 -> WADDR

//  ___________       ___   ___   ___   ___   ____   ____
// (write_ar_mb) AND (WA0 + WA1 + IR8 + IR9 + IR10 + IR11) ⇒ derive sel from waddr
// → Otherwise, use IR
//
// Use negative logic, so use_waddr = 0.
//
//
// WADDR I R IR            USE-WADDR   USE-IR    USE-ZERO    OUTPUT TO IBUS
// ------------------------------------------------------------------------
// 00100 X X XX XXXX XXXX      1
// 00101 X X XX XXXX XXXX      1
// 00110 X X XX XXXX XXXX      1
// 00111 0 0 XX XXXX XXXX      1
// 00111 0 1 XX XXXX XXXX      1
// 00111 1 0 XX XXXX XXXX      1
// 00111 1 1 0X XXXX XXXX      1
// 00111 1 1 10 XXXX XXXX      1
// 
// 00111 1 1 11 XXXX X000                1
// 00111 1 1 11 XXXX X001                1
// 00111 1 1 11 XXXX X010                1
// 00111 1 1 11 XXXX X011                1
// 00111 1 1 11 XXXX X100                1
// 00111 1 1 11 XXXX X101                1
// 00111 1 1 11 XXXX X110                1
// 00111 1 1 11 XXXX X111                1
// 
// 01111 X X XX XXXX XXXX                1          X              1
// 0110X X X XX XXXX XXXX                           1              1
// ------------------------------------------------------------------------
//
///////////////////////////////////////////////////////////////////////////////


`ifndef reg_mbr_v
`define reg_mbr_v

`include "comparator.v"
`include "demux.v"
`include "mux.v"
`include "regfile.v"
`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The Memory Bank Register File

module reg_mbr (nreset, waddr, raddr, ir,
		ibus, aext, nfpram_fprom, nfpaext, fpo);
   input        nreset;
   input [4:0] 	waddr;
   input [4:0] 	raddr;
   input [11:0] ir;
   input 	nfpaext;
   input 	nfpram_fprom;
   
   inout [7:0] 	ibus;
   
   output [7:0] aext;
   output [7:0] fpo;

   wire 	nreset;
   wire [4:0] 	waddr;
   wire [4:0] 	raddr;
   wire [7:0] 	ibus;
   wire [2:0] 	sel;
   tri0 [7:0] 	aext;

   wire 	nsel;
   wire [7:0] 	yaddr, ywrite, yread;
   wire 	nwrite_ar_mbx, nwrite_mbp, nwrite_mbp_flags, nwrite_mbn, nwmb0, nwmbr;
   wire 	nread_ar_mbx, nread_mbp, nread_mbp_flags, nread_mbn, nrmb0, nrmbr;
   wire 	and1, and2, nwaddr_or_ir, mb0;
   wire 	nbankr0, nbankr1, nbankw0, nbankw1;
   
   // The addressing mode decoder
   demux_138      addrdemux (.g1(waddr[2]), .g2a(waddr[3]), .g2b(waddr[4]), .a(3'b111), .y(yaddr));
   assign nwrite_ar_mbx = yaddr[7];

   // The register write decoder
   demux_138      writedemux (.g1(waddr[3]), .g2a(waddr[4]), .g2b(1'b0), .a(waddr[2:0]), .y(ywrite));
   assign nwrite_mbp = ywrite[4];
   assign nwrite_mbp_flags = ywrite[5];
   assign nwrite_mbn = ywrite[7];

   // The register read decoder
   demux_138      readdemux (.g1(raddr[3]), .g2a(raddr[4]), .g2b(1'b0), .a(raddr[2:0]), .y(yread));
   assign nread_mbp = yread[4];
   assign nread_mbp_flags = yread[5];
   assign nread_mbn = yread[7];

   // Derive enable signals from read/write decoders
   assign #6 nwmb0 = nwrite_mbp & nwrite_mbp_flags;
   assign #6 nwmbr = nwmb0 & nwrite_mbn;

   assign #6 nrmb0 = nread_mbp & nread_mbp_flags;
   assign #6 nrmbr = nrmb0 & nread_mbn;

   assign #6 mb0 = ~(nwmb0 & nrmb0);

   // Initialisation circuitry. This provides a default mapping for early boot,
   // before the MBRx registers are configured.

   // Asserting nreset asynchronously sets a '74 flip flop. The non-inverted
   // output of the is connected to the gate of the '139 read decoder. When the
   // FF sets, the Q output goes high, the '139 is disabled, and the outputs of
   // all four '670 registers are tri-stated. All 8 AEXT lines are pulled low
   // so AEXT resets to 0. This represents the first RAM bank.
   //
   // If the front panel RAM/ROM switch is set to RAM (low), we need to map to
   // ROM instead. To do this, the *inverted* output from the reset FF above
   // drives the gate of a single '125 buffer, whose input is the FPRAM#/FPROM
   // signal. This then drives AEXT₇. When FPROM is selected (1), AEXT becomes
   // 128 decimal, which should map to the first ROM bank.
   //
   // Finally: when BANKW0# signal is asserted (during the execution of an SMB
   // instruction), the reset FF clears. The '139 gate goes low, enabling the
   // '670 chip select lines, which then start driving AEXT. The inverted line
   // goes high, and the '125 is tri-stated. This read too complex, but is in
   // fact quite simple:

   wire 	n139g, n125g;
   flipflop_74h resetff (.d(1'b1), .clk(1'b1), .set(nreset), .rst(nbankw0),
			 .q(n139g), .qn(n125g));
   buffer_125q ramrombuf (.a(nfpram_fprom), .oe(n125g), .y(aext[7]));
   

   // Decode addressing modes. Decide if the register to use will be derived
   // from (zero padded) WADDR[1:0] or IR[2:0]. Usually, it's IR[0:0]. WADDR is
   // use if WADDR is 001XX (write-ar-mbp, write-ar-mbs, write-ar-mbd or
   // write-ar-mbz). One exception: if write-ar-mbz is selected (WADDR=00111)
   // and I=1 and R=1 and OP=11xxxxxxxx (i.e. IR[11:8]=1111), the register is
   // derived from IR[2:0].

   // The timings are VERY pessimistic. Typical 74LVC1g propagation delay will
   // be in the order of 1.5ns.
   assign #6 and1 = waddr[0] & waddr[1] & ir[8];
   assign #6 and2 = ir[9] & ir[10] & ir[11];
   assign #6 nwaddr_or_ir = (and1 & and2) | nwrite_ar_mbx;

   // The multiplexer chooses the MBn address.
   wire [3:0] 	sel4;
   mux_157 selmux (.sel(nwaddr_or_ir), .oe(mb0), .i1({2'b00, waddr[1:0]}), .i2({1'b0, ir[2:0]}), .y(sel4));
   assign sel = sel4[2:0];

   // The MBR register file.
   wire [3:0] 	wy, ry;

   // The write decoder. Selects one bank of '670s for writing during an I/O
   // write transaction.
   demux_139h iowdemux (.g(nwmbr), .a({sel[2], 1'b1}), .y(wy));
   assign nbankw0 = wy[1];
   assign nbankw1 = wy[3];

   // The reading decoder. Selects one bank of '670s for reading. The decoder
   // is permanently selected, for speed. This implies that the AEXT bus will
   // always be driven. When the value needs to be put on the IBUS, an
   // additionan '541 buffer is enabled.
   demux_139h iordemux (.g(n139g),  .a({sel[2], 1'b1}), .y(ry));
   assign nbankr0 = ry[1];
   assign nbankr1 = ry[3];

   // Four '670 4×4 bit register files forming 8×8 bit registers.
   regfile_670 reg0lo (.d(ibus[3:0]), .re(nbankr0), .we(nbankw0), .ra(sel[1:0]), .wa(ir[1:0]), .q(aext[3:0]));
   regfile_670 reg0hi (.d(ibus[7:4]), .re(nbankr0), .we(nbankw0), .ra(sel[1:0]), .wa(ir[1:0]), .q(aext[7:4]));

   regfile_670 reg1lo (.d(ibus[3:0]), .re(nbankr1), .we(nbankw1), .ra(sel[1:0]), .wa(ir[1:0]), .q(aext[3:0]));
   regfile_670 reg1hi (.d(ibus[7:4]), .re(nbankr1), .we(nbankw1), .ra(sel[1:0]), .wa(ir[1:0]), .q(aext[7:4]));

   // Buffers to output the value of AEXT to the data bus when the
   // registers are read. Only the low order 8 bits are written to.

   buffer_541 regbuf (.oe1(nrmbr), .oe2(1'b0), .a(aext), .y(ibus[7:0]));

   // Also a buffer to output AEXT to the front panel

   buffer_541 fpbuf (.oe1(nfpaext), .oe2(1'b0), .a(aext), .y(fpo[7:0]));
   

   
   
endmodule // reg_mbr
`endif //  `ifndef reg_mbr_v

// End of file
