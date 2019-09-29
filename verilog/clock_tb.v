// REDESIGNED IN 2019

`include "clock.v"

`timescale 1ns/10ps

module clock_tb();
   reg nfpclk_or_clk;
   reg fpclk;
   reg nreset;

   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, t34, wstb;

   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      $monitor ("%d | > %b %b %b %b %b %b", 
      		$time, clk1, clk2, clk3, clk4, t34, wstb);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      nreset = 0;
      
      // Start off with the front panel disconnected
      nfpclk_or_clk = 1'b1;
      fpclk = 1'bz;
      
      #50 nreset = 1;

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

      #10000 $finish;
      
   end // initial begin
   
   clock_generator clk (.nreset(nreset), .fpclk(fpclk),
			.nfpclk_or_clk(nfpclk_or_clk),
			.clk1(clk1),
			.clk2(clk2),
			.clk3(clk3),
			.clk4(clk4),
			.t34(t34),
			.wstb(wstb));

   wire [5:0] clkvec = { clk1, clk2, clk3, clk4, t34, wstb };
   always @clkvec begin
      if (clkvec != 6'b0111_1_1 && // Clock phase 1
	  clkvec != 6'b1011_1_1 && // Clock phase 2
	  clkvec != 6'b1101_0_1 && // Clock phase 3 (T34 low)
	  clkvec != 6'b1110_0_1 && // Clock phase 4 (T34 low, WSTB high)
	  clkvec != 6'b1110_0_0)   // Clock phase 4 (T34 low, WSTB low)
	begin
	 $error("Bad clock vector: CLK: %b %b %b %b T34: %b WSTB: %b",
		clk1, clk2, clk3, clk4, t34, wstb);
      end
   end

endmodule // clock_tb
