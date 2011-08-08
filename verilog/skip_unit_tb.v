`include "skip_unit.v"

`timescale 1ns/10ps


module skip_unit_tb();
   reg [9:0]  ir;
   reg [3:0]  sel;
   reg 	      z, n, l;

   wire       skip;
   reg        test_branch;
   
   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/skip_unit_tb.vcd");
      $display ("time\t IR[9:0]    SEL  Z N L SKIP");
      $monitor ("%g\t   %b        %b   %b %b %b %b",
		$time, ir, sel, z, n, l, skip);
      $dumpvars (0, skip_unit_tb);
      
      z = 0;
      n = 0;
      l = 0;
      test_branch = 0;
      
      for (j = 0; j <= 15; j = j + 1) begin
	 #500 sel = j;
	 for (i = 1; i <= 512; i = i << 1) begin
	    #100 ir = i;
	 end
      end

      // Test branch logic.
      
      #500 sel = 15;
      test_branch = 1;
      n = 0;
      z = 0;
      l = 0;
      ir = 0;

      // Play with the flags.
      for (j = 0; j < 8; j = j + 1) begin
	 n = j & 4 ? 1 : 0;
	 z = j & 2 ? 1 : 0;
	 l = j & 1 ? 1 : 0;

	 for (i = 0; i < 16; i = i + 1) begin
	    #100 ir = i;
	 end
      end
	
      #10000 $finish;      // Terminate simulataaa   skip_unit_unit add_unit (a, b, enable, y, l);
   end
      
   skip_unit foo(sel, ir, z, n, l, 0, skip);

endmodule // skip_unit_tb

// End of file.
