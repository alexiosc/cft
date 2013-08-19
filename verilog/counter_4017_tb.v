`include "counter.v"

`timescale 1ns/10ps

module counter_4017_tb();

// Declare inputs as regs and outputs as wires

   reg clk, nclken, clear;

   wire [9:0] q;
   wire       co;

   integer i;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/counter_4017_tb.vcd");
      $dumpvars (0, counter_4017_tb);

      clk = 0;
      nclken = 1; 
      clear = 1;

      #1000 clear = 0;
      #1000 nclken = 0;

      #1000 nclken = 1;
      #1000 nclken = 0;

      #2000 clear = 1;
      #2000 clear = 0;
      
      #15000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
   end

   // Connect DUT to test bench
   //counter_4017 c (clk, nclken, clear, q, co);
   counter_4017 c (clk, q[9], clear, q, co);
   wire pulse5;
   
   assign pulse5 = q[0] | q[2] | q[4] | q[6] | q[8];


endmodule
