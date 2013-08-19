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
   parameter delay = 18;
   
   input  j1, k1, clk1, set1, rst1;
   input  j2, k2, clk2, set2, rst2;
   output q1, qn1;
   output q2, qn2;

   wire   j1, k1, clk1, set1, rst1;
   wire   j2, k2, clk2, set2, rst2;
   wire   q1, qn1;
   wire   q2, qn2;

   initial begin
      // $display("BOM: 74x112");
   end

   flipflop_112h #(delay) flipflop_112h1 (j1, k1, clk1, set1, rst1, q1, qn1);
   flipflop_112h #(delay) flipflop_112h2 (j2, k2, clk2, set2, rst2, q2, qn2);
endmodule
   

module flipflop_112h (j, k, clk, set, rst, q, qn);
   parameter delay = 18;

   input j, k, clk, set, rst;
   output q, qn;

   wire j, k, clk, set, rst;
   reg 	q, qn;

   initial begin
      if (($random % 2) == 1) begin
	 q <= 1;
	 qn <= 0;
      end else begin
	 q <= 0;
	 qn <= 1;
      end
   end

   always @(negedge clk) begin
      if (set == 1 && rst == 1) begin
	 case ({j, k})
	   2'b01: begin
	      #delay
		q <= 1'b0;
	      qn <= 1'b1;
	   end
	   2'b10: begin
	      #delay
		q <= 1'b1;
	      qn <= 1'b0;
	   end
	   2'b11: begin
	      #delay
		q <= ~q;
	      qn <= ~qn;
	   end
	 endcase // case ({j, k})
      end // if (set == 1 && rst == 1)
   end

   always @ (set, rst, negedge clk) begin
      case ({set, rst})
	2'b00:
	  begin
	     #delay
	     q <= 1'b0;
	     qn <= 1'b0;
	  end
	2'b01:
	  begin
	     #delay
	     q <= 1'b1;
	     qn <= 1'b0;
	  end
	2'b10:
	  begin
	     #delay
	     q <= 1'b0;
	     qn <= 1'b1;
	  end
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

   initial begin
      // $display("BOM: 74x174");
   end

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
   parameter delay = 17;
   
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

   initial begin
      // $display("BOM: 74x175");
   end

   always @ (rst, posedge clk)
     begin
	if (rst == 1'b0) begin
	   #delay begin
	      q <= 4'b0000;
	      nq <= 4'b1111;
	   end
	end else begin
	   #delay begin
	      q <= d;
	      nq <= ~d;
	   end
	end
     end
endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x273 8-bit D flip-flop with reset
//
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_273 (d, q, clk, clr);
   parameter propagation_delay = 7;
   
   input [7:0] d;		// Data
   input       clk;		// Clock
   input       clr;		// /CLR (active low): reset

   output [7:0] q;		// Output
   
   wire [7:0] 	d;
   wire 	clk;
   wire 	clr;
 	
   reg [7:0] 	q;

   initial begin
      q <= $random;
      // $display("BOM: 74x273");
   end

   always @ (negedge clr, posedge clk)
     begin
	if (clr == 1'b0) begin
	   q <= #propagation_delay 8'b00000000;
	end else begin
	   q <= #propagation_delay d;
	end
     end
endmodule // flipflop_273


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x574 8-bit synchronous D flip-flop
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_574 (d, q, clk, oe);
   parameter propagation_delay = 7;
   
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
      // $display("BOM: 74x574");
   end

   always @ (posedge clk)
     begin
	q0 <= d;
     end // FF574

   assign #propagation_delay q = oe ? 8'bzzzzzzzz : q0;

endmodule // End of Module counter


// INVERTING octal flip-flop
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
      // $display("BOM: 74x564");
   end

   always @ (posedge clk)
     begin : FF564
	q0 <= #2 d;
     end // FF564

   assign q = (oe) ? 8'bzzzzzzzz : ~q0;

endmodule // End of Module counter


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x74 D flip-flop
//
// Notes:
//
// From http://www.kingswood-consulting.co.uk/giicm/7450.html
//
// Dual D flip-flop with set and reset.
//
//       +---+--+---+           +---+---+----+----*---+---+
// /1RST |1  +--+ 14| VCC       | D |CLK|/SET|/RST| Q |/Q |
//    1D |2       13| /2RST     +===+===+====+====*===+===+
//  1CLK |3       12| 2D        | X | X |  0 |  0 | 1 | 1 |
// /1SET |4  7474 11| 2CLK      | X | X |  0 |  1 | 1 | 0 |
//    1Q |5       10| /2SET     | X | X |  1 |  0 | 0 | 1 |
//   /1Q |6        9| 2Q        | 0 | / |  1 |  1 | 0 | 1 |
//   GND |7        8| /2Q       | 1 | / |  1 |  1 | 1 | 0 |
//       +----------+           | X |!/ |  1 |  1 | - | - |
//                              +---+---+----+----*---+---+
//
// From dataset:
//
//   HC  @ 5V, 15pF, data 14 ns, set 15ns, reset: 16ns.
//   HCT @ 5V, 15pF, data 15 ns, set/reset: 18ns.
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_74 (d1, clk1, set1, rst1, q1, qn1,
		    d2, clk2, set2, rst2, q2, qn2);
   input  d1, clk1, set1, rst1;
   input  d2, clk2, set2, rst2;
   output q1, qn1;
   output q2, qn2;

   wire   d1, clk1, set1, rst1;
   wire   d2, clk2, set2, rst2;
   wire   q1, qn1;
   wire   q2, qn2;

   initial begin
      // $display("BOM: 74x74");
   end

   flipflop_74h flipflop_74h1 (d1, clk1, set1, rst1, q1, qn1);
   flipflop_74h flipflop_74h2 (d2, clk2, set2, rst2, q2, qn2);
endmodule // flipflop_74
   

module flipflop_74h (d, clk, set, rst, q, qn);
   parameter delay1 = 15;	// For HCT
   parameter delay2 = 18;
   
   input d, clk, set, rst;
   output q, qn;

   wire d, clk, set, rst;
   reg 	q, qn;

   initial begin
      q <= 0;
      qn <= 1;
   end

   always @(posedge clk) begin
      if ({set, rst} == 2'b11) #delay1 begin
	 q <= d;
	 qn <= ~d;
      end
   end

   always @ (set, rst) begin
      case ({set, rst})
	2'b00:
	  #delay2 begin
	     q <= 1;
	     qn <= 1;
	  end
	2'b01:
	  #delay2 begin
	     q <= 1'b1;
	     qn <= 1'b0;
	  end
	2'b10:
	  #delay2 begin
	     q <= 1'b0;
	     qn <= 1'b1;
	  end
      endcase // case ({set, rst})
   end // always @ (set, rst, posedge clk)
endmodule // flipflop_74h


///////////////////////////////////////////////////////////////////////////////
//
// 74HC373 8-bit 3-state latch
//
///////////////////////////////////////////////////////////////////////////////

module latch_373 (d, oc, enc, q);
   parameter delay = 14;
   
   input [7:0]  d;
   input        oc, enc;

   output [7:0] q;

   wire [7:0] 	d;
   wire 	oc, enc;

   wire [7:0] 	q;
   reg [7:0] 	q0;

   always @(enc or d) begin
     if (enc) begin
       #(delay-2) q0 = d;
     end
   end

   assign #delay q = oc ? 8'bzzzzzzzz : q0;
endmodule // latch_373


///////////////////////////////////////////////////////////////////////////////
//
// 74HC374 8-bit D-flip-flop
//
///////////////////////////////////////////////////////////////////////////////

module flipflop_374 (d, oc, clk, q);
   parameter delay = 15;
   
   input [7:0]  d;
   input        oc, clk;

   output [7:0] q;

   wire [7:0] 	d;
   wire 	oc, clk;

   wire [7:0] 	q;
   reg [7:0] 	q0;

   always @(posedge clk) begin
      q0 = d;
   end

   assign #delay q = oc ? 8'bzzzzzzzz : q0;

endmodule // flipflop_374


module flipflop_374i (d, oc, clk, q);
   parameter delay = 15;
   
   input [7:0]  d;
   input        oc, clk;

   output [7:0] q;

   wire [7:0] 	d;
   wire 	oc, clk;

   wire [7:0] 	q;
   reg [7:0] 	q0;

   initial begin
      q0 = 8'b11111111;
   end

   always @(posedge clk) begin
      q0 = d;
   end

   assign #delay q = oc ? 8'bzzzzzzzz : q0;

endmodule // flipflop_374i


`endif //  `ifndef flipflop_v


// End of file.
