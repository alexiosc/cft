`include "alu.v"
`include "clock.v"
`include "register.v"

`timescale 10ns/10ps
module alu_tb();

   reg 	       nreset, nrsthold, nirqs;
   reg [3:0]   runit;
   reg [15:0]  ir, ibus;
   reg [15:0]  ac;
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

      ac = 0;
      t = 0;
      for (k = 0 ; k < 4; k = k + 1) begin
	 _k = k & 1 ? ALU_CS2 : ALU_CS1;
	 nirqs = k & 2 ? 1'b1 : 1'b0;

	 for (i = 0; i < MAX; i = i + 1) begin
	    for (j = 0; j < 2; j = j + 1) begin
	       #250 ac = a;
	       fl = j;
	       _a = a;
	       
	       #250 runit = _k;
	       #250 begin
		  if (_k == ALU_CS1) begin
		     y_correct = nirqs ? 0 : 2;
		  end else if (_k == ALU_CS2) begin
		     y_correct = nirqs ? 1 : 16'hfff8;
		  end
		  else $finish;
		  
		  if (y_correct != y) begin
		     $display("%s: [fail] t=%d. nirqs=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b> (%b)",
			      testname, t, nirqs, _k, alu.uop, fl, _a, nfltadd, y, y_correct);
		     $display ("%s: [fail] Assertion failed (result incorrect).", testname);
		     #100 $finish;
		  end
		  if (isroll == 1) begin
		     $display("%s: [fail] t=%d. nirqs=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, nirqs, _k, alu.uop, fl, _a, nfltadd, y);
		     $display ("%s: [fail] Assertion failed (L latch was set).", testname);
		     #100 $finish;
		  end
		  if (roll16 == 1) begin
		     $display("%s: [fail] t=%d. nirqs=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, nirqs, _k, alu.uop, fl, _a, nfltadd, y);
		     $display ("%s: [fail] Assertion failed (L ROLL data was set).", testname);
		     #100 $finish;
		  end
		  if (!nfltadd) begin
		     $display("%s: [fail] t=%d. nirqs=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			      testname, t, nirqs, _k, alu.uop, fl, _a, nfltadd, y);
		     $display ("%s: [fail] Assertion failed (ADD carry out was set).", testname);
		     #100 $finish;
		  end

		  /*
		  $display("%s: [ok] %d. nirqs=%b, op=%b, uop=%b, <L,A>=<%b,%16b> => <%b,%16b>",
			   testname, t, nirqs, _k, alu.uop, fl, _a, nfltadd, y);
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

   assign ibus_real = ibus;
   assign y = ibus_real;

   clock_generator clock_generator (1'bz, 1'bz,
				    nreset,
				    0, 0,
				    1'bz, 1'bz,
				    clk1, clk2, clk3, clk4, clk5, nguard);

   alu alu (nreset, nrsthold, clk5, nguard, nirqs,
		runit,
		ir, ibus_real, ac,
		fl,
		nwalu,
		nflstrobe, fv, nfltadd, roll16, isroll);

endmodule

