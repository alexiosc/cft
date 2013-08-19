`include "serial.v"
`timescale 1ns/10ps

module shiftreg_164_tb();

   reg a, b, clk, clr;
   wire [7:0] q;

   integer    i, x;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/shiftreg_164_tb.vcd");
      $dumpvars (0, shiftreg_164_tb);

      a = 0;
      b = 0;
      clk = 0;
      clr = 1;

      #100 clr = 0;
      #100 clr = 1;
      #200 a = 0;
      b = 1;
	
      for (i = 0; i < 6; i = i + 1) begin
	 #100 clk = ~clk;
      end

      a = 1;
      b = 1;
      
      for (i = 0; i < 16; i = i + 1) begin
	 #100 clk = ~clk;
      end

      a = 0;
      b = 0;
      
      for (i = 0; i < 8; i = i + 1) begin
	 #100 clk = ~clk;
      end

      #100 clr = 0;

      #200
      
      a = 1;
      b = 1;
      
      for (i = 0; i < 16; i = i + 1) begin
	 #100 clk = ~clk;
      end

      #2000 $finish;      // Terminate simulation
   end

   always begin
      #125 clk = ~clk;
   end
   
   // Connect DUT to test bench
   shiftreg_164 ff (a, b, clk, clr, q);

endmodule
