///////////////////////////////////////////////////////////////////////////////
//
// THE INSTRUCTION REGISTER
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019

`ifndef reg_ir_v
`define reg_ir_v

`include "flipflop.v"
`include "buffer.v"

`timescale 1ns/1ps

// This models both the IR register and the front line buffers.
module reg_ir (nreset, ibus, nwrite_ir, ir,
	       nfpirl, nfpirh, fpd);

   input 	 nreset;
   inout [15:0]  ibus;
   input 	 nwrite_ir;
   output [15:0] ir;

   input 	 nfpirl;
   input 	 nfpirh;
   output [7:0]  fpd;
   
   wire [15:0] 	 ibus, ir;
   wire [7:0] 	 fpd;

   // The original CFT used latches and worked. We'll move to flip-flops
   // here. It should make no difference, but might protect us from some
   // glitches.

   wire 	 reset;
   assign #6     reset = ~nreset;

   // latch_573 ir_lo (ibus[7:0],  ir[7:0],  nwrite_ir, nreset);
   // latch_573 ir_hi (ibus[15:8], ir[15:8], nwrite_ir, nreset);
   flipflop_574 ir_lo (.d(ibus[7:0]),   .q(ir[7:0]),  .clk(nwrite_ir), .oe(reset));
   flipflop_574 ir_hi (.d(ibus[15:8]),  .q(ir[15:8]), .clk(nwrite_ir), .oe(reset));

   // The front panel buffers
   buffer_541 ir_fpbuf_lo (.a(ir[7:0]),  .y(fpd), .oe1(nfpirl), .oe2(1'b0));
   buffer_541 ir_fpbuf_hi (.a(ir[15:8]), .y(fpd), .oe1(nfpirh), .oe2(1'b0));

endmodule // reg_ir

`endif //  `ifndef reg_ir_v

// End of file
