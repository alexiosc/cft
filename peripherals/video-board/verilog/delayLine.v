`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// DELAY LINE
//
// Function: 8-stage digital delay line with reset. Data (d) is clocked in on
// the rising edge of clk. On every clk pulse, data ripples to the next
// stage. The parameter delay (0..7) selects the output of any of the stages
// and outputs it to q. Thus, q lags behind d by delay+1 clocks.
//
///////////////////////////////////////////////////////////////////////////////

module DelayLine(nreset, clk, d, delay, q);

   input       nreset, clk, d;
   input [2:0] delay;

   output      q;
   
   reg [7:0]   d0;
   
   always @(negedge nreset, posedge clk) begin
      if (nreset == 1'b0) begin
	 d0 <= 8'b00000000;
      end else if (clk == 1'b1) begin
	 d0 <= {d0[6:0], d};
      end
   end
      
   assign q = d0[delay];
   
endmodule // DelayLine

// End of file.