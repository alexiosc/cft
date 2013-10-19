///////////////////////////////////////////////////////////////////////////////
//
// Function: Priority encoders.
//
// Dataset: 
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/10ps

`ifndef priority_v
`define priority_v

module priority_148 (a, ei, y, gs, eo);
   parameter delay = 14;

   input [7:0]  a;
   input 	ei;

   output [2:0] y;
   output 	gs;
   output 	eo;

   reg 		gs0;
   reg [3:0] 	y0;

   assign eo = {ei, a} == 9'd255 ? 1'b0 : 1'b1;
   assign gs = (ei == 0) && (a != 8'd255) ? 1'b0: 1'b1;
   assign y = (ei == 1) ? 7 :
	      (a[7] == 0) ? 0 :
	      (a[6] == 0) ? 1 :
	      (a[5] == 0) ? 2 :
	      (a[4] == 0) ? 3 :
	      (a[3] == 0) ? 4 :
	      (a[2] == 0) ? 5 :
	      (a[1] == 0) ? 6 : 7;
   
endmodule // priority_148

`endif //  `ifndef priority_v

// End of file.
