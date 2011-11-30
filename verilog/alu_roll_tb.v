`include "alu.v"
`timescale 1ns/10ps

module alu_roll_tb();
   reg [15:0] a;
   reg [2:0]  op;
   reg 	      enable;
   reg 	      l;
	      
   wire [15:0] y;
   wire        l_out;

   integer    i;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_roll_tb.vcd");
      $display ("time\t EN OP LA                LY");	
      $monitor ("%g\t   %b  %b %b%b               %b%b", 
		$time, enable, op, l, a, y, l_out);
      $dumpvars (0, alu_roll_tb);

      enable = 1;
      op = 0;

      l = 0;
      a = 16'b1111110000010001;

      #50 enable = 0;
      #100 op = 1;
      #100 op = 2;
      #100 op = 3;
      #200 l = 1;
      op = 0;
      #100 op = 1;
      #100 op = 2;
      #100 op = 3;

      a = 8;
      l = 0;
      op = 0;
      #100 op = 1;
      #100 op = 2;
      #100 op = 3;
      #200 l = 1;
      op = 0;
      #100 op = 1;
      #100 op = 2;
      #100 op = 3;

      #200 $finish;      // Terminate simulation
   end

   alu_roll_unit roll_unit (a, l, enable, op, y, l_out);

endmodule
