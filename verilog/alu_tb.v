`include "alu.v"
`include "clock.v"
`include "register.v"

`timescale 1ns/10ps
module alu_tb();

   reg 	       nreset, nrsthold, nirqs;
   reg [3:0]   runit;
   reg [15:0]  ir, ibus, ac;
   tri0 [15:0] ibus_real;

   wire        clk1, clk2, clk3, clk4, clk5, nt12, nt34;

   reg 	       fl, nwalu;

   wire        nflstrobe, fv, nfltadd, roll16, isroll;

   localparam ALU_IDLE = 0;

   localparam ALU_ADD = 4'b1000;
   localparam ALU_AND = 4'b1001;
   localparam ALU_OR  = 4'b1010;
   localparam ALU_XOR = 4'b1011;
   
   localparam ALU_ROLL = 4'b1100;
   localparam ALU_NOT  = 4'b1101;
   
   localparam ALU_CS1  = 4'b1110;
   localparam ALU_CS2  = 4'b1111;

   localparam ALU_RBL  = 3'b010;
   localparam ALU_RBR  = 3'b011;
   localparam ALU_RNL  = 3'b110;
   localparam ALU_RNR  = 3'b101;

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_tb.vcd");
      $dumpvars (0, alu_tb);

      // Reset
      runit = ALU_IDLE;
      nirqs = 1;
      nwalu = 1;
      ir = 0;
      ac = 0;
      fl = 0;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      nreset = 0;
      #250 nrsthold = 0;
      #500 nreset = 1;
      #625 nrsthold = 1;

      // Basic tests. Individual operations tested elsewhere.
      #250 ac = 'h9999;
      #250 ibus = 'hffff;
      nwalu = 0;
      #250 nwalu = 1;
      #250 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

      #250 runit = ALU_ADD;
      #500 runit = ALU_IDLE;

      #250 ac = 'h1234;
      #250 ibus = 'h1111;
      nwalu = 0;
      #250 nwalu = 1;
      #250 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

      #250 runit = ALU_ADD;
      #500 runit = ALU_IDLE;

      #250 runit = ALU_AND;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_OR;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_XOR;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_NOT;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_ROLL;
      ir = ALU_RBR;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_ROLL;
      ir = ALU_RBL;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_ROLL;
      ir = ALU_RNR;
      #250 runit = ALU_IDLE;

      #250 runit = ALU_ROLL;
      ir = ALU_RNL;
      #250 runit = ALU_IDLE;
      ir = 0;

      #1000 $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;

   clock_generator clock_generator (1'bz, 1'bz,
				    nreset,
				    0, 0,
				    1'bz, 1'bz,
				    clk1, clk2, clk3, clk4, nt12, nt34);

   alu alu_unit(nreset, nrsthold, clk2, clk3, clk4, nt34, nirqs,
		runit,
		ir, ibus_real, ac,
		fl,
		nwalu,
		nflstrobe, fv, nfltadd, roll16, isroll);

endmodule
