///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// FUNCTION: constant store.
//
// NOTES: outputs 0000, 0001, 0003 or 0004 to the ibus.
//
// Constants we need:
//
// Value Uses
// ----------------------------------------------------------------------------
// 0000  Reset vector. (initial value of PC)
// 0001  Not used (yet), but available as a side-effect of the wiring.
// 0002  ISR vector.
// 0003  ISR vector bank.
//
// To arrive at this layout, we decode RADDR and direct RADDR₀ and
// RADDR₁ straight to the IBUS:
// _______  ____
// RSTHOLD  RUEN  RADDR  Constant        
// ------------------vv-------------------vv-----------------------------------
//    0      X    XXXXX  0000'0000'0000'0000   Resetting. drive 0000.
//    1      1    XXXXX  High impedance        Read units disabled.
//    1      0    0XXXX  High impedance        CS not selected.
//    1      0    10XXX  High impedance        CS not selected.
//    1      0    11000  0000'0000'0000'0000   CS0 selected, drive 0000.
//    1      0    11001  0000'0000'0000'0001   CS1 selected, drive 0001.
//    1      0    11010  0000'0000'0000'0010   CS2 selected, drive 0002.
//    1      0    11011  0000'0000'0000'0011   CS3 selected, drive 0003.
//    1      0    111XX  High impedance        CS not selected.
// ------------------^^-------------------^^-----------------------------------
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "demux.v"
`include "mux.v"
`timescale 1ns/10ps

module constant_store (nrsthold, nruen, raddr, ibus);
   input         nrsthold;	// Active low: RSTHOLD
   input 	 nruen;		// Active low: RUEN
   input [4:0] 	 raddr;		// Read address

   output [15:0]  ibus;		// 

   wire [1:0] 	 constant;	// 

   // A decoder for the rest of the signals.
   wire [7:0] 	 y;
   wire 	 nread_csx, ncsoe;

   demux_138 cs_decoder (.g1(raddr[4]), .g2a(raddr[2]), .g2b(nruen), .a({2'b00, raddr[3]}), .y(y));
   assign nread_csx = y[1];
   assign #4 ncsoe = nrsthold & nread_csx;

   mux_253 cs_valuemux (.sel({nrsthold, 1'b0}),
			.i1({raddr[0], raddr[0], 2'b00}), .oe1(1'b0), .y1(constant[0]),
			.i2({raddr[1], raddr[1], 2'b00}), .oe2(1'b0), .y2(constant[1]));

   buffer_541 cs_buflo (.oe1(ncsoe), .oe2(ncsoe), .a({6'b000000, constant}), .y(ibus[7:0]));
   buffer_541 cs_bufhi (.oe1(ncsoe), .oe2(ncsoe), .a({8'b00000000}),         .y(ibus[15:8]));
   
endmodule // constant_store

// End of file.
