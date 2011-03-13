`timescale 1ns/10ps
`include "alu_181.v"

module alu_181_tb();

   reg [3:0] A, B, S;
   reg 	     CNb, M; 
   wire [3:0] F;
   wire       AEB, X, Y, CN4b;

   integer    i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("alu_181_tb.vcd");
      $display ("time\t A    B    S    CNb M F    AEB X Y CN4b");	
      $monitor ("%g\t %b %b %b   %b %b %b %b", 
		$time, A, B, S, CNb, M, F, AEB, X, Y, CN4b);
      $dumpvars (0, alu_181_tb);

      A = 0;
      B = 0;
      S = 0;
      M = 0;
      CNb = 1;

      #20 S = 1;
      #20 A = 3;
      #20 B = 4;
      #20 B = 5;

      #20 S = 1;
      #20 S = 2;
      #20 S = 3;
      #20 S = 4;
      #20 S = 5;
      #20 S = 6;
      #20 S = 7;
      #20 S = 8;
      #20 S = 9;
      

      #50 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   Circuit74181b alu (S, A, B, M, CNb, F, X, Y, CN4b, AEB);

endmodule
