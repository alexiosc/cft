///////////////////////////////////////////////////////////////////////////////
//
// 74x157 MUX TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// mux_157_tb.v — 157 multiplexer testbench
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

`include "mux.v"
`timescale 1ns/10ps

module mux_157_tb();

   reg        sel;
   reg [3:0]  a;
   reg [3:0]  b;
   reg        ng;
   
   wire [3:0] y;

   integer   i;

   // Initialize all variables
   initial begin
      // $display ("time\t oe1 sel i1  y1   oe2 sel i2   y2");
      $monitor ("t: %7d | %b %b %b %b > %b", $time, a, b, sel, ng, y);
      $dumpfile ("vcd/mux_157_tb.vcd");
      $dumpvars (0, mux_157_tb);

      a = 0;
      b = 0;
      sel = 0;
      ng = 0;

      for (i = 0; i < 1024; i = i + 1) begin
	 #100 { ng, sel, b, a } = i;
      end

      #200 $display("345 OK");
      $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   mux_157 mux_157 (.sel(sel), .a(a), .b(b), .ng(ng), .y(y));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (a, b, sel, ng) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 if (ng === 1) begin
	    // If the gate is high, the Y output is always low.
	    if (y !== 4'b0000) $sformat(msg, "ng=%b but y=%b (should be y=0000)", ng, y);
	 end

	 else if (ng !== 0) begin
	    if (y !== a) $sformat(msg, "testbench but, ng=%b", ng);
	 end

	 else if (sel === 0) begin
	    if (y !== a) $sformat(msg, "ng=%b, a=%b, b=%b, sel=%b but y=%b (should be same as a)", ng, a, b, sel);
	 end

	 else if (sel === 1) begin
	    if (y !== b) $sformat(msg, "ng=%b, a=%b, b=%b, sel=%b but y=%b (should be same as b)", ng, a, b, sel);
	 end

	 else $sformat(msg, "testbench bug, sel=%b", sel);

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK mux");
      end
   end
   

endmodule
