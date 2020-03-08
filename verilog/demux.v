///////////////////////////////////////////////////////////////////////////////
//
// Function: Demultiplexers.
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`ifndef demux_v
`define demux_v

module demux_138 (g1, ng2a, ng2b, a, y);
   parameter delay = 14;

   input        g1;		// Active high enable
   input        ng2a;		// Active low enable 1
   input        ng2b;		// Active low enable 2
   input [2:0] 	a;		// Input vector (3 bits)
   
   output [7:0] y;		// Output.
   
   reg [7:0] 	y0;

   assign #delay y = y0;

   always @ ({g1, ng2a, ng2b, a}) begin
      case ({g1, ng2a, ng2b, a})
	6'b100_000: y0 <= 8'b11111110;
	6'b100_001: y0 <= 8'b11111101;
	6'b100_010: y0 <= 8'b11111011;
	6'b100_011: y0 <= 8'b11110111;
	6'b100_100: y0 <= 8'b11101111;
	6'b100_101: y0 <= 8'b11011111;
	6'b100_110: y0 <= 8'b10111111;
	6'b100_111: y0 <= 8'b01111111;
	default:    y0 <= 8'b11111111;
      endcase // case (a)
   end // always @ ({g1, ng2a, ng2b, a})
endmodule // demux_138


module demux_139 (ng1, a1, y1, ng2, a2, y2);
   parameter delay = 16;

   input        ng1, ng2;	// Active low enables
   input [1:0] 	a1, a2;		// Input vector (3 bits)
   
   output [3:0] y1, y2;		// Output.
   
   wire 	ng1, ng2;
   wire [1:0] 	a1, a2;
   
   reg [3:0] 	y01, y02;
   wire [3:0] 	y1, y2;
   
   wire 	q;

   demux_139h h1 (.ng(ng1), .a(a1), .y(y1));
   demux_139h h2 (.ng(ng2), .a(a2), .y(y2));
   
endmodule // demux_138




module demux_139h (ng, a, y);
   parameter delay = 16;

   input        ng;		// Active high enable
   input [1:0] 	a;		// Input vector (3 bits)
   
   output [3:0] y;		// Output.
   
   wire 	ng;
   wire [1:0] 	a;
   
   reg [3:0] 	y0;
   wire [3:0] 	y;
   
   wire 	q;

   initial begin
     y0 = 4'b1111;
   end

   // The 139 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.
   assign #delay y = ng ? 4'b1111 : y0;
   
   always @ (a) begin
      case (a)
	0: y0 = 4'b1110;
	1: y0 = 4'b1101;
	2: y0 = 4'b1011;
	3: y0 = 4'b0111;
	default: y0 = 4'b1111; // Could happen when a=X.
      endcase // case (a)
   end // always @ (a)

endmodule // demux_139h

// Just like a '138, but with active-high outputs
module demux_238 (g1, ng2a, ng2b, a, y);
   parameter delay = 14;

   input        g1;		// Active high enable
   input        ng2a;		// Active low enable 1
   input        ng2b;		// Active low enable 2
   input [2:0] 	a;		// Input vector (3 bits)
   
   output [7:0] y;		// Output.
   
   reg [7:0] 	y0;

   assign #delay y = y0;

   always @ ({g1, ng2a, ng2b, a}) begin
      case ({g1, ng2a, ng2b, a})
	6'b100_000: y0 <= 8'b00000001;
	6'b100_001: y0 <= 8'b00000010;
	6'b100_010: y0 <= 8'b00000100;
	6'b100_011: y0 <= 8'b00001000;
	6'b100_100: y0 <= 8'b00010000;
	6'b100_101: y0 <= 8'b00100000;
	6'b100_110: y0 <= 8'b01000000;
	6'b100_111: y0 <= 8'b10000000;
	default:    y0 <= 8'b00000000;
      endcase // case (a)
   end // always @ ({g1, ng2a, ng2b, a})
endmodule // demux_238


`endif //  `ifndef demux_v

// End of file.
