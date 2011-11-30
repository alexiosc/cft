`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_112_tb();

// Declare inputs as regs and outputs as wires
   reg j, k, clk, set, rst;
   wire q, qn;
   integer i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t j k c s r q Q");	
      $monitor ("%g\t %b %b %b %b %b %b %b", 
		$time, j, k, clk, set, rst, q, qn);
      $dumpfile ("vcd/flipflop_112_tb.vcd");
      $dumpvars (0, flipflop_112_tb);


      clk = 0;
      j = 0;
      k = 0;
      set = 1;
      rst = 1;

      #30 set = 0;
      #15 set = 1;
      #30 rst = 0;
      #15 rst = 1;
      #30 j = 1;
      #60 j = 0;
      #30 k = 1;
      #60 k = 0;

      #30 j = 1;
      k = 1;

      #100 k = 0;

      #100 $finish;      // Terminate simulation
   end

   always begin
      #11 clk = ~clk;
   end
   
   // Connect DUT to test bench
   flipflop_112h flipflop (j, k, clk, set, rst, q, qn);

endmodule
