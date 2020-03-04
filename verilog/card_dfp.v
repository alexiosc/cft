///////////////////////////////////////////////////////////////////////////////
//
// BASIC DEBUGGING FUNCTIONALITY FROM THE DFP
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// dfp.v -- A very, very simple DFP used for verification
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

`ifndef io_v
`define io_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Simulate some I/O for debugging purposes.
//
///////////////////////////////////////////////////////////////////////////////

module card_dfp (
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

   input 	 nirq;		// Input to the ISM
   input 	 nirqs;		// Interrupt acknowledge, driven by the ISM

   input 	 nsysdev;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev1xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev2xx;	// Driven by the I/O addr decoder (BUS board)
   input 	 niodev3xx;	// Driven by the I/O addr decoder (BUS board)

   input 	 nmem;		// Microcode store output
   input 	 nio;		// Microcode store output
   input 	 nw;		// Driven by the BUS board.
   input 	 nr;		// Microcode store output
   input 	 nws;		// Open drain, handled by BUS board

   input [23:0]  ab;		// 24-bit address bus
   inout [15:0]  db;		// 16-bit data bus

   input [7:0] 	 nirqn;		// Open drain extended IRQs (INT board)

   inout 	 nhalt;		// Open drain, multiple readers
   input 	 nendext;	// Open drain, handled by the microcode sequencer
   input 	 nskipext;	// Open drain, handled by SBU

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


   reg 		 nhalt_drv;
   assign nhalt = nhalt_drv;

   reg [15:0] 	 db_drv;
   assign db = db_drv;

   event 	 assertion_failed;
   event 	 halting;

   // We may not have much, but we have an Output Register.
   reg [15:0] 	 OR;
   reg [15:0] 	 hidb;

   initial begin
      nhalt_drv = 1'bz;
      db_drv = 16'bZ;
      OR = 16'd0;
   end      

   // Testing and debugging.
   always @(posedge nw) begin

      // Let's be realistic
      if (niodev1xx == 1'b0) begin
	 casex (ab[7:0])

	   // SOR
	   8'h00: begin
	      OR = db;
	      $display("T: OR: %04x", OR);
	   end

	   8'h08: $display("T: ENEF: not implemented");      // ENEF
	   8'h09: $display("T: DISEF: not implemented");     // DISEF

	   // SENTINEL
	   8'h0f: begin
	      $display("T: SENTINEL");
	      -> assertion_failed;
	      -> halting;
	   end
	     
	   8'h10: $display("T: PRINTA: %h", db);             // PRINTA
	   8'h11: $display("T: PRINTc: %d", db);             // PRINTC
	   8'h12: $display("T: PRINTD: %d", $signed(db));    // PRINTD
	   8'h13: $display("T: PRINTU: %d", db);             // PRINTU
	   8'h14: $display("T: PRINTH: %x", db);             // PRINTH
	   8'h15: $display("T: PRINTB: %b", db);             // PRINTB
	   8'h16: $display("T: PRINTc: 32");                 // PRINTSP
	   8'h17: $display("T: PRINTc: 10");                 // PRINTNL
	   8'h18: $display("T: DEBUGON: not implemented");   // DEBUGON
	   8'h19: $display("T: DEBUGOFF: not implemented");  // DEBUGOFF
	   8'h1a: $display("T: DUMP: not implemented");      // DUMP
	   8'h1b: hidb = db;				     // PRINTHI
	   8'h1c: $display("T: PRINTL: %h%04h", hidb, db);   // PRINTLO

	   // HALT
	   8'h1d: begin
	      $display("D: *** HALTING ***");
	      $display("D: TIME: %d ns", $time);
	      nhalt_drv <= 1'b0;
	      -> halting;
	   end
	     
	   8'h1e: $display("T: ASSERT: TRUE");               // SUCCESS
	   8'h1f: $display("T: ASSERT: FALSE");              // FAIL

	   default:
	     begin
		$display("T: UNKNOWN DFP ADDR %h", ab[9:0]);
		-> assertion_failed;
		-> halting;
	     end
	 endcase // casex (addr[7:0])
      end // if (niodev1xx == 1'b0)
   end // always @ (posedge nw)
endmodule // debug_io

`endif //  `ifndef io_v

// End of file.
