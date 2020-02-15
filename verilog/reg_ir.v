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
`include "demux.v"

`timescale 1ns/1ps

// This models both the IR register and the front line buffers.
module reg_ir (clk4, waddr,
	       ibus, ir,
	       nfpirl, nfpirh, fpd);

   input 	 clk4;
   input [4:0] 	 waddr;

   output [15:0] ibus;
   output [15:0] ir;

   input 	 nfpirl;
   input 	 nfpirh;
   output [7:0]  fpd;
   
   wire [15:0] 	 ibus, ir;
   wire [7:0] 	 fpd;

   // Decode WADDR address 00010. The nwrite_ir output is only active during
   // clk4, so its raising edge is at the end of the clock cycle, as is
   // standard of all writable units.
   wire [7:0] 	 y;
   wire 	 nwrite_ir;
   demux_138 waddr_dec (.g1(1'b1), .ng2a(waddr[3]), .ng2b(waddr[4]),
			.a(waddr[2:0]), .y(y));
   assign #6 nwrite_ir = y[2] | clk4;

   // The original CFT used latches for the IR—and it worked! We'll move to
   // flip-flops here. It should make no difference, but might protect us from
   // some glitches.
   flipflop_574 ir_lo (.d(ibus[7:0]),   .q(ir[7:0]),  .clk(nwrite_ir), .noe(1'b0));
   flipflop_574 ir_hi (.d(ibus[15:8]),  .q(ir[15:8]), .clk(nwrite_ir), .noe(1'b0));
   // latch_573 ir_lo (ibus[7:0],  ir[7:0],  nwrite_ir, nreset);
   // latch_573 ir_hi (ibus[15:8], ir[15:8], nwrite_ir, nreset);

   // The front panel buffers
   buffer_541 ir_fpbuf_lo (.a(ir[7:0]),  .y(fpd), .noe1(nfpirl), .noe2(1'b0));
   buffer_541 ir_fpbuf_hi (.a(ir[15:8]), .y(fpd), .noe1(nfpirh), .noe2(1'b0));

endmodule // reg_ir

`endif //  `ifndef reg_ir_v

// End of file
