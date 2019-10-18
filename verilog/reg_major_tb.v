///////////////////////////////////////////////////////////////////////////////
//
// MAJOR REGISTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
// reg_major_tb.v -- Major Register Testbench
//
// Copyright © 2011-2019 Alexios Chouchoulas
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

`include "reg_major.v"
`timescale 1ns/10ps

module reg_major_tb();
   reg         reset;
   reg [15:0]  ibus;
   reg         nread;
   reg         nwrite;
   reg 	       ninc;
   reg 	       ndec;
   wire [15:0] out;

   wire        fz;
   wire        fn;
   wire        naccpl;
   
   reg 	       nfpl;
   reg 	       nfph;
   wire [7:0]  fpd;

   integer    i;
   
   // Initialize all variables
   initial begin        
      $display ("time\t oe1 oe2 a y");	
      $monitor ("t: %7d | %b %b %b %b %b %h > %h %h %b %b %b | %b %b %h", $time,
		reset, nread, nwrite, ninc, ndec, ibus,
		ibus_real, out, fz, fn, naccpl,
		nfpl, nfph, fpd);
      $dumpfile ("vcd/reg_major_tb.vcd");
      $dumpvars (0, reg_major_tb);

      reset = 1;
      nread = 1;
      nwrite = 1;
      ninc = 1;
      ndec = 1;
      nfpl = 1;
      nfph = 1;
      ibus = 16'h0000;

      // To properly cover the register we need to test:
      // * Resets
      // * Reads
      // * Writes
      // * Increments
      // * Decrements
      //
      // We'll be using 250ns delays because that's the maximum
      // frequency of strobes coming in from the control unit.

      // Test reset
      reset = 1;		// Should be zero
      ibus = 16'h5678;
      nwrite = 0;
      #250 reset = 0;
      #63.5 nwrite = 1;
      #186.5 ibus = 16'hZZZZ;	// Shoul be 5678
      #250 reset = 1;
      #63.5 reset = 0;		// Should be zero again.

      // Test writes and reads. The Control Unit ‘guarantees’ (via
      // microcode) that a read and write can't be asserted
      // simultaneously.
      for (i = 0; i < 65536 ; i = i + 1) begin
      	 #63.5 ibus = i ^ 16'h1234;	// Mix up the values a little bit.
      	 #63.5 nwrite = 0;
      	 #63.5 nwrite = 1;
      	 #63.5 ibus = 16'hZZZZ;
      	 #63.5 nread = 0;
      	 #63.5 nread = 1;
      end

      // Test increments
      for (i = 0; i < 65540 ; i = i + 1) begin
      	 #186.5 ninc = 0;
      	 #63.5 ninc = 1;
      end

      // Test decrements
      for (i = 0; i < 65540 ; i = i + 1) begin
	 #186.5 ndec = 0;
	 #63.5 ndec = 1;
      end

      #1000 $display("OK");
      $finish;      // Terminate simulation
   end // initial begin

   // Asynchronous Front Panel functionality
   always begin
      #1937 nfpl = 0;		// 1937 is prime, and so is 1937+30+30
      #30 nfpl = 1; 
      nfph = 0;
      #30 nfph = 1;
   end

   wire [15:0] ibus_real = ibus;
   assign ibus_real = ibus;

   // Connect DUT to test bench
   reg_major reg_major (.reset(reset), .ibus(ibus_real),
			.nread(nread), .nwrite(nwrite),
			.ninc(ninc), .ndec(ndec), .out(out),
			.fz(fz), .fn(fn), .naccpl(naccpl),
			.nfpl(nfpl), .nfph(nfph), .fpd(fpd));

   // Verify Reset and loading behaviour.
   reg [8191:0] msg;
   reg [15:0] 	old;
   always @ (reset, ibus_real, nread, nwrite) begin
      #45 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Resetting
	 if (reset === 1) begin
	    if (out !== 16'h0000) begin
	       $sformat(msg, "reset=%b but out=%x", reset, out);
	    end;
	 end
	 
	 else if (reset !== 0) $sformat(msg, "testbench bug, reset=%b", reset);

	 // Setting values
	 else if (nwrite === 0) begin
	    if (out !== ibus) begin
	       $sformat(msg, "reset=%b, nwrite=%b, ibus=%x but out=%x", reset, nwrite, ibus, out);
	    end
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK reset/load");
      end
   end // always @ (reset, ibus_real, nread, nwrite)

   // Verify increment and decrement behaviour
   reg [15:0] correct_out;
   always @ (negedge ninc, negedge ndec) begin
      #100 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({ninc, ndec})
	   2'b11: correct_out = out; // Idle
	   2'b01: correct_out = out + 1; // Incrementation
	   2'b10: correct_out = out - 1; // Decrementation
	   default: $sformat(msg, "testbench bug, ninc=%b, ndec=%b", ninc, ndec);
	 endcase // casex ({ninc, ndec})

	 if (out !== correct_out) $sformat(msg, "ninc=%b, ndec=%b, but out=%04x (should be %04x)",
					   ninc, ndec, out, correct_out);

	 // Has the wrap-around trigger been asserted?
	 if ((ndec === 0 && out === 16'hffff) || (ninc === 0 && out === 16'h0000)) begin
	    if (naccpl !== 0) begin
	       $sformat(msg, "ninc=%b, ndec=%b, out wrapped around to %04x but naccpl=%b (should be 0)",
			ninc, ndec, out, naccpl);
	    end
	 end else if (naccpl !== 1) begin
	    $sformat(msg, "ninc=%b, ndec=%b, out=%04x, but naccpl=%b (should be 1)",
		     ninc, ndec, out, naccpl);
	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
	 end
	 else $display("OK INC/DEC");
      end
   end // always @ (reset, ibus_real, nread, nwrite)


   // Verify flag outputs
   reg  correct_fz, correct_fn;
   always @ (out) begin
      if ($time > 100) begin
	 #100 begin
	    
	    correct_fz = out === 16'd0 ? 1'b1 : 1'b0;
	    correct_fn = out[15] === 1 ? 1'b1 : 1'b0;
	    
	    if (fz !== correct_fz) $sformat(msg, "out=%04x but fz=%b (should be %b)", out, fz, correct_fz);
	    else if (fn !== correct_fn) $sformat(msg, "out=%04x but fn=%b (should be %n)", out, fn, correct_fn);
	    
   	    // Fail if we've logged an issue.
   	    if (msg[7:0]) begin
   	       $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	       $error("assertion failure");
   	       #100 $finish;
   	    end
	    else $display("OK fz/fn");
	 end // if ($time > 10)
      end // if ($time > 10)
   end

   // Front Panel
   always @ (posedge nfpl, posedge nfph) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 casex ({nfph, nfpl})
	   2'b11: if (fpd != 8'bzzzzzzzz) begin
	      $sformat(msg, "nfph=%b, nfpl=%b, but fpd=%b (should be Z)", nfph, nfpl, fpd);
	   end

	   2'b01: if (fpd != out[15:8]) begin
		 $sformat(msg, "nfph=%b, nfpl=%b, but fpd=%02x (should be %02x)", nfph, nfpl, fpd, out[15:8]);
	   end
	   
	   2'b10: if (fpd != out[7:0]) begin
		 $sformat(msg, "nfph=%b, nfpl=%b, but fpd=%02x (should be %02x)", nfph, nfpl, fpd, out[7:0]);
	   end

	   default: $sformat(msg, "testbench bug, nfph=%b, nfpl=%b", nfph, nfpl);
	 endcase
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("OK front panel");
      end
   end // always @ (nmem, nio)
   
endmodule // reg_major_tb

// End of file.
