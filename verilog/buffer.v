///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state noninverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef buffer_v
`define buffer_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_240 (oe1, oe2, a1, a2, y1, y2);
   parameter delay = 7;
   
   input        oe1, oe2;	// /OE tri-state active-low enables
   input [3:0]  a1, a2;		// Inputs

   output [3:0] y1, y2;		// Tri-state outputs

   wire 	oe1, oe2;
   wire [3:0] 	a1, a2;
   wire [3:0] 	y1, y2;

   initial begin
      // $display("BOM: 74x240");
   end

   assign #delay y1 = oe1 ? 4'bzzzz : ~a1;
   assign #delay y2 = oe2 ? 4'bzzzz : ~a2;
endmodule // End of Module buffer


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x244 4-bit Dual 4-bit 3-state inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_244 (oe1, oe2, a1, a2, y1, y2);
   parameter delay = 7;
   
   input        oe1, oe2;	// /OE tri-state active-low enables
   input [3:0]  a1, a2;		// Inputs

   output [3:0] y1, y2;		// Tri-state outputs

   wire 	oe1, oe2;
   wire [3:0] 	a1, a2;
   wire [3:0] 	y1, y2;

   initial begin
      // $display("BOM: 74x244");
   end

   assign #delay y1 = oe1 ? 4'bzzzz : a1;
   assign #delay y2 = oe2 ? 4'bzzzz : a2;
endmodule // End of Module buffer


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x245 8-bit 3-state noninverting bus transceiver. 
//
// Notes: DIR=1 -> B <--- A
//        DIR=0 -> A <--- B
//
///////////////////////////////////////////////////////////////////////////////

module buffer_245 (dir, nen, a, b);
   parameter delay = 7;
   
   input        dir;
   input 	nen;
   inout [7:0] 	a, b;

   wire 	dir;
   wire 	nen;
   wire [7:0] 	a, b;

   initial begin
      // $display("BOM: 74x245");
   end

   assign #delay a = (!nen && !dir) ? b : 8'bzzzzzzzz;
   assign #delay b = (!nen && dir) ? a : 8'bzzzzzzzz;
endmodule // End of Module buffer

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x125 4-bit tri-state buffer
//
///////////////////////////////////////////////////////////////////////////////

module buffer_125q (a, noe, y);
   parameter delay = 15;
   
   input        a, noe;
   output       y;

   wire 	a, noe, y;

   initial begin
      // $display("BOM: 1/4 74x125");
   end

   assign #delay y = noe ? 1'bz : a;
endmodule // End of Module buffer



///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x541 8-bit 3-state non-inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_541 (noe1, noe2, a, y);
   parameter delay = 10;
   
   input        noe1, noe2;	// /OE tri-state active-low enables
   input [7:0] 	a;

   output [7:0] y;

   assign #delay y = noe1 || noe2 ? 8'bzzzzzzzz : a;
endmodule // buffer_541


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x540 8-bit 3-state inverting buffer/line driver.
//
///////////////////////////////////////////////////////////////////////////////

module buffer_540 (oe1, oe2, a, y);
   parameter delay = 10;
   
   input        oe1, oe2;	// /OE tri-state active-low enables
   input [7:0] 	a;

   output [7:0] y;

   assign #delay y = oe1 || oe2 ? 8'bzzzzzzzz : ~a;
endmodule // buffer_540

`endif //  `ifndef buffer_v

// End of file.
