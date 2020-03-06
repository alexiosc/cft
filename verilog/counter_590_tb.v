///////////////////////////////////////////////////////////////////////////////
//
// 74x590 COUNTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// counter_590_tb.v -- 74x590 testbench
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

`include "counter.v"

`timescale 1ns/10ps

module counter_590_tb();

// Declare inputs as regs and outputs as wires

   reg clk, ccken, cclr, rck, g;

   wire [7:0] q, q1;
   wire rco, rco1;

   integer i;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_590_tb.vcd");
      $dumpvars (0, counter_590_tb);

      clk = 0;
      ccken = 1;
      g = 1;
      rck = 0;

      #1000 cclr = 0;
      #1000 cclr = 1;
      #100 g = 0;
      #100 ccken = 0;
      #1000 g = 1;
      #1000 g = 0;
      #1000 ccken = 1;
      #1000 ccken = 0;
      #2000 cclr = 0;
      #1000 ccken = 1;
      #1000 ccken = 0;
      #2000 cclr = 1;
      
      #150000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
      rck = ~rck;
   end

   // Connect DUT to test bench. Note, the '590 implementation is
   // partial because it's used in a very particular way.
   counter_590 c0 (clk,  ccken, cclr, rck, g, q, rco);
   counter_590 c1 (~rco, ccken, cclr, rck, g, q1, rco1);

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

   // // Check value loading
   // always @ (clk) begin
   //    #30 begin
   // 	 msg[7:0] = "";		// Use the msg as a flag.

   // 	 // Check for an async clear (clr, active high)
   // 	 if (npl === 0) begin
   // 	    val = p;
   // 	    if (q !== p) $sformat(msg, "npl=%b, p=%b, but q=%b (should be same as p)", npl, p, q);
   // 	 end else if (npl !== 1) $sformat(msg, "testbench bug, npl=%b", npl);

   // 	 // Fail if we've logged an issue.
   // 	 if (msg[7:0]) begin
   // 	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   // 	    $error("assertion failure");
   // 	    #100 $finish;
   // 	 end
   // 	 else $display("345 OK load");
   //    end
   // end // always @ (npl)

endmodule
