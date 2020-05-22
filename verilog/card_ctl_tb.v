///////////////////////////////////////////////////////////////////////////////
//
// BASIC TESTBENCH FOR THE CTL BOARD
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// card_ctl_tb.v -- The CTL Board
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

`timescale 1ns/1ps

module card_ctl_tb(
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
   // THE CTL CARD
   //
   ///////////////////////////////////////////////////////////////////////////////
   
   wire [40:1] 	 cport_ctl;
   wire [6:0] 	 ir_6_0;
   wire 	 nwen;
   wire 	 fl;
   wire 	 fv;
   wire 	 nflagwe;
   wire 	 fz;
   wire 	 fn;
   wire [15:10]  pc_15_10;
   wire 	 nfpreset;
   wire 	 fpclk;
   wire 	 nfpclk_or_clk;
   wire 	 fpfetch;
   wire 	 nfpua0;
   wire 	 nfpuc0;
   wire 	 nfpuc1;
   wire 	 nfpuc2;
   wire 	 nfpirh;
   wire 	 nfpirl;
   wire 	 nfpflags;
   wire 	 powerok;

   reg 		 nreset_drv;
   reg 		 nendext_drv;
   reg 		 nhalt_drv;
   reg [15:0] 	 ibus_drv;
   reg [800:0] 	 status;
   integer 	 i, j;
   
   // Simulate things
   assign nfpreset = 1'b1;
   assign nfpclk_or_clk = 1'b1;
   assign fpclk = 1'b0;

   always begin
      $dumpfile ("vcd/card_ctl_tb.vcd");
      $dumpvars (0, card_ctl_tb);

      status = "Reset";
      nhalt_drv = 1'b1;
      nreset_drv = 0;
      ibus_drv = 16'hZZZZ;
      #1000 nreset_drv = 1;

      // We can only test the uPC partially: nrsthold has already been
      // tested during reset, and the control store drives nend.
      #1000 status = "uPC test";
      for (i = 0; i < 512; i++) begin
	 #250 nendext_drv = i[5] ? 1'b0 : 1'bz;
	 nhalt_drv = i[6] ? 1'b0 : 1'bz;
      end

      #1000 status = "Done";
      #100000 $finish;
   end

   assign nreset = nreset_drv;
   assign nhalt = nhalt_drv;
   assign nendext = nendext_drv;
   
   assign ibus = ibus_drv;
   
   // Fake the Data Bus
   always @(nmem, nio, nr) begin
      if ((nmem == 1'b0 || nio == 1'b0) && (nr == 1'b0)) begin
	 #30 ibus_drv = 16'h2176; // NOP.
      end else begin
	 #30 ibus_drv = 16'hZZZZ;
      end
   end

   // Connect the DUT and its many signals

   assign cport_ctl[7:1] = ir_6_0[6:0];
   assign cport_ctl[8] = nwen;
   assign fl = cport_ctl[9];
   assign fv = cport_ctl[10];
   assign nflagwe = cport_ctl[11];
   assign fz = cport_ctl[12];
   assign fn = cport_ctl[13];

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

   // These are for expansion, and we can keep them commented out for now.
   // assign cport_ctl[36:32] = cond[4:0];
   // assign cport_ctl[37] = cext8;
   // assign cport_ctl[38] = cext9;
   // assign cport_ctl[39] = idxen;
   // assign in_rsvd = cport_ctl[40];

   card_ctl card_ctl(
		.nreset(nreset), .nrsthold(nrsthold),
		.clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34),
		.nirq(nirq), .nirqs(nirqs),
		.nsysdev(nsysdev), .niodev1xx(niodev1xx),
		.niodev2xx(niodev2xx), .niodev3xx(niodev3xx),
		.nmem(nmem), .nio(nio), .nw(nw), .nr(nr), .nws(nws),
		.nwaiting(1'b1),
		.ab(ab), .db(db),
		.nirqn(nirqn),
		.nhalt(nhalt), .nendext(nendext), .nskipext(nskipext),
		.ibus(ibus), .raddr(raddr), .waddr(waddr), .action(action),
		.fpd(fpd),
		.cport(cport_ctl),
		.rsvd(rsvd), .wstb(wstb), .nruen(nruen)
                );

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFICATION
   //
   ///////////////////////////////////////////////////////////////////////////////

   // We have individual testbenches for most of the modules here, so no need
   // to test their particular behaviours. We do test how they integrate
   // together though.

   // if ({x} !== 1'b1 && {x} !== 1'b0) begin
   //    $sformat(msg, "{x} drive failure: nreset=%b", {x});
   // end

   reg [8000:0] msg;
   integer 	vi, vj;
   always @ (nreset, fpclk, nfpclk_or_clk, clk1, clk2, clk3, clk4, t34, nrsthold) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (nreset !== 1'b1 && nreset !== 1'b0) begin
	    $sformat(msg, "nreset drive failure: nreset=%b", nreset);
	 end

	 else if (fpclk !== 1'b1 && fpclk !== 1'b0) begin
	    $sformat(msg, "fpclk drive failure: nreset=%b", fpclk);
	 end

	 else if (nfpclk_or_clk !== 1'b1 && nfpclk_or_clk !== 1'b0) begin
	    $sformat(msg, "nfpclk_or_clk drive failure: nreset=%b", nfpclk_or_clk);
	 end

	 else if (clk1 !== 1'b1 && clk1 !== 1'b0) begin
	    $sformat(msg, "clk1 drive failure: nreset=%b", clk1);
	 end

	 else if (clk2 !== 1'b1 && clk2 !== 1'b0) begin
	    $sformat(msg, "clk2 drive failure: nreset=%b", clk2);
	 end

	 else if (clk3 !== 1'b1 && clk3 !== 1'b0) begin
	    $sformat(msg, "clk3 drive failure: nreset=%b", clk3);
	 end

	 else if (clk4 !== 1'b1 && clk4 !== 1'b0) begin
	    $sformat(msg, "clk4 drive failure: nreset=%b", clk4);
	 end

	 else if (t34 !== 1'b1 && t34 !== 1'b0) begin
	    $sformat(msg, "t34 drive failure: nreset=%b", t34);
	 end

	 else if (nrsthold !== 1'b1 && nrsthold !== 1'b0) begin
	    $sformat(msg, "nrsthold drive failure: nreset=%b", nrsthold);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK clock");
      end
   end // always @ (clr, npl, p, cpu, cpd)
   
   
   always @ (card_ctl.ir) begin
      if ($time > 100) #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 for (vi = 0; msg[7:0] == "" && vi < 16; vi++) begin
	    if (card_ctl.ir[vi] !== 1'b1 && card_ctl.ir[vi] !== 1'b0) begin
	       $sformat(msg, "IR fault: ir=%b", card_ctl.ir);
	    end;
	 end;

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK IR");
      end // if ($time > 100)
   end // always @ (card_ctl.ir)
   
   
   always @ (ibus) begin
      if ($time > 100) #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Allow the IBus to be at high impedance, or allow it to have a full
	 // 16-bit value.
	 if (ibus != 16'bZ) begin
	    for (vi = 0; msg[7:0] == "" && vi < 16; vi++) begin
	       if (ibus[vi] !== 1'b1 && ibus[vi] !== 1'b0) begin
		  $sformat(msg, "IBus fault: ibus=%b", ibus);
	       end;
	    end;
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK IBus");
      end // if ($time > 100)
   end // always @ (ibus)
   
   
   always @ (card_ctl.microcode_sequencer.uaddr, card_ctl.microcode_sequencer.ucontrol) begin
      if ($time > 100) #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 for (vi = 0; msg[7:0] == "" && vi < 18; vi++) begin
	    if (card_ctl.microcode_sequencer.uaddr[vi] !== 1'b1 &&
		card_ctl.microcode_sequencer.uaddr[vi] !== 1'b0) begin
	       $sformat(msg, "uAddr fault: uaddr=%b", card_ctl.microcode_sequencer.uaddr);
	    end;
	 end

	 if (card_ctl.microcode_sequencer.ncse == 1'b0) begin
	    for (vi = 0; msg[7:0] == "" && vi < 24; vi++) begin
	       if (card_ctl.microcode_sequencer.ucontrol[vi] !== 1'b1 &&
		   card_ctl.microcode_sequencer.ucontrol[vi] !== 1'b0) begin
		  $sformat(msg, "uAddr fault: ucontrol=%b", card_ctl.microcode_sequencer.ucontrol);
	       end;
	    end;
	 end

	 else if (card_ctl.microcode_sequencer.ncse == 1'b0 &&
		  card_ctl.microcode_sequencer.ucontrol !== 24'bZ) begin
	    $sformat(msg, "uAddr tri-state fault: ncse=%b, ucontrol=%b",
		     card_ctl.microcode_sequencer.ncse,
		     card_ctl.microcode_sequencer.ucontrol);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK Control Store");
      end // if ($time > 100)
   end // always @ (ibus)
   
   
endmodule // card_ctl_tb

`endif //  `ifndef card_ctl_tb_v

// End of file.
