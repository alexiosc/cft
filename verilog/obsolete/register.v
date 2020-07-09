`ifndef register_v
`define register_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x670 dual synchronous JK flip-flop
//
// Notes:
//
// From http://www.kingswood-consulting.co.uk/giicm/74600.html
//
// 4x4-bit 3-state dual-port register file.
// 
//     +---+--+---+
//  D2 |1  +--+ 16| VCC
//  D3 |2       15| D1
//  D4 |3       14| WA0
// RA1 |4   74  13| WA1
// RA0 |5  670  12| /WE
//  Q4 |6       11| /RE
//  Q3 |7       10| Q1
// GND |8        9| Q2
//     +----------+
//
///////////////////////////////////////////////////////////////////////////////

module register_670 (d, wa, nwe, q, ra, nre);
   parameter delay = 21;
   
   input [3:0] d;		// Data in
   input [1:0] wa;		// Write address
   input       nwe;		// Latch in enable (active low)

   input [1:0] ra;		// Read address
   input       nre;		// Output enable (active low, high: q=ZZZZ)

   output [3:0] q;		// Output

   reg [3:0] 	r0, r1, r2, r3;

   initial begin
      r0 <= $mti_random;
      r1 <= $mti_random;
      r2 <= $mti_random;
      r3 <= $mti_random;
   end

   // Write port
   always @(nwe, wa) if (nwe == 1'b0) begin
      case (wa)
	0: r0 <= d;
	1: r1 <= d;
	2: r2 <= d;
	3: r3 <= d;
      endcase // case (wa)
   end

   // Read port
   assign #delay q = (nre == 1'b0 && ra == 0) ? r0 : 4'bzzzz;
   assign #delay q = (nre == 1'b0 && ra == 1) ? r1 : 4'bzzzz;
   assign #delay q = (nre == 1'b0 && ra == 2) ? r2 : 4'bzzzz;
   assign #delay q = (nre == 1'b0 && ra == 3) ? r3 : 4'bzzzz;

endmodule // register_670
   

`endif //  `ifndef register_v


// End of file.
