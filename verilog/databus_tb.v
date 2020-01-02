///////////////////////////////////////////////////////////////////////////////
//
// DATA BUS TRANSCEIVER & WAIT STATE TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// databus_tb.v -- testbench for the Data Bus transeiver and Wait States
//
// Copyright © 2011–2019 Alexios Chouchoulas
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

`include "clock.v"
`include "databus.v"
`timescale 1ns/10ps

`define DELTA 911

module databus_tb();

   reg          nreset;
   reg 		nhalt;

   reg 		nmem, nio, nr, nwen;
   reg 		nws_drv;

   wire 	clk1, clk2, clk3, clk4, t34, wstb;
   wire 	nw;
   wire 	nws;

   wire [15:0] 	ibus, db;
   reg [15:0] 	ibus_drv, db_drv;

   // Hack to allow bidirectional tri-state driving/reading.
   assign ibus = ibus_drv;
   assign db = db_drv;
   assign nws = nws_drv;

   // Convenience
   wire 	nwaiting;
   assign nwaiting = databus.nwaiting;
   
   reg [800:0] 	status;
   integer 	i, j, k;
   
   initial begin        
      $dumpfile ("vcd/databus_tb.vcd");
      $dumpvars (0, databus_tb);
      $monitor ("t: %7d | %b %b %b %b %b  %b %b %b %b | %b | %04x %04x (%0s)",
		$time, nreset, nhalt, clk3, t34, wstb,
		nmem, nio, nr, nwen,
		nws,
		ibus, db,
		status);

      status = "reset";
      i = 0;
      nreset = 0;
      nhalt = 0;
      nmem = 1;
      nio = 1;
      nr = 1;
      nwen = 1;
      nws_drv = 1'bz;
      ibus_drv = 16'bZ;
      db_drv = 16'bZ;

      #5000 status = "Write Strobes";

      nreset = 1;

      // Get us to a more plausible phase difference with the clock. Normally,
      // this is all done by the microcode sequencer, so it's *basically*
      // synchronous, but we're asynchronous in this testbed, so we have to make
      // do.
      #125;
      for (i = 0; i < 16; i = i + 1) begin
	 #250 nwen = i[0];
	 nhalt = i[3];
      end
      nwen = 1;
      nhalt = 0;
      #187.5;			// This brings us back in phase with the clocks.
      
      for (j = 0; j < 2; j += 1) begin
	 #5000 $sformat(status, "%0s", j == 0 ? "LOAD" : "IN");
	 ibus_drv = 16'bZ;
	 nwen = 1;
	 nhalt = 1;
	 for (i = 0; i < 65536; i += `DELTA) begin
	    #62.5 if (j == 0) nmem = 0; else nio = 0;
	    nr = 0;
	    db_drv = i;
	    #187.5 if (j == 0) nmem = 1; else nio = 1;
	    nr = 1;
	 end
	 db_drv = 16'bZ;
	 nmem = 1;
	 nio = 1;
      end // for (j = 0; i < 2; j += 1)

      // Writing (0 wait states)
      for (j = 0; j < 2; j += 1) begin
	 #5000 $sformat(status, "%0s", j == 0 ? "STORE" : "OUT");
	 ibus_drv = 16'bZ;
	 nr = 1;
	 nwen = 1;
	 nhalt = 1;
	 for (i = 0; i < 65536; i += `DELTA) begin
	    #62.5 if (j == 0) nmem = 0; else nio = 0;
	    nwen = 0;
	    ibus_drv = i;
	    #187.5 if (j == 0) nmem = 1; else nio = 1;
	    nwen = 1;
	 end
	 ibus_drv = 16'bZ;
	 nmem = 1;
	 nio = 1;
      end; // for (j = 0; i < 2; j += 1)

      // Try 1, 2 and 4 wait states.soup
      for (k = 1; k <= 4; k = k * 2) begin

	 // Writing, one wait state
	 for (j = 0; j < 2; j += 1) begin
	    #5000 $sformat(status, "%0s (%0d WS)", j == 0 ? "STORE" : "OUT", k);
	    ibus_drv = 16'bZ;
	    nr = 1;
	    nwen = 1;
	    nhalt = 1;
	    nws_drv = 1'bz;
	    for (i = 0; i < 65536; i += `DELTA) begin
	       #62.5 if (j == 0) nmem = 0; else nio = 0;
	       nwen = 0;
	       ibus_drv = i;
	       nws_drv = 0;
	       #187.5 if (j == 0) nmem = 1; else nio = 1;
	       nwen = 1;
	       #((k - 1) * 250 + 12.5);	// 250 = 1 WS, 500 = 2 WS, etc.
	       nws_drv = 1'bz;	// Two cycle delay
	       #237.5;
	    end
	    ibus_drv = 16'bZ;
	    nmem = 1;
	    nio = 1;
	 end; // for (j = 0; i < 2; j += 1)
      end; // for (k = 1; k <= 4; k = k * 2)
      
      #5000 $finish;      // Terminate simulation
   end // initial begin

   // A wait state counter
   integer num_ws = 0;
   always @(posedge wstb) begin
      if (nwaiting === 0) num_ws += 1;
      else num_ws = 0;
   end

   // Use the standard clock generator.
   clock_generator clock_generator (.nreset(nreset),
				    .fpclk(1'b1), .nfpclk_or_clk(1'b1),
				    .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4),
				    .t34(t34), .wstb(wstb));
   
   // Connect DUT to test bench

   databus databus (.nreset(nreset),
		    .nhalt(nhalt), 
		    .clk3(clk3), .t34(t34), .wstb(wstb),
		    .nmem(nmem), .nio(nio), .nr(nr), .nwen(nwen),
		    .nws(nws), .ibus(ibus), .nw(nw), .db(db));

   // Verify our findings.
   reg [8191:0] msg;
   reg 		correct_nbusen;

   // Make sure that the bus enables, compare bus values.
   always @ (nmem, nio, nwaiting, databus.nbusen) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({ nmem, nio, nwaiting })
	   4'b111: correct_nbusen = 1;
	   4'b??0: correct_nbusen = 0;
	   4'b?0?: correct_nbusen = 0;
	   4'b0??: correct_nbusen = 0;
	   4'b00?: $sformat(msg, "testbench bug, nmem=%b and nio=%b", nmem, nio);
	   default: $sformat(msg, "testbench bug, nmem=%b, nio=%b, nwaiting=%b", nmem, nio, nwaiting);
	 endcase // casex ({ nmem, nio, nwaiting })

	 if (databus.nbusen != correct_nbusen) begin
	    $sformat(msg, "nmem=%b, nio=%b, nwaiting=%b, but databus.nbusen=%b",
		     nmem, nio, nwaiting, databus.nbusen);
	 end

	 // When the bus is driven, both sides should be the same.
	 if (databus.nbusen === 0) begin
	    if (ibus !== db) begin
	       $sformat(msg, "databus.nbusen=%b, ibus=%04x, but db=%04x (should be identical)",
			databus.nbusen, ibus, db);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK busen");
      end
   end // always @ (nmem, nio, nwaiting, databus.nbusen)

   // Check the Data Bus connection
   always @ (wstb, nmem, nio, nr, nwen, nw) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Note: nmem/nio validity and mutual exclusion is tested above. Also
	 // their relationship to nbusen, so use that to see if the bus works.
	 
	 // But check mutual exclusion of nr, and nw/nwen.
	 if (nr === 0 && (nwen === 0 || nw === 0)) begin
	    $sformat(msg, "testbench bug, nr=%b, nw=%b, nwen=%b. Reads and writes are mutually exclusive!",
		     nr, nw, nwen);
	 end

	 else if (databus.nbusen === 0 && nr === 0) begin
	    if (ibus !== db_drv) begin
	       $sformat(msg, "read error, databus.nbusen=%b, nr=%b, but ibus (%04x) != db_drv (%04x)",
			databus.nbusen, nr, ibus, db_drv);
	    end
	 end

	 else if (databus.nbusen === 0 && nw === 0) begin
	    if (db !== ibus_drv) begin
	       $sformat(msg, "write error, databus.nbusen=%b, nw=%b, but db (%04x) != ibus_drv (%04x)",
			databus.nbusen, nw, db, ibus_drv);
	    end
	 end

	 else if (nhalt === 1 && nwen === 0 && wstb === 0 && nw !== 0) begin
	    $sformat(msg, "nhalt=%b, nwen=%b, wstb=%b, but nw=%b", nhalt, nwen, wstb, nw);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK busen");
      end
   end // always @ (wstb, nmem, nio, nr, nwen, nw)


   // Make sure wait states are registered and cleared
   always @ (nreset, negedge nws, posedge clk3) begin
      #30 begin

	 // Ensure wait states are cleared on the rising edge of CLK3.
	 if (nreset === 0) begin
	    if (nwaiting !== 1) $sformat(msg, "nreset=%b but nwaiting=%b", nreset, nwaiting);
	 end

	 else if (nreset !== 1) $sformat(msg, "testbench bug, nreset=%b", nreset);

	 else if (nws === 1 && clk3 === 1) begin
	    if (nwaiting !== 1) $sformat(msg, "nreset=%b, nws=%b, @ clk3 posedge nwaiting=%b (should be 1)",
					 nreset, nws, nwaiting);
	 end

	 else if (nws === 0 && t34 === 0) begin
	    if (nwaiting !== 0) $sformat(msg, "nreset=%b, nws=%b, but nwaiting=%b (should be 0)",
					 nreset, nws, nwaiting);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
   	 else $display("OK nws");
      end // always @ (nreset, negedge nws, posedge clk3)
   end // always @ (nreset, negedge nws, posedge clk3)


   // There's something wrong with this, revisit.
   
   // Check the values of nw.
   // reg correct_nw;
   // always @ (negedge wstb, nmem, nio, nr, nwen, nw) begin
   //    #20 begin
   // 	 msg[7:0] = "";		// Use the msg as a flag.

   // 	 // Note: nmem/nio validity and mutual exclusion is tested above. Also
   // 	 // their relationship to nbusen, so use that to see if the bus works.

   // 	 if (nhalt === 0) begin
   // 	    if (nw !== 1'bz) $sformat(msg, "nhalt=%b, but nw=%b (should be Z)", nhalt, nw);
   // 	 end

   // 	 else if (nhalt !== 1) $sformat(msg, "testbench bug, nhalt=%b", nhalt);

   // 	 else if (nwen !== 1 && nwen !== 0) $sformat(msg, "testbench bug, nwen=%b", nwen);

   // 	 else if (nwaiting !== 1 && nwaiting !== 0)
   // 	   $sformat(msg, "databus.v bug, nwaiting=%b", nwaiting);

   // 	 else begin
   // 	    casex ({ nwen, nwaiting, wstb, nw })

   // 	      4'b000_1, 4'b001_1, 4'b010_1, 4'b100_1, 4'b101_1:
   // 		$sformat(msg, "nwen=%b, nwaiting=%b, wstb=%b, but nw=%b (should be 0)",
   // 			 nwen, nwaiting, wstb, nw);

   // 	      4'b011_0, 4'b110_0, 4'b111_0: 
   // 		$sformat(msg, "nwen=%b, nwaiting=%b, wstb=%b, but nw=%b (should be 1)",
   // 			 nwen, nwaiting, wstb, nw);
   // 	    endcase // casex ({ nwen, nwaiting, nw })
   // 	 end
		
   // 	 // Fail if we've logged an issue.
   // 	 if (msg[7:0]) begin
   // 	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   // 	    $error("assertion failure");
   // 	    #100 $finish;
   // 	 end
   // 	 else $display("OK nw");
   //    end
   // end


endmodule // buffer_245_tb

// End of file.
