`timescale 1ns/10ps
`include "buffer.v"

module buffer_244_tb();
   reg 	      oe1, oe2;
   reg [3:0]  a1, a2;
   
   wire [3:0] y1, y2;
   integer    i;
   

   // Initialize all variables
   initial begin        
      $display ("time\t oe1 a1 y1 oe2 a2 y2");	
      $monitor ("%g\t %b %b %b %b %b %b", 
		$time, oe1, a1, y1, oe2, a2, y2);
      $dumpfile ("buffer_244_tb.vcd");
      $dumpvars (0, buffer_244_tb);

      oe1 = 1;
      oe2 = 1;
      a1 = 4'b1010;
      a2 = 4'b0101;
      
      #20 oe1 = 0;
      #30 oe2 = 0;

      for (i = 0; i < 15; i = i + 1) begin
	 #50 a1 = i;
	 #50 a1 = i;
      end
      
      #1000 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   buffer_244 buffer (oe1, oe2, a1, a2, y1, y2);
endmodule // buffer_244_tb

// End of file.
