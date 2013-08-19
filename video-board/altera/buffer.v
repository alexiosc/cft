`ifndef buffer_v
 `define buffer_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT BUFFER
//
///////////////////////////////////////////////////////////////////////////////


module buffer(d, en, q);

   parameter bits = 4;

   input [bits-1:0] 	 d;
   input 		 en;

   output reg [bits-1:0] q;

   assign q = en == 1'b1 ? d : 64'hz;

endmodule // buffer

`endif //  `ifndef buffer_v

// End of file.
