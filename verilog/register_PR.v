// HISTORICAL

`ifndef register_PR_v
`define register_PR_v

`include "flipflop.v"
`include "buffer.v"
`include "mux.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: The PR register.
//
// Notes: this is a 6-bit register used to store the page number used for
// current-page addressing. This is necessary since instructions can only
// address up to 10 bits.
//
// The PR may be set from two sources: the PC, and the iBus (using the OP2 SPG
// instruction to set if from the accumulator).
//
// A. Setting from the PC. The most significant 6 bits of the PC are used for
// this.
//
//    A1. Set when the PC is explicitly changed by JMP or JSR. This is detected
//        using the w_pc signal from the control unit.
//
//    A2. When pc increments across a page boundary. This is detected using the
//        6 most significant bits of the PC and the inc_pc signal from the control
//        unit.
//
//    A3. When the OP2 CPG (current page) instruction is used. The control unit
//        triggers this by writing the PC over itself, making this equivalent
//        to case A1.
//
// B. Setting from the IBUS. This is only done in one case, when using the OP2
//    SPG (set page) insruction to load the PR from the Accumulator. To
//    simplify loading the page number into the accumulator, the six LEAST
//    significant bits from the IBUS are used here. This allows us to do:
//
//        LI #42
//        SPG
//
//    rather than having to use rolls.
//
//        LI 3F   ; L,A = ?,003F
//        CLL     ; L,A = 0,003F
//        RNL     ; L,A = 0,03F0
//        RNL     ; L,A = 0,3F00
//        RBL     ; L,A = 0,7E00
//        RBL     ; L,A = 0,FC00
//
///////////////////////////////////////////////////////////////////////////////

module reg_pr (pc_in, w_pc, inc_pc, pr_in, w_pr, oe, pr_out, pr_unbuf);
   input [15:0]  pc_in;		// Input from the PC
   input 	 w_pc;		// Active low: the PC is being set.
   input 	 inc_pc;	// Active low: The PC is being stepped.

   input [15:0]  pr_in;		// Input from the ibus
   input 	 w_pr;		// The PR is being updated from pr_in.

   input 	 oe;		// Active low: output register to ibus
   output [15:0] pr_out;	// Tri-state; output the PR when oe is low.
   output [5:0]  pr_unbuf;	// Unbuffered <AE,PR> output for AGL and panel.

   wire [5:0] 	 pgbus;		// Internal 3-state bus.
   wire [1:0] 	 _pad;

   // Method A maps bits like this:
   //
   // Method A (w_pr = 1):
   // PC  15 14 13 12 11 10 | 09 08 07 06 05 03 02 01 00
   // PR   5  4  3  2  1  0
   //
   // Method B (w_pr = 0):
   // A   15 14 13 12 11 10 09 08 07 06 05 03 02 01 00
   // PR                              5  4  3  2  1  0
   wire 	 sel;
   mux_257 src_mux_1 (sel, {2'b00, pc_in[15:14]}, {2'b00, pr_in[5:4]}, 0, {_pad, pgbus[5:4]});
   mux_257 src_mux_0 (sel, pc_in[13:10], pr_in[3:0], 0, pgbus[3:0]);

   // Generate the latch signal. The '574 latches data on the positive edge of
   // latch. This is tricky, because, for method B, we're supposed to latch on
   // the positive edge of w_pr, a change which will make the MUX changeover
   // while we're latching. To make sure this works, we'll delay w_pr using a
   // bunch of nand gates. We can use a 74HCT00, each gate of which has an 10ns
   // typical delay. Use all four of them, plus the spare one from the latch
   // encoder: 50ns delay.

   wire 	 sel0, sel1, sel2, sel3;
   nand #10 nand_74hct00_1 (sel0, w_pr, w_pr); // !w_pr
   nand #10 nand_74hct00_2 (sel1, sel0, sel0);
   nand #10 nand_74hct00_3 (sel2, sel1, sel1); // !w_pr
   nand #10 nand_74hct00_4 (sel3, sel2, sel2);
   nand #10 nand_74hct00_5 (sel, sel3, sel3); // !w_pr

   ///////////////////////////////////////////////////////////////////////////////
   //
   // PC Cross-page detection
   //
   // This works by detecting changes (falling/rising edges) in pc[9] when
   // inc_pc is set. A positive pulse is output.
   //
   ///////////////////////////////////////////////////////////////////////////////

   // Rising edge detector. Generates negative pulse.
   nand #10 nand_74hct00_6 (pc9_a, pc_in[9], pc_in[9]);
   nand #10 nand_74hct00_7 (pulse1, pc_in[9], pc9_a);

   // Falling edge detector. Generates negative pulse using the negated value
   // of pc9 (pc9_a) from the rising edge detector above.
   nand #10 nand_74hct00_8 (pc9_b, pc9_a, pc9_a);
   nand #10 nand_74hct00_9 (pulse2, pc9_b, pc9_a);

   // Combine the two edge detectors.
   nand #10 nand_74hct00_10 (pulse3, pulse1, pulse2);

   // Invert the inc_pc signal.
   nand #10 nand_74hct00_11 (not_inc_pc, inc_pc, inc_pc);

   // Only pulse when pc_inc is high.
   nand #10 nand_74hct00_12 (pulse, not_inc_pc, pulse3);

   // Truth table
   //
   // pccp = pc_inc AND pc[9:0] == 10'b1111111111;
   //      ____ ____
   // pccp w_pc w_pr latch
   // ----------------------
   //  0     0     0     1
   //  0     0     1     1
   //  0     1     0     1 
   //  0     1     1     0
   //  1     0     0     1
   //  1     0     1     1
   //  1     1     0     1
   //  1     1     1     1
   //
   // latch = !inc_pc nand w_pc nand w_pc.
   //
   // latch = ((inc_pc nand inc_pc) nand w_pc) nand w_pr
   //                      latch0
   // inc_pc ---|DD      / 
   //           |  )o---+
   // inc_pc ---|DD     +---|DD
   //                       |  )o--- latch
   // w_pc   ---|DD     +---|DD
   //           |  )o---+
   // w_pr   ---|DD      \ 
   //                       latch1
   // Propagation delay: 3 x ~10ns = 30ns.

   // Delay and invert sel (which is !w_pr anyway).
   nand #10 nand_74hct00_12 (delay_sel, sel, sel);

   //nand #10 nand_74hct00_13 (latch0, pulse, pulse);
   nand #10 nand_74hct00_13 (latch1, nw_pc, delay_sel); // delay_sel = w_pr delayed by ~60ns.
   nand #10 nand_74hct00_14 (nlatch1, latch1, latch1);
   nand #10 nand_74hct00_15 (latch, pulse, nlatch1);
   nand #10 nand_74hct00_16 (nw_pc, w_pc, w_pc);

   
   // The centrepiece of the register is, of course, a flip-flop.
   flipflop_574 ff ({2'b00, pgbus}, {_pad, pr_unbuf}, latch, 0);

   // Output the PR when needed. Use two '244s so we can output zeroes for the
   // top 8 bits of the word.
   buffer_244 buf_hi (oe, oe, 4'b0000, 4'b0000, pr_out[15:12], pr_out[11:8]);
   buffer_244 buf_lo (oe, oe, {2'b00, pr_unbuf[5:4]}, pr_unbuf[3:0], pr_out[7:4], pr_out[3:0]);

endmodule // reg_pr
  

`endif //  `ifndef register_PR_v
