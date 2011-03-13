`include "register.v"

`timescale 10ns/10ps
module register_reg_I_tb();

// Declare inputs as regs and outputs as wires
   reg clear;
   reg toggle;
   reg clock;
   reg reset;

   wire q, nq;
   
   // Initialize all variables
   initial begin        
      $display ("time\t clear toggle clock reset q nq");
      $monitor ("%g\t  %b %b %b %b %b %b", 
		$time, clear, toggle, clock, reset, q, nq);
      $dumpfile ("register_reg_I_tb.vcd");
      $dumpvars (0, register_reg_I_tb);

      clear = 0;
      clock = 0;
      reset = 1;

      #100 reset = 0;
      #100 reset = 1;

      #100 toggle = 1;
      #100 toggle = 0;

      #100 toggle = 1;
      #100 toggle = 0;

      #100 toggle = 1;
      #100 toggle = 0;

      #100 toggle = 1;
      #100 toggle = 0;

      #100 clear = 1;
      #100 clear = 0;

      #100 clear = 1;
      #100 clear = 0;

      #100 toggle = 1;
      #100 toggle = 0;


      #100 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #63 clock = ~clock;
   end

   reg_I register (clear, toggle, clock, reset, q, nq);
endmodule
