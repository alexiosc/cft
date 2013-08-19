`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_74_tb();

// Declare inputs as regs and outputs as wires
   reg d, clk, set, rst;
   wire q, qn;
   integer i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t d c s r q Q");	
      $monitor ("%g\t %b %b %b %b %b %b", 
		$time, d, clk, set, rst, q, qn);
      $dumpfile ("vcd/flipflop_74_tb.vcd");
      $dumpvars (0, flipflop_74_tb);


      clk = 0;
      d = 0;
      set = 1;
      rst = 1;

      #100 d = 1;
      #100 d = 0;
      
      /*
      #90 set = 0;
      d = 1;
      #45 set = 1;
      #90 rst = 0;
      #45 rst = 1;
      #90 d = 1;
      #180 d = 0;
      #90 d = 1;
      #180 d = 0;

      #900 d = 1;

      #450 rst = 1;
      #450 rst = 0;

      #1500 d = 0;
       */

      

      #300 $finish;      // Terminate simulation
   end

   always begin
      #33 clk = ~clk;
   end
   
   // Connect DUT to test bench
   flipflop_74h flipflop (d, clk, set, qn, q, qn);

endmodule
