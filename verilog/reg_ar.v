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
	       nfparh, fpd);

   input         nmem;
   input 	 nio;
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
   assign #7 naben = nmem & nio;

   // The Address Register itself. The '574 has tri-state outputs, but we
   // output the AR to both the Address Bus and the Front Panel, so we '574 FFs
   // and separate buffers.
   flipflop_574 ar_lo  (.d(ibus[7:0]),   .q(ar[7:0]),   .clk(nwrite_ar), .noe(1'b0));
   flipflop_574 ar_mid (.d(ibus[15:8]),  .q(ar[15:8]),  .clk(nwrite_ar), .noe(1'b0));
   flipflop_574 ar_hi  (.d(aext),        .q(ar[23:16]), .clk(nwrite_ar), .noe(1'b0));

   // The Address Bus buffers
   buffer_541 ar_ab_lo  (.a(ar[7:0]),   .y(ab[7:0]),   .noe1(naben), .noe2(1'b0));
   buffer_541 ar_ab_mid (.a(ar[15:8]),  .y(ab[15:8]),  .noe1(naben), .noe2(1'b0));
   buffer_541 ar_ab_hi  (.a(ar[23:16]), .y(ab[23:16]), .noe1(naben), .noe2(1'b0));

   // The Front Panel buffers. Note: the DFP can sample the whole AB (and thus,
   // the AR) directly. It just needs to output the top 8 bits of the AR onto
   // the FPD bus for the front panel, so only one buffer is needed.
   buffer_541 ar_fpbuf_hi  (.a(ar[23:16]), .y(fpd),   .noe1(nfparh), .noe2(1'b0));

   // The I/O Address Decoder isn't really part of the AR, but if
   // they're colocated it saves having to bus 8 lines. (AR[15:8])
   // across units. The decoder provides four convenient control lines
   // to decode the MSB of I/O space addresses, so devices can usually
   // implement full address decoding with just a '138 decoder. It
   // uses the AR for decoding rather than the Address Bus itself so
   // it can generate a device select strobe as soon as early as
   // possible.

   wire 	 nar_high_0;
   wire [7:0] 	 y;

   // Note: AR[10] is decoded TWICE here, to avoid a hazard that can cause spurious nsysdev strobes.

   // Note: the '688 is slow. We can bypass it entirely, in which case I/O
   // space will always be 1,024 addresses. Partial decoding will mean the top
   // 12 bits will be don't care values for I/O devices. But that's OK because
   // all our devices are mapped at I/O addresses &3FF and below anyway. This
   // is reminiscent of the Z80's behaviour with I/O addresses. (it only has
   // 256 of them and you're supposed to ignore the upper 8 bits of the address
   // bus).
   comparator_688 ioad_cmp (.a({ar[15:10], 2'b00}), .b(8'd0), .ng(naben),
			    .neq(nar_high_0));
   demux_138 ioad_dec (.g1(1'b1), .ng2a(nio), .ng2b(1'b0 & nar_high_0),
		       .a({ar[10:8]}), .y(y));
   assign nsysdev = y[0];
   assign niodev1xx = y[1];
   assign niodev2xx = y[2];
   assign niodev3xx = y[3];

endmodule // reg_ar

`endif //  `ifndef reg_ar_v

// End of file
