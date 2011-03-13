`include "alu.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb();

// Declare inputs as regs and outputs as wires
   reg [15:0] a, b;
   reg [2:0]  rollop;

   reg 	      e_add, e_and, e_or, e_xor, e_not, e_roll;

   reg clear;
   reg toggle;
   reg clock;
   reg reset;

   wire [15:0] y;
   
   // Initialize all variables
   initial begin        
      $display ("time\t clk la                b                +&|^!> roll +>ly                ");
      $monitor ("%g\t   %b  %b%b %b %b%b%b%b%b%b  %b  %b%b%b%b",
		$time, clock, l_in, a, b, e_add, e_and, e_or, e_xor, e_not, e_roll, rollop, l_latch, add_l_out, roll_l_out, y);
      $dumpfile ("alu_tb.vcd");
      $dumpvars (0, alu_tb);

      clock = 0;
      reset = 0;
      a = 0;
      b = 0;
      e_add = 1;
      e_and = 1;
      e_or = 1;
      e_xor = 1;
      e_not = 1;
      e_roll = 1;
      rollop = 0;
      
      #10 reset = 1;

      // Test addition
      #100 a = 192;
      b = 1500;
      e_add = 0;
      #50 e_add = 1;

      // ADD (sets carry)
      #100 a = 'hf000;
      b = 'h1000;
      e_add = 0;
      #50 e_add = 1;

      // ADD again (should clear carry)
      #100 e_add = 0;
      b = 'h2000;
      #50 e_add = 1;

      // ADD
      #100 a = 15;
      b = 128;
      e_add = 0;
      #50 e_add = 1;

      // OR
      #100 a = {4{4'b1010}};
      b = {4{4'b0101}};
      e_or = 0;
      #50 e_or = 1;

      // AND
      #100 a = 'h0ff0;
      b = 'hff00;
      e_and = 0;
      #50 e_and = 1;

      // XOR
      #100 a = 'h8ff8;
      b = 'hff08;
      e_xor = 0;
      #50 e_xor = 1;

      // << 1
      #100 a = 'h4444;
      rollop = 2;		// RBL
      e_roll = 0;
      #50 e_roll = 1;

      // >> 1
      #100 a = 'h4444;
      rollop = 1;		// RBR
      e_roll = 0;
      #50 e_roll = 1;

      // << 4
      #100 a = 'h4444;
      rollop = 6;		// RNL
      e_roll = 0;
      #50 e_roll = 1;

      // >> 4
      #100 a = 'h4444;
      rollop = 5;		// RNR
      e_roll = 0;
      #50 e_roll = 1;

      // NOT
      #100 a = 'h4242;
      e_not = 0;
      #50 e_not = 1;

      #500 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #10 clock = ~clock;
   end

   alu alu (a, b, clock, e_add, e_and, e_or, e_xor, e_not, e_roll, rollop,
	    l_in, add_l_out, roll_l_out, l_latch, y);

   // The L register.
   reg_L reg_l (roll_l_out, l_latch, 1'b1, add_l_out, add_l_out, clock, reset, l_in, );
endmodule
