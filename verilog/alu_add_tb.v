`timescale 1ns/10ps
`include "alu.v"

module alu_add_tb();
   reg [15:0]  a, b;
   reg 	       enable;
	      
   wire [15:0] y;
   wire        l;

   integer     i, j;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("alu_add_tb.vcd");
      $display ("time\t EN A                B                L Y");
      $monitor ("%g\t   %b  %b %b %b %b", 
		$time, enable, a, b, l, y);
      $dumpvars (0, alu_add_tb);

      enable = 1;
      a = 0;
      b = 0;
      #500 enable = 0;

      for (i = 16'hfffe; i < 16'hffff; i = i + 1) begin
	 for (j = 0; j < 20; j = j + 1) begin
	    #200 a = i;
	    b = j;
	 end
      end

      #200 $finish;      // Terminate simulation
   end

   alu_add_unit add_unit (a, b, enable, y, l);

endmodule // alu_add_tb

// End of file.
