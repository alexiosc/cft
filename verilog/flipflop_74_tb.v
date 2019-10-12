///////////////////////////////////////////////////////////////////////////////
//
// 74x74 FLIP-FLOP TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// flipflop_74_tb.v -- 74x74 testbench
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

module flipflop_74_tb();

// Declare inputs as regs and outputs as wires
   reg     d, nset, nrst;
   wire    q, nq, clk;
   integer i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t d c s r q Q");
      $monitor ("t: %7d | %b %b %b %b > %b %b", $time, clk, nset, nrst, d, q, nq);
      $dumpfile ("vcd/flipflop_74_tb.vcd");
      $dumpvars (0, flipflop_74_tb);

      d = 0;
      nset = 1;
      nrst = 1;

      for (i = 0; i < 128; i = i + 1) begin
	 #100 { nset, nrst, d } = {i[5:4], i[1]};
      end
      #300 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin
   
   assign #15 clk = i[6] === 0 ? i[0] : 1;
   

   // Connect DUT to test bench
   flipflop_74h flipflop (.d(d), .clk(clk), .nset(nset), .nrst(nrst), .q(q), .nq(nq));

   // Verify our findings.
   reg [8191:0] msg;
   always @ (nset, nrst, d) begin
      #30 begin
   	 msg[0] = "";		// Use the msg as a flag.

   	 // Check asynchronous set
	 if (nset === 0 && nrst === 1) begin
	    if (q !== 1 || nq !== 0) begin
	       $sformat(msg, "on async set, nset=%b, nrst=%b, but q=%b, nq=%b (should be q=1, nq=0)", nset, nrst, q, nq);
	    end
	 end

   	 // Check asynchronous clear
	 else if (nset === 1 && nrst === 0) begin
	    if (q !== 0 || nq !== 1) begin
	       $sformat(msg, "on async clear, nset=%b, nrst=%b, but q=%b, nq=%b (should be q=1, nq=0)", nset, nrst, q, nq);
	    end
	 end

   	 // Check simultaneous asynchronous clear and reset, both outputs are
   	 // high! (but this is not a stable state)
	 else if (nset === 0 && nrst === 0) begin
	    if (q !== 1 || nq !== 1) begin
	       $sformat(msg, "on simultaneous async clear & reset, nset=%b, nrst=%b, but q=%b, nq=%b (should be q=1, nq=1)", nset, nrst, q, nq);
	    end
	 end

	 else if (nset === 1 && nrst === 1) begin
	    // Ensure the outputs are complementary
	    if (q !== ~nq) $sformat(msg, "outputs not complementary! q=%b, nq=%b", q, nq);
	 end

	 else if (nset !== 0 && nset !== 1) begin
	    $sformat(msg, "testbench bug, nset=%b", nset);
	 end
	 
	 else if (nrst !== 0 && nrst !== 1) begin
	    $sformat(msg, "testbench bug, nrst=%b", nrst);
	 end

	 else if (d !== 0 && d !== 1) begin
	    $sformat(msg, "testbench bug, nrst=%b", nrst);
	 end
	 
   	 // Fail if we've logged an issue.
   	 if (msg[0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
      end
   end // always @ (nset, nrst)

   // clock-synchronous checks
   always @ (posedge clk) begin
      #30 begin
   	 msg[0] = "";		// Use the msg as a flag.

	 if (clk == 1 && nset === 1 && nrst === 1) begin
	    if (q !== d || nq !== ~d) begin
	       $sformat(msg, "on clock, nset=%b, nrst=%b, clk=%b, d=%b, but q=%b, nq=%b (q should follow d)", nset, nrst, clk, d, q, nq);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
      end
   end
endmodule
