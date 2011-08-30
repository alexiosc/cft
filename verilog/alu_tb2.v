`include "alu.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb2();

// Declare inputs as regs and outputs as wires
   reg [15:0] bus;
   reg [2:0]  rollop;

   reg [3:0]  op;

   reg clear;
   reg guardpulse;
   reg toggle;
   reg clock;
   reg reset;
   reg clear_l;
   reg latch_a, latch_b;

   wire [15:0] y;
   wire l_in, add_l_out, roll_l_out, l_latch;
   
   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_tb2.vcd");
      $dumpvars (0, alu_tb2);

      clock = 0;
      reset = 0;
      bus = 0;
      latch_a = 0;
      latch_b = 0;
      op = 4'b0000;
      guardpulse = 0;
      rollop = 7;
      clear_l = 1;
      
      #10 reset = 1;

      // Test addition
      #100 a = 192;
      b = 1500;
      op = 4'b1000;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // Test addition
      #250 a = 192;
      b = 65500;
      op = 4'b1000;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // ADD (sets carry)
      #250 a = 'hf000;
      b = 'h1000;
      op = 4'b1000;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // ADD again (should clear carry)
      #1000 op = 4'b0000;
      b = 'h2000;
      op = 4'b1000;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // ADD
      #250 a = 15;
      b = 128;
      op = 4'b1000;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // AND
      #250 a = 65535;
      b = 255;
      op = 4'b1001;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // AND
      #250 a = 65535;
      b = 32768;
      op = 4'b1001;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // OR
      #250 a = 16'b1100110011110000;
      b =      16'b0011001100001111;
      op = 4'b1010;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // OR
      #250 a = 0;
      b = 65535;
      op = 4'b1010;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // OR
      #250 a = 0;
      b = 0;
      op = 4'b1010;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;


      // XOR
      #250 a = 16'b1100110011110000;
      b =      16'b0011001100001111;
      op = 4'b1011;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // XOR
      #250 a = 65535;
      b = 65535;
      op = 4'b1011;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;

      // XOR
      #250 a = 0;
      b = 65535;
      op = 4'b1011;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      // RBL
      #250 a = 15;
      b = 0;
      clear_l = 1;
      op = 4'b1100;
      rollop = 3'b010;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      // RBR
      #250 a = 15;
      b = 0;
      clear_l = 1;
      op = 4'b1100;
      rollop = 3'b001;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      // RNL
      #250 a = 15;
      b = 0;
      clear_l = 1;
      op = 4'b1100;
      rollop = 3'b110;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      // RNR
      #250 a = 15;
      b = 0;
      clear_l = 1;
      op = 4'b1100;
      rollop = 3'b101;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      // NOT
      #250 a = 32768 + 15;
      b = 0;
      clear_l = 1;
      op = 4'b1101;
      rollop = 3'b101;
      latch_a = 1;
      latch_b = 1;
      #50 latch_a = 0;
      latch_b = 0;
      #450 op = 4'b0000;
      clear_l = 0;

      #500 $finish;      // Terminate simulation
   end // initial begin

   always begin
      #500 clock = ~clock;
   end

   rom_alu alu (a, b, latch_a, latch_b, clock, guardpulse, reset, op, rollop,
	    l_in, add_l_out, roll_l_out, l_latch, y);

   // The L register.
   reg_L reg_l (roll_l_out, l_latch, clear_l, add_l_out, add_l_out, clock, reset, l_in, );
endmodule
