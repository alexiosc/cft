///////////////////////////////////////////////////////////////////////////////
//
// Microcode Sequencer
//
///////////////////////////////////////////////////////////////////////////////

`include "buffer.v"
`include "counter.v"
`include "flipflop.v"
`include "rom.v"

`timescale 1ns/10ps

///////////////////////////////////////////////////////////////////////////////
//
// BASED ON DRAWN SCHEMATICS
//
///////////////////////////////////////////////////////////////////////////////

module sequencer (clk4, nreset,
		  naindex, nskip, fl, fv, nirqs, nrsthold, nws, nhalt, ir,
		  runit, wunit, opif, ncpl, ncll, nsti, ncli,
		  nincac, nincpc, nincdr,
		  uinstr18, nmem, nio, nr, nwen, nend,
		  nuce);

   input        clk4, nreset;
   input        naindex, nskip, fl, fv, nirqs, nrsthold, nws, nhalt;
   input [15:0] ir;

   output [3:0] runit;
   output [2:0] wunit;
   output [3:0] opif;
   output 	ncpl, ncll, nsti, ncli;
   output 	nincac, nincpc, nincdr;
   output 	uinstr18, nmem, nio, nr, nwen, nend;
   output 	nuce;
   
   wire 	clk4;
   wire 	naindex, nskip, fl, fv, nirqs, nrsthold;
   tri1 	nws, nhalt;
   wire [15:0] 	ir;
   
   tri0 [3:0] 	runit;
   tri0 [2:0] 	wunit;
   tri0 [3:0] 	opif;
   tri1 	ncpl, ncll;
   tri1 	nsti, ncli;
   tri1 	nincac, nincpc, nincdr;
   tri1 	uinstr18;
   tri1 	nmem, nio, nr, nwen, nend;
   tri1 	nuce;
/*
   initial begin
      // These initial values are useful to resolve simulation-specific
      // issues. They are simulation-specific because the uPC starts at a known
      // address, and the microcode ROM issues a known vector, so
      // initialisation to a well-defined state is a given. Verilog doesn't
      // know this, of course.
      nmem = 1;
      nio = 1;
      nr = 1;
      nw = 1;
   end*/

   // Microcode PC
   wire [3:0] upc;
   counter_161 counter (nrsthold, clk4, nws, nhalt, nend, 4'b0000, upc, );

   // The Microcode ROMs
   wire [14:0] uaddr;
   wire [23:0] control_out;
   assign uaddr = {nrsthold, nirqs, fv, fl, ir[15:12], ir[11], nskip, naindex, upc};

   nand #6 (nuce, nhalt, nreset);
   rom #(15, 70, "../microcode/microcode-00.list") rom0 (uaddr, control_out[7:0], 1'b0, nuce);
   rom #(15, 70, "../microcode/microcode-01.list") rom1 (uaddr, control_out[15:8], 1'b0, nuce);
   rom #(15, 70, "../microcode/microcode-02.list") rom2 (uaddr, control_out[23:16], 1'b0, nuce);

   // Decode the control vector.
   assign runit = control_out[3:0]; // RUNIT
   assign wunit = control_out[6:4]; // WUNIT
   assign opif = control_out[10:7]; // OPIF

   // Flag control
   assign ncpl = control_out[12];   // CPL#
   assign ncll = control_out[13];   // CLL#
   assign nsti = control_out[14];   // STI#
   assign ncli = control_out[15];   // CLI#

   // Increment controls
   assign nincac = control_out[11]; // INCAC#
   assign nincpc = control_out[16]; // INCPC#
   assign nincdr = control_out[17]; // INCDR#

   // Memory & I/O
   assign nmem = control_out[19]; // MEM#
   assign nio = control_out[20];  // IO#
   assign nr = control_out[21];	  // R#
   assign nwen = control_out[22]; // WEN#
   assign nend = control_out[23]; // END#

   // Reserved
   assign uinstr18 = control_out[18]; // UINSTR18
   
endmodule // sequencer

// End of file.
