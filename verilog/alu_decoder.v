///////////////////////////////////////////////////////////////////////////////
//
// THE ALU ADDRESS DECODER
//
// REDESINGED IN 2019
//
// NOTES: 
//
///////////////////////////////////////////////////////////////////////////////


`ifndef alu_rom_v
`define alu_rom_v

`include "demux.v"

`timescale 1ns/1ps

module alu_decoder (raddr, nruen, waddr, nwuen, action, 
		    nromce,
		    nread_alu_b, nwrite_alu_b,
		    naction_cpl, naction_cll, naction_sru,
		    naction_101, naction_110);

   input [4:0] raddr;
   input       nruen;
   input [4:0] waddr;
   input       nwuen;
   input [3:0] action;

   output      nromce;
   output      nread_alu_b;
   output      nwrite_alu_b;
   output      naction_cpl;
   output      naction_cll;
   output      naction_101;
   output      naction_110;
   output      naction_sru;

   wire [7:0]  y1, y2, y3, y4;

   demux_138 demux_rom (.a(3'b000), .g1(raddr[4]), .ng2a(raddr[3]), .ng2b(nruen), .y(y1));
   assign nromce = y1[0];

   // These decode RADDR and WADDR 11000
   demux_138 demux_rb (.a({ raddr[3], raddr[1:0]}), .g1(raddr[4]), .ng2a(raddr[2]), .ng2b(nruen), .y(y2));
   demux_138 demux_wb (.a({ waddr[3], waddr[1:0]}), .g1(waddr[4]), .ng2a(waddr[2]), .ng2b(nwuen), .y(y3));
   assign nread_alu_b = y2[4];
   assign nwrite_alu_b = y3[4];

   // This decodes actions 0xxx.
   demux_138 demux_action (.a(action[2:0]), .g1(action[3]), .ng2a(1'b0), .ng2b(1'b0), .y(y4));
   assign naction_cpl = y4[1];	// 0001: action_cpl
   assign naction_cll = y4[2]; 	// 0010: action_cll
   assign naction_101 = y4[5]; 	// 0101: reserved
   assign naction_110 = y4[6]; 	// 0110: reserved
   assign naction_sru = y4[7]; 	// 0111: action_sru
   
endmodule // alu_rom

`endif //  `ifndef alu_rom_v

// End of file
