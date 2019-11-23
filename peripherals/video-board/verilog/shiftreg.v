`ifndef shiftreg_v
 `define shiftreg_v

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// n-BIT SHIFT REGISTER WITH RESET
//
// Function: an n-bit shift register. It resets to 0 asynchronously
// when nreset is low, loads the value of d when nload is low, and
// shifts out (MSB first) on the falling edge of shift.
//
///////////////////////////////////////////////////////////////////////////////


module shiftreg(nreset, nload, shift, d, q);

   parameter bits = 8;
   
   input 	    nreset, nload, shift;
   input [bits-1:0] d;
   
   output 	    q;

   reg [bits-1:0]   d0;

   always @(negedge nreset, negedge nload, negedge shift) begin
      if (nreset == 1'b0) d0 <= 0;
      else if (nload == 1'b0) d0 <= d;
      else if (shift == 1'b0) d0 <= {d0[bits-2:0], 1'b0};
   end
      
   assign q = d0[7];
   
endmodule // shiftreg8

`endif //  `ifndef shiftreg_v

// End of file.


