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

module demux_138 (g1, g2a, g2b, a, y);
   parameter delay = 15;

   input       g1;		// Active high enable
   input       g2a;		// Active low enable 1
   input       g2b;		// Active low enable 2
   input [2:0] a;		// Input vector (3 bits)

   output [7:0] y;		// Tri-state output.
   
   wire        g1, g2a, g2b;
   wire [2:0]  a;

   reg [7:0]   y0;
   wire [7:0]  y;

   // The 138 DOES NOT tri-state output. Instead, when disabled, all
   // its active-low outputs are high.
   assign #delay y = (g1 && !g2a && !g2b) ? y0 : 8'b11111111;
   
   always @ (a) begin
      case (a)
	0: y0 = 8'b11111110;
	1: y0 = 8'b11111101;
	2: y0 = 8'b11111011;
	3: y0 = 8'b11110111;
	4: y0 = 8'b11101111;
	5: y0 = 8'b11011111;
	6: y0 = 8'b10111111;
	7: y0 = 8'b01111111;
	default: $display("demux_138: should never happen!");
      endcase
     end // FF574

   assign q = (oe) ? 8'bzzzzzzzz : q0;

endmodule // End of Module counter

`endif //  `ifndef demux_v

// End of file.
