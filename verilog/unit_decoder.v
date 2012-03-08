///////////////////////////////////////////////////////////////////////////////
//
// Unit Decoder
//
///////////////////////////////////////////////////////////////////////////////

`include "demux.v"
`include "buffer.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module unit_decoder (clk5, nguard, nreset, nuce,
		     runit, wunit,
		     nragl, nrpc, nrdr, nrac,
		     nwar, nwpc, nwir, nwdr, nwac, nwalu);

   input        clk5, nguard, nreset, nuce;
   input [3:0] 	runit;
   input [2:0] 	wunit;

   output       nragl, nrpc, nrdr, nrac;
   output 	nwar, nwpc, nwir, nwdr, nwac, nwalu;
   
   wire 	clk5, nguard, nreset, nuce;
   wire [3:0] 	runit;
   wire [2:0] 	wunit;

   tri1 	nragl, nrpc, nrdr, nrac;
   tri1 	nwar, nwpc, nwir, nwac, nwalu;


   // Partial read unit decoder. Only values values 0-7 are decoded. The rest
   // are handled by the ALU.
   wire [7:0] 	ry0;
   demux_138 read_demux(nreset, runit[3], 1'b0, runit[2:0], ry0);

   // Uncomment additional lines to use GUARD# on the specified lines. This
   // simulates the jumpers in the schematic.
   wire 	nrac0, nrdr0, nrpc0, nragl0;
   assign nragl0 = ry0[2];
   //or #6 guard_agl (nragl0, ry0[2], nguard);
   assign nrpc0 = ry0[3];
   //or #6 guard_pc (nrpc0, ry0[3], nguard);
   assign nrdr0 = ry0[4];
   //or #6 guard_dr (nrdr0, ry0[4], nguard);
   assign nrac0 = ry0[5];
   //or #6 guard_ac (nrac0, ry0[5], nguard);

   // Buffer the outputs. When UCE# is asserted, unit decoders tri-state their
   // control lines.
   tri1 [7:0] 	ry1;
   buffer_541 read_buf(nuce, 1'b0, {2'b0, nrac0, nrdr0, nrpc0, nragl0, 2'b0}, ry1);
   // Lines 0, 1 and 6, 7 are unused.
   assign nragl = ry1[2];
   assign nrpc = ry1[3];
   assign nrdr = ry1[4];
   assign nrac = ry1[5];


   // Write unit decoder. This demux produces a write strobe ANDed with CLK5,
   // which is our write clock. We use the '138 for that.

   wire [7:0] 	wy0;
   demux_138 write_demux(nreset, clk5, 1'b0, wunit, wy0);

   // Buffer the outputs. When UCE# is asserted, unit decoders tri-state their
   // control lines.
   tri1 [7:0] 	wy1;
   buffer_541 write_buf(nuce, 1'b0, wy0, wy1);
   // Lines 0 & 1 are unused.
   assign nwar = wy1[2];
   assign nwpc = wy1[3];
   assign nwir = wy1[4];
   assign nwdr = wy1[5];
   assign nwac = wy1[6];
   assign nwalu = wy1[7];

endmodule // unit_decoder

// End of file.
