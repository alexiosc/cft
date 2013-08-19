`include "flipflop.v"
`timescale 1ns/10ps

module latch_373_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] d;
   reg 	     oc, enc;

   wire [7:0] q;

   integer    i;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/latch_373_tb.vcd");
      $dumpvars (0, latch_373_tb);

      enc = 1;
      oc = 1;
      d = 0;

      #2000 oc = 0;

      for (i = 0; i < 256 ; i = i + 1) begin
	 #100 d = i;
      end

      #2000 $finish;      // Terminate simulation
   end

   always begin
      #2000 enc = ~enc;
   end

   latch_373 latch (d, oc, enc, q);
endmodule
