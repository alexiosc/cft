`include "counter.v"

`timescale 1ns/10ps

module counter_393_tb();

// Declare inputs as regs and outputs as wires

   wire [3:0] q, q1;
   wire rco, rco1;

   reg 	clr, clk;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_393h_tb.vcd");
      $dumpvars (0, counter_393_tb);

      clk = 0;
      clr = 1;

      #1000 clr = 0;
      #1000 clr = 1;
      
      #12500 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
   end

   // Connect DUT to test bench
   counter_393h c (clk, clr, q);

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
