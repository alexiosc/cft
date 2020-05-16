///////////////////////////////////////////////////////////////////////////////
//
// A FAKE INTERRUPT/IOT BOARD FOR VERILOG TESTING
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// card_verilog_test.v -- A fake card
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

`ifndef card_verilog_test_v
`define card_verilog_test_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Simulate some I/O for debugging purposes.
//
///////////////////////////////////////////////////////////////////////////////

module card_verilog_test (
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
		cport,                       // C port, unbussed pins on backplane
		rsvd,                        // Reserved for bussed expansion
		wstb, nruen, nwuen,          // Removed, kept for expansion
                );

   input         nreset;	// Open drain, various drivers.
   input 	 nrsthold;	// Driven by the reset unit.

   input 	 clk1;		// Output by the clock unit.
   input 	 clk2;		// Output by the clock unit.
   input 	 clk3;		// Output by the clock unit.
   input 	 clk4;		// Output by the clock unit.
   input 	 t34;		// Output by the clock unit.

   inout 	 nirq;		// Input to the ISM
   input 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   input 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   input 	 nmem;		// Microcode store output
   input 	 nio;		// Microcode store output
   input 	 nw;		// Driven by the BUS board.
   input 	 nr;		// Microcode store output
   inout 	 nws;		// Open drain, handled by BUS board

   input [23:0]  ab;		// 24-bit address bus
   inout [15:0]  db;		// 16-bit data bus

   input [7:0] 	 nirqn;		// Open drain extended IRQs (INT board)

   inout 	 nhalt;		// Open drain, multiple readers
   input 	 nendext;	// Open drain, handled by the microcode sequencer
   inout 	 nskipext;	// Open drain, handled by SBU

   inout [15:0]  ibus;		// 16-bit processor bus
   input [4:0] 	 raddr;		// 5-bit IBus read address
   input [4:0] 	 waddr;		// 5-bit IBus write address
   input [3:0] 	 action;	// 4-bit action address (STI, CLI, etc.)

   output [7:0]  fpd;		// 8-bit front panel data
   inout [40:1]  cport;		// The unbussed backplane port. User-defined.

   inout  [4:1]	 rsvd;		// Reserved bussed pins
   inout 	 wstb;		// Removed, kept for expansion
   inout 	 nruen;		// Removed, kept for expansion
   inout 	 nwuen;		// Removed, kept for expansion

   // Wire definitions for the above.

   wire          nreset, nrsthold, clk1, clk2, clk3, clk4, t34;
   wire 	 nirq, nirqs, nsysdev, niodev1xx, niodev2xx, niodev3xx;
   wire   	 nmem, nio, nw, nr, nws, nhalt, nendext, nskipext;
   wire  	 wstb, nruen, nwuen;
   wire [23:0] 	 ab;
   wire [15:0] 	 db;
   wire [7:0] 	 nirqn;
   wire [15:0] 	 ibus;
   wire [7:0] 	 fpd;
   wire [40:1] 	 cport;
   wire [4:1] 	 rsvd;


   reg [15:0] 	 ibus_drv;
   reg 		 nirq_drv;
   reg 		 nirq_en;
   reg [15:0] 	 nirq_ctr;
   reg 		 nws_drv;
   reg [15:0] 	 iot_port_a, iot_port_b;

   assign ibus = ibus_drv;
   assign nirq = nirq_drv;
   assign nws = nws_drv;
   
   initial begin
      ibus_drv = 16'bz;
      nirq_drv = 1'bz;
      nirq_en = 1'b1;
      nirq_ctr = 1;
      nws_drv = 1'bz;
   end

   always begin
      // Keep the timer rate relatively prime to the clock speed.
      #277 begin
	 if (nirq_en == 0) begin
	    if (nirq_ctr == 0) begin
	       nirq_drv = 1'b0;
	    end else begin
	       nirq_ctr = nirq_ctr - 1;
	    end
	 end else nirq_drv = 1'bz;
      end
   end

   always @(posedge nw) begin
      // Map to 3FD-3FF, addresses we probably won't use.
      if (niodev3xx == 1'b0) begin
	 casex (ab[7:0])
	   8'hfd: iot_port_a = db;
	   8'hfe: iot_port_b = db;
	   8'hff: begin
	      nirq_drv = 1'b1;
	      nirq_en = db === 0 ? 1'b1 : 1'b0;
	      nirq_ctr = db;
	   end
	 endcase // casex (ab[7:0])
      end
   end // always @ (posedge nw)

   wire [15:0] 	 product;
   assign product = iot_port_a * iot_port_b;

   // When the device is selected for a multiplication result
   // transaction, assert nSKIPEXT if the product is zero.
   assign nskipext = nr === 1'b0 &&
		     niodev3xx === 1'b0 &&
		     ab[7:0] === 8'hfe &&
		     product == 0 ? 1'b0 : 1'bz;

   always @(nr, niodev3xx, ab) begin
      // Map to 3F0-3FF, addresses we probably won't use for anything else.
      if (nr === 1'b0 && niodev3xx === 1'b0) begin
	 case (ab[7:0])
	   8'hf0: ibus_drv = 16'h0000;
	   8'hf1: ibus_drv = 16'h0000;
	   8'hf2: ibus_drv = 16'h0000;
	   8'hf3: ibus_drv = 16'h0000;
	   8'hf4: ibus_drv = 16'h0000;
	   8'hf5: ibus_drv = 16'h0000;
	   8'hf6: ibus_drv = 16'h0000;
	   8'hf7: ibus_drv = 16'h0000;
	   8'hf8: ibus_drv = 16'h1234;
	   8'hf9: ibus_drv = 16'h5678;
	   8'hfa: ibus_drv = 16'h9abc;
	   8'hfb: ibus_drv = 16'hdef0;
	   8'hfc: ibus_drv = 16'h4321;
	   8'hfd: ibus_drv = product;
	   8'hfe: ibus_drv = product;
	   8'hff: ibus_drv = nirq_ctr;
	   default: ibus_drv = 16'bzzzz;
	 endcase // case ([15:0])
      end else ibus_drv = 16'bzzzz; // if (niodev3xx == 1'b0)
   end // always @ (posedge nw)
endmodule // debug_io

`endif //  `ifndef card_verilog_test_v

// End of file.

