///////////////////////////////////////////////////////////////////////////////
//
// BASIC TESTBENCH FOR THE BUS BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// card_bus_tb.v -- The BUS Board
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

`include "clock.v"
`include "card_bus.v"

`timescale 1ns/1ps

//`define DELTA 21
`define DELTA 89
//`define DELTA 941
//`define DELTA 1543

module card_bus_tb(
		nreset, nrsthold,            // Reset
		clk1, clk2, clk3, clk4, t34, // Clock
		nirq, nirqs,                 // Unexpanded Interrupts
		nsysdev,                     // I/O space decoder, I/O 000-0FF
		niodev1xx,		     // I/O space 100-1FF
		niodev2xx,		     // I/O space 200-2FF
		niodev3xx,		     // I/O space 300-3FF
		nmem, nio, nw, nr, nws,      // Bus transactions
		ab,                          // 24-bit address bus
		db,                          // 16-bit data bus
		nirqn,                       // Expanded interrupts (nIRQ0–nIRQ7)
		nhalt, nendext, nskipext,    // Run control for processor extensions
		ibus,                        // Processor bus
		raddr, waddr, action,        // Microcode fields
		fpd,			     // 8-bit front panel bus
		rsvd,                        // Reserved for bussed expansion
		wstb, nruen                  // Removed, kept for expansion
                );

   inout         nreset;	// Open drain, various drivers.
   output        nrsthold;	// Driven by the reset unit.

   output 	 clk1;		// Output by the clock unit.
   output 	 clk2;		// Output by the clock unit.
   output 	 clk3;		// Output by the clock unit.
   output 	 clk4;		// Output by the clock unit.
   output 	 t34;		// Output by the clock unit.

   input 	 nirq;		// Input to the ISM
   output 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   output 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   output 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   output 	 nmem;		// Microcode store output
   output 	 nio;		// Microcode store output
   output 	 nw;		// Driven by the BUS board.
   output 	 nr;		// Microcode store output
   inout 	 nws;		// Open drain, handled by BUS board

   output [23:0] ab;		// 24-bit address bus
   inout  [15:0] db;		// 16-bit data bus

   inout  [7:0]	 nirqn;		// Open drain extended IRQs (INT board)

   inout 	 nhalt;		// Open drain, multiple readers
   inout 	 nendext;	// Open drain, handled by the microcode sequencer
   inout 	 nskipext;	// Open drain, handled by SBU

   inout  [15:0] ibus;		// 16-bit processor bus
   output [4:0]  raddr;		// 5-bit IBus read address
   output [4:0]  waddr;		// 5-bit IBus write address
   output [3:0]  action;	// 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;		// 8-bit front panel data

   inout  [4:1]	 rsvd;		// Reserved bussed pins
   inout 	 wstb;		// Removed, kept for expansion
   inout 	 nruen;		// Removed, kept for expansion

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire 	 nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire   	 nmem, nio, nw, nr;
   tri1 	 nws, nhalt, nendext, nskipext, nirq;
   wire  	 wstb, nruen;
   wire [23:0] 	 ab;
   wire [15:0] 	 db;
   wire [7:0] 	 nirqn;
   wire [15:0] 	 ibus;
   wire [7:0] 	 fpd;
   wire [4:1] 	 rsvd;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // THE BUS CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire [40:1] 	 cport_bus;
   wire          idxen;         // Input from AIL, auto-indexing enabled
   reg [6:0] 	 ir_6_0;
   wire 	 nwen;
   reg 		 nfpram_rom;
   wire 	 nfpaext;

   reg 		 nreset_drv;
   reg [15:0] 	 ibus_drv;
   reg [4:0] 	 raddr_drv;
   reg [4:0] 	 waddr_drv;
   reg 		 nwen_drv;

   reg [800:0] 	 status;
   integer 	 i, j;
   
   always begin
      $dumpfile ("vcd/card_bus_tb.vcd");
      $dumpvars (0, card_bus_tb);

      status = "Reset";
      nreset_drv = 0;
      ibus_drv = 16'hZZZZ;
      raddr_drv = 0;
      waddr_drv = 0;
      nwen_drv = 1;
      #1000 nreset_drv = 1;

      #300000 $finish;
   end

   assign nreset = nreset_drv;
   assign ibus = ibus_drv;
   assign raddr = raddr_drv;
   assign waddr = waddr_drv;
   assign nwen = nwen_drv;
   
   // Connect the DUT and its signals

   assign cport_bus[3:1] = ir_6_0[2:0]; // IR[2:0] is needed here
   assign cport_bus[4] = idxen;
   //assign cport_bus[14] = nwen;
   assign cport_bus[38] = nfpram_rom;
   assign cport_bus[39] = nfpaext;

   clock_generator clock_generator (.nreset(nreset),
				    .clk1(clk1),
				    .clk2(clk2),
				    .clk3(clk3),
				    .clk4(clk4),
				    .t34(t34),
				    .nrsthold(nrsthold));
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
                     .ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
                     .fpd(fpd),
                     .cport(cport_bus),
                     .rsvd(rsvd), .wstb(wstb), .nruen(nruen)
                     );

   reg [8191:0] msg;

   ///////////////////////////////////////////////////////////////////////////////
   //
   // C PORT PIN-OUT VERIFICATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   // always @ (cport_bus, pc_15_10, ac, fn, fz, naccpl,
   // 	     nfppch, nfppcl, nfpdrh, nfpdrl, nfpach, nfpacl, nfpsph, nfpspl) begin
   //    #180 begin
   // 	 msg[7:0] = "";		// Use the msg as a flag.

   // 	 // Ensure the pinout is correct. This pinout is based on the
   // 	 // backplane spreadsheet at:
   // 	 //
   // 	 // https://docs.google.com/spreadsheets/d/13SUZ3FpwtXLWjZ45vqc8UWCJGz9KExWpTMRTJuJIw_4

   // 	 if (cport_bus[6:1] !== pc_15_10) begin
   // 	    $sformat(msg, "C Port mismatch: cport[6:1]=%b but pc_15_10=%b", cport_bus[6:1], pc_15_10);
   // 	 end

   // 	 else if (cport_bus[18:11] != { nfpspl, nfpsph, nfpacl, nfpach, nfpdrl, nfpdrh, nfppcl, nfppch }) begin
   // 	    $sformat(msg, "C Port mismatch: cport[18:11]=%b but FP strobe vector=%b", cport_bus[18:11],
   // 		     { nfpspl, nfpsph, nfpacl, nfpach, nfpdrl, nfpdrh, nfppcl, nfppch });
   // 	 end

   // 	 else if (cport_bus[38:23] !== cport_ac) begin
   // 	    $sformat(msg, "C Port mismatch: cport[38:23]=%b but ac=%b", cport_bus[38:23], cport_ac);
   // 	 end
	 
   // 	 else if (cport_bus[38] !== fn) begin
   // 	    $sformat(msg, "C Port mismatch: cport[38]=%b but fn=%b", cport_bus[38], fn);
   // 	 end

   // 	 else if (cport_bus[39] !== fz) begin
   // 	    $sformat(msg, "C Port mismatch: cport[39]=%b but fz=%b", cport_bus[39], fz);
   // 	 end

   // 	 else if (cport_bus[40] !== naccpl) begin
   // 	    $sformat(msg, "C Port mismatch: cport[40]=%b but naccpl=%b", cport_bus[40], naccpl);
   // 	 end

   // 	 // Fail if we've logged an issue.
   // 	 if (msg[7:0]) begin
   // 	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   // 	    $error("assertion failure");
   // 	    #100 $finish;
   // 	 end
   // 	 else $display("345 OK CPORT");
   //    end
   // end // always @ (clr, npl, p, cpu, cpd)
endmodule // card_bus_tb

`endif //  `ifndef card_bus_tb_v

// End of file.
