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
      q = $random;
   end

   and #delay (tc, cet, q[0], q[1], q[2], q[3]);

   always @ (mr) begin
      if (mr == 0) #delay q <= 4'b0000;
   end

   always @(posedge cp) begin
      if (mr == 1 && cp == 1) begin
	 if (pe == 0) #delay q <= p;
	 else if (cet == 1 && cep == 1) #delay q <= q + 1;
      end
   end
   
endmodule // counter_161


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x193 4-bit synchronous presettable up/down counter
//
///////////////////////////////////////////////////////////////////////////////

module counter_193 (clr, npl, p, cpu, cpd, q, ntcu, ntcd);
   parameter delay = 43;	// approxmate maximum delay at 25°C, 5V.
   
   input        clr;		// Clear outputs (active high, on rising edge)
   input        npl;		// Parallel load (active low, on falling edge)
   input [3:0]  p;		// Parallel input value
   input        cpu;		// Count up clock (rising edge)
   input        cpd;		// Count down clock (rising edge)
   output [3:0] q;		// Output
   output 	ntcu;		// Carry out to next stage
   output 	ntcd;		// Borrow out to next stage

   wire 	clr;
   wire 	npl;
   wire [3:0] 	p;
   wire 	cpu;
   wire 	cpd;

   reg [3:0] 	q;
   wire 	ntcu;
   wire 	ntcd;

   initial begin
      //$display("Initialising 74x193");
      q <= $random;
   end

   always @(clr, npl, p) begin
      if (clr == 1) begin
	 #delay q <= 4'b0000;
      end else if (npl == 0) begin
	 #delay q <= p;
     end
   end

   always @(posedge cpu) begin
      if (clr == 0 && npl == 1 && cpd == 1) #delay q <= q + 1;
   end

   always @(posedge cpd) begin
      if (clr == 0 && npl == 1 && cpu == 1) #delay q <= q - 1;
   end

   // Calculate carry and borrow out
   assign #delay ntcd = q == 4'b0000 ? cpd : 1'b1;
   assign #delay ntcu = q == 4'b1111 ? cpu : 1'b1;
endmodule // counter_193


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x191 4-bit synchronous presettable up/down counter
//
///////////////////////////////////////////////////////////////////////////////

// Delays calibrated for AC family.
module counter_191 (p, npl, down, nce, cp,
		    q, nrc, tc);
   input [3:0]  p;
   input 	npl;	        // Active low asynchronous parallel load
   input 	down;		// 0 = count up, 1 = count down
   input 	nce;		// Active low clock enable
   input 	cp;		// Clock (positive edge)

   output [3:0] q;		// Count out
   output 	nrc;		// Active low ripple clock output
   output 	tc;		// Terminal count

   reg [3:0] 	q;
   wire 	nrc;
   wire 	npl;	        // Active low asynchronous parallel load
   wire 	down;		// 0 = count up, 1 = count down
   wire 	nce;		// Active low clock enable
   wire 	cp;		// Clock (positive edge)

   initial begin
      // $display("BOM: 74x191");
      q <= 4'b0110;
   end

   // Async parallel load
   always @(npl) begin
      if (npl == 0) #5.5 q <= p;
   end

   // Synchronous counting
   always #6 @(posedge cp) begin
      if (npl == 1 && nce == 0) begin
	 if (down == 0) q <= q + 1;
	 if (down == 1) q <= q - 1;
      end
   end

   // The terminal count (TC) output is normally LOW. It goes HIGH when the
   // circuits reach zero in the count down mode or 15 in the count up
   // mode. The TC output will then remain HIGH until a state change occurs,
   // whether by counting or presetting or until U/D is changed.
   assign #7 tc = (down == 1'b0 && q == 4'b1111) ? 1 : (down == 1'b1 && q == 4'b0000) ? 1 : 0;

   // This is from the schematics of the '191 found at
   // http://ee-classes.usc.edu/ee459/library/datasheets/DM74LS191.pdf
   assign #9 nrc = cp == 1'b0 && nce == 1'b0 && tc == 1 ? 0 : 1;


endmodule // counter_191


///////////////////////////////////////////////////////////////////////////////
//
// Function: 74x590 8-bit counter.
//
///////////////////////////////////////////////////////////////////////////////

// NOTE: These follow Nexperia nomenclature:
//
// https://assets.nexperia.com/documents/data-sheet/74HC590.pdf

module counter_590 (nmrc, cpc, cpr, nce, noe, q, nrco);
   parameter delay = 16;

   input 	nmrc;			// Reset (active low)
   input 	cpc;			// Count clock (raising edge)
   input 	cpr;			// Register clodk (raising edge)
   input 	nce;			// Count enable (active low)
   input 	noe;			// Output enabel (active low)

   output [7:0] q;			// Count output
   output 	nrco;			// Ripple output (active low)

   reg [7:0] 	count;
   reg [7:0] 	oreg;

   assign #delay q = noe ? 8'bzzzzzzzz : oreg;
   assign #delay nrco = count == 255 ? 1'b0 : 1'b1;

   initial begin
      count <= $random;
      oreg <= $random;
   end

   // The count stage. #delay+2 is used to simulate what happens when
   // both cpc and cpr are driven from the same signal: the register
   // lags one count behind the counter.
   always @(nmrc) begin
      if (nmrc == 1'b0) #(delay+1) count = 0;
   end
   always @(posedge cpc) begin
      if (nmrc == 1'b1 && nce == 1'b0 && cpc == 1'b1) #(delay + 2) count = count + 1;
   end

   // The register stage
   always @(posedge cpr) begin
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
