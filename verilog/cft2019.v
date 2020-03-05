///////////////////////////////////////////////////////////////////////////////
//
// A BASIC CFT COMPUTER, 2019 EDITION
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// cft2019.v -- A basic CFT setup
//
// Copyright © 2011–2020 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`ifndef cft2019_v
`define cft2019_v

`include "card_ctl.v"
`include "card_reg.v"
`include "card_bus.v"
`include "card_alu.v"
`include "card_dfp.v"
`include "card_mem.v"

`timescale 1ns/1ps

// All cards start with card_ and have identical port definitions.

module cft2019(
                nreset, nrsthold,            // Reset
                clk1, clk2, clk3, clk4, t34, // Clock
                nirq, nirqs,                 // Unexpanded Interrupts
                nsysdev,                     // I/O space decoder, I/O 000-0FF
                niodev1xx,                   // I/O space 100-1FF
                niodev2xx,                   // I/O space 200-2FF
                niodev3xx,                   // I/O space 300-3FF
                nmem, nio, nw, nr, nws,      // Bus transactions
                ab,                          // 24-bit address bus
                db,                          // 16-bit data bus
                nirqn,                       // Expanded interrupts (nIRQ0–nIRQ7)
                nhalt, nendext, nskipext,    // Run control for processor extensions
                ibus,                        // Processor bus
                raddr, waddr, action,        // Microcode fields
                fpd,                         // 8-bit front panel bus
                rsvd,                        // Reserved for bussed expansion
                wstb, nruen, nwuen,          // Removed, kept for expansion
                );

   inout         nreset;        // Open drain, various drivers.
   output        nrsthold;      // Driven by the reset unit.

   output        clk1;          // Output by the clock unit.
   output        clk2;          // Output by the clock unit.
   output        clk3;          // Output by the clock unit.
   output        clk4;          // Output by the clock unit.
   output        t34;           // Output by the clock unit.

   input         nirq;          // Input to the ISM
   output        nirqs;         // Interrupt acknowledge, driven by the ISM

   output        nsysdev;       // Driven by the I/O addr decoder (BUS board)
   output        niodev1xx;     // Driven by the I/O addr decoder (BUS board)
   output        niodev2xx;     // Driven by the I/O addr decoder (BUS board)
   output        niodev3xx;     // Driven by the I/O addr decoder (BUS board)

   output        nmem;          // Microcode store output
   output        nio;           // Microcode store output
   output        nw;            // Driven by the BUS board.
   output        nr;            // Microcode store output
   inout         nws;           // Open drain, handled by BUS board

   output [23:0] ab;            // 24-bit address bus
   inout  [15:0] db;            // 16-bit data bus

   inout  [7:0]  nirqn;         // Open drain extended IRQs (INT board)

   inout         nhalt;         // Open drain, multiple readers
   inout         nendext;       // Open drain, handled by the microcode sequencer
   inout         nskipext;      // Open drain, handled by SBU

   inout  [15:0] ibus;          // 16-bit processor bus
   output [4:0]  raddr;         // 5-bit IBus read address
   output [4:0]  waddr;         // 5-bit IBus write address
   output [3:0]  action;        // 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;           // 8-bit front panel data

   inout  [4:1]  rsvd;          // Reserved bussed pins
   inout         wstb;          // Removed, kept for expansion
   inout         nruen;         // Removed, kept for expansion
   inout         nwuen;         // Removed, kept for expansion

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire          nirq, nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire          nmem, nio, nw, nr, nws, nhalt, nendext, nskipext;
   wire          wstb, nruen, nwuen;
   wire [23:0]   ab;
   wire [15:0]   db;
   wire [7:0]    nirqn;
   wire [15:0]   ibus;
   wire [7:0]    fpd;
   wire [4:1]    rsvd;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // INTER-CARD SIGNALS (FROM THE ‘C’ PORTS)
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [40:1]   cport_ctl;     // CTL BOARD
   wire [6:0]    ir_6_0;
   wire          nwen;
   wire          fl;
   wire          fv;
   wire          nflagwe;
   wire          fz;
   wire          fn;
   wire [15:10]  pc_15_10;
   wire          nfpreset;
   wire          fpclk;
   wire          nfpclk_or_clk;
   wire          fpfetch;
   wire          nfpua0;
   wire          nfpuc0;
   wire          nfpuc1;
   wire          nfpuc2;
   wire          nfpirh;
   wire          nfpirl;
   wire          nfpflags;
   wire          powerok;

   wire [40:1]   cport_reg;     // REG BOARD
   wire          nfppch;
   wire          nfppcl;
   wire          nfpdrh;
   wire          nfpdrl;
   wire          nfpach;
   wire          nfpacl;
   wire          nfpsph;
   wire          nfpspl;
   wire [15:0]   ac;
   wire          naccpl;

   wire [40:1]   cport_bus;     // BUS BOARD

   wire          nfparh;        // FP request for ar[23:16]
   wire          idxen;         // Input from AIL, auto-indexing enabled
   wire          nfpram_rom;    // Input from DFP to MBU. 0=RAM layout, 1=RAM/ROM
   wire          nfpaext;       // FP request for AEXT

   wire [40:1]   cport_alu;     // ALU BOARD

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE CTL CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   assign ir_6_0[6:0] = cport_ctl[7:1];
   assign nwen = cport_ctl[8];
   assign cport_ctl[9] = fl;
   assign cport_ctl[10] = fv;
   assign nflagwe = cport_ctl[11];
   assign cport_ctl[12] = fz;
   assign cport_ctl[13] = fn;
   

   assign cport_ctl[19:14] = pc_15_10[15:10];

   assign cport_ctl[20] = nfpreset;
   assign cport_ctl[21] = fpclk;
   assign cport_ctl[22] = nfpclk_or_clk;

   assign fpfetch = cport_ctl[23];
   assign cport_ctl[24] = nfpua0;
   assign cport_ctl[25] = nfpuc0;
   assign cport_ctl[26] = nfpuc1;
   assign cport_ctl[27] = nfpuc2;
   assign cport_ctl[28] = nfpirl;
   assign cport_ctl[29] = nfpirh;
   assign cport_ctl[30] = nfpflags;
   assign cport_ctl[31] = powerok;
   assign idxen = cport_ctl[39];

   // These are for expansion, and we can keep them commented out for now.
   // assign cport_ctl[36:32] = cond[4:0];
   // assign cport_ctl[37] = cext8;
   // assign cport_ctl[38] = cext9;
   // assign in_rsvd = cport_ctl[40];

   card_ctl card_ctl(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_ctl),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE REG CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   assign pc_15_10 = cport_reg[6:1];
   assign cport_reg[11] = nfppch;
   assign cport_reg[12] = nfppcl;
   assign cport_reg[13] = nfpdrh;
   assign cport_reg[14] = nfpdrl;
   assign cport_reg[15] = nfpach;
   assign cport_reg[16] = nfpacl;
   assign cport_reg[17] = nfpsph;
   assign cport_reg[18] = nfpspl;
   assign ac = cport_reg[38:23];
   assign fn = cport_reg[38];   // Note: same as ac[15]
   assign fz = cport_reg[39];
   assign naccpl = cport_reg[40];
   card_reg card_reg(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_reg),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE BUS CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   assign cport_bus[3:1] = ir_6_0[2:0]; // IR[2:0] is needed here
   assign cport_bus[4] = idxen;
   assign cport_bus[14] = nwen;
   assign cport_bus[38] = nfpram_rom;
   assign cport_bus[39] = nfpaext;

   card_bus card_bus(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus),
                     .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_bus),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE ALU CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   assign cport_alu[7:1] = ir_6_0;
   assign fl = cport_alu[8];
   assign fv = cport_alu[9];
   assign cport_alu[10] = nflagwe;
   assign cport_alu[38:23] = ac;

   card_alu card_alu(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
		     .ibus(ibus),
                     .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_alu),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // A FAKE DFP AND BACKPLANE, WITH SOME (BASIC) REAL FUNCTIONALITY
   //
   ///////////////////////////////////////////////////////////////////////////////

   assign powerok = 1'b1;
   assign nfpreset = 1'b1;
   assign nfpclk_or_clk = 1'b1;
   assign fpclk = 1'b0;
   assign nfpram_rom = 1'b1;

   wire [40:1] 	 cport_dfp;
   card_dfp card_dfp(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_dfp),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // A MEMORY CARD
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire [40:1]   cport_mem;     // MEM board doesn't use local connections
   card_mem card_mem(
                     .nreset(nreset), .nrsthold(nrsthold),
                     .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
                     .nirq(nirq), .nirqs(nirqs),
                     .nsysdev(nsysdev), .niodev1xx(niodev1xx),
                     .niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
                     .nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
                     .ab(ab), .db(db),
                     .nirqn(nirqn),
                     .nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_mem),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen), .nwuen(nwuen)
                     );

endmodule // cft2019

`endif //  `ifndef cft2019_v

// End of file.
