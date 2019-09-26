`include "flipflop.v"
`include "clock.v"
`include "vibrator.v"
`include "counter.v"
`include "dfp_step.v"

`timescale 1ns/10ps

module step_tb();


   reg fpclken;
   reg fpustep;
   reg nreset;
   reg fpfast, fpslow;

   wire testclk, slowclk;
   wire clk1, clk2, clk3, clk4, nt12, nt34;
   wire nhalt;
   
   integer i;
      
   initial begin
      
      //$display ("time\t d pulse");
      //$monitor ("%g\t  %b %b %b %b", 
      // 	       $time, d, pulse1, pulse2, pulse);
      $dumpfile ("vcd/step_tb.vcd");
      $dumpvars (0, step_tb);
      
      nreset = 0;
      
      // Start off with the front panel disconnected
      fpclken = 1'b1;
      fpustep = 0;
      fpfast = 1'bz;
      fpslow = 1'bz;
      fpclken = 1;

      #50 nreset = 1;

      // Step
      #2000 fpustep = 1;
      #2000 fpustep = 0;
      
      // Let it run a while, then connect the front panel.
      //fpustep = 0;
      //fpfast = 1;
      //fpslow = 0;

      // Then, stop the clock.
      // #5000 fpclken = 0;
      
      // // Strobe the uStep switch
      // #2000 fpustep = 1;
      // #1000 fpustep = 0;
      // for (i = 0; i < 20; i = i + 1) begin
      // 	 #(1000 + ($random % 400) - 200) fpustep = 1;
      // 	 #(1000 + ($random % 400) - 200) fpustep = 0;
      // end
      
      #10000 $finish;
      
   end // initial begin
   
   slow_clock_generator slow_clocks (slowclk, testclk);
   clock_generator clock_generator (fpclken, fpustep,
				    nreset,
				    slowclk, testclk,
				    fpfast, fpslow,
				    clk1, clk2, clk3, clk4, nt12, nt34);

   step_sequencer step_sequencer (clock_generator.rawclk,
				  clk1, clk2, clk3, clk4, fpustep, nreset, nhalt);


   wire [3:0] q1;
   not #6 (nrawclk, clock_generator.rawclk);
   //counter_590 c1(nrawclk, 0, nreset, clock_generator.rawclk, 1'b0, q1, );
   
   
endmodule // step_tb
