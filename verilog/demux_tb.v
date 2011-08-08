`include "demux.v"
`timescale 1ns/10ps

module demux_138_tb();

// Declare inputs as regs and outputs as wires
   reg [2:0]  a;
   reg 	      g1, g2a, g2b;
   wire [7:0] y;

   integer    i;

   // Initialize all variables
   initial begin        
      $display ("time\t g1 g2a g2b a y");	
      $monitor ("%g\t %b %b %b %b %b", 
		$time, g1, g2a, g2b, a, y);
      $dumpfile ("vcd/demux_tb.vcd");
      $dumpvars (0, demux_138_tb);

      g1 = 0;
      g2a = 1;
      g2b = 1;
      a = 0;

      #50 g1 = 0;
      #70 g2a = 0;
      #90 g2b = 0;
      #100 g1 = 1;

      for (i = 0; i < 8; i = i + 1) begin
	 #(100 + (i * 50)) a = i;
      end

      #2000 $finish;      // Terminate simulation
   end
   
   // Connect DUT to test bench
   demux_138 demux (g1, g2a, g2b, a, y);

endmodule
