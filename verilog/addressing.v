`ifndef ar_v
`define ar_v

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

// The Address Register. Please note: the console buffers are not
// modelled here.

module reg_ar (ibus, nwar, nreset, ar);
   input [15:0] ibus;
   input 	nwar;
   input 	nreset;
   
   output [15:0] ar;
   
   wire [15:0] 	 ibus, ar;
      
   flipflop_574 ir_lo (ibus[7:0],  ar[7:0],  nwar, 1'b0);
   flipflop_574 ir_hi (ibus[15:8], ar[15:8], nwar, 1'b0);
endmodule // reg_ir


// The SYSDEV# and IODEVn# decoder.

module sysdev_demux (ab, nio, nsysdev, niodev1, niodev2, niodev3);
   input [15:0] ab;
   input 	nio;

   output 	nsysdev;
   output 	niodev1, niodev2, niodev3;

   wire 	cmp;
   wire [7:0] 	y;
   
   comparator_688 syscomp ({ab[15:11], 3'b0}, 8'b00000000, nio, cmp);
   demux_138 sysdemux (1, cmp, 0, ab[10:8], y);

   assign nsysdev = y[0];
   assign niodev1 = y[1];
   assign niodev2 = y[2];
   assign niodev3 = y[3];

endmodule // sysdev_demux


// The Autoindex logic

module ail (ar, nend, naindex);
   input [15:0] ar;
   input 	nend;

   output 	naindex;

   wire [15:0] 	ar;
   wire 	nend;

   wire 	naindex;

   // The comparator matches AR values like 0000_0000_1XXX_XXXX. Note
   // that AR15 is matched using the '688's active low cascade input
   // to allow for 9-bit decoding.
   wire 	nai;
   comparator_688 ailcomp (ar[14:7], 8'b0000_0001, ar[15], nai);

   // The flip-flop registers the value of NAI for the remainded of
   // the instruction (until END# is asserted). We do this because
   // indirect access clobbers the AR mid-instruction and we need the
   // entire microprogram to run with AINDEX# asserted as soon as it's
   // detected (i.e. at the end of the fetch cycle).
   
   wire [3:0] 	q;
   flipflop_112h ailreg (0, 0, 0, nai, nend, , naindex);

endmodule // ail


// The Address Bus Drive Logic. Note: bus hold is not modelled.

module ab_driver (ar, nmem, nio, ab);
   input [15:0]  ar;
   input 	 nmem, nio;

   output [15:0] ab;

   wire [15:0] 	 ar, ab;
   wire 	 nmem, nio, naben;
   
   and #6 (naben, nmem, nio);
   buffer_541 buf_lo (naben, 0, ar[7:0], ab[7:0]);
   buffer_541 buf_hi (naben, 0, ar[15:8], ab[15:8]);
endmodule // ab_driver
   
`endif //  `ifndef ar_v

// End of file
