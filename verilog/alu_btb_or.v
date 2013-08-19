`include "alu.v"
`include "clock.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb();

   reg 	       nreset, nrsthold, nirqs;
   reg [3:0]   runit;
   reg [15:0]  ir, ibus;
   wire [15:0] ac;
   tri0 [15:0] ibus_real;

   wire        clk1, clk2, clk3, clk4, clk5, nguard;
   wire [15:0] y;

   reg 	       fl, nwalu;

   wire        nflstrobe, fv, nfltadd, roll16, isroll;

   localparam ALU_IDLE = 0;

   localparam ALU_ADD = 4'b1000;
   localparam ALU_AND = 4'b1001;
   localparam ALU_OR  = 4'b1010;
   localparam ALU_XOR = 4'b1011;
   
   localparam ALU_ROLL = 4'b100;
   localparam ALU_NOT  = 4'b101;
   
   localparam ALU_CS1  = 4'b110;
   localparam ALU_CS2  = 4'b111;

   localparam testname = "ALU OR";
   localparam MAX = 1024;
   localparam MAX2 = MAX * MAX;
   localparam DELTA = 21553;
   //localparam DELTA = 1;
   localparam MODULO = 65536;

   integer     i, j, a, b, y_correct, l_correct;
   integer     t;
   
   // Initialize all variables
   initial begin        
      //$dumpfile ("vcd/alu_tb.vcd");
      //$dumpvars (0, alu_tb);

      // Reset
      runit = ALU_IDLE;
      nirqs = 1;
      nwalu = 1;
      ir = 0;
      a = 0;
      fl = 0;
      ibus = 16'bzzzz_zzzz_zzzz_zzzz;
      
      nreset = 0;
      #250 nrsthold = 0;
      #500 nreset = 1;
      #625 nrsthold = 1;

      a = 0;
      b = 0;
      t = 0;

      for (i = 0; i < MAX; i = i + 1) begin
	 for (j = 0; j < MAX; j = j + 1) begin
	    #250 ibus = b;
	    nwalu = 0;
	    #250 nwalu = 1;
	    #250 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

	    #250 runit = ALU_OR;
	    #250 begin
	       y_correct = (a | b) & 65535;
	       l_correct = 1;

	       if (y_correct != y) begin
		  $display("%s: [fail] t=%d: %1d/%1d. %5d OR %5d = %5d =? %5d",
			   testname, t, i, j, a, b, y, y_correct);
		  $display ("%s: [fail] Assertion failed (result incorrect).", testname);
		  #100 $finish;
	       end
	       if (!nfltadd) begin
		  $display("%s: [fail] t=%d: %1d/%1d. %5d OR %5d = %5d =? %5d",
			   testname, t, i, j, a, b, y, y_correct);
		  $display ("%s: [fail] Assertion failed (carry out was asserted).", testname);
		  #100 $finish;
	       end
	       if (isroll) begin
		  $display("%s: [fail] t=%d: %1d/%1d. %5d + %5d = %1d,%5d =? %1d,%5d",
			   testname, t, i, j, a, b, nfltadd, y, l_correct, y_correct);
		  $display ("%s: [fail] Assertion failed (roll L out was set).", testname);
		  #100 $finish;
	       end
	       if (roll16) begin
		  $display("%s: [fail] t=%d: %1d/%1d. %5d + %5d = %1d,%5d =? %1d,%5d",
			   testname, t, i, j, a, b, nfltadd, y, l_correct, y_correct);
		  $display ("%s: [fail] Assertion failed (roll L latch was set).", testname);
		  #100 $finish;
	       end

	       t = t + 1;
	       if ((t % 4000) == 0) $display ("%s: [ok] Tests up to %1d (of %1d) successful (%1d%% done).",
					      testname, t, MAX2, 100 * t / MAX2);
	       	       
	       runit = ALU_IDLE;
	       
	       a = (a + DELTA) % MODULO;
	    end
	 end
	 b = (b + DELTA) % MODULO;
	 
      end // for (i = 0; i < 10; i = i + 1)

      $display("%s: [ok] Pass.", testname);

      #500 $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;
   assign y = ibus_real;
   assign ac = a;

   wire nt23, nt34;
   clock_generator clock_generator (1'bz, 1'bz,
				    nreset,
				    0, 0,
				    1'bz, 1'bz,
				    clk1, clk2, clk3, clk4, , nt34);

   alu alu_unit(nreset, nrsthold, clk2, clk3, clk4, nt34, nirqs,
		runit,
		ir, ibus_real, ac,
		fl,
		nwalu,
		nflstrobe, fv, nfltadd, roll16, isroll);

/*

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
 
 */
endmodule
