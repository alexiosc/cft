`include "flipflop.v"
`include "clock.v"
`include "vibrator.v"

`timescale 1ns/10ps

module clock_tb();


   reg fpclken;
   reg fpustep;
   reg nreset;
   reg fpfast, fpslow;

   reg xstart;
   
   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, nguard;

   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/clock_tb.vcd");
      $dumpvars (0, clock_tb);
      
      nreset = 0;
      xstart = 1;
      
      // Start off with the front panel disconnected
      fpclken = 1'b1;
      fpustep = 1'bz;
      fpfast = 1'bz;
      fpslow = 1'bz;
      
      #50 nreset = 1;

      #1070 xstart = 0;
      #100 xstart = 1;

      #1070 xstart = 0;
      #100 xstart = 1;
      #50 xstart = 0;
      #1000 xstart = 1;

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
      for (i = 0; i < 40; i = i + 1) begin
	 #(10000 + ($random % 4000) - 2000) fpustep = 1;
	 #(10000 + ($random % 4000) - 2000) fpustep = 0;
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
   
   // The slow clock vibrator
   slow_clock_generator slow_clocks (slowclk, testclk);
   clock_generator clock_generator (fpclken, fpustep,
				    nreset,
				    slowclk, testclk,
				    fpfast, fpslow,
				    clk1, clk2, clk3, clk4, , nt34);
   // This is an experiment
   // wire xffq, xffnq, xff2d, xffq2, xffnq2, xffq3, xffnq3;
   // flipflop_74h xff1 (0, clk1, xstart, nreset, xffq, xffnq);
   // wire nxffnq;
   // not #8 (nxffnq, xffnq);

   // flipflop_74h xff2 (nxffnq, clk1, xstart, nreset, xffq2, xffnq2);
   // wire nxffnq2;
   // not #8 (nxffnq2, xffnq2);
   // flipflop_74h xff3 (nxffnq2, clk1, xstart, nreset, xffq3, xffnq3);

   // wire [5:0] xtmp;
   // flipflop_174 xff4 ({xtmp[4:0], 1'b1}, xtmp, clk1, xstart & nreset);

   wire clk8;


   assign clk8 = clk1 & clk3;
   
endmodule // triclock_tb
