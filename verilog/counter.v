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

   parameter delay = 20;

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
   wire		tc;
 	
   reg [3:0] 	q;

   initial begin
      // $display("BOM: 74x161");
   end

   and #delay (tc, cet, q[0], q[1], q[2], q[3]);

   always @ (mr, pe) begin
      if (mr == 0) begin
	 #delay q <= 4'b0000;
      end else if (pe == 0) begin
	 #delay q <= p;
      end
   end

   always @ (posedge cp) begin
      if (cet == 1 && cep == 1) begin
	 #delay q <= q + 1;
      end
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
      // $display("BOM: 74x193");
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
// Function: 74x590 8-bit counter. CAUTION: buggy/incomplete implementation
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
   assign #delay rco = count == 255 ? 1'b0 : 1'b1;

   always @(cclr) begin
      if (cclr == 0) count = 0;
   end

   always @(posedge clk) begin
      if (ccken == 1'b0 && cclr == 1'b1) begin
	 #(delay + 2) count = cclr ? (count + 1) & 255 : 0;
      end
   end

   always @(posedge rck) begin
      #delay oreg = count;
   end
endmodule // counter_590



module counter_590i (clk, ccken, cclr, rck, g, q, rco);
   parameter delay = 16;
		    
   input clk, ccken, cclr, rck, g;
   output [7:0] q;
   output rco;

   reg 	  [7:0] count;
   reg    [7:0] oreg;

   assign #delay q = g ? 8'bzzzzzzzz : oreg;
   assign #delay rco = count == 255 ? 1'b0 : 1'b1;

   initial begin
      count = 0;
      oreg = 0;
   end

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



///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x393 4-bit counter with reset.
//
///////////////////////////////////////////////////////////////////////////////

module counter_393h (clk, clr, q);
   parameter delay = 18;
		    
   input 	clk, clr;
   output [3:0] q;
   reg [3:0] 	q;
   
   always @(clr) begin
      if (clr == 0) q = 0;
   end

   always @(negedge clk) begin
      if (clr == 1) #delay q = q + 1;
   end
endmodule // counter_393h



///////////////////////////////////////////////////////////////////////////////
//
// Function: 40x17 Decimal Counter/Divider
//
///////////////////////////////////////////////////////////////////////////////

module counter_4017 (clk, nclken, reset, q, co);
   parameter delay = 0;
		    
   input 	clk, nclken, reset;
   
   output [9:0] q;
   output 	co;
   
   reg [3:0] 	count;
   wire [9:0] 	q;
   wire		co;
   
   always @(reset) begin
      if (reset == 1) count = 0;
   end

   always @(posedge clk) begin
      if (reset == 0 && nclken == 0) #delay count = (count + 1) % 10;
   end

   assign #delay q[0] = count == 0 ? 1 : 0;
   assign #delay q[1] = count == 1 ? 1 : 0;
   assign #delay q[2] = count == 2 ? 1 : 0;
   assign #delay q[3] = count == 3 ? 1 : 0;
   assign #delay q[4] = count == 4 ? 1 : 0;
   assign #delay q[5] = count == 5 ? 1 : 0;
   assign #delay q[6] = count == 6 ? 1 : 0;
   assign #delay q[7] = count == 7 ? 1 : 0;
   assign #delay q[8] = count == 8 ? 1 : 0;
   assign #delay q[9] = count == 9 ? 1 : 0;
   
   assign #delay co = count >= 5 ? 0 : 1;
	      
endmodule // counter_4017

`endif //  `ifndef counter_v

// End of file.
