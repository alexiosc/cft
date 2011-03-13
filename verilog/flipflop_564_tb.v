`timescale 1ns/10ps
`include "flipflop.v"

module flipflop_564_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] d;
   reg 	     clk;
   reg 	     oe;

   wire [7:0] q;

   // Initialize all variables
   initial begin        
      $display ("time\t oe clk d        q");	
      $monitor ("%g\t %b %b %b %b", 
		$time, oe, clk, d, q);
      $dumpfile ("out.vcd");
      $dumpvars (0, flipflop_564_tb);

      oe = 1;
      clk = 0;
      d = 0;
      
      #15 oe = 0;
      #100 d = 1;
      #200 d = 2;
      #300 d = 4;
      #400 d = 8;
      #800 oe = 1;

      #900 $finish;      // Terminate simulation
   end

   always begin
      #30 clk = ~clk;
   end
   
   // Connect DUT to test bench
   flipflop_564 flipflop (d, q, clk, oe);

endmodule
