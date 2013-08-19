`include "comparator.v"
`timescale 1ns/10ps

module comparator_688_tb();

// Declare inputs as regs and outputs as wires
   reg [7:0] a, b;
   reg 	     en;

   wire      equal;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/comparator_688_tb.vcd");
      $dumpvars (0, comparator_688_tb);


      en = 1;
      a = 0;
      b = 100;
      
      #200 a = 1;
      #200 a = 2;
      #200 a = 3;
      #200 a = 4;
      #200 a = 50;
      #200 a = 100;
      #200 a = 150;
      #200 a = 200;
      #200 a = 250;

      en = 0;

      #200 a = 1;
      #200 a = 2;
      #200 a = 3;
      #200 a = 4;
      #200 a = 50;
      #200 a = 100;
      #50 en = 1;
      #50 en = 0;
      #50 en = 1;
      #50 en = 0;
      
      #200 a = 150;
      #200 a = 200;
      #200 a = 250;

      #200 b = 1;
      #200 b = 2;
      #200 b = 3;
      #200 b = 4;
      #200 b = 50;
      #200 b = 100;
      #200 b = 150;
      #200 b = 200;
      #200 b = 250;

      #200 $finish;      // Terminate simulation
   end

   // Connect DUT to test bench
   comparator_688 comparator (a, b, en, equal);

endmodule
