`include "vibrator.v"
`timescale 1ns/10ps

module vibrator_123_tb();
   reg 	      a, b, clr;
   wire       q, nq;
   wire       q2, nq2;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/vibrator_123_tb.vcd");
      $dumpvars (0, vibrator_123_tb);

      b = 1;
      clr = 1;
      a = 1'b0;
      
      #220 b = 0;
      #220 b = 1;
      #100 clr = 0;
      #100 clr = 1;

      #200 $finish;      // Terminate simulation
   end

   always begin
      #50 a = ~a;
   end
      
   // Connect DUT to test bench
   vibrator_123h #20 vibrator (a, b, clr, q, nq);
   vibrator_123h #20 vibrator2 (q, 1'b1, clr, q2, nq2);
   
endmodule // vibrator_123_tb

// End of file.
