`include "vibrator.v"
`timescale 1ns/10ps

module vibrator_555_tb();
   wire       q1;
   wire       q2;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/vibrator_555_tb.vcd");
      $dumpvars (0, vibrator_555_tb);

      #2000 $finish;      // Terminate simulation
   end

   vibrator_555 #(50,50) vibrator1 (q1);
   vibrator_555 #(90,270) vibrator2 (q2);
   
endmodule // vibrator_555_tb

// End of file.
