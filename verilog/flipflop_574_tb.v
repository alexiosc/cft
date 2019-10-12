///////////////////////////////////////////////////////////////////////////////
//
// 74x574 FLIP-FLOP TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// flipflop_574_tb.v -- 74x574 testbench
//
// Copyright © 2011–2019 Alexios Chouchoulas
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

`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_574_tb();
   reg 	      noe;
   reg [7:0]  d;

   wire       clk;
   wire [7:0] q;
   integer    i;
   

   // Initialize all variables
   initial begin        
      $monitor ("t: %7d | %b %b %x > %x", $time, clk, noe, d, q);
      $dumpfile ("vcd/flipflop_574_tb.vcd");
      $dumpvars (0, flipflop_574_tb);

      d = 0;
      noe = 1;

      for (i = 0; i < 2048; i = i + 1) begin
	 #100 {noe, d} = {i[9], i[8:1]};
      end

      #200 $display("OK");
      $finish;      // Terminate simulation
   end

   assign #15 clk = i[10] === 0 ? i[0] : 1;
   
   // Connect DUT to test bench
   flipflop_574 flipflop (.noe(noe), .clk(clk), .d(d), .q(q));

   // Verify our findings.
   reg [8191:0] msg;
   reg [7:0] 	lastq;
   always @ (noe, clk, d) begin
      #30 begin
   	 msg[0] = "";		// Use the msg as a flag.

   	 // Check asynchronous set
	 if (noe === 1) begin
	    if (q != 8'bzzzzzzzz) $sformat(msg, "noe=%b but q=%x (should be Z)", noe, q);
	 end

	 else if (noe !== 0) $sformat(msg, "testbench bug, noe=%b", noe);

	 else if (lastq != 8'bxxxxxxxx && q !== lastq) begin
	    $sformat(msg, "q changed from %b to %b without clock positive edge!", lastq, q);
	 end
	 
   	 // Fail if we've logged an issue.
   	 if (msg[0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
      end
   end // always @ (noe, posedge clk)

   always @(posedge clk) begin
      // noe === 0 implied here
      if (clk === 1) begin
	 lastq = d;
	 if (noe !== 0 && d !== q) $sformat(msg, "noe=%b, d=%b, but q=%b", noe, d, q);
      end
   end

endmodule
