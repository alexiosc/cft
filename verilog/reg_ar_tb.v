///////////////////////////////////////////////////////////////////////////////
//
// TEST THE ADDRESS REGISTER
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_ar_tb.v -- Address Register testbench
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

`include "reg_ar.v"
`timescale 1ns/10ps

module reg_ar_tb();
   reg          halt;
   reg          nmem;
   reg          nio;
   reg [7:0]    aext;
   reg [15:0]   ibus;
   wire [15:0] 	ibus_real;

   wire [23:0] 	ab;

   reg 		nwrite_ar;
   reg 		nfparh;
   wire [7:0] 	fpd;

   wire 	nsysdev;
   wire 	niodev1xx;
   wire 	niodev2xx;
   wire 	niodev3xx;
   
   integer    i;
   reg [800:0] status;
   
   // Initialize all variables
   initial begin
      $monitor ("t: %7d | %b %b %h:%h > %h %b %b %b %b | %b > %h", $time,
		nmem, nio, aext, ibus, nwrite_ar,
		ab, nsysdev, niodev1xx, niodev2xx, niodev3xx,
		nfparh, fpd);
      $dumpfile ("vcd/reg_ar_tb.vcd");
      $dumpvars (0, reg_ar_tb);

      status = "reset";
      halt = 0;
      aext = 8'd0;
      ibus = 16'h0000;
      nwrite_ar = 1;
      nmem = 1;
      nfparh = 1;

      // Simulate reset
      //#250 nreset = 1;

      // First, test I/O transactions because they're easier. We only
      // have 1,024 I/O addresses, but test up to 2,048. NOTE: there's
      // a '138 glitch that causes a spurious nsysdev strobe 
      status = "I/O space";
      for (i = 0; i < 2048; i = i + 37) begin
	 #62.5 ibus = i[15:0];
	 aext = 8'd0;
	 nwrite_ar = 0;
	 #62.5 nwrite_ar = 1;
	 nio = 0;
	 #125 nio = 1;
      end

      #2000;
      
      // Now to some of the memory. We'll just do 256K in big
      // increments. Should be enough!
      status = "memory";
      for (i = 0; i < 262144; i = i + 3169) begin
	 #62.5 ibus = i[15:0];
	 aext = i[23:16];
	 nwrite_ar = 0;
	 #62.5 nwrite_ar = 1;
	 nmem = 0;
	 #125 nmem = 1;
      end
      
      #2000 $display("345 OK");
      $finish;      // Terminate simulation
   end // initial begin

   // Load the IR every now and then
   // always begin
   //    #1000 nwrite_ir = 0;
   //    #63.5 nwrite_ir = 1;
   // end

   assign ibus_real = ibus;

   // Asynchronous Front Panel functionality
   always begin
      #229 nfparh = 0;		// 1937 is prime, and so is 1937+30+30
      #250 nfparh = 1;
   end

   // Connect DUT to test bench
   reg_ar reg_ar (.halt(halt),
		  .nmem(nmem),
		  .nio(nio),
		  .ibus(ibus_real),
		  .aext(aext),
		  .nwrite_ar(nwrite_ar),
		  .ab(ab),
		  .nsysdev(nsysdev),
		  .niodev1xx(niodev1xx),
		  .niodev2xx(niodev2xx),
		  .niodev3xx(niodev3xx),
		  .nfparh(nfparh),
		  .fpd(fpd));

   // Verify our findings.
   reg [8191:0] msg;
   integer 	ok, b;
   
   always @ (nmem, nio, posedge nwrite_ar) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

	 // Address loading checks
	 if (nwrite_ar === 0) begin
	    if ({aext, ibus} !== reg_ar.ar) begin
	       $sformat(msg, "nwrite_ar=%b, aext=%x, ibus=%x, but ar=%x", nwrite_ar, aext, ibus, reg_ar.ar);
	    end;
	 end
	 
	 else if (nwrite_ar !== 1) $sformat(msg, "testbench bug, nwrite_ar=%b", nwrite_ar);

	 // Address bus driver checks
	 casex ({nmem, nio})
	   // Address bus idle
	   // The AB is always driven now (unless HALTed, which we're not testing here)
	   // 2'b11: begin
	   //    if (ab !== 24'bzzzzzzzzzzzzzzzzzzzzzzzz) begin
	   // 	 $sformat(msg, "nmem=%b, nio=%b, but AB is being driven with ab=%x", nmem, nio, ab);
	   //    end
	   // end
	   2'b11: begin
	      if (ab === 24'bzzzzzzzzzzzzzzzzzzzzzzzz) begin
	   	 $sformat(msg, "nmem=%b, nio=%b, but AB is not being driven (ab=%x)", nmem, nio, ab);
	      end
	   end

	   // Address bus driven during a memory or I/O transaction
	   2'b10, 2'b01: begin
	      if (ab !== reg_ar.ar) begin
		 $sformat(msg, "nmem=%b, nio=%b, ar=%x, but ab=%x", nmem, nio, reg_ar.ar, ab);
	      end
	   end

	   // Should never happen!
	   2'b00: $sformat(msg, "nmem=%b and nio=%b should never happen!", nmem, nio);
	   default: $sformat(msg, "testbench bug, nmem=%b, nio=%b", nmem, nio);
	 endcase // casex ({nmem, nio})
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK drive");
      end
   end // always @ (nmem, nio)
   
   always @ (nmem, nio, nsysdev, niodev1xx, niodev2xx, niodev3xx) begin
      #30 begin
   	 msg[7:0] = "";		// Use the msg as a flag.

   	 // I/O address decoder checks
   	 casex ({nmem, nio, reg_ar.ar[15:8], nsysdev, niodev1xx, niodev2xx, niodev3xx})
   	   30'b1_1_????????__1_1_1_1: ok=1; // No transaction
   	   30'b0_?_????????__1_1_1_1: ok=1; // Memory accesses
   	   30'b1_0_1???????__1_1_1_1: ok=1; // High I/O addr
   	   30'b1_0_?1??????__1_1_1_1: ok=1; // High I/O addr
   	   30'b1_0_??1?????__1_1_1_1: ok=1; // High I/O addr
   	   30'b1_0_???1????__1_1_1_1: ok=1; // High I/O addr
   	   30'b1_0_????1???__1_1_1_1: ok=1; // High I/O addr
   	   30'b1_0_?????1??__1_1_1_1: ok=1; // High I/O addr

   	   30'b1_0_00000000__0_1_1_1: ok=1; // I/O addr 000–0FF
   	   30'b1_0_00000001__1_0_1_1: ok=1; // I/O addr 100–1FF
   	   30'b1_0_00000010__1_1_0_1: ok=1; // I/O addr 200–2FF
   	   30'b1_0_00000011__1_1_1_0: ok=1; // I/O addr 300–3FF

   	   default: ok=0;
   	 endcase // casex ({nmem, nio, ar[15:8], nsysdev, niodev1xx, niodev2xx, niodev3xx})
	 
   	 if (!ok) begin
   	    $sformat(msg, "invalid I/O decoding: nmem=%b, nio=%b, ab=%x: nsysdev=%b, niodev1xx=%b, niodev2xx=%b, niodev3xx=%b",
   		     nmem, nio, reg_ar.ar, nsysdev, niodev1xx, niodev2xx, niodev3xx);
   	 end

   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK decoder/fp");
      end
   end // always @ (nset, nrst)
   
   always @ (nfparh) begin
      #30 begin
   	 // Front Panel checks
   	 if (nfparh === 0) begin
   	    if (fpd !== reg_ar.ar[23:16]) $sformat(msg, "nfparh=%b, ab=%x but fpd=%x", nfparh, reg_ar.ar, fpd);
   	 end

   	 else if (nfparh !== 1) $sformat(msg, "testbench bug, nfparh=%b", nfparh);
	 
   	 // Fail if we've logged an issue.
   	 if (msg[7:0]) begin
   	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
   	    $error("assertion failure");
   	    #100 $finish;
   	 end
	 else $display("345 OK decoder/fp");
      end
   end // always @ (nset, nrst)
endmodule // reg_ar_tb

// End of file.
