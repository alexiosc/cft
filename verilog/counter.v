///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x161 4-bit synchronous presettable counter
//
// Dataset: 74ACT161.pdf
//
///////////////////////////////////////////////////////////////////////////////

`ifndef counter_v
`define counter_v

`timescale 1ns/10ps

module counter_161 (
		    mr,		// /MR: Reset
		    cp,		// CP: Clock
		    cet,	// Enable 1: counts if cet and cep
		    cep,	// Enable 2: counts if cet and cep
		    pe,		// /PE: Load
		    p,		// Value in
		    q,		// Value out
		    tc		// High if q==1111
		    );

   input       mr;
   input       cp;
   input       cet;
   input       cep;
   input       pe;
   input [3:0] p;
   
   output [3:0] q;
   output 	tc;

   wire 	mr;
   wire 	cp;
   wire 	cet;
   wire 	cep;
   wire 	pe;
   wire [3:0] 	p;
 	
   reg [3:0] 	q;
   reg		tc;

   initial begin
      $display("BOM: 74x161");
   end

   // Note: propagation delays are for 74ACT161 running at 5V.

   always @ (negedge mr, posedge cp)
     begin : COUNTER

	// Precedence of operations: reset, load, count, hold.

	// Master reset (/MR) overrides everything.
	if (mr == 1'b0) begin
	   q <= #6 4'b0000;
	end

	else
	  // This only gets processed when MR is inactive, so on the
	  // positive edge of cp.

	  if (pe == 1'b0) begin
	     // Load.
	     q <= #5 p;
	  end

	  else if (cet == 1'b1 && cep == 1'b1) begin
	     // Count
	     q <= #7 q + 1;
	  end
     end // End of Block COUNTER

   always @ (q)
     begin
	if (q == 4'b1111)
	      tc <= 1;
	else tc <= 0;
     end
   

endmodule // counter_161


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x193 4-bit synchronous presettable up/down counter
//
///////////////////////////////////////////////////////////////////////////////

module counter_193 (clear, load, p, count_up, count_down, q, carry, borrow);

   parameter delay = 45;	// approxmate maximum delay at 25°C, 5V.
   
   input        clear;		// active high, on rising edge
   input        load;		// active low, on falling edge
   input [3:0]  p;
   input        count_up;	// on rising edge
   input        count_down;	// on rising edge
   output [3:0] q;
   output 	carry;
   output 	borrow;

   wire 	clear;
   wire 	load;
   wire [3:0] 	p;
   wire 	count_up;
   wire 	count_down;

   reg [3:0] 	q;
   wire 	carry;
   wire 	borrow;

   initial begin
      $display("BOM: 74x193");
   end

   always @ (clear, load) begin
      if (clear == 1) begin
	 #delay q <= 4'b0000;
      end else if (load == 0) begin
	 #delay q <= p;
      end
   end

   always @(posedge count_up) begin
      if (clear == 0 && load == 1) #delay q <= q + 1;
   end

   always @(posedge count_down) begin
      if (clear == 0 && load == 1) #delay q <= q - 1;
   end

   // Calculate carry and borrow out
   assign #delay borrow = (q == 4'b0000 && count_down == 0) ? 1'b0 : 1'b1;
   assign #delay carry = (q == 4'b1111 && count_up == 0) ? 1'b0 : 1'b1;
endmodule // counter_193


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x590 8-bit counter. CAUTION: buggy implementation
//
///////////////////////////////////////////////////////////////////////////////

module counter_590 (clk, ccken, cclr, rck, g, q, rco);
   parameter delay = 16;
		    
   input clk, ccken, cclr, rck, g;
   output [7:0] q;
   output rco;

   reg 	  [7:0] count;
   reg    [7:0] oreg;

   assign #delay q = g ? 8'bzzzzzzzz : oreg;
   assign #delay rco = count == 0 ? 1'b0 : 1'b1;

   always @(cclr) begin
      if (cclr == 0) count = 0;
   end

   always @(posedge clk) begin
      if (ccken == 1'b0 && cclr == 1'b1) begin
	 #(delay + 2) count = (count + 1) & 255;
      end
   end

   always @(posedge rck) begin
      #delay oreg = count;
   end
endmodule // counter_590

`endif //  `ifndef counter_v

// End of file.
