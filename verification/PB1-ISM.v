///////////////////////////////////////////////////////////////////////////////
//
// PB1-ISM.v -- Processor Board A, Interrupt State Machine
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
// Processor Board A, Interrupt State Machine
//
///////////////////////////////////////////////////////////////////////////////

module PB1_ISM(nreset, nend, nsti, ncli, nirq,
			     fint, firq, nirqs);

   input  nreset;
   input  nend;
   input  nsti;
   input  ncli;
   input  nirq;

   output fint;
   output firq;
   output nirqs;

   // RESET# or CLI#
   wire   fint, nfint;
   wire   nreset_or_cli;
   and #6 ic044a_08_ncli (nreset_or_cli, nreset, ncli);
   
   // Interrupt Flag (Asynchronous)
   flipflop_112h ic046a_112_async(.set(nsti), .rst(nreset_or_cli),
				  .j(0), .clk(0), .k(0),
				  .q(fint), // For debugging purposes only
				  .qn(nfint));

   // MASKEDIRQ#
   wire   nmaskedirq;
   or #6 ic045a_32_maskedirq (nmaskedirq, nfint, nirq);

   flipflop_112h ic046b_112_sync(.set(nmaskedirq), .rst(nreset_or_cli),
				 .j(0), .clk(0), .k(0),
				 .q(firq));

   // IRQ Register
   flipflop_74h ic036b_74_reg(.set(1), .rst(nreset), .d(firq), .clk(nend),
			      .qn(nirqs));


endmodule // PB1_ISM


// End of file.
