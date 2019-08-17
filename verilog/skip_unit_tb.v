`include "skip_unit.v"

`timescale 1ns/10ps


module skip_unit_tb();
   reg 	       clk4, nreset;
   reg [15:0]  ir;
   reg [4:0]   cond;
   reg 	       fn, fz, fl, fv;
   wire        nskip;
   reg 	       nskipext;

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/skip_unit_tb.vcd");
      $dumpvars (0, skip_unit_tb);
      $monitor ("%g\t %b %b %b %b %b %b %b %b %b", 
		$time, clk4, ir, cond, fn, fz, fl, fv, nskipext, nskip);

      clk4 = 0;
      ir = 0;
      cond = 0;
      fn = 0;
      fz = 0;
      fl = 0;
      fv = 0;
      
      // Reset
      nreset = 0;
      nskipext = 1;
      #5000 nreset = 1;

      // Try nskipext first
      #1000 nskipext = 0;
      ir = 16'b1101_0_0_111111_1111; // OP2
      for (i = 0 ; i < 32; i = i + 1) begin
	 #1000 cond = i;
	 #500 begin
	    fv = 1;
	    fl = 1;
	    fz = 1;
	    fn = 1;
	 end;
	 #500 begin
	    fv = 0;
	    fl = 0;
	    fz = 0;
	    fn = 0;
	 end;
      end
      #2000 nskipext = 1;
      #10000;

      // Exercise flag-based skips
      cond = 5'b01111;
      for (i = 0 ; i < 32; i = i + 1) begin
	 #1000 ir = 16'b1101_0_0_000000_XXXX; // OP2
	 ir[4:0] = i;

	 for (j = 0 ; j < 16; j = j + 1) begin
	    #250 fv = (j & 1) != 0;
	    fl = (j & 2) != 0;
	    fz = (j & 4) != 0;
	    fn = (j & 8) != 0;
	 end
	 #250 ir = 0;
	 fv = 0;
	 fl = 0;
	 fz = 0;
	 fn = 0;
      end // for (i = 0 ; i < 32; i = i + 1)

      // // Test out the IS_ROLL skip
      // #16000 cond = 5'b01110;
      // ir = 0;

      // for (i = 0; i < 8; i = i + 1) begin
      // 	 #4000 ir = 16'b1100_0_0_0000000_XXX; // OP1
      // 	 ir[3:0] = i;
      // end

      // Test microcode flag skips.
      #10000 cond = 5'b00000;
      ir = 0;

      for (i = 10 ; i <= 13; i = i + 1) begin
	 #1000 cond = i;

	 for (j = 0 ; j < 16; j = j + 1) begin
	    #250 fv = (j & 1) != 0;
	    fl = (j & 2) != 0;
	    fz = (j & 4) != 0;
	    fn = (j & 8) != 0;
	 end
	 #250 ir = 0;
	 fv = 0;
	 fl = 0;
	 fz = 0;
	 fn = 0;
      end // for (i = 10 ; i <= 13; i = i + 1)

      // Test the IR bits checks (for microcoded instructions)
      #10000 cond = 0;
      ir = 0;
      for (i = 1; i <= 7; i = i + 1) begin
	 #4000 cond = i;
	 #1000 ir = 1023;
	 #1000 ir = 1 << (i + 2);
	 #1000 ir = 0;
      end

      #10000 cond = 0;
      #2000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk4 = ~clk4;
   end
      
   skip_unit sbl(.clk4(clk4), .nreset(nreset),
		 .ir(ir[6:0]), .cond(cond), .fn(fn), .fz(fz), .fl(fl), .fv(fv),
		 .nskip(nskip), .nskipext(nskipext));

endmodule // skip_unit_tb

// End of file.
