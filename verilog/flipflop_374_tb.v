`include "flipflop.v"
`timescale 1ns/10ps

module flipflop_374_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0]  d;
   reg 	      oc;
   reg 	      clk;

   wire [7:0] q;

   integer    i;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/flipflop_374_tb.vcd");
      $dumpvars (0, flipflop_374_tb);

      d = 0;
      oc = 0;
      clk = 1;

      for (i = 0; i < 256; i = i + 1) begin
	 #500 d = i;
      end
      
      #2000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
   end
   
   always begin
      #350 oc = ~oc;
   end
   
   // Connect DUT to test bench
   flipflop_374 ff (d, oc, clk, q);

endmodule
