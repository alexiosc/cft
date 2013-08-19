///////////////////////////////////////////////////////////////////////////////
//
// PB1-uCB.v -- Processor Board A, microcode Board Interface
//
// Copyright © 2011-2013 Alexios Chouchoulas
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  
//
///////////////////////////////////////////////////////////////////////////////

`include "counter.v"
`include "buffer.v"
`include "vibrator.v"
`include "demux.v"
`include "flipflop.v"
`include "mux.v"

`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// Processor Board 0, Microcode Program Counter
//
///////////////////////////////////////////////////////////////////////////////

// This is no longer pertinent. The uPC counter has moved to PB0.v

// module PB1_uCB(nreset, nrsthold, clk4, nws, nhalt, nend, nendext,
// 			     upc, nuce);

//    input 	nreset;
//    input 	nrsthold;
//    input 	clk4;
//    input 	nws;
//    input 	nhalt;
//    input 	nend;
//    input 	nendext;

//    output [3:0] upc;
//    output 	nuce;
   
//    wire 	  _nclrupc0, _nclrupc;
//    counter_161 ic012_upc_ctr (.mr(nrsthold), .cp(clk4),
//    			      .cet(nws), .cep(nhalt),
//    			      .pe(_nclrupc), .p(4'b0000),
//    			      .q(upc));

//    // Calculate the CLRUPC# signal from ENDEXT# and END#. We only have NANDs,
//    // and we configure them as an AND gate instead (negative logic OR). ENDEXT#
//    // is an open-drain (declared wand above) signal from the CFT bus, END# is
//    // pulled high (declared tri1) and coming from the microcode store. Both
//    // signals are obviously active low.
//    nand #6 ic011a_00_nend1 (_nclrupc0, nendext, nend);
//    nand #6 ic011b_00_nend2 (_nclrupc, _nclrupc0, _nclrupc0); // Configured as NOT

//    // Obtain the UCE# signal from HALT# and RESET#. When either is low
//    // (asserted), the microcode store is disconnected and all control signals
//    // revert to their idle values (via pull-ups and -downs).
//    nand #6 ic011c_00_nuce (nuce, nhalt, nreset);
   
// endmodule // PB1_uCB


// End of file.
