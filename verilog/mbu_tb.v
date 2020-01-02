///////////////////////////////////////////////////////////////////////////////
//
// MEMORY BANK REGISTER TESTBENCH
//
///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
// USES OK/FAIL OUTPUT
//
// reg_mbr_tb.v -- Memory Bank Register Testbench
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

`include "mbu.v"
`include "demux.v"
`include "clock.v"

`timescale 1ns/10ps


module reg_mbr_tb();
   reg        nreset;
   reg        nfpram_fprom;
   reg [15:0] ibus, ab, db, ir;
   reg 	      nr, nwen;
   reg [4:0]  waddr;
   reg [4:0]  raddr;
   wire       nw;
   
   wire [15:0] ibus_real, ab_real, db_real;
   wire [7:0]  aext, db_low, ibus_low;
   
   integer    i, j, k;

   reg [800:0] status;

   wire        wstb, t34;
   
   wire        nsysdev;

   // Convenience decoded outputs to the Flag unit.
   wire        nwrite_flags;
   wire        nwrite_mbp_flags;
   wire        nread_flags;
   wire        nread_mbp_flags;

   wire [7:0]  mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   // Assemble the 8 registers. This makes strong assumptions about the
   // structure of the MBR circuitry!
   assign mb0 = mbu.regfile.mem[0];
   assign mb1 = mbu.regfile.mem[1];
   assign mb2 = mbu.regfile.mem[2];
   assign mb3 = mbu.regfile.mem[3];
   assign mb4 = mbu.regfile.mem[4];
   assign mb5 = mbu.regfile.mem[5];
   assign mb6 = mbu.regfile.mem[6];
   assign mb7 = mbu.regfile.mem[7];
   
   initial begin        
      $dumpfile ("vcd/mbu_tb.vcd");
      $dumpvars (0, reg_mbr_tb);

      $monitor ("t: %7d | %b %b | init=%b rom=%b | IR: %04x | %d %02x | waddr=%05b raddr=%05b ibus=%02x | regfile: %04x %02x ce=%b we=%b oe=%b | regs: %02x %02x %02x %02x %02x %02x %02x %02x",
      		$time,
		waddr, raddr,
		mbu.nenable, nfpram_fprom,
		ir,
		mbu.sel, aext,
		waddr, raddr, ibus_low,
		mbu.regfile.a, mbu.regfile.d, mbu.regfile.nce, mbu.regfile.nwe, mbu.regfile.noe,
      		mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7);

      // Before we begin, randomise the values of the eight registers to
      // simulate an actual SRAM.
      for (i = 0; i < 8 ; i = i + 1) begin
	 mbu.regfile.mem[i] = $random & 255;
      end;

      nreset = 0;
      nfpram_fprom = 0;		// RAM
      ibus = 16'bzzzzzzzzzzzzzzzz;
      ir = 16'd0;
      ab = 16'd0;
      db = 16'bZ;
      ab_snoop = 0;
      db_snoop = 0;
      nr = 1;
      nwen = 1;
      
      waddr = 4'b0000;
      raddr = 4'b0000;

      status = "reset";

      #5000 nreset = 1;

      // The TB isn't synchronous to the clock, so adjust its phase difference.
      #10;

      // Read the registers using simulated Page Zero accesses, which is fairly
      // complicated but the best option this early in the test.
      
      status = "read power-on default MBx (IN)";
      #1000 raddr = 4'd0;
      waddr = 4'd0;
      for (i = 0; i < 16 ; i = i + 1) begin
   	 nfpram_fprom = i[0];
      	 ibus = 16'bzzzzzzzzzzzzzzz;
	 ir = 16'b0000_11_1100000000 | i[3:1];
      	 #250 waddr = 5'b00111;	       // write_ar_mbx (reads from MBn)
      	 #250 waddr = 5'b00000;	       // idle again
      end

      #1000;

      // First, let's configure the MBn registers. Test all 256 values on all 8
      // registgers. We can only write to the registers using OUT instructions,
      // and we'll simulate those. This will also take the MBU out of
      // post-reset mode.

      status = "write (OUT)";
      raddr = 4'b0000;
      waddr = 4'b0000;
      ibus = 16'bZ;
      db = 16'bZ;
      ir = 0;

      // Note: to OUT, we drive the IBUS.
      for (i = 0; i < 8 ; i = i + 1) begin
   	 #1000

   	 for (j = 0; j < 256; j = j + 1) begin
	    #250 ab = 8 | i;
	    nwen = 0;
	    ibus = j;
	    #250 nwen = 1;
	    ibus = 16'dZ;
   	 end

	 // OUT a final value to configure the registers for subsequent testing.
	 #250 nwen = 0;
	 ibus = { i[3:0] ^ 4'hf, i[3:0] };
	 #250 nwen = 1;
	 ibus = 16'dZ;
      end // for (i = 0; i < 8 ; i = i + 1)
      // We don't have an nIO signal, so nSYSDEV only depends on the AB. Clear the address. to deselect the MBU.
      ab = 16'd0;
      #1000;




      // Read the registers using simulated IN instructions.
      status = "read (IN)";
      raddr = 4'b0000;
      waddr = 4'b0000;
      ibus = 16'bZ;
      db = 16'bZ;
      ir = 0;
      nwen = 1;
      
      for (i = 0; i < 8 ; i = i + 1) begin
   	 #1000 ab = 8 | i;
	 #250 nr = 0;
	 #250 if (db_low !== { i[3:0] ^ 4'hf, i[3:0] }) begin
	    $display(msg, "read (IN): ab=%04x, reg %d = %02x (should be %02x)",
		     ab, ab[2:0], db, { i[3:0] ^ 4'hf, i[3:0] });
	    $error("assertion failure");
	    #100 $finish;
	 end else begin
	    $display("OK IN");
	 end
	 nr = 1;
      end
      ab = 16'd0;

      #1000;

      // Test RADDRs.
      status = "read (RADDR)";
      for (i = 0; i < 32; i = i + 1) begin
	 raddr = i[4:0];
	 #250;

	 if ((raddr === 5'b01100 || raddr === 5'b01101)) begin
	    // The MBU responded here. It should put the value of MB0 on the IBUS. Check.
	    if (ibus_real[7:0] !== mbu.regfile.mem[0]) begin
	       $display("read (RADDR): raddr=%05b, ibus=%02x, (should be %02x)",
			raddr, ibus[7:0], mbu.regfile.mem[0]);
	       $error("assertion failure");
	       #100 $finish;
	    end else begin
	       $display("OK RADDR");
	    end
	 end else begin
	    // The MBU is decoding the wrong address!
	    if (ibus_real !== 16'bZ) begin
	       $display("read (RADDR): raddr=%05b, ibus=%04x, MBU drove the IBUS (it shouldn't have)",
			raddr, ibus[7:0]);
	       $error("assertion failure");
	       #100 $finish;
	    end else begin
	       $display("OK RADDR");
	    end
	 end
      end
      raddr = 5'b0;

      #1000;

      // Test WADDRS.
      status = "write (WADDR)";
      for (i = 0; i < 32; i = i + 1) begin
	 waddr = i;

   	 for (j = 0; j < 256; j = j + 49) begin
	    #125 ibus = j;
	    waddr = i;
	    #125 waddr = 0;
	    ibus = 16'dZ;
   	 end

	 // Send out a final value to configure MB0 for subsequent
	 // testing. (same value it had before)
	 #125 ibus = 8'hf0;
	 waddr = i;
	 #125 waddr = 0;
	 ibus = 16'dZ;
	 
      end // for (i = 0; i < 32; i = i + 1)

      #1000;
      




`ifdef never

      
      #1000 raddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
   	 #125 ibus = (i ^ 4'hf) << 4 | (i & 4'hf);
   	 ir = 16'd0 | i;	       // MBn address on IR
   	 #62.5 waddr = 5'b01111;	       // read_mbn
   	 #62.5 waddr = 5'b00000;	       // idle again
      end
      #1000;

      // Then, let's read them back.
      status = "read MBN";
      #1000 waddr = 4'b0000;
      for (i = 0; i < 8 ; i = i + 1) begin
      	 ibus = 16'bzzzzzzzzzzzzzzzz;
      	 ir = 16'd0 | i;	       // address on IR
      	 #50 raddr = 5'b01111;	       // write_mbn
      	 #200 raddr = 5'b00000;	       // idle again
      end
      #1000;

      #1000 ir = 16'b0000_0100_0000_0000;
      status = "check raddr";
      for (i = 0; i < 32 ; i = i + 1) begin
      	 #100 raddr = i;
      end

      #1000 ir = 16'b0000_0100_0000_0000;
      status = "reference IR";
      for (i = 0; i < 32 ; i = i + 1) begin
      	 #100 ir = i;
      end

      // Try the write_ar_mb addresses.
      status = "reference AR:MBx";
      #1000 ir = 16'b1111_0100_0000_0000;
      raddr = 0;
      #1000 for (j = 5'b00100; j <= 5'b00111 ; j = j + 1) begin
      	 #250 waddr = j;
      end

      #1000 status="test AR:MBZ auto-index";

      // Try the index registers. This uses an instruction like TRAP I R &0xx
      // which should NOT select registers based on IR[2:0], just on WADDR.
      for (i = 5'b00100; i <= 5'b00111; i++) begin
      	 waddr = i;
      	 //5'b00111;
      	 for (j = 16'b0000_1100_0000_0000; j < 16'b0000_1111_1111_1111 ; j = j + 1) begin
      	    #25 ir = j;
   	    // Temporarily drive the IBUS with the complement of the IR to
   	    // prove that the register selection isn't influenced by this. If
   	    // it were, MBn, n = ir[2:0] XOR 111 would be selected.
   	    #25 ibus = j ^ 8'hff;
   	    #50 ibus = 16'bzzzzzzzzzzzzzzzz;
      	 end;
      	 #1000;
      end; // for (i = 5'b00100; i <= 5b'00111; i++)


`endif //  `ifdef never

      #1000 $finish;
   end // initial begin

   // always begin
   //    #950 nfpaext = 1'b0;
   //    #50 nfpaext = 1'b1;
   // end



   assign ibus_real = ibus;
   assign ab_real = ab;
   assign db_real = db;
   assign db_low = db_real[7:0]; // This simplifies things with gtkwave
   assign ibus_low = ibus_real[7:0]; // This simplifies things with gtkwave

   // Connect the DUT   
   mbu mbu (.nreset(nreset),
	    .wstb(wstb), .t34(t34),
	    .waddr(waddr), .raddr(raddr),
	    .ir(ir[11:0]),
	    .ibus(ibus_real[7:0]),
	    .aext(aext),
	    .nr(nr), .nw(nw),
	    .ab(ab_real[7:0]),
	    .db(db_real[7:0]),
	    .nsysdev(nsysdev),
	    .nwrite_flags(nwrite_flags),
	    .nwrite_mbp_flags(nwrite_mbp_flags),
	    .nread_flags(nread_flags),
	    .nread_mbp_flags(nread_mbp_flags),
	    .nfpram_fprom(nfpram_fprom)
	    );

   // Use the actual clock generator to make testing more accurate.
   clock_generator clk (.nreset(nreset), .fpclk(1'b0), .nfpclk_or_clk(1'b1), .wstb(wstb), .t34(t34));

   // Simulate SYSDEV generation. Assume ALL bus transactions are I/O
   // transactions for simplicity.
   assign #14 nsysdev = ab < 256 ? 1'b0 : 1'b1;

   // Simulate the crucial parts of the BUS board.
   assign ibus_real = nr ? 16'bZ : db;
   assign db_real = nwen ? 16'bZ : ibus;
   assign #6 nw = nwen; // | wstb;

   // Verify our findings.
   reg [8191:0] msg;
   reg 		contention = 0;
   reg 		default_values = 1'b1;
   reg [7:0] 	mbn[7:0];	// Snooped register values
   reg [7:0] 	correct_value1, correct_value2;
   reg [2:0] 	n;
   wire [17:0] 	waddr_and_ir;
   reg [15:0] 	db_snoop, ab_snoop;

   // Verify post-reset behaviour
   always @(nfpram_fprom, aext, mbu.ndis) begin
      if (nreset === 1'b1 && mbu.ndis === 1'b0) #50 begin
	 if (nfpram_fprom == 0 && aext !== 8'h00) begin
	    $sformat(msg, "post-reset, nfpram_fprom=%b (RAM) but AEXT was %02x (should be 00)",
		     nfpram_fprom, aext);
	 end;	      
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
	 $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	 $error("assertion failure");
	 #100 $finish;
      end
      else $display("OK post-reset");
   end

   // // Verify the MBU can be enabled by a write.
   // always @(posedge nw) #80 begin
   //    if ($time > 250 && mbu.ndis !== 1'b1) begin
   // 	 $sformat(msg, "After an OUT instruction, mbu.ndis = %b (should be 1).", mbu.ndis);
   //    end

   //    // Fail if we've logged an issue.
   //    if (msg[7:0]) begin
   // 	 $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   // 	 $error("assertion failure");
   // 	 #100 $finish;
   //    end
   //    else begin
   // 	 $display("OK INIT");
   //    end
   // end


   // // Verify OUT behaviour
   // always @(nw) begin
   //    // After an OUT instruction, the MBU should come out of post-reset mode.
   //    if (nw === 1'b1) #500 begin
   // 	 if (mbu.ndis !== 1'b1) begin
   // 	    $sformat(msg, "After an OUT instruction, mbu.ndis = %b (should be 1).", mbu.ndis);
   // 	 end
   //    end

   //    // Don't test until 250ns after start, to allow the clock to work properly.
   //    if ($time > 250 && nw === 1'b0) begin
   // 	 // Test that the correct value was written.
   // 	 begin
   // 	    ab_snoop = ab_real;
   // 	    db_snoop = db_real;
   // 	    #0 if (mbu.regfile.regfile.mem[ab_real[2:0]] !== db_real[7:0]) begin
   // 	       $sformat(msg, "OUT %03x <- %02x, but regfile.mem[%d] = %02x (should be %02x)",
   // 			ab_real[10:0], db_real, ab_real[2:0],
   // 			mbu.regfile.regfile.mem[ab_real[2:0]], db_real[2:0]);
   // 	    end
   // 	 end

   // 	 // Fail if we've logged an issue.
   // 	 if (msg[7:0]) begin
   // 	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
   // 	    $error("assertion failure");
   // 	    #100 $finish;
   // 	 end
   // 	 else $display("OK OUT");
   //    end
   // end

   // Verify writing to the MBP via WADDR
   always @(waddr, ibus[7:0]) begin
      if (waddr === 5'b01100 || waddr === 5'b01101) #250 begin
	 if (ibus[7:0] !== 8'bZ && mbu.regfile.mem[0] !== ibus[7:0]) begin
	    $sformat(msg, "waddr=%b, ibus=%02x but mbp=%02x (should be %02x)",
		     waddr, ibus[7:0], mbu.regfile.mem[0], ibus[7:0]);
	 end;	      
      end

      // Fail if we've logged an issue.
      if (msg[7:0]) begin
	 $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	 $error("assertion failure");
	 #100 $finish;
      end
      else $display("OK post-reset");
   end

   // Check for bus contention
   always @(aext) begin
      if ($time > 250) begin
	 for (k = 0; k < 8; k++) begin
	    if (aext[k] === 1'bX) begin
	       $sformat(msg, "AEXT contention (%08b, %02x)", aext, aext);
	       $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	       $error("assertion failure");
	       #100 $finish;
	    end
	 end
      end // if ($time > 250)
   end // always @ (aext)
   
   // Check for bus contention on DB[7:0]
   always @(db_low) begin
      if ($time > 250) begin
	 for (k = 0; k < 8; k++) begin
	    if (db_low[k] === 1'bX) begin
	       $sformat(msg, "DB[7:0] (db_low) contention (%08b, %02x)", db_low, db_low);
	       $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	       $error("assertion failure");
	       #100 $finish;
	    end
	 end
      end
   end // always @ (db_low)
   
   // Check for bus contention on AB[7:0]
   always @(ab_real[7:0]) begin
      if ($time > 250) begin
	 for (k = 0; k < 8; k++) begin
	    if (ab_real[k] === 1'bX) begin
	       $sformat(msg, "AB[7:0] contention (%08b, %02x)", ab_real[7:0], ab_real[7:0]);
	       $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	       $error("assertion failure");
	       #100 $finish;
	    end
	 end
      end
   end // always @ (ab_real)
   
   // Check for bus contention on SEL (the MBU register file's address)
   always @(mbu.sel) begin
      if ($time > 250) begin
	 for (k = 0; k < 3; k++) begin
	    if (mbu.sel[k] === 1'bX) begin
	       $sformat(msg, "SEL contention (%03b)", mbu.sel);
	       $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	       $error("assertion failure");
	       #100 $finish;
	    end
	 end
      end
   end // always @ (mbu.sel)
   

`ifdef never
   // MBn register snooping to facilitate further testing.
   always @(waddr, ir, ibus_real) begin
      if (waddr === 5'b01111) #30 begin
	 mbn[ir[2:0] ] = ibus_real[7:0];
	 // After the first MBR register is written to, the MBR is
	 // enabled. Default values are no longer put on AEXT.
	 if (ir[2:0] < 3'b100) default_values = 0;
      end

      //       waddr      ==? 5'b001??
      else if (waddr[4:2] == 3'b001) #100 begin
	 // write_agl_mbX decoding is complicated. The correct register to use
	 // is selected based on the exact write_agl_mb[pdsz] signal. In the
	 // case of the write_agl_mbz signal, auto-index locations are also
	 // decoded, but only if I=R=1.
	 casex ({waddr[1:0], ir})
	   { 2'b00, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbp;
	   { 2'b01, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbd;
	   { 2'b10, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbs;
	   { 2'b11, 16'b????_0?_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_10_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_0????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_10???????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
	   { 2'b11, 16'b????_11_11?????000 }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbz: MB0 auto-index;
	   { 2'b11, 16'b????_11_11?????001 }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbz: MB1 auto-index;
	   { 2'b11, 16'b????_11_11?????010 }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbz: MB2 auto-index;
	   { 2'b11, 16'b????_11_11?????011 }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz: MB3 auto-index;
	   { 2'b11, 16'b????_11_11?????100 }: { n, correct_value1 } = { 3'd4, mb4 }; // write_agl_mbz: MB4 auto-index;
	   { 2'b11, 16'b????_11_11?????101 }: { n, correct_value1 } = { 3'd5, mb5 }; // write_agl_mbz: MB5 auto-index;
	   { 2'b11, 16'b????_11_11?????110 }: { n, correct_value1 } = { 3'd6, mb6 }; // write_agl_mbz: MB6 auto-index;
	   { 2'b11, 16'b????_11_11?????111 }: { n, correct_value1 } = { 3'd7, mb7 }; // write_agl_mbz: MB7 auto-index;
	 endcase // case ({waddr[1:0], ir})

	 if (aext !== correct_value1) begin
	    $sformat(msg, "waddr=%b, ir[11:0]=%b_%b, registered mb%1d=%02x, but aext=%02x",
		     waddr, ir[11:10], ir[9:0], n, correct_value1, aext);
	 end;

	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK write");
      end // if (waddr[4:2] == 3'b001)
   end

   // Verify reading. We'll peer into the '670 to do this properly.
   always @ (raddr) begin
      #30 begin
	 msg[7:0] = "";		// Use the msg as a flag.

	 if (raddr === 5'b01111) begin
	    // Snoop the MBn register to compare against later

	    if (default_values) begin
	       correct_value2 = { nfpram_fprom, 7'd0 };
	    end else begin
	       // The stupid way round
	       case (ir[2:0])
		 3'd0: correct_value2 = mb0;
		 3'd1: correct_value2 = mb1;
		 3'd2: correct_value2 = mb2;
		 3'd3: correct_value2 = mb3;
		 3'd4: correct_value2 = mb4;
		 3'd5: correct_value2 = mb5;
		 3'd6: correct_value2 = mb6;
		 3'd7: correct_value2 = mb7;
	       endcase
	    end // else: !if(default_values)

	    case (default_values)
	      1: if (ibus_real !== correct_value2) begin
		 $sformat(msg, "raddr=%b, n=%1d, registered mb%1d=%02x, but ibus=%04x",
			  raddr, ir[2:0], ir[2:0], correct_value2, ibus_real);
	      end
	      
	      0: if (ibus_real !== mbn[ir[2:0]] || ibus_real !== correct_value2) begin
		 $sformat(msg, "raddr=%b, n=%1d, snooped mb%1d=%02x, registered mb%1d=%02x, but ibus=%04x",
			  raddr, ir[2:0], ir[2:0], mbn[ir[2:0]], ir[2:0], correct_value2, ibus_real);
	      end

	    endcase // case (default_values)
	 end
	 
	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("FAIL: assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 else $display("OK read");
      end
   end

`endif //  `ifdef never
endmodule // reg_mbr_tb


// End of file.
