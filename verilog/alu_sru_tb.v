///////////////////////////////////////////////////////////////////////////////
//
// ALU SRU TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// alu_sru_tb.v -- testbench for the ALU's serial Shift/Rotate Unit
//
// Copyright © 2011–2019 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////


`include "alu_sru.v"
`include "alu_portb.v"
`include "flipflop.v"
`timescale 1ns/10ps

`define DELTA 21
//`define DELTA 89
//`define DELTA 941
//`define DELTA 1543


module alu_sru_tb();
   // Declare inputs as regs and outputs as wires
   reg           clk2, clk3, clk4;
   reg           nreset;
   reg           nrsthold;
   reg 	         op_rotate;
   reg 	         op_arithmetic;
   reg 	         op_right;
   reg [3:0]     op_dist;
   reg           nstart;
   reg           nwrite_alu;
   reg [15:0]    ibus;
   wire [15:0]   ibus_real;
   wire [15:0]   b;
   wire          bcp;
   wire          fl;
   wire [2:0]    shift_op;	// This simplified decoding in gtk_wave;

   integer       i, j, k, l, cycle_ctr;
   reg [800:0]   status;


   // Test a single SRU operation
   task test_sru_op;
      input [2:0]   sru_op;
      input [800:0] op_name;

      #5000 status = op_name;
      { op_rotate, op_arithmetic, op_right } = sru_op;

      for (i = 0; i < 16; i = i + 1) begin
	 #1000 $sformat(status, "%0s %0d", op_name, i);
	 op_dist = i;

	 for (j = 16'h1234; j < 65536; j = j + `DELTA) begin
	    ibus = j;
	    #62.5 nwrite_alu = 0;
	    nstart = 0;
	    cycle_ctr = 0;
	    #62.5 nwrite_alu = 1;
	    #62.5 ibus = 16'bZ;
	    #62.5 nstart = 1;

	    // The microcode waits four cycles (1µs), then reads Port B on
	    // the fifth one before moving on.
	    #1250;
	 end
      end
   endtask // test_sru_op
   

   // Initialize all variables
   initial begin        
      $dumpfile ("vcd/alu_sru_tb.vcd");
      $monitor ("t: %7d | %b%b%b %2d %04x (%016b) > %b:%04x (%b:%016b) (%0s)", $time,
		op_rotate, op_arithmetic, op_right, op_dist, ibus, ibus,
		fl, b, fl, b, status);
      $dumpvars (0, alu_sru_tb);

      cycle_ctr = 0;
      tb_shift_ctr = 0;
      status = "reset";
      op_arithmetic = 0;
      op_rotate = 0;
      op_right = 0;
      op_dist = 0;
      nstart = 1;
      nreset = 0;
      nrsthold = 0;
      ibus = 16'h0000;
      nwrite_alu = 0;
      #250 nwrite_alu = 1;
      #250 ibus = 16'bzzzz_zzzz_zzzz_zzzz;

      // Make sure the SRU doesn't start when reset is held low.
      #500 nstart = 0;
      #250 nstart = 1;

      // Now stop resetting and let's test.
      nreset = 1;
      #2000 nrsthold = 1;

      // There are 80 possible operations this unit can perform, represented as
      // a total of 7 bits (4 for the distance, 1 for logit/arithmetic, 1 for
      // shift/rootate, 1 for left/right):

      //            OP   I R 987 654 3210
      // SHL = SRU  0111'1'0'000'000'dddd    ; Bitwise shift left by d bits
      // SHR = SRU  0111'1'0'000'001'dddd    ; Bitwise shift right by d bits
      // ASR = SRU  0111'1'0'000'011'dddd    ; Arithmetic shift right by d bits
      // ROL = SRU  0111'1'0'000'100'dddd    ; Rotate left by d bits
      // ROR = SRU  0111'1'0'000'101'dddd    ; Rotate right by d bits

      // We'll use a custom task to test each operation.

      test_sru_op(3'b000, "SHL");
      test_sru_op(3'b001, "SHR");
      test_sru_op(3'b011, "ASR");
      test_sru_op(3'b100, "ROL");
      test_sru_op(3'b101, "ROR");
      test_sru_op(3'b110, "RLA");
      test_sru_op(3'b111, "RRA");

      #3000 $finish;      // Terminate simulation
   end // initial begin

   assign ibus_real = ibus;

   // A fake L register. This will reset to zero on every reset or SRU start.
   wire flout_sru;
   flipflop_74h #(10,10) l_ff(.d(flout_sru), .clk(bcp), .nset(1'b1), .nrst(nstart & nreset), .q(fl));

   assign shift_op = { op_rotate, op_arithmetic, op_right };
   
   always begin
      #62.5 clk2 = 0;
      #62.5 clk2 = 1; clk3 = 0;
      #62.5 clk3 = 1; clk4 = 0;
      #62.5 clk4 = 1;
      cycle_ctr++;
   end

   // Include the ALU's B register. (noe = 1 because for this test's purposes,
   // the B reg is never put on the Ibus. This is only needed by the
   // microcode).
   alu_portb alu_b (.ibus(ibus_real), .bcp(nwrite_alu & bcp), .nread_alu_b(1'b1), .b(b));

   // Instantiate the DUT
   alu_sru alu_sru (.nreset(nreset), .nrsthold(nrsthold),
		    .clk2(clk2), .clk3(clk3), .clk4(clk4),
		    .b(b),
		    .fl(fl),
		    .nstart(nstart),
		    .op_arithmetic(op_arithmetic),
		    .op_rotate(op_rotate),
		    .op_right(op_right),
		    .op_dist(op_dist),
		    .ibus(ibus_real),
		    .bcp(bcp),
		    .flout_sru(flout_sru));

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY OUR FINDINGS
   //
   ///////////////////////////////////////////////////////////////////////////////

   reg [8191:0]   msg;

   // Check for properly timed SRU activation
   always @ (posedge clk3) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({nreset, nstart, alu_sru.nstart_sync})
	   3'b0?0: $sformat(msg, "SRU started during reset! nreset=%b, nstart=%b, but nstart_sync=%b (should be 1)",
			    nreset, nstart, alu_sru.nstart_sync);
	   3'b110: $sformat(msg, "nreset=%b, nstart=%b, but nstart_sync=%b (should be 1)",
			    nreset, nstart, alu_sru.nstart_sync);
	   3'b101: $sformat(msg, "SRU failed to start! nreset=%b, nstart=%b, but nstart_sync=%b (should be 0)",
			    nreset, nstart, alu_sru.nstart_sync);
	 endcase // casex ({nreset, nstart, alu_sru.nstart_sync})
	 
	 if (nreset !== 0 && nreset !== 1) $sformat(msg, "testbench bug, nreset=%b", nreset);
	 if (nstart !== 0 && nstart !== 1) $sformat(msg, "testbench bug, nstart=%b", nstart);

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else if (nreset === 0 || nstart === 0) $display("345 OK nstart");
      end
   end // always @ (posedge clk2)

   // Count the number of SRU pulses
   integer tb_shift_ctr;
   always @(negedge alu_sru.nstart_sync, posedge alu_sru.shiftclk) begin
      if (nreset === 1) begin
	 if (alu_sru.nstart_sync == 0) tb_shift_ctr = 0;
	 else if (alu_sru.shiftclk) tb_shift_ctr++;
      end
   end

   // Check for correct results
   reg [15:0] correct_b;
   reg 	      fl0;
   wire signed [15:0] js;	// A signed 16-bit version of j
   assign js = j[15:0];

   always @(posedge alu_sru.nstart_sync) begin
      // Wait for 16 periods. 16×62.5ns=1µs.
      fl0 <= fl;
      //$display("\nt: %7d | start %04h fl %b %b dist %d", $time, j[15:0], fl, fl0, op_dist);
      #1000 begin
	 //$display("t: %7d | check fl=%b fl0=%b\n", $time, fl, fl0);
	 
	 if (tb_shift_ctr !== op_dist) begin
	    $sformat(msg, "shift engine miscount, op_dist=%0d, but saw %0d shiftclk pulses.",
		     op_dist, alu_sru.shiftclk);
	 end

	 if (nreset === 1) begin
	    case ({op_rotate, op_arithmetic, op_right})
	      3'b000: correct_b = (j << op_dist) & 16'hffff;  // Bitwise shift left
	      3'b001: correct_b = (j >> op_dist) & 16'hffff;  // Bitwise shift right
	      3'b011: correct_b = $signed(js >>> op_dist) & 16'hffff; // Arithmetic (sign extending) shift right
	      3'b100: correct_b = op_dist == 0 ? j : (j << (op_dist)) | (fl0 << (op_dist - 1)) | (j >> (17 - op_dist));
	      3'b101: correct_b = op_dist == 0 ? j : (j >> (op_dist)) | (fl0 << (op_dist - 1)) | (j << (17 - op_dist));
	      3'b110: correct_b = op_dist == 0 ? j : (j << (op_dist)) | (j >> (16 - op_dist));
	      3'b111: correct_b = op_dist == 0 ? j : (j >> (op_dist)) | (j << (16 - op_dist));
	     // to implement
	    endcase // case ({op_rotate, op_arithmetic, op_right})
	    
	    if (b !== correct_b) begin
	       $sformat(msg,
			"op=%0s, op_rotate=%b, op_arithmetic=%b, op_right=%b, op_dist=%0d, fl0=%b, j=%04x (%b) but result was %04x (%b)--should be %04x (%b)",
			status, op_rotate, op_arithmetic, op_right, op_dist, fl0,
			j[15:0], j[15:0], b, b, correct_b, correct_b);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("345 OK result");
      end
   end // always @ (posedge alu_sru.nstart_sync)


endmodule // alu_sru_tb

// End of file.


