`include "alu.v"
`include "clock.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb();

// Declare inputs as regs and outputs as wires
   reg [15:0] ibus;
   reg 	      w_a;
   reg 	      w_b;

   reg 	      l, ints;

   reg [3:0]  runit;
   reg [2:0]  rollop;

   wire       clk1, clk2, clk3, clk4, clk5, guard;

   reg 	      reset, rsthold;

   wire       alu_l_toggle, alu_l_out, alu_l_latch;

   wire [15:0] y;

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

   localparam testname = "ALU CS";
   localparam MAX = 65536;	// Test everything.

   localparam DELTA = 21553;
   //localparam DELTA = 1;
   localparam MODULO = 65536;

   integer     i, j, k, a, y_correct, l_correct;
   integer     t;
   reg [15:0]  _a;
   reg [3:0]   _k;
   
   // Initialize all variables
   initial begin
      /*
      $dumpfile ("vcd/alu_tb.vcd");
      $dumpvars (0, alu_tb);
       */

      // Reset.
      reset = 0;
      rsthold = 0;
      runit = ALU_IDLE;
      ibus = 0;
      a = 0;
      l = 0;
      t = 0;
      w_a = 1;
      w_b = 1;
      rollop = 0;
      
      #500 reset = 1;
      #1000 rsthold = 1;

      for (k = 0 ; k < 4; k = k + 1) begin
	 _k = k & 1 ? ALU_CS2 : ALU_CS1;
	 ints = k & 2 ? 1'b1 : 1'b0;

	 for (i = 0; i < MAX; i = i + 1) begin
	    for (j = 0; j < 2; j = l + 1) begin
	       #250 ibus = a;
	       l = j;
	       _a = a;
	       #63 w_a = 0;
	       #63 w_a = 1;
	       
	       #250 runit = _k;
	       #250 begin
		  if (_k == ALU_CS1) begin
		     y_correct = ints ? 0 : 2;
		  end else if (_k == ALU_CS2) begin
		     y_correct = ints ? 1 : 16'hfff8;
		  end
		  else $finish;
		  
		  if (y_correct != y) begin
		     $display("%s: [fail] t=%d. ints=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b> (%b)",
			      testname, t, ints, _k, alu.uop, l, _a, alu_l_out, y, y_correct);
		     $display ("%s: [fail] Assertion failed (result incorrect).", testname);
		     #100 $finish;
		  end
		  if (alu_l_latch == 1) begin
		     $display("%s: [fail] t=%d. ints=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, ints, _k, alu.uop, l, _a, alu_l_out, y);
		     $display ("%s: [fail] Assertion failed (L latch was set).", testname);
		     #100 $finish;
		  end
		  if (alu_l_toggle != 0) begin
		     $display("%s: [fail] t=%d. ints=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, ints, _k, alu.uop, l, _a, alu_l_out, y);
		     $display ("%s: [fail] Assertion failed (ADD carry out was set).", testname);
		     #100 $finish;
		  end
		  if (l_correct != alu_l_out) begin
		     $display("%s: [fail] t=%d. ints=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, ints, _k, alu.uop, l, _a, alu_l_out, y);
		     $display ("%s: [fail] Assertion failed (L incorrectly output).", testname);
		     #100 $finish;
		  end

		  /*
		  $display("%s: [ok] %d. ints=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			   testname, t, ints, _k, alu.uop, l, _a, alu_l_out, y);
		   */
		  
		  t = t + 1;
		  if ((t % 4000) == 0) $display ("%s: [ok] Tests up to %1d (of %1d) successful (%1d%% done).",
						 testname, t, 8 * MAX, 100 * t / (8 * MAX));
		  
		  runit = ALU_IDLE;
		  a = (a + DELTA) % MODULO;
		  
	       end // # 250
	    end // for (l = 0; l < 2; l = l + 1)
	 end // for (i = 0; i < MAX; i = i + 1)
      end // for (k = 0 ; k < 8; k = k + 1)
      
      $display("%s: [ok] Pass.", testname);

      #500 $finish;      // Terminate simulation
   end // initial begin

   clock_generator clock_generator (1, // halt (never)
				    1, // run (always)
				    0, // step (never)
				    reset, // reset (never)
				    clk1, clk2, clk3, clk4, clk5, guard);
   rom_alu alu (ibus, w_a, w_b,
		clk5,
		1'b0, // Ignore /GUARD to simplify testing,
		reset, rsthold,
		runit, rollop,
		l, alu_l_toggle, alu_l_out, alu_l_latch,
		ints,		// Selects constant source bank
		y);
endmodule

