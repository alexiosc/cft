`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_273_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] d;
   reg 	     clk;
   reg 	     clr;

   wire [7:0] q;

   integer    i;
   
   // Initialize all variables
   initial begin        
      //$display ("time\t oe clk d        q");	
      //$monitor ("%g\t %b %b %b %b", 
      //	$time, oe, clk, d, q);
      $dumpfile ("vcd/flipflop_273_tb.vcd");
      $dumpvars (0, flipflop_273_tb);

      clr = 1;
      clk = 0;
      d = 0;

      #100 clr = 0;
      #150 clr = 1;
      
      for (i = 0; i < 256; i = i + 1) begin
	 #150 d = i;
      end
      
      #100 d = 1;
      #200 d = 2;
      #300 d = 4;
      #400 d = 8;

      #900 $finish;      // Terminate simulation
   end

   always begin
      #100 clk = ~clk;
   end
   
   always begin
      #1050 clr = 0;
      #200 clr = 1;
   end
   
   // Connect DUT to test bench
   flipflop_273 flipflop (d, q, clk, clr);

endmodule
