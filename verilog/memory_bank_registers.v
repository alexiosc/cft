///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// FUNCTION: the Address Register (AR) and I/O address decoder.
//
// NOTES:
//
// RADDR   REG   
// 00100   00   MB0   Program Bank
// 00101   01   MB1   Data Bank
// 00110   10   MB2   Stack Bank
// 00111   11   MB3   Page 0 Bank (conditionally overridden by address)
//
//
///////////////////////////////////////////////////////////////////////////////


`ifndef memory_bank_registers_v
`define memory_bank_registers_v

`include "flipflop.v"
`include "demux.v"
`include "comparator.v"
`include "buffer.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The Address Register and I/O Address decoder

module reg_ar (ibus, aext, nwrite_ar, nmem, nio,
	       ab, nsysdev, niodev1xx, niodev2xx, niodev3xx);
   input [15:0] ibus;
   input [7:0] 	aext;
   input 	nwrite_ar;
   input 	nmem;
   input 	nio;

   output [23:0] ab;
   output 	 nsysdev;
   output 	 niodev1xx;
   output 	 niodev2xx;
   output 	 niodev3xx;
   
   wire [15:0] 	 ibus;
   wire [23:0] 	 ar, ab;
   wire [7:0] 	 y;
   wire 	 naben;
   wire 	 niocmp;
   wire 	 nsysdev;
   wire 	 niodev1xx;
   wire 	 niodev2xx;
   wire 	 niodev3xx;

   assign #7 naben = nmem & nio;

   // The AR is just a bank of flip flops connected to a bank of buffers.
      
   flipflop_574 ff0 (.d(ibus[7:0]),  .q(ar[7:0]),    .clk(nwrite_ar), .oe(1'b0));
   flipflop_574 ff1 (.d(ibus[15:8]), .q(ar[15:8]),   .clk(nwrite_ar), .oe(1'b0));
   flipflop_574 ff2 (.d(aext[7:0]),  .q(ar[23:16]),  .clk(nwrite_ar), .oe(1'b0));

   buffer_541 buf0 (.a(ar[7:0]),   .y(ab[7:0]),   .oe1(naben), .oe2(1'b0));
   buffer_541 buf1 (.a(ar[15:8]),  .y(ab[15:8]),  .oe1(naben), .oe2(1'b0));
   buffer_541 buf2 (.a(ar[23:16]), .y(ab[23:16]), .oe1(naben), .oe2(1'b0));

   // The I/O Device decoder outputs four enable signals for I/O space address
   // ranges 0000–00FF, 0100–01FF, 0200–02FF, and 0300–03FF when I/O
   // transactions are taking place. This decodes IO# and AR[15:0] (the upper 8
   // bits of the AR aren't valid in I/O transactions), leaving I/O devices
   // with the need to decode one enable signal plus 8 bits of address, which
   // most can do with a single '138, saving two ICs per card.

   comparator_688 syscomp (.a({ab[15:11], 3'b0}), .b(8'b00000000), .en(nio), .equal(niocmp));
   demux_138      sysdemux (.g1(1'b1), .g2a(nio), .g2b(niocmp), .a(ab[10:8]), .y(y));
   assign nsysdev = y[0];
   assign niodev1xx = y[1];
   assign niodev2xx = y[2];
   assign niodev3xx = y[3];

endmodule // reg_ar

`endif //  `ifndef memory_bank_registers_v

// End of file
