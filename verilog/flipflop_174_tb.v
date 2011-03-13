`timescale 1ns/10ps
`include "flipflop.v"

module flipflop_174_tb();

// Declare inputs as regs and outputs as wires
   reg [5:0]  d;
   reg 	      clk, rst;
   wire [5:0] q;
   integer i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t clk rst d q");	
      $monitor ("%g\t %b %b %b %b", 
		$time, clk, rst, d, q);
      $dumpfile ("flipflop_174_tb.vcd");
      $dumpvars (0, flipflop_174_tb);

      clk = 0;
      d = 0;
      rst = 1;

      #30 d = 6'b111111;
      #30 rst = 0;
      #15 rst = 1;
      #30 d = 6'b111000;
      #60 d = 6'b000111;

      #100 $finish;      // Terminate simulation
   end

   always begin
      #11 clk = ~clk;
   end
   
   // Connect DUT to test bench
   flipflop_174 flipflop (d, q, clk, rst);

endmodule

// End of file.
