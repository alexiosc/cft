///////////////////////////////////////////////////////////////////////////////
//
// front-panel.v -- The front panel, including PFP board (partial)
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


`include "rom.v"
`include "ram.v"
`include "demux.v"


`timescale 1ns/1ps

`define DFP_BASE         16'h0100
`define DFP_HALT         (`DFP_BASE | 16'h1d) /*     11d: -whef HALT */


  
///////////////////////////////////////////////////////////////////////////////
//
// The front panel subsystem (lights, switches and PFP controller board)
//
///////////////////////////////////////////////////////////////////////////////

module front_panel(
		   // DIN-41612
		   ec_ab,         // 16-bit address bus
		   //ec_aext,       // 8-bit address bus extension
		   ec_db,         // 16-bit data bus
		   /*
		    ec_nirq0,      // Single open drain interrupt line
		    ec_nirq,       // 8 open drain interrupt lines
		    ec_nirqs,      // IRQ acknowledge, active low
		    */
		   //ec_nmem,       // memory strobe, active low
		   ec_nio,        // I/O strobe, active low
		   ec_nr,         // read strobe, active low
		   ec_nw,         // write strobe, active low
		   ec_nhalt,      // halt machine, open drain
		   /*
		    ec_nreset,     // reset machine, open drain
		    ec_nendext,    // end current instruction, open drain
		    ec_nskipext,   // skip input, open drain
		    ec_nws,        // wait state, open drain
		    */
		    ec_nsysdev,    // I/O 0000-00FF selected
		   /*
		    ec_niodev1xx,  // I/O 0100-01FF selected 
		    ec_niodev2xx,  // I/O 0200-02FF selected
  		    ec_niodev3xx,  // I/O 0300-03ff selected
		    ec_clk1,       // 4 MHz clock, 75%, 90°
		    ec_clk2,       // 4 MHz clock, 75%, 180°
		    ec_clk3,       // 4 MHz clock, 75%, 270°
		    ec_clk4,       // 4 MHz clock, 75%, 0°
		    ec_nt34        // 4 MHz clock, 50%, 0°
		    */
		   );
   

   ///////////////////////////////////////////////////////////////////////////////
   //
   // EXPANSION CONNECTOR (DIN 41612)
   //
   ///////////////////////////////////////////////////////////////////////////////

   // The bus directions are the official directions for interfacing devices.

   input [15:0] ec_ab;         // 16-bit address bus
   input [7:0] 	ec_aext;       // 8-bit address bus extension (generated here)
   inout [15:0] ec_db;         // 16-bit data bus
   /*
   input        ec_nirq0;      // Single open drain interrupt line
   input [7:0]  ec_nirq;       // 8 open drain interrupt lines
   inout        ec_nirqs;      // IRQ acknowledge, active low
    */
   //input       ec_nmem;       // memory strobe, active low
   input        ec_nio;        // I/O strobe, active low
   input 	ec_nr;         // read strobe, active low
   input 	ec_nw;         // write strobe, active low
   inout        ec_nhalt;       // halt machine, open drain
   /*
   inout        ec_nreset;      // reset machine, open drain
   inout        ec_nendext;     // end current instruction, open drain
   inout        ec_nskipext;    // skip input, open drain
   inout        ec_nws;         // wait state, open drain
    */
   input        ec_nsysdev;     // I/O 0000-00FF selected
   /*
   input        ec_niodev1xx;   // I/O 0100-01FF selected
   input        ec_niodev2xx;   // I/O 0200-02FF selected
   input        ec_niodev3xx;   // I/O 0300-03ff selected
   input        ec_clk1;	// 4 MHz clock, 75%, 90°
   output       ec_clk2;        // 4 MHz clock, 75%, 180°
   output       ec_clk3;        // 4 MHz clock, 75%, 270°
   output       ec_clk4;        // 4 MHz clock, 75%, 0°
   output       ec_nt34;        // 4 MHz clock, 50%, 0°
    */

   reg 		     ec_nhalt_drv;
   assign ec_nhalt = ec_nhalt_drv;
   
   reg signed [15:0] si;
   
   integer 	     ticks;
   integer 	     hi;

   event 	     assertion_failed;
   event 	     dump;
   event 	     sentinel;

   wire 	     dec_addr;
   
   initial begin
      // Initialise stuff
      ec_nhalt_drv <= 1'bz;
   end

   
   // The DFP board can halt the system. When this happens, we assert HALT#,
   // wait a little bit, then exit the simulation entirely.
   assign dec_addr = ((ec_ab & 16'hffe0) === `DFP_BASE) ? 1'b1 : 1'b0;
   
   // Respond to OUT instructions
   always @(negedge ec_nw) begin
      if (ec_nsysdev == 0 && dec_addr == 1) begin
      	 case (ec_ab)
      	   `DFP_HALT:		// HALT instruction
      	     begin
      		//$display("T: HALTING (using PFP board instruction), t=%d");
		ec_nhalt_drv <= 1'b0;

		// If the DEB board is present, it'll take care of stopping the
		// simulation for us (it terminates in 1000 ns). We terminate
		// later, and only do it so tests of the front panel code
		// (without DEB card) can succeed.
		#4900 $finish;
      	     end
	   
      	   default: // Not implemented
      	     $display("ERROR: write %04h to I/O %04h not implemented", ec_db, ec_ab);
      	 endcase // case (ec_ab)
      end // if (ec_nio == 0)
   end // always @ (negedge ec_nw)

endmodule // front_panel


// End of file.
