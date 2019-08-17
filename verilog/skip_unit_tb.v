`include "skip_unit.v"

`timescale 1ns/10ps


module skip_unit_tb();
   reg 	       clk1, nreset;
   reg [15:0]  ir;
   reg [3:0]   opif;
   reg 	       fneg, fzero, fl, fv;

   wire        nskip;

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/skip_unit_tb.vcd");
      $dumpvars (0, skip_unit_tb);

      clk1 = 0;
      ir = 0;
      opif = 0;
      fneg = 0;
      fzero = 0;
      fl = 0;
      fv = 0;
      
      // Reset
      nreset = 0;
      #1000 nreset = 1;

      // Exercise flag-based skips
      opif = 15;
      for (i = 0 ; i < 32; i = i + 1) begin
	 #4000 ir = 16'b1101_0_0_000000_XXXX; // OP2
	 ir[4:0] = i;

	 for (j = 0 ; j < 16; j = j + 1) begin
	    #250 fv = (j & 1) != 0;
	    fl = (j & 2) != 0;
	    fzero = (j & 4) != 0;
	    fneg = (j & 8) != 0;
	 end
	 #250 ir = 0;
	 fv = 0;
	 fl = 0;
	 fzero = 0;
	 fneg = 0;
      end // for (i = 0 ; i < 32; i = i + 1)

      // Test out the IS_ROLL skip
      #16000 opif = 4'b1110;
      ir = 0;

      for (i = 0; i < 8; i = i + 1) begin
	 #4000 ir = 16'b1100_0_0_0000000_XXX; // OP1
	 ir[3:0] = i;
      end

      // Test microcode flag skips.
      #16000 opif = 10;
      ir = 0;

      for (i = 10 ; i <= 13; i = i + 1) begin
	 #4000 opif = i;

	 for (j = 0 ; j < 16; j = j + 1) begin
	    #250 fv = (j & 1) != 0;
	    fl = (j & 2) != 0;
	    fzero = (j & 4) != 0;
	    fneg = (j & 8) != 0;
	 end
	 #250 ir = 0;
	 fv = 0;
	 fl = 0;
	 fzero = 0;
	 fneg = 0;
      end // for (i = 10 ; i <= 13; i = i + 1)

      // Test the IR bits checks (for microcoded instructions)
      #16000 opif = 0;
      ir = 0;
      for (i = 1; i <= 7; i = i + 1) begin
	 #4000 opif = i;
	 #1000 ir = 1023;
	 #1000 ir = 1 << (i + 2);
	 #1000 ir = 0;
      end

      #16000 opif = 0;
      #200000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk1 = ~clk1;
   end
      
   skip_unit su(clk1, nreset,
		ir, opif, fneg, fzero, fl, fv,
		nskip);

endmodule // skip_unit_tb

// End of file.
