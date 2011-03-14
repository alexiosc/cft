`ifndef flipflop_v
`define flipflop_v


`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x112 dual synchronous JK flip-flop
//
// Notes:
//
// From http://www.kingswood-consulting.co.uk/giicm/74100.html
//
// Dual negative-edge-triggered J-K flip-flops with set and reset.
// 
//       +---+--+---+           +---+---+----+----+----*---+---+
// /1CLK |1  +--+ 16| VCC       | J | K |/CLK|/SET|/RST| Q |/Q |
//    1K |2       15| /1RST     +===+===+====+====+====*===+===+
//    1J |3       14| /2RST     | X | X |  X |  0 |  0 | 0 | 0 |
// /1SET |4   74  13| /2CLK     | X | X |  X |  0 |  1 | 1 | 0 |
//    1Q |5  112  12| 2K        | X | X |  X |  1 |  0 | 0 | 1 |
//   /1Q |6       11| 2J        | 0 | 0 |  \ |  1 |  1 | - | - |
//   /2Q |7       10| /2SET     | 0 | 1 |  \ |  1 |  1 | 0 | 1 |
//   GND |8        9| 2Q        | 1 | 0 |  \ |  1 |  1 | 1 | 0 |
//       +----------+           | 1 | 1 |  \ |  1 |  1 |/Q | Q |
//                              | X | X | !\ |  1 |  1 | - | - |
//                              +---+---+----+----+----*---+---+
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_112 (j1, k1, clk1, set1, rst1, q1, qn1,
		     j2, k2, clk2, set2, rst2, q2, qn2);
   input  j1, k1, clk1, set1, rst1;
   input  j2, k2, clk2, set2, rst2;
   output q1, qn1;
   output q2, qn2;

   wire   j1, k1, clk1, set1, rst1;
   wire   j2, k2, clk2, set2, rst2;
   wire   q1, qn1;
   wire   q2, qn2;

   flipflop_112h flipflop_112h1 (j1, k1, clk1, set1, rst1, q1, qn1);
   flipflop_112h flipflop_112h2 (j2, k2, clk2, set2, rst2, q2, qn2);
endmodule
   

module flipflop_112h (j, k, clk, set, rst, q, qn);
   input j, k, clk, set, rst;
   output q, qn;

   wire j, k, clk, set, rst;
   reg 	q, qn;

   // initial begin
   //    q <= $random;
   //    qn <= $random;
   // end

   always @ (set, rst, negedge clk) begin
      case ({set, rst})
	2'b00:
	  begin
	     q <= 1'b0;
	     qn <= 1'b0;
	  end
	2'b01:
	  begin
	     q <= 1'b1;
	     qn <= 1'b0;
	  end
	2'b10:
	  begin
	     q <= 1'b0;
	     qn <= 1'b1;
	  end
	2'b11:
	  begin
	     if (clk == 0'b00) begin
		case ({j, k})
		  2'b01: begin
		     q <= 1'b0;
		     qn <= 1'b1;
		  end
		  2'b10: begin
		     q <= 1'b1;
		     qn <= 1'b0;
		  end
		  2'b11: begin
		     q <= ~q;
		     qn <= ~qn;
		  end
		endcase // case ({j, k})
	     end // if (clk == 0'b00)
	  end // case: 2'b11
      endcase // case ({set, rst})
   end
endmodule // flipflop_jk


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x174 6-bit synchronous D flip-flop with reset
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_174 (d, q, clk, rst);
   input [5:0] d;		// Data
   input       clk;		// Clock (rising edge)
   input       rst;		// /RST (active low): output enable

   output [5:0] q;		// Output
   
   wire [5:0] 	d;
   wire 	clk;
   wire 	rst;
 	
   reg [5:0] 	q;

   always @ (rst, posedge clk)
     begin
	if (rst == 1'b0) begin
	   q <= 6'b000000;
	end else begin
	   q <= d;
	end
     end
endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x175 4-bit D flip-flop with complementary outputs and reset
//
// Notes:
//
//      +---+--+---+            +----+---+---*---+---+
// /RST |1  +--+ 16| VCC        |/RST|CLK| D | Q |/Q |
//   Q1 |2       15| Q4         +====+===+===*===+===+
//  /Q1 |3       14| /Q4        |  0 | X | X | 0 | 1 |
//   D1 |4   74  13| D4         |  1 | / | 0 | 0 | 1 |
//   D2 |5  175  12| D3         |  1 | / | 1 | 1 | 0 |
//  /Q2 |6       11| /Q3        |  1 |!/ | X | - | - |
//   Q2 |7       10| Q3         +----+---+---*---+---+
//  GND |8        9| CLK
//      +----------+
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_175 (d, q, nq, clk, rst);
   input [3:0] d;		// Data
   input       clk;		// Clock (rising edge)
   input       rst;		// /RST (active low): output enable

   output [3:0] q;		// Output
   output [3:0] nq;		// Complementary output
   
   wire [3:0] 	d;
   wire 	clk;
   wire 	rst;
 	
   reg [3:0] 	q;
   reg [3:0] 	nq;

   always @ (rst, posedge clk)
     begin
	if (rst == 1'b0) begin
	   q <= 4'b0000;
	   nq <= 4'b1111;
	end else begin
	   q <= d;
	   nq <= ~d;
	end
     end
endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x574 8-bit synchronous D flip-flop
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_574 (d, q, clk, oe);
   parameter propagation_delay = 2;
   
   input [7:0] d;		// Data
   input       clk;		// Clock
   input       oe;		// /OE (active low): output enable

   output [7:0] q;		// Output
   
   wire [7:0] 	d;
   wire 	clk;
   wire 	oe;
 	
   reg [7:0] 	q0;

   wire [7:0] 	q;

   initial begin
      q0 <= $random;
   end

   always @ (posedge clk)
     begin : FF574
	q0 <= #propagation_delay d;
     end // FF574

   assign q = (oe) ? 8'bzzzzzzzz : q0;

endmodule // End of Module counter


module flipflop_564 (d, q, clk, oe);
   input [7:0] d;		// Data
   input       clk;		// Clock
   input       oe;		// /OE (active low): output enable

   output [7:0] q;		// Output
   
   wire [7:0] 	d;
   wire 	clk;
   wire 	oe;
 	
   reg [7:0] 	q0;

   wire [7:0] 	q;

   initial begin
      q0 <= $random;
   end

   always @ (posedge clk)
     begin : FF564
	q0 <= #2 d;
     end // FF574

   assign q = (oe) ? 8'bzzzzzzzz : ~q0;

endmodule // End of Module counter

`endif //  `ifndef flipflop_v

// End of file.

