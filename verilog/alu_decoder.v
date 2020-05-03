///////////////////////////////////////////////////////////////////////////////
//
// THE ALU ADDRESS DECODER
//
// REDESIGNED IN 2019
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef alu_decoder_v
`define alu_decoder_v

`include "demux.v"
`include "counter.v"

`timescale 1ns/1ps


module alu_decoder (nrsthold, clk3, t34, raddr, waddr, action, 
		    nalu_op, nread_alu_y,
		    nread_alu_b, nwrite_alu_b,
		    naction_cpl, naction_cll, naction_sru, nws);

   input       nrsthold;
   input       clk3;
   input       t34;
   input [4:0] raddr;
   input [4:0] waddr;
   input [3:0] action;

   output      nalu_op;
   output      nread_alu_b;
   output      nread_alu_y;
   output      nwrite_alu_b;
   output      naction_cpl;
   output      naction_cll;
   output      naction_sru;
   output      nws;

   wire [7:0]  y1, y2, y3, y4;

   // demux_138 demux_rom (.a(3'b000), .g1(raddr[4]), .ng2a(raddr[3]), .ng2b(t34), .y(y1));
   demux_138 demux_rom (.a(3'b000), .g1(raddr[4]), .ng2a(raddr[3]), .ng2b(1'b0), .y(y1));
   assign nalu_op = y1[0];

   // These decode RADDR and WADDR 11000
   demux_138 demux_rb (.a({ raddr[3], raddr[1:0]}), .g1(raddr[4]), .ng2a(raddr[2]), .ng2b(t34), .y(y2));
   demux_138 demux_wb (.a({ waddr[3], waddr[1:0]}), .g1(waddr[4]), .ng2a(waddr[2]), .ng2b(t34), .y(y3));
   assign nread_alu_y = y2[4]; // UPDATE THIS IN SCHEMATICS!!!
   assign nread_alu_b = y2[5]; // UPDATE THIS IN SCHEMATICS!!!
   assign nwrite_alu_b = y3[4];

   // This decodes actions 0xxx.
   demux_138 demux_action (.a(action[2:0]), .g1(1'b1), .ng2a(action[3]), .ng2b(t34), .y(y4));
   assign naction_cpl = y4[1];	// 0001: action_cpl
   assign naction_cll = y4[2]; 	// 0010: action_cll
   //assign naction_wpa = y4[6]; 	// 0110: action_wpa
   assign naction_sru = y4[7]; 	// 0111: action_sru

   // The wait state generator: the ALU can be slow, so we generate a single
   // wait state whenever it's addressed. This has the effect of prolonging all
   // instructions involving the ALU by one processor cycle per ALU operation.
   //
   // Operation: the WS counter counts on the rising edge of CLK3. It is loaded
   // with zero on reset. When ALU_OP goes low, the rising edge of CLK3
   // increments from 0000₂ to 0001₂ which asserts a wait state. On the next
   // rising edge of CLK3, the counter proceeds to 0010₂ which deasserts the
   // wait state and resets the count to 0000₂, deasserting the wait state. The
   // count is also reset on RSTHOLD.

   // wire        wsen;
   // wire        ctr_ws_mr;
   // wire [3:0]  ctr_ws_q;
   
   // assign #5 wsen = ~nalu_op;
   // assign #5 ctr_ws_mr = ~ctr_ws_q[1];
   // assign #5 nws = ctr_ws_q[0] == 1 ? 1'b0 : 1'bz;

   // counter_161 ctr_ws (.mr(ctr_ws_mr),
   // 		       .pe(nrsthold), .p(4'b0000),
   // 		       .cp(clk3), .cet(wsen), .cep(wsen),
   // 		       .q(ctr_ws_q));

   
endmodule // alu_rom

`endif //  `ifndef alu_decoder_v

// End of file
