`ifndef addressableShiftRegister_v
`define addressableShiftRegister_v
`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// ADDRESSABLE SHIFT REGISTER
//
// Function: a shift register with a phase offset feature. 8 bits are input at
// a time, but shifting can start at any bit, D0 to 7. Bit 7 is output first,
// bit 0 last. A shift-end signal is asserted as bit 0 is output, and this can
// be used to clock other devices.
//
///////////////////////////////////////////////////////////////////////////////

module AddressableShiftRegister(nreset, nload, phase, shift, d, q, co);

   input       nreset, nload, shift;
   input [2:0] phase;
   input [7:0] d;

   output      q, co;
   
   reg [7:0]   d0;
   reg [2:0]   sel;
   
   always @(negedge nreset, negedge nload, negedge shift) begin
      if (nreset == 1'b0) begin
	 d0 <= 8'b00000000;
	 sel <= 3'b111;
      end else if (nload == 1'b0) begin
	 d0 <= d;
	 sel <= phase;
      end else if (shift == 1'b0) begin
	 sel <= sel - 1;
      end
   end
      
   assign co = sel != 3'b000;
   assign q = d0[sel];
   
endmodule // addressableShiftRegister

`endif


// End of file.