///////////////////////////////////////////////////////////////////////////////
//
// mem64k.v -- 64 kW of SRAM for simplified testing purposes
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


`include "ram.v"


`timescale 1ns/1ps


///////////////////////////////////////////////////////////////////////////////
//
// 64 kW RAM MEMORY FOR MACHINE CODE-LEVEL TESTING
//
///////////////////////////////////////////////////////////////////////////////

module mem64k(
              // DIN-41612
              ec_ab,         // 16-bit address bus
              //ec_aext,       // 8-bit address bus extension
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

   input [15:0] ec_ab;          // 16-bit address bus
   //input [7:0] 	ec_aext;        // 8-bit address bus extension (generated here)
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

   reg [4096:0] ramlo = "img/a-00.list";
   reg [4096:0] ramhi = "img/a-01.list";

   integer 	i;
   
   initial begin
      if ($value$plusargs("ramlo=%s", ramlo)) begin
	 //logfile = $fopen(deb_logfile, "w");
	 $display("Reading RAM LSB image (+ramlo) %-0s\n", ramlo);
	 $readmemb(ramlo, ic003_64c008_ramlo.mem); // Read the memory image.
	 // Exclusive XOR reduction trick
	 if (^ic003_64c008_ramlo.mem[0] === 1'bx ||
	     ^ic003_64c008_ramlo.mem[65535] === 1'bx) begin
	    $display("ERROR: RAM low image %-0s failed to load or incomplete.", ramlo);
	    $finish;
	 end
      end
      if ($value$plusargs("ramhi=%s", ramhi)) begin
	 //logfile = $fopen(deb_logfile, "w");
	 $display("Reading RAM MSB image (+ramhi) %-0s\n", ramhi);
	 $readmemb(ramhi, ic005_64c008_ramhi.mem); // Read the memory image.
	 if (^ic005_64c008_ramhi.mem[0] === 1'bx ||
	     ^ic005_64c008_ramhi.mem[65535] === 1'bx) begin
	    $display("ERROR: RAM low image %-0s failed to load or incomplete.", ramlo);
	    $finish;
	 end
      end

      // $display("ERROR: RAM IMAGE = %-0s, %-0s", ramlo, ramhi);
      // for (i =0 ; i < 65536; i = i + 1) begin
      // 	 $display("ERROR: %04h: %02h%02h", i[15:0], ic005_64c008_ramhi.mem[i], ic003_64c008_ramlo.mem[i], );
      // end
      // #100 $finish;
      
   end

   // 64 kW of SRAM: two devices, each 8 bits wide.
   sram #(16, 55) ic003_64c008_ramlo (.a(ec_ab), .d(ec_db[7:0]), .nce(ec_nmem), .nwe(ec_nw), .noe(ec_nr));
   sram #(16, 55) ic005_64c008_ramhi (.a(ec_ab), .d(ec_db[15:8]), .nce(ec_nmem), .nwe(ec_nw), .noe(ec_nr));

endmodule // mem64

// End of file.
