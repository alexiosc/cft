`include "buffer.v"
`timescale 1ns/10ps

module buffer_541_tb();
   reg 	      oe1, oe2;
   reg [7:0]  a;

   wire [7:0] y;

   integer    i, j;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe1 oe2 a y");	
      $monitor ("%g\t %b %b %b %b", $time, oe1, oe2, a, y);
      $dumpfile ("vcd/buffer_541_tb.vcd");
      $dumpvars (0, buffer_541_tb);

      for (j = 0; j < 4; j = j + 1) begin
	 oe1 = j[0];
	 oe2 = j[1];

	 for (i = 0; i < 256; i = i + 1) begin
	    #50 a = i;
	 end

	 #500;
      end
      
      #1000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_541 buffer (.oe1(oe1), .oe2(oe2), .a(a), .y(y));
endmodule // buffer_541_tb

// End of file.
