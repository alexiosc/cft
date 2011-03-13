`include "register.v"

`timescale 10ns/10ps
module register_reg_L_tb();

// Declare inputs as regs and outputs as wires
   reg d;
   reg latch;		// Clocks in data on rising edge
   reg clear;
   reg toggle1, toggle2;
   reg clock;
   reg reset;

   wire q, nq;
   
   // Initialize all variables
   initial begin        
      $display ("time\t d latch toggle1 toggle2 clock clear reset q nq");
      $monitor ("%g\t  %b %b %b %b %b %b b %b %b %b", 
		$time, d, latch, toggle1, toggle2, clock, clear, reset, q, nq);
      $dumpfile ("register_reg_L_tb.vcd");
      $dumpvars (0, register_reg_L_tb);

      d = 0;
      latch = 0;
      clock = 0;
      clear = 1;
      reset = 1;

      #100 reset = 0;
      #100 reset = 1;

      #100 toggle1 = 1;
      #100 toggle1 = 0;

      #100 toggle2 = 1;
      #100 toggle2 = 0;

      #100 toggle1 = 1;
      #100 toggle1 = 0;

      #100 toggle2 = 1;
      #100 toggle2 = 0;

      #100 d = 1;
      #100 latch = 1;
      #100 latch = 0;

      #100 clear = 0;
      #100 clear = 1;

      #100 d = 1;
      #100 latch = 1;
      #100 latch = 0;

      #100 d = 0;
      #100 latch = 1;
      #100 latch = 0;

      #100 d = 0;
      #100 latch = 1;
      #100 latch = 0;

      #100 d = 1;
      #100 latch = 1;
      #100 latch = 0;

      // Changes in D shouldn't do anything without latching.

      #100 d = 1;
      #100 latch = 1;
      #100 latch = 0;

      #100 d = 1;
      latch = 0;
      #100 d = 0;
      #100 d = 1;
      #100 d = 0;


      #100 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #63 clock = ~clock;
   end

   reg_L register (d, latch, clear, toggle1, toggle2, clock, reset, q, nq);
endmodule
