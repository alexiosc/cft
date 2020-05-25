///////////////////////////////////////////////////////////////////////////////
//
// THE DATA BUS INTERFACE (INCLUDING WAIT STATES)
//
// REDESIGNED IN 2019
//
// NOTES:
//
///////////////////////////////////////////////////////////////////////////////


`ifndef databus_v
`define databus_v

`include "buffer.v"
`include "flipflop.v"

`timescale 1ns/1ps

module databus (nrsthold, nhalt, clk1, clk2, clk3, clk4, t34,
		nmem, nio, nr, nwen,
		nws, nwaiting,
		ibus,
		nw, db);

   input 	nrsthold;
   input 	nhalt;
   input 	clk1;
   input 	clk2;
   input 	clk3;
   input 	clk4;
   input 	t34;
   input 	nmem;
   input 	nio;
   input 	nr;
   inout 	nwen;
   inout 	nws;
   output 	nwaiting;

   inout [15:0] ibus;		// input & output!

   output 	nw;

   inout [15:0] db;		// input & output!

   wire 	nreset;
   wire 	nhalt;
   wire 	clk3;
   wire 	t34;
   wire 	nmem;
   wire 	nio;
   wire 	nr;
   wire 	nwen;
   tri1 	nws;		// Pulled up (may not be needed if Bus Hold is used)

   wire [15:0] 	ibus;
   
   wire 	nw;

   wire [15:0] 	db;

   // Wait states

   wire 	halt, nw0, nwaiting, nws_in_t34, nbusen;

   // The delays here are purposefully different, and all are much higher than
   // the maximum propagation delays for LVC family little gates.

   // nws_in_t34 ensures wait states are only requested during the last 50% of
   // the clock cycle.
   assign #7 nws_in_t34 = nws | t34;          // 74LVC1G32

   ///////////////////////////////////////////////////////////////////////////////
   //
   // NEW WRITE LOGIC, MUCH SIMPLER AND MORE EFFECTIVE
   //
   ///////////////////////////////////////////////////////////////////////////////

   wire 	nstart_write, wstb, nwen_delayed;
   assign #4 nwen_delayed = ~nwen;
   assign #4 nstart_write = nwen | nwen_delayed;
   //   assign #4 nstart_write = nwen | clk3;
   flipflop_74h #2.5 ff_nw (.nset(nstart_write), .d(1'b1), .clk(1'b1), .nrst(clk2), .nq(wstb));
   assign #7 nw0 = (wstb & nwaiting) | nwen; // 74LVC1G0832

   // // Choose one assignment (JP3 on the BUS board).
   // wire nwstb;
   // //assign nwstb = clk4;
   // assign #4 nwstb = clk4 | clk4x8;

   // The nW driver. The Microcode Sequencer can tri-state all its outputs when
   // nHALT is asserted, but we generate nW here, so we need to be able to tri-state it.
   assign #6 halt = ~nhalt;		      // 74LVC1G04
   assign #6 nw = halt ? 1'bz : nw0;	      // 74LVC1G125

   // The Wait State FF itself
   flipflop_74h #2.5 ff_ws (.nset(nws), .d(1'b0), .clk(clk3), .nrst(nrsthold), .nq(nwaiting));
   //flipflop_74h #2.5 ff_ws (.nset(nws_in_t34), .d(1'b0), .clk(clk3), .nrst(nrsthold), .nq(nwaiting));

   assign #7 nbusen = nwaiting & nio & nmem; // 74LVC1G11

   // Connect the buses.
   buffer_245 buf_dblo (.a(ibus[7:0]),  .b(db[7:0]),  .dir(nr), .nen(nbusen));
   buffer_245 buf_dbhi (.a(ibus[15:8]), .b(db[15:8]), .dir(nr), .nen(nbusen));
   
endmodule // databus

`endif //  `ifndef databus_v

// End of file
