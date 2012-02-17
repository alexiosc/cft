`include "alu.v"
`include "clock.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb();

// Declare inputs as regs and outputs as wires
   reg [15:0] ibus;
   reg 	      w_a;
   reg 	      w_b;

   reg 	      l;

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
   
   localparam ALU_ROLL = 4'b100;
   localparam ALU_NOT  = 4'b101;
   
   localparam ALU_CS1  = 4'b110;
   localparam ALU_CS2  = 4'b111;

   localparam testname = "ALU NOT";
   localparam MAX = 65536;	// Test everything.

   integer     i, y_correct, l_correct;
   integer     t;
   
   // Initialize all variables
   initial begin        
      //$dumpfile ("vcd/alu_tb.vcd");
      //$dumpvars (0, alu_tb);

      // Reset.
      reset = 0;
      rsthold = 0;
      runit = ALU_IDLE;
      ibus = 0;
      l = 0;
      w_a = 1;
      w_b = 1;
      t = 0;
      
      #500 reset = 1;
      #1000 rsthold = 1;

      for (i = 0; i < MAX; i = i + 1) begin
	 #250 ibus = i;
	 #63 w_a = 0;
	 #63 w_a = 1;
	 
	 #250 runit = ALU_NOT;
	 #250 begin
	    y_correct = (~i) & 65535;
	    l_correct = 0;
	    
	    if (y_correct != y) begin
	       $display("%s: [fail] t=%d: NOT %5d = %5d =? %5d",
			testname, t, i, y, y_correct);
	       $display ("%s: [fail] Assertion failed (result incorrect).", testname);
	       #100 $finish;
	    end
	    if (l_correct != alu_l_toggle) begin
	       $display("%s: [fail] t=%d: NOT %5d = %5d =? %5d",
			testname, t, i, y, y_correct);
	       $display ("%s: [fail] Assertion failed (carry out was set).", testname);
	       #100 $finish;
	    end
	    if (alu_l_toggle != 0) begin
	       $display("%s: [fail] t=%d: NOT %5d = %5d =? %5d",
			testname, t, i, y, y_correct);
	       $display ("%s: [fail] Assertion failed (ADD carry out was set).", testname);
	       #100 $finish;
	    end
	    if (alu_l_out) begin
	       $display("%s: [fail] t=%d: NOT %5d = %5d =? %5d",
			testname, t, i, y, y_correct);
	       $display ("%s: [fail] Assertion failed (L ROLL data was set).", testname);
	       #100 $finish;
	    end
	    if (alu_l_latch) begin
	       $display("%s: [fail] t=%d: NOT %5d = %5d =? %5d",
			testname, t, i, y, y_correct);
	       $display ("%s: [fail] Assertion failed (L ROLL latch was set).", testname);
	       #100 $finish;
	    end
	    
	    t = t + 1;
	    if ((t % 4000) == 0) $display ("%s: [ok] Tests up to %1d (of %1d) successful (%1d%% done).",
					   testname, t, MAX, 100 * t / MAX);
	    
	    runit = ALU_IDLE;

	 end // # 250
      end // for (i = 0; i < MAX; i = i + 1)

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
		1, // /INTS always 1 for now,
		y);
endmodule
