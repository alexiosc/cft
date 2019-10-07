///////////////////////////////////////////////////////////////////////////////
//
// THE ADDRESS REGISTER
//
///////////////////////////////////////////////////////////////////////////////

// REDESIGNED IN 2019

`ifndef reg_ar_v
`define reg_ar_v

`include "flipflop.v"
`include "buffer.v"
`include "comparator.v"
`include "demux.v"

`timescale 1ns/1ps

// This models both the AR register and the I/O address decoder.
module reg_ar (nmem, nio, ibus, aext, nwrite_ar, ab,
	       nsysdev, niodev1xx, niodev2xx, niodev3xx,
	       nfparl, nfparm, nfparh, fpd);

   inout [15:0]  ibus;
   input [7:0] 	 aext;
   input 	 nwrite_ar;

   output [23:0] ab;
   output 	 nsysdev;
   output 	 niodev1xx;
   output 	 niodev2xx;
   output 	 niodev3xx;

   input 	 nfparh;
   output [7:0]  fpd;
   
   wire [15:0] 	 ibus;
   wire [23:0] 	 ar;
   wire [7:0] 	 fpd;
   wire 	 naben;

   // Drive the Address Bus during MEM and IO cycles.
   assign #6 naben = nmem & nio;

   // The Address Register itself. The '574 has tri-state outputs, but we
   // output the AR to both the Address Bus and the Front Panel, so we '574 FFs
   // and separate buffers.
   flipflop_574 ar_lo  (.d(ibus[7:0]),   .q(ir[7:0]),   .clk(nwrite_ar), .oe(1'b0));
   flipflop_574 ar_mid (.d(ibus[15:8]),  .q(ir[15:8]),  .clk(nwrite_ar), .oe(1'b0));
   flipflop_574 ar_hi  (.d(ibus[23:16]), .q(ir[23:16]), .clk(nwrite_ar), .oe(1'b0));

   // The Address Bus buffers
   buffer_541 ar_ab_lo  (.a(ar[7:0]),   .y(ab[7:0]),   .oe1(naben), .oe2(1'b0));
   buffer_541 ar_ab_mid (.a(ar[15:8]),  .y(ab[15:8]),  .oe1(naben), .oe2(1'b0));
   buffer_541 ar_ab_hi  (.a(ar[23:16]), .y(ab[23:16]), .oe1(naben), .oe2(1'b0));

   // The Front Panel buffers. Note: the DFP can sample the whole AB (and thus,
   // the AR) directly. It just needs to output the top 8 bits of the AR onto
   // the FPD bus for the front panel, so only one buffer is needed.
   buffer_541 ar_fpbuf_hi  (.a(ar[23:16]), .y(fpd),   .oe1(nfparh), .oe2(1'b0));

   // The I/O Address Decoder isn't really part of the AR, but they've been
   // drawn together in schematics for a while, so I'll leave it here. The
   // decoder provides four convenient control lines to decode the MSB of I/O
   // space addresses, so devices can usually implement full address decoding
   // with just a '138 decoder.

   wire 	 nar11_15_eq_0;
   wire [7:0] 	 y;
   
   comparator_688 ioad_cmp (.a({ar[15:11], 3'b000}), .b(8'd0), .ng(1'b0),
			    .neq(nar11_15_eq_0));
   demux_138 (.g1(1'b1), .g2a(nio), .g2b(nar11_15_eq_0), .a(ar[10:8]), .y(y));
   assign nsysdev = y[0];
   assign niodev1xx = y[1];
   assign niodev2xx = y[2];
   assign niodev3xx = y[3];

endmodule // reg_ar

`endif //  `ifndef reg_ar_v

// End of file
