///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: constant store.
//
// NOTES: outputs either 0000, 0001 or FFFE to the ibus.
//
// Constants we need:
//
// Value Uses
// -------------------------------------------------------------------------------
// 0000  JSR instruction return vector. Zero source for OP1 CLA, OP2 CLA2.
// 0001  TRAP instruction return vector.
// 0002  ISR return vector.
// FFFE: ISR vector.
// FFFF: Reset vector.
//
// There are two unit select signals from the Control Unit:
//
// -r_cs1: return vectors (000X)
// -r_cs2: service vectors (FFFX)
//
// The entire collection of vectors could have been done with just one
// select line, but since microcode can't directly control the
// constant, and we decide on that using the LSB of the IR (in part),
// no microprogram could use two different values. It turns out the
// ISR microprogram needs to do just this (store the PC in RAM, then
// jump to a predefined location).
//
// _____ _____ ___ ___
// r_cs1 r_cs2 RST INT  Value  Notes
// --------------------------------------------------------------------------
//   X     X    0   X    FFF0  Reset vector
//   0     0    X   X          Never happens (r_csX are '138 outputs)
//
//   0     1    0   0          Never happens (INTs disabled in RST code)
//   0     1    0   1          Undefined
//   0     1    1   0    0002  r_cs1: ISR return vector
//   0     1    1   1    0000  r_cs1: JSR instruction return vector
//
//   1     0    0   0          Never happens (INTs disabled in RST code)
//   1     0    0   1          Undefined
//   1     0    1   0    FFF8  r_cs2: ISR vector
//   1     0    1   1    0001  r_cs2: TRAP instruction return vector
//
// We use -r_cs1, -r_cs2 and -int to control a '138, enabled by -RST
// being high (the active-high G1 input):
//
// ___ _____ _____ ___ 
// rst r_cs1 r_cs2 int Y Notes
//  0    X     X    X  - '138 deselected
//  1    0     0    0  0 Never happens
//  1    0     0    1  1 Never happens
//  1    0     1    0  2 *** 0002 (cs1, int: ISR return vector)
//  1    0     1    1  3 *** 0000 (cs1     : JSR instruction return vector)
//  1    1     0    0  4 *** FFFE (cs2, int: ISR vector)
//  1    1     0    1  5 *** 0001 (cs2     : TRAP instruction return vector)
//  1    1     1    0  6 Unit deselected
//  1    1     1    1  7 Unit deselected
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "demux.v"
`timescale 1ns/10ps

module constant_store (in_rst, in_int, r_cs1, r_cs2, q);
   input         in_rst;	// Active low: In RST handler
   input 	 in_int;	// Active low: In INT handler
   input 	 r_cs1;		// Active low: CS1 selected
   input 	 r_cs2;		// Active low: CS2 selected

   output [15:0] q;

   wire [7:0] 	 cen;

   // A decoder for the rest of the signals.
   demux_138 ct_demux (in_rst, 0, 0, {r_cs1, r_cs2, in_int}, cen);
   
   // The reset vector
   buffer_244 rsthi (in_rst, in_rst, 4'b0000, 4'b1111, q[3:0], q[7:4]);
   buffer_244 rstlo (in_rst, in_rst, 4'b1111, 4'b1111, q[11:8], q[15:12]);

   // The ISR return vector (0002)
   buffer_244 isrrlo (cen[2], cen[2], 4'b0010, 4'b0000, q[3:0], q[7:4]);
   buffer_244 isrrhi (cen[2], cen[2], 4'b0000, 4'b0000, q[11:8], q[15:12]);

   // The JSR return vector (0000)
   buffer_244 jsrlo (cen[3], cen[3], 4'b0000, 4'b0000, q[3:0], q[7:4]);
   buffer_244 jsrhi (cen[3], cen[3], 4'b0000, 4'b0000, q[11:8], q[15:12]);

   // The ISR vector (fffe)
   buffer_244 isrvlo (cen[4], cen[4], 4'b1000, 4'b1111, q[3:0], q[7:4]);
   buffer_244 isrvhi (cen[4], cen[4], 4'b1111, 4'b1111, q[11:8], q[15:12]);

   // The TRAP return vector (0001)
   buffer_244 traplo (cen[5], cen[5], 4'b0001, 4'b0000, q[3:0], q[7:4]);
   buffer_244 traphi (cen[5], cen[5], 4'b0000, 4'b0000, q[11:8], q[15:12]);

/* -----\/----- EXCLUDED -----\/-----
   always @(cs[0]) begin
      if (cs[0] == 1) begin
	 // cs[0] == 0 for now. Apply a sanity check.
	 $display("ERROR: constant_store: cs[0] is 1. Sanity check failed.");
	 //#500 $finish();
      end
   end
   
   // Use a '138 to evaluate the constant store function.
   demux_138 ct_demux (1, oe, 0, {rst, cs}, cen);

   // TODO: these are diode-based 'gates'.
   and #2 (hi, cen[4], cen[6]);
   and #2 (lo, cen[0], cen[1], cen[2], cen[3], cen[4], cen[5]);

   assign q0 = {{15{hi}}, lo};

   buffer_244 buf0 (oe, oe, q0[3:0], q0[7:4], q[3:0], q[7:4]);
   buffer_244 buf1 (oe, oe, q0[11:8], q0[15:12], q[11:8], q[15:12]);

   buffer_244 buf2 (rst, rst, q0[3:0], q0[7:4], q[3:0], q[7:4]);
   buffer_244 buf3 (rst, rst, q0[11:8], q0[15:12], q[11:8], q[15:12]);
 -----/\----- EXCLUDED -----/\----- */
   
endmodule // constant_store

// End of file.
