`ifndef ir_v
`define ir_v

`include "flipflop.v"

`timescale 1ns/1ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

// The Instruction Register. Please note: the console buffers are not
// modelled here.

module reg_ir (ibus, nwir, nreset, ir);
   inout [15:0] ibus;
   input 	nwir;
   input 	nreset;
   
   output [15:0] ir;
   
   wire [15:0] 	 ibus, ir;
      
   flipflop_273 ir_lo (ibus[7:0],  ir[7:0],  nwir, nreset);
   flipflop_273 ir_hi (ibus[15:8], ir[15:8], nwir, nreset);
endmodule // reg_ir

`endif //  `ifndef ir_v

// End of file
