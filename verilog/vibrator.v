///////////////////////////////////////////////////////////////////////////////
//
// Function: Monostable vibrators
//
///////////////////////////////////////////////////////////////////////////////

`ifndef vibrator_v
`define vibrator_v

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x123h astable vibrator
//
///////////////////////////////////////////////////////////////////////////////

module vibrator_123h(a, b, clr, q, nq);
   parameter delay = 200;
   
   input        a, b, clr;	// /OE tri-state active-low enables
   output 	q, nq;

   wire 	a, b, clr, q, nq;
   reg 		q0;

   initial begin
      $display("BOM: 1/2 74x123");
      q0 <= 0;
   end

   always @(negedge a) begin
      if (b == 1) begin
	 q0 <= 1'b1;
	 #delay q0 <= 1'b0;
      end
   end

   always @(posedge b) begin
      if (a == 0) begin
	 q0 <= 1'b1;
	 #delay q0 = 1'b0;
      end
   end

   always @(negedge clr) begin
      q0 = 0;
   end

   assign q = clr ? q0 : 1'b0;
   assign nq = clr ? ~q0 : 1'b1;
   
endmodule // vibrator_123h

///////////////////////////////////////////////////////////////////////////////
//
// Function: Basic simulation of a 555 in astable multivibrator mode
//
///////////////////////////////////////////////////////////////////////////////

module vibrator_555(q);
   parameter t_on = 200;
   parameter t_off = 200;

   output q, nq;
   reg 	  q;

   initial begin
      $display("BOM: 555");
      q <= 0;
   end

   always begin
      #t_off q <= 1;
      #t_on q <= 0;
   end
endmodule // vibrator_555

`endif //  `ifndef
// End of file.
