///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: Step sequencer.
//
///////////////////////////////////////////////////////////////////////////////

`ifndef step_v
`define step_v

`include "flipflop.v"
`include "mux.v"
`include "vibrator.v"
`include "counter.v"

`timescale 1ns/10ps


///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: STEP SEQUENCER
//
// NOTES:
//
///////////////////////////////////////////////////////////////////////////////

module step_sequencer (rawclk, clk1, clk2, clk3, clk4, fpustep, nreset, nhalt);
   input rawclk, clk1, clk2, clk3, clk4;
   input fpustep;
   input nreset;
   
   output nhalt;

   tri1  nhalt;			// Pull up /HALT.

   wire  fpustep0, fpustep1, fpustep2, fpustep3;
   nand #6 (fpustep0, fpustep, fpustep);
   nand #6 (fpustep1, fpustep0, fpustep0);
   nand #6 (fpustep2, fpustep1, fpustep1);
   nand #6 (fpustep3, fpustep2, fpustep);

   flipflop_112h ff(0, nhalt, clk3, fpustep3, nreset, nhalt, );
   
   // wire [7:0] d, q;
   // assign d[0] = ~fpustep;
   // assign d[1] = q[0];
   // assign d[2] = 1;
   // assign d[3] = 1;
   // assign d[4] = 1;
   // assign d[5] = 1;
   // assign d[6] = 1;
   // assign d[7] = 1;
   // flipflop_374 ff (d, 0, clk1, q);
			 
endmodule // step_sequencer

`endif //  `ifndef step_v

// End of file.
