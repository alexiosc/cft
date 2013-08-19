`include "comparator.v"
`timescale 1ns/10ps

module comparator_85_tb();

// Declare inputs as regs and outputs as wires
   reg [3:0] a, b;
   reg 	     en;

   reg 	     ieq, ilt, igt;
   wire	     oeq, olt, ogt;
   wire [2:0] n;

   integer    i, j, k;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/comparator_85_tb.vcd");
      $dumpvars (0, comparator_85_tb);

      ilt = 0;
      ieq = 0;
      igt = 0;
      a = 0;
      b =0;

      for (k = 0 ; k < 4; k = k + 1) begin
	 #500
	       ilt = k == 1 ? 1'b1 : 1'b0;
	       ieq = k == 2 ? 1'b1 : 1'b0;
	       igt = k == 3 ? 1'b1 : 1'b0;
	 for (i = 0; i < 16; i = i + 1) begin
	    for (j = 0; j < 16; j = j + 1) begin
	       #100 a = i; b = j;
	    end
	 end
      end // for (k = 0 ; k < 4; k = k + 1)

      #200 $finish;      // Terminate simulation
   end

   assign n = olt + oeq + ogt;

   // Connect DUT to test bench
   comparator_85 comparator (a, b, ilt, ieq, igt, olt, oeq, ogt);

endmodule
