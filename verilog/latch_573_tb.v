///////////////////////////////////////////////////////////////////////////////
//
// 74x573 LATCH TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// latch_573_tb.v -- 74x573 testbench
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

`include "latch.v"
`timescale 1ns/10ps

module latch_573_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] d;
   reg 	     noe, le;
   
   wire [7:0] q;
   reg [7:0]  oldq;
   
   integer    i;
   
   // Initialize all variables
   initial begin        
      $monitor ("t: %7d | %b %b %x > %x", $time, d, noe, le, q);
      $dumpfile ("vcd/latch_573_tb.vcd");
      $dumpvars (0, latch_573_tb);

      noe = 1;
      le = 1;
      d = 0;
      oldq = latch_573.q0;

      for (i = 0; i < 2048 ; i = i + 1) begin
	 #100 d = i[7:0];
	 noe = i[8];
	 le = ~i[9];
      end

      #2000 $finish;      // Terminate simulation
   end

   latch_573 latch_573 (.d(d), .le(le), .noe(noe), .q(q));

   
   // Verify our findings.
   reg [8191:0] msg;
   always @ (noe) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (noe === 1) begin
	    if (q != 8'bzzzzzzzz) $sformat(msg, "noe=%b but q=%b (should be Z)", noe, q);
	 end

	 else if (noe !== 0) $sformat(msg, "testbench bug, noe=%b", noe);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK output");
      end
   end // always @ (noe)
   
   always @ (le, d) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (le === 1) begin
	    if (q != d) $sformat(msg, "incorrect q: le=0 but q=%b (should be %b)", q, oldq);
	    oldq = d;
	 end

	 else if (le === 0) begin
	    if (q != oldq) $sformat(msg, "q changed with le=0: q=%b (should be %b)", q, oldq);
	 end

	 else if (noe !== 0) $sformat(msg, "testbench bug, noe=%b", noe);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK output");
      end
   end // always @ (noe, posedge clk)
   
endmodule
