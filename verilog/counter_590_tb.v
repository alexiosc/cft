`timescale 1ns/10ps
`include "counter.v"

module counter_590_tb();

// Declare inputs as regs and outputs as wires

   reg clk, ccken, cclr, rck, g;

   wire [7:0] q;
   wire rco;

   integer i;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_590_tb.vcd");
      $dumpvars (0, counter_590_tb);

      clk = 0;
      ccken = 1;
      g = 1;
      rck = 0;

      #1000 cclr = 0;
      #1000 cclr = 1;
      #100 g = 0;
      #100 ccken = 0;
      #1000 g = 1;
      #1000 g = 0;
      #1000 ccken = 1;
      #1000 ccken = 0;
      
      #50000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
      rck = ~rck;
   end

   // Connect DUT to test bench
   counter_590 c0 (clk, ccken, cclr, rck, g, q, rco);

   // Ripple counting.
   //not u0 (cet_in1, tc_out0);
   //not u1 (cet_in2, tc_out1);
   //not u2 (cet_in3, tc_out2);

endmodule
