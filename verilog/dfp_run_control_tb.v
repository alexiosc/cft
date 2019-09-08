//
// REDESIGNED IN 2019
//

`include "clock.v"
`include "dfp_run_control.v"

`timescale 1ns/10ps


module dfp_run_control_tb();
   reg fpclken_in;

   wire fpustep_in;

   integer n, i;
   
   initial begin        
      $dumpfile ("vcd/dfp_run_control_tb.vcd");
      $dumpvars (0, dfp_run_control_tb);

      //$monitor ("%g\t %b %b %b %b %b", $time, waddr, raddr, ir[11:0] , ibus[7:0], dfp_run_control.sel);

      n = 0;
      nreset = 0;
      nrsthold = 0;
      nclr = 0;
      step_nrun = 1;
      nustep = 1;

      #250 nreset = 1;
      #2000 nrsthold = 1;
      
      #250 nclr = 1;

      step_nrun = 0;
      fpclken_in = 0;

      // Enable fast clock
      #40000 fpclken_in = 1;

      // Now request a stop.
      #1000 step_nrun = 1;

      // Request a single step.
      // clock first)
      for (i = 0; i < 10; i = i + 1) begin
	 #2200 step_nrun = 0;
	 #10 step_nrun = 1;
      end

      // Request some microsteps
      #5000 for (i = 0; i < 10; i = i + 1) begin
	 #2200 nustep = 0;
	 #10 nustep = 1;
      end

      // Try the clear function
      #5000 step_nrun = 0;
      #10 step_nrun = 1;
      #1000 nclr = 0;
      #1000 nclr = 1;

      // Finarlly, Go back to the fast clock again.
      #5000 fpclken_in = 1;
      step_nrun = 1;

      // Try resetting (this should assert WAIT)
      #5000 nreset = 0;
      nrsthold = 0;
      #250 nreset = 1;
      #2000 nrsthold = 1;

      // Set to run again (so nwait deasserts)
      #5000 step_nrun = 0;

      #10000 $finish;

   end

   // Simulate a DFP slow clock and the fetch/#exec signal
   reg fpclk;
   initial begin
      fpclk = 0;
   end
   always begin
      #300 fpclk = ~fpclk;
   end
   assign fpustep_in = fpclk;

   always @(posedge clk4) begin
      n = (n + 1) % 5;
      fpfetch_nexec = (n < 2);
   end

   reg nreset;
   reg nrsthold;
   reg step_nrun;
   reg fpfetch_nexec;
   reg nclr;
   reg nustep;
   wire fpclken_out;
   wire fpustep_out;

   // Instantiate DUT.
   wire clk4;
   dfp_run_control dfp_run_control (.nreset(nreset), .nrsthold(nrsthold), .clk4(clk4),
				    .step_nrun(step_nrun), .fpfetch_nexec(fpfetch_nexec), .nclr(nclr), .nustep(nustep),
				    .fpclken_in(fpclken_in), .fpustep_in(fpustep_in),
				    .fpclken_out(fpclken_out), .fpustep_out(fpustep_out),
				    .nwait(nwait));
   

   // Instantiate the clock generator for verification, and also because its clk4 output feeds back to us.
   clock_generator clock(.nreset(nreset), .fpclk(fpustep_out), .nfpclk_or_clk(fpclken_out),
			.clk4(clk4));


endmodule // dfp_run_control_tb


// End of file.
