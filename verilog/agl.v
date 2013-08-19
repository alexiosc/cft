///////////////////////////////////////////////////////////////////////////////
//
// THE ADDRESS GENERATION UNIT
// 
///////////////////////////////////////////////////////////////////////////////


`ifndef agl_v
`define agl_v

`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module agl(ir, pc, nragl, nend, ibus);

   input [15:0]  pc, ir;
   input 	 nragl;
   input 	 nend;

   output [15:0] ibus;

   wire [15:0] 	pc, ir;
   wire 	nragl;
   wire 	nend;

   wire [15:0] 	ibus;

   // Address Generation Logic tri-stating buffers
   buffer_541 buf_lo (nragl, 1'b0, ir[7:0], ibus[7:0]);
   buffer_541 buf_hi (nragl, 1'b0, {page, ir[9:8]}, ibus[15:8]);

   // Zero Page Logic
   wire [5:0] 	page;
   tri0 [7:0] 	q;
   flipflop_374 zpff ({2'b0, pc[15:10]}, ir[10], nend, q);
   assign page = q[5:0];

endmodule // agl


`endif //  `ifndef agl_v
