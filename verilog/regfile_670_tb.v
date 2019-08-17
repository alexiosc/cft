`include "regfile.v"
`timescale 1ns/10ps

module regfile_670_tb();

// Declare inputs as regs and outputs as wires
   reg [3:0] d;
   reg 	     we, re;
   reg [1:0] ra, wa;

   wire [3:0] q;

   reg [3:0] x;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/regfile_670_tb.vcd");
      $dumpvars (0, regfile_670_tb);

      ra = 2'b00;
      re = 1'b1;

      d = 4'b0001;
      #10 wa = 2'b00;
      #10 we = 1'b0;
      #30 we = 1'b1;

      d = 4'b0011;
      #10 wa = 2'b01;
      #10 we = 1'b0;
      #30 we = 1'b1;

      d = 4'b0111;
      #10 wa = 2'b10;
      #10 we = 1'b0;
      #30 we = 1'b1;

      d = 4'b1111;
      #10 wa = 2'b11;
      #10 we = 1'b0;
      #30 we = 1'b1;

      x = 4;
     

      #40000 $finish;      // Terminate simulation
   end

   always begin
      #400 ra = ra + 1;
   end
   
   always begin
      x = x + 1;
      #500 d = x;
      #10 wa = 2'b11;
      #10 we = 1'b0;
      #50 we = 1'b1;
      #10 d = 4'bzzzz;
   end
   
   always begin
      #100 re = ~re;
   end
   
   // Connect DUT to test bench
   regfile_670 regfile (d, re, we, ra, wa, q);

endmodule
