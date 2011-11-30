`include "register.v"

`timescale 10ns/10ps
module register_inc_reg16_tb();

// Declare inputs as regs and outputs as wires
   reg [15:0]    d;
   reg 	         latch;		// Clocks in data on rising edge
   reg 	         oe;		// OE = 0: output enabled
   reg 	         inc;		// Increments on rising edge
   reg 	         reset;

   output [15:0] q;

   integer i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe latch inc rst d q");
      $monitor ("%g\t  %b     %b   %b   %b %b               %b", 
		$time, oe, latch, inc, reset, d, q);
      $dumpfile ("vcd/register_inc_reg16_tb.vcd");
      $dumpvars (0, register_inc_reg16_tb);

      d = 16'bzzzzzzzzzzzzzzzz;
      #10 latch = 1;
      inc = 1;
      reset = 1;

      #10 oe = 0;

      #20 d = 16'hfefa;
      #10 latch = 0;
      #10 latch = 1;

      #30 for (i = 0; i < 10; i = i + 1) begin
	 #10 inc = 0;
	 #10 inc = 1;
      end

      #30 oe = 1;

      #100 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   inc_reg16 register (d, q, , latch, oe, inc, 1'b1, reset);
endmodule
