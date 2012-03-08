`include "flipflop.v"
`include "clock.v"
`include "vibrator.v"

`timescale 1ns/10ps

module clock_tb();


   reg fpclken;
   reg fpustep;
   reg nreset;
   reg fpfast, fpslow;

   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, clk5, nguard;

   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      nreset = 0;
      
      // Start off with the front panel disconnected
      fpclken = 1'b1;
      fpustep = 1'bz;
      fpfast = 1'bz;
      fpslow = 1'bz;
      
      #50 nreset = 1;
      
      // Let it run a while, then connect the front panel.
      #5000 fpclken = 1;
      fpustep = 0;
      fpfast = 1;
      fpslow = 0;
      
      // Then, stop the clock.
      #5000 fpclken = 0;
      
      // Strobe the uStep switch
      #2000 fpustep = 1;
      #1000 fpustep = 0;
      for (i = 0; i < 20; i = i + 1) begin
	 #(1000 + ($random % 400) - 200) fpustep = 1;
	 #(1000 + ($random % 400) - 200) fpustep = 0;
      end

      // Change the clock speed to the slow clock and wait a LOT
      #1000 fpclken=0;
      #1000 fpfast=0;
      #1000 fpslow=0;
      #1000 fpclken = 1;
      #10000000 fpclken = 0;

      #1000 fpclken=0;
      #1000 fpfast=0;
      #1000 fpslow=1;
      #100000 fpclken = 1;

      
      #10000000 $finish;
      
   end // initial begin
   
   // The slow clock vibrator (
   slow_clock_generator slow_clocks (slowclk, testclk);
   clock_generator clock_generator (fpclken, fpustep,
				    nreset,
				    slowclk, testclk,
				    fpfast, fpslow,
				    clk1, clk2, clk3, clk4, clk5, nguard);
   
endmodule // triclock_tb
