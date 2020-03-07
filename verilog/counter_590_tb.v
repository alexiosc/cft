///////////////////////////////////////////////////////////////////////////////
//
// 74x590 COUNTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
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
   reg         nmrc, cpc, cpr, nce, noe, nrco;
   wire [7:0]  q;
   wire        rco;
   reg [800:0] status;

   integer     i, oldcount;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_590_tb.vcd");
      $dumpvars (0, counter_590_tb);

      nmrc = 0;
      cpc = 0;
      cpr = 0;
      nce = 0;
      noe = 0;
      oldcount = counter_590.count;

      status = "Count";
      for (i = 0 ; i < 32768; i = i + 1) begin
	 // Run with all combinations of clocks enabled/inhibited
	 #250;
	 nce = i[10];
	 noe = i[11];
	 cpc = i[12] ? 0: i[0];
	 cpr = i[13] ? 0 : i[0];
	 nmrc = ~i[14];
      end

      // Same test, inverted register clock
      status = "Inverted register clock";
      for (i = 0 ; i < 32768; i = i + 1) begin
	 // Run with all combinations of clocks enabled/inhibited
	 #250;
	 nce = i[10];
	 noe = i[11];
	 cpc = i[12] ? 0: i[0];
	 cpr = i[13] ? 0 : ~i[0];
	 nmrc = ~i[14];
      end
      
      #1500 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench. Note, the '590 implementation is
   // partial because it's used in a very particular way.
   counter_590 counter_590 (.nmrc(nmrc), .cpc(cpc), .cpr(cpr), .nce(nce), .noe(noe), .q(q), .nrco(nrco));
   
   // // Ripple counting.
   // //not u0 (cet_in1, tc_out0);
   // //not u1 (cet_in2, tc_out1);
   // //not u2 (cet_in3, tc_out2);

   // Verify our findings.
   reg [8191:0] msg;

   // Check reset behaviour
   always @(nmrc) begin
      #30 begin
   	 if (nmrc === 1'b0) begin
	    if (counter_590.count !== 8'd0) begin
	       $sformat(msg, "nmrc=%d, but internal counter_590.count=%b (%0d)", nmrc, counter_590.count);
	    end
	    oldcount = 0;
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK reset");
      end
   end // always @ (nmrc)

   // Check ripple output
   always @ (nrco) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (counter_590.count == 255 && nrco !== 1'b0) begin
	    $sformat(msg, "counter_590.count=%b (%0d) but nrco=%b (should be 0)", counter_590.count, counter_590.count, nrco);
	 end
	 else if (counter_590.count != 255 && nrco !== 1'b1) begin
	    $sformat(msg, "counter_590.count=%b (%0d) but nrco=%b (should be 1)", counter_590.count, counter_590.count, nrco);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK ripple");
      end
   end

   // Check count behaviour
   always @ (posedge cpc) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 if (nmrc === 1'b1 && nce == 1'b0) begin
	    if (counter_590.count != 8'((oldcount + 1) & 255)) begin
	       $sformat(msg, "nmrc=%d, cpc=posedge, nce=%b, but count mismatch (is %0d, expected %0d)",
			nmrc, nce, counter_590.count, (oldcount + 1) & 255);
	    end
	    oldcount = counter_590.count;
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK count");
      end
   end // always @ (clr, npl, p, cpu, cpd)

endmodule
