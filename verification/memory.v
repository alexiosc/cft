///////////////////////////////////////////////////////////////////////////////
//
// memory.v -- The MEM board
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


///////////////////////////////////////////////////////////////////////////////
//
// Memory
//
///////////////////////////////////////////////////////////////////////////////

module memory(
              // DIN-41612
              ec_ab,         // 16-bit address bus
              ec_aext,       // 8-bit address bus extension
              ec_db,         // 16-bit data bus
	      /*
              ec_nirq0,      // Single open drain interrupt line
              ec_nirq,       // 8 open drain interrupt lines
              ec_nirqs,      // IRQ acknowledge, active low
	       */
              ec_nmem,       // memory strobe, active low
              //ec_nio,        // I/O strobe, active low
              ec_nr,         // read strobe, active low
              ec_nw,         // write strobe, active low
	      /*
              ec_nhalt,      // halt machine, open drain
              ec_nreset,     // reset machine, open drain
              ec_nendext,    // end current instruction, open drain
              ec_nskipext,   // skip input, open drain
              ec_nws,        // wait state, open drain
              ec_nsysdev,    // I/O 0000-00FF selected
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
   input [7:0] ec_aext;        // 8-bit address bus extension (generated here)
   inout [15:0] ec_db;          // 16-bit data bus
   /*
   input        ec_nirq0;       // Single open drain interrupt line
   input [7:0]  ec_nirq;        // 8 open drain interrupt lines
   inout        ec_nirqs;       // IRQ acknowledge, active low
    */
   input       ec_nmem;        // memory strobe, active low
   //output       ec_nio;         // I/O strobe, active low
   input       ec_nr;          // read strobe, active low
   input       ec_nw;          // write strobe, active low
   /*
   inout        ec_nhalt;       // halt machine, open drain
   inout        ec_nreset;      // reset machine, open drain
   inout        ec_nendext;     // end current instruction, open drain
   inout        ec_nskipext;    // skip input, open drain
   inout        ec_nws;         // wait state, open drain
   output       ec_nsysdev;     // I/O 0000-00FF selected
   output       ec_niodev1xx;   // I/O 0100-01FF selected
   output       ec_niodev2xx;   // I/O 0200-02FF selected
   output       ec_niodev3xx;   // I/O 0300-03ff selected
   output       ec_clk1;        // 4 MHz clock, 75%, 90°
   output       ec_clk2;        // 4 MHz clock, 75%, 180°
   output       ec_clk3;        // 4 MHz clock, 75%, 270°
   output       ec_clk4;        // 4 MHz clock, 75%, 0°
   output       ec_nt34;        // 4 MHz clock, 50%, 0°
    */

   // Decoder
   wire [7:0] 	y;
   wire 	nramen0;
   wire 	nramen1;
   wire 	nromen0;
   wire 	nromen1;
   
   demux_138 ic001_138_decoder (.g1(1), .g2a(ec_nmem), .g2b(0), .a({1'b0, ec_aext[7:6]}),
				.y(y));

   assign nramen0 = y[0];	// 0-512 kW
   assign nramen1 = y[1];	// 512-1024 kW
   assign nromen0 = y[2];	// 1024-1536 kW
   assign nromen1 = y[3];	// 1536-2048 kW

   // 
   wire [18:0] 	ae;
   assign ae = {ec_aext[5:0], ec_ab[12:0]};

   // 512 kW of SRAM: two devices, each 8 bits wide.
   sram #(19, 55) ic003_64c008_ramlo (.a(ae[18:0]), .d(ec_db[7:0]), .nce(nramen0), .nwe(ec_nw), .noe(ec_nr));
   sram #(19, 55) ic005_64c008_ramhi (.a(ae[18:0]), .d(ec_db[15:8]), .nce(nramen0), .nwe(ec_nw), .noe(ec_nr));

   // 512 kW of ROM: two devices, each 8 bits wide.
   rom #(19, 55) ic002_29040_romlo (.a(ae[18:0]), .d(ec_db[7:0]), .nce(nromen0), .noe(ec_nr));
   rom #(19, 55) ic004_29040_romhi (.a(ae[18:0]), .d(ec_db[15:8]), .nce(nromen0), .noe(ec_nr));

   // Memory initialisation for testing purposes
   reg [4096:0] ramlo = "img/ram-00.list";
   reg [4096:0] ramhi = "img/ram-01.list";
   reg [4096:0] romlo = "img/rom-00.list";
   reg [4096:0] romhi = "img/rom-01.list";

   initial begin
      // Read memory images if specified by the command line
      if ($value$plusargs("RAMlo=%s", ramlo)) begin
	 $display("Reading RAM LSB image (+RAMlo) %s\n", ramlo);
	 $readmemb(ramlo, ic003_64c008_ramlo.mem);
      end
      if ($value$plusargs("RAMhi=%s", ramhi)) begin
	 $display("Reading RAM MSB image (+RAMhi) %s\n", ramhi);
	 $readmemb(ramhi, ic005_64c008_ramhi.mem);
      end
      if ($value$plusargs("ROMlo=%s", romlo)) begin
	 $display("Reading ROM LSB image (+ROMlo) %s\n", romlo);
	 $readmemb(romlo, ic002_29040_romlo.mem);
      end
      if ($value$plusargs("ROMhi=%s", romhi)) begin
	 $display("Reading ROM MSB image (+ROMhi) %s\n", romhi);
	 $readmemb(romhi, ic004_29040_romhi.mem);
      end
   end // initial begin

endmodule // memory



// End of file.
