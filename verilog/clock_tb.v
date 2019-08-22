`include "flipflop.v"
`include "clock.v"
`include "vibrator.v"

`timescale 1ns/10ps

module clock_tb();
   reg nfpclk_or_clk;
   reg fpclk;
   reg nreset;
   reg fpfast, fpslow;

   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, t34, wstb;

   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      nreset = 0;
      
      // Start off with the front panel disconnected
      nfpclk_or_clk = 1'b1;
      fpclk = 1'bz;
      fpfast = 1'bz;
      fpslow = 1'bz;
      
      #50 nreset = 1;

      // Let it run a while, then connect the front panel.
      #5000 nfpclk_or_clk = 1;
      fpclk = 0;
      fpfast = 1;
      fpslow = 0;
      
      // Then, stop the clock.
      #5000 nfpclk_or_clk = 0;
      
      // Strobe the uStep switch
      #2000 fpclk = 1;
      #1000 fpclk = 0;
      for (i = 0; i < 40; i = i + 1) begin
	 #(10000 + ($random % 4000) - 2000) fpclk = 1;
	 #(10000 + ($random % 4000) - 2000) fpclk = 0;
      end

      // Change the clock speed to the slow clock and wait a LOT
      #1000 nfpclk_or_clk=0;
      #1000 fpfast=0;
      #1000 fpslow=0;
      #1000 nfpclk_or_clk = 1;
      #10000000 nfpclk_or_clk = 0;

      #1000 nfpclk_or_clk=0;
      #1000 fpfast=0;
      #1000 fpslow=1;
      #100000 nfpclk_or_clk = 1;

      #10000000 $finish;
      
   end // initial begin
   
   clock_generator clk (.nreset(nreset), .fpclk(fpclk),
			.nfpclk_or_clk(nfpclk_or_clk),
			.clk1(clk1),
			.clk2(clk2),
			.clk3(clk3),
			.clk4(clk4),
			.t34(t34),
			.wstb(wstb));

endmodule // clock_tb
