///////////////////////////////////////////////////////////////////////////////
//
// 74x541 BUFFER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// buffer_541_tb.v -- 74x541 testbench
//
// Copyright © 2011-2019 Alexios Chouchoulas
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

`include "clock.v"

`timescale 1ns/10ps

module clock_tb();
   reg nfpclk_or_clk;
   reg fpclk;
   reg nreset;

   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, t34;
   wire nrsthold;

   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      $monitor ("t: %7d | > %b %b %b %b %b", 
      		$time, clk1, clk2, clk3, clk4, t34);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      nreset = 0;
      
      // Start off with the front panel disconnected
      nfpclk_or_clk = 1'b1;
      fpclk = 1'bz;
      
      #100 nreset = 1;

      // Wait for Reset Hold
      #10000;
      
      // Let it run a while, then connect the front panel.
      #5000 nfpclk_or_clk = 1;
      fpclk = 0;
      
      // Then, stop the clock.
      #5000 nfpclk_or_clk = 0;
      
      // Strobe the uStep switch
      #2000 fpclk = 1;
      #1000 fpclk = 0;
      for (i = 0; i < 40; i = i + 1) begin
	 #(1000 + ($random % 400) - 200) fpclk = 1;
	 #(1000 + ($random % 400) - 200) fpclk = 0;
      end

      // Change the clock speed to the slow clock and wait a LOT
      #1000 nfpclk_or_clk=0;
      #1000 nfpclk_or_clk = 1;
      #10000 nfpclk_or_clk = 0;

      #1000 nfpclk_or_clk=0;
      #10000 nfpclk_or_clk = 1;

      #10000 $display("345 OK");
      $finish;
      
   end // initial begin

   // Assign tri-state wires
   wire nreset_real;
   wire fpclk_real;
   wire nfpclk_or_clk_real;

   assign nreset_real = nreset;
   assign fpclk_real = fpclk;
   assign nfpclk_or_clk_real = nfpclk_or_clk;

   // Connect the DUT
   clock_generator clk (.nreset(nreset_real), .fpclk(fpclk_real),
			.nfpclk_or_clk(nfpclk_or_clk_real),
			.clk1(clk1),
			.clk2(clk2),
			.clk3(clk3),
			.clk4(clk4),
			.t34(t34),
			.nrsthold(nrsthold));

   wire [5:0] clkvec = { clk1, clk2, clk3, clk4, t34 };

   reg [8191:0] msg;
   always @(clkvec, nreset) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 if (nreset === 0) begin
	    if (clkvec !== 6'b0111_1) $sformat(msg, "nreset=%b, but clocks are %b %b %b %b, t34=%b",
						 nreset, clk1, clk2, clk3, clk4, t34);
	 end
	 
	 else if (nreset === 1) begin
	    if (clkvec !== 6'b0111_1 && // Clock phase 1
		clkvec !== 6'b1011_1 && // Clock phase 2
		clkvec !== 6'b1101_0 && // Clock phase 3 (T34 low)
		clkvec !== 6'b1110_0)   // Clock phase 4 (T34 low, WSTB low)
	      begin
		 $sformat(msg, "bad clock vector: %b %b %b %b T34: %b",
			  clk1, clk2, clk3, clk4, t34);
	      end
	 end

	 else begin // else: !if(nreset === 0)
	    $sformat(msg, "testbench bug, nreset=%b", nreset);
	 end

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("345 OK clock");
      end
   end
endmodule // clock_tb

// End of file.

