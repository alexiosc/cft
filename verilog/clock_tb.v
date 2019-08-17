//
// REDESIGNED IN 2019
//
`include "clock.v"
`include "reset.v"

`timescale 1ns/10ps

module clock_tb();
   reg fpclk;		   // Slow/step clock from the front panel.
   reg nfpclk_or_clk;	   // When low: use FPCLK. Otherwise, use CLK.
   reg nreset;		   // RESET# signal.
   wire nreset_real;

   wire clk1, clk2, clk3, clk4, t34, wstb;
   wire nrsthold;
   integer i;

   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      // Start off with the front panel disconnected
      nfpclk_or_clk = 1'b1;
      fpclk = 1'bz;
      nreset = 0;
      #100 nreset = 1;
      #2000 ;
      

      // Let it run a while, then connect the front panel.
      #5000 nfpclk_or_clk = 1;
      fpclk = 0;
      
      // Then, stop the clock.
      #5000 nfpclk_or_clk = 0;
      
      // Strobe the uStep switch
      #2000 fpclk = 1;
      #1000 fpclk = 0;
      for (i = 0; i < 40; i = i + 1) begin
	 #(200 + ($urandom % 550)) fpclk = 1;
	 #(200 + ($urandom % 550)) fpclk = 0;
      end

      // Change the clock speed to the slow clock and wait a LOT
      #1000 nfpclk_or_clk=0;
      #1000 nfpclk_or_clk = 1;
      #10000 nfpclk_or_clk = 0;

      #1000 nfpclk_or_clk=0;
      #10000 nfpclk_or_clk = 1;

      #10000 $finish;
      
   end // initial begin

   assign nreset_real = nreset;
   
   // The slow clock vibrator
   reset_logic reset_logic(.nreset(nreset_real), .nrsthold(nrsthold), .clk3(clk3), .fpreset(1'b1), .powerok(1'b1));
   clock clock (.fpclk(fpclk), .nfpclk_or_clk(nfpclk_or_clk), .nreset(nreset_real),
		.clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .t34(t34), .wstb(wstb));
   
endmodule // triclock_tb
