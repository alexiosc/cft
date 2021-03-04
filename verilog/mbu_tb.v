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
`include "clock.v"
`include "demux.v"
`include "clock.v"

`timescale 1ns/10ps


module reg_mbu_tb();
   reg        nrsthold;
   reg        nfpram_rom;
   reg [15:0] ibus_drv, ir;
   reg 	      nr, nwen;
   reg [4:0]  waddr;
   reg [4:0]  raddr;
   reg 	      naction_index;
   wire       nw;
   wire       nir_idx;

   wire       nrsthold_real, nfpram_rom_real;
   wire [15:0] ibus;
   wire [7:0]  aext, db_low, ibus_low;
   
   integer    i, j, k;

   reg [800:0] status;

   wire        clk1, clk2, clk3, clk4, t34;
   
   // Convenience decoded outputs to the Flag unit.
   wire        nwar;

   wire [7:0]  mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7;

   // Assemble the 8 registers. This makes strong assumptions about the
   // structure of the MBR circuitry!
   assign mb0 = mbu.mb[0];
   assign mb1 = mbu.mb[1];
   assign mb2 = mbu.mb[2];
   assign mb3 = mbu.mb[3];
   assign mb4 = mbu.mb[4];
   assign mb5 = mbu.mb[5];
   assign mb6 = mbu.mb[6];
   assign mb7 = mbu.mb[7];
   
   initial begin        
      $dumpfile ("vcd/mbu_tb.vcd");
      $dumpvars (0, reg_mbu_tb);

      // Check if the ROM image was loaded
      // if (mbu.rom_ctl.mem[0] === 8'bxxxxxxxx) begin
      // 	 $error("FAIL: ROM image not found.");
      // 	 $finish;
      // end;

      // $monitor ("t: %7d | %b %b | init=%b rom=%b | IR: %04x | %d %02x | waddr=%05b raddr=%05b ibus=%02x | regfile: %04x %02x ce=%b we=%b oe=%b | regs: %02x %02x %02x %02x %02x %02x %02x %02x",
      // 		$time,
      // 		waddr, raddr,
      // 		mbu.nenable, nfpram_rom,
      // 		ir,
      // 		mbu.sel, aext,
      // 		waddr, raddr, ibus_low,
      // 		mbu.regfile.a, mbu.regfile.d, mbu.regfile.nce, mbu.regfile.nwe, mbu.regfile.noe,
      // 		mb0, mb1, mb2, mb3, mb4, mb5, mb6, mb7);


      // NOTE: Because of the complexity of how the MBU works, we have
      // verification tests running both inside always() blocks like simpler
      // units, but we also test our findings synchronously in this block.


      ///////////////////////////////////////////////////////////////////////////////
      //
      // INITIALISE
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Before we begin, randomise the values of the eight registers to
      // simulate an actual SRAM.
      // for (i = 0; i < 8 ; i = i + 1) begin
      // 	 mbu.regfile.mem[i] = $random & 255;
      // end;
      // Set the MBU SRAM to predictable values for testing.
      naction_index = 1'b1;
      for (i = 0; i < 2048 ; i = i + 1) begin
	 mbu.regfile_mbu.mem[i] = i[7:0] ^ (i[10:8] << 5);
      end;

      nrsthold = 0;
      nfpram_rom = 0;		// RAM
      ibus_drv = 16'bzzzzzzzzzzzzzzzz;
      ir = 16'd0;
      
      waddr = 5'b00000;
      raddr = 5'b00000;

      status = "reset";

      #5000 nrsthold = 1;

      // Also, initialise the CTX register. Otherwise, it starts off with an XX
      // value, and that messes up early testing. We won't be testing its
      // correct operation yet, just stick the value in.
      mbu.ff_ctx.q0 = $random;

      // The TB isn't synchronous to the clock, so adjust its phase difference.
      #114;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // VERIFY POWER-ON DEFAULTS
      //
      ///////////////////////////////////////////////////////////////////////////////

      // Read the registers using read_mbn.
      // little more complicated than it should be, but I/O transactions bring
      // the MBU out of its post-reset mode so we can't use them.

      status = "read power-on default MBx (via IR)";
      #1000 raddr = 5'd0;
      for (i = 0; i < 4096 ; i = i + 1) begin
      	 nfpram_rom = i[0];
      	 ibus_drv = 16'bzzzzzzzzzzzzzzz;
      	 ir = 16'b1000_11_1100000000 | i[3:1]; // Use IDX registers for good measure.
      	 #250 raddr = 5'b11011;	       // read_mbn
      	 #250 raddr = 5'b00000;	       // idle again
      end

      #1000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // SET AND READ THE CTX REGISTER BEFORE ENABLING THE MBU
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "set and read the CTX register";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      // Use <= to wrap around to zero.
      for (i = 0; i <= 256 ; i = i + 1) begin
      	 #62.5 ibus_drv = i & 8'hff; // Only the LSB is used here
      	 #62.5;
      	 #62.5;
      	 #62.5 waddr = 5'b11101;             // write_ctx
      	 #250 waddr = 5'b00000;		     // idle again

      	 #125 ibus_drv = 16'bzzzzzzzzzzzzzzz;

      	 #125 raddr = 5'b11101;	             // read_ctx
      	 #250 raddr = 5'b00000;		     // idle again
      end // for (i = 0; i < 256 ; i = i + 1)

      #1000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // ENABLE THE MBU, SET MBRs
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "enable MBU, initialise MBRs via WMBn";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8 ; i = i + 1) begin
      	 #62.5 ir = 16'b1000_11_1100000000 | i[2:0]; // Use IDX registers for good measure.
	 ibus_drv = i ^ 8'hff;
	 #62.5;
	 #62.5;
	 #62.5 waddr = 5'b11011;
      	 #250 waddr = 5'b00000;	     // idle again

      	 #62.5 ir = 16'b1000_11_1100000000 | i[2:0]; // Use IDX registers for good measure.
	 ibus_drv = i;
	 #62.5;
	 #62.5;
	 #62.5 waddr = 5'b11011;
      	 #250 waddr = 5'b00000;	     // idle again
      end
      ibus_drv = 16'bZ;

      #10000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // READ BACK THE MBRs
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "read back the MBRs";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8 ; i = i + 1) begin
      	 #62.5 ir = 16'b1000_11_1100000000 | i[2:0]; // Use IDX registers for good measure.
	 #125;
	 #62.5 raddr = 5'b11011;
      	 #250 raddr = 5'b00000;		     // idle again
      end
      ibus_drv = 16'bZ;

      #10000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // WRITE MBP, READ MBP
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "test write_mbp, read_mbp";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      // Use <= so that we wrap around to 00, the default expected value for testing.
      for (i = 0; i <= 256 ; i = i + 1) begin
	 // For sanity, if IR is used by mistake, the wrong MBr gets updated.
      	 #62.5 ir = 16'b1000_11_1100000000;
	 ibus_drv = i;
	 #62.5;
	 #62.5;
	 #62.5 waddr = 5'b11100;
      	 #250 waddr = 5'b00000;	     // idle again
	 #125 ibus_drv = 16'bZ;
	 #125;
	 #250 raddr = 5'b11100;	     // Read it back
      	 #250 raddr = 5'b00000;	     // idle again
      end
      ibus_drv = 16'bZ;

      #1000;

      ///////////////////////////////////////////////////////////////////////////////
      //
      // READ BACK THE MBRs VIA PAGE ZERO ACCESS, ALL VALUES OF I AND R FIELDS
      //
      ///////////////////////////////////////////////////////////////////////////////

      status = "index using write_ar_mbp";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8192 ; i = i + 1) begin
      	 #62.5 ir = {4'b1000, i[11:0]};
	 naction_index = i[12] ^ 1;
	 #125;
	 #62.5 waddr = 5'b00100; // write_ar_mbp
      	 #250 waddr = 5'b00000;	 // idle again
      end
      ibus_drv = 16'bZ;

      status = "index using write_ar_mbd";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8192 ; i = i + 1) begin
      	 #62.5 ir = {4'b1000, i[11:0]};
	 naction_index = i[12] ^ 1;
	 #125;
	 #62.5 waddr = 5'b00101; // write_ar_mbd
      	 #250 waddr = 5'b00000;	 // idle again
      end
      ibus_drv = 16'bZ;

      status = "index using write_ar_mbs";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8192 ; i = i + 1) begin
      	 #62.5 ir = {4'b1000, i[11:0]};
	 naction_index = i[12] ^ 1;
	 #125;
	 #62.5 waddr = 5'b00110; // write_ar_mbd
      	 #250 waddr = 5'b00000;	 // idle again
      end
      ibus_drv = 16'bZ;

      status = "index using write_ar_mbz";
      #1000 raddr = 5'd0;
      waddr = 5'd0;
      raddr = 5'd0;
      ibus_drv = 16'bZ;
      for (i = 0; i < 8192 ; i = i + 1) begin
      	 #62.5 ir = {4'b1000, i[11:0]};
	 naction_index = i[12] ^ 1;
	 #125;
	 #62.5 waddr = 5'b00111; // write_ar_mbd
      	 #250 waddr = 5'b00000;	 // idle again
      end
      ibus_drv = 16'bZ;

      #10000;

      $finish;
   end // initial begin

   // Bi-directional buses and convenience

   assign nrsthold_real = nrsthold;
   assign nfpram_rom_real = nfpram_rom;
   assign ibus = ibus_drv;
   assign ibus_low = ibus[7:0]; // This simplifies things with gtkwave

   // Connect the DUT   
   mbu mbu (.nrsthold(nrsthold_real),
	    .clk2(clk2), .clk4(clk4),
	    .t34(t34),
	    .waddr(waddr), .raddr(raddr),
	    .ir(ir[2:0]),
	    .nir_idx(nir_idx),
	    .ibus(ibus_low),
	    .aext(aext),
	    .nwar(nwar),
	    .nfpram_rom(nfpram_rom_real)
	    );

   // Make the nir_idx signal work
   assign #15 nir_idx = (naction_index == 0) && (ir[11:8] === 4'b1111) ? 1'b0 : 1'b1;

   // Use the actual clock generator to make testing more accurate.
   clock_generator clk (.nrsthold(nrsthold_real), .clk1(clk1), .clk2(clk2),
			.clk3(clk3), .clk4(clk4), .t34(t34));



   // Verify our findings.
   reg [8191:0] msg;
   reg [320:0] 	what;		// Used for WADDR index checks
   reg 		contention = 0;
   reg 		default_values = 1'b1;
   reg [7:0] 	mbn[7:0];	// Snooped register values
   reg [7:0] 	correct_value1, correct_value2;
   reg [2:0] 	n;
   wire [17:0] 	waddr_and_ir;
   reg [15:0] 	db_snoop, ab_snoop;


   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY POST-RESET BEHAVIOUR
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @(nfpram_rom, aext, mbu.ndis) begin
      if (nrsthold === 1'b1 && mbu.ndis === 1'b0) #50 begin
	 correct_value1 = { nfpram_rom, 7'd0 };
	 if (nfpram_rom_real == 0 && aext !== correct_value1) begin
	    $sformat(msg, "post-reset, nfpram_rom_real=%b (RAM) but AEXT was %02x (should be %02x)",
		     nfpram_rom_real, aext, correct_value1);
	 end
	 
	 // Fail if we've logged an issue.
	 if (msg[7:0]) begin
	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
	    $error("assertion failure");
	    #100 $finish;
	 end
	 //else $display("345 OK post-reset");
      end
   end // always @ (nfpram_rom, aext, mbu.ndis)

   ///////////////////////////////////////////////////////////////////////////////
   //
   // VERIFY ADDRESS DECODING
   //
   ///////////////////////////////////////////////////////////////////////////////

   always @(waddr) begin
      if ($time > 100) #60 begin
	 if (nwar !== ((clk4 == 1'b0 && waddr[4:2] === 3'b001) ? 1'b0 : 1'b1)) begin
	    $display("346 FAIL waddr decoding failure, clk4=%b, waddr=%b, nwar=%b (should be %b)",
		     clk4, waddr, mbu.nwar, (waddr[4:2] === 3'b001 ? 1'b0 : 1'b1));
	    $error("assertion failure");
	    #500 $finish;
	 end
	 else $display("345 OK waddr/war");
      end
   end
   
//    // always @(waddr, t34) begin
//    //    if ($time > 100) #40 begin
//    // 	 if (t34 === 1'b0 && (mbu.nwmbp !== ((waddr === 5'b01100 || waddr === 5'b01101) ? 1'b0 : 1'b1))) begin
//    // 	    $display("346 FAIL waddr decoding failure, waddr=%b, nwmbp=%b (should be %b)",
//    // 	  	     waddr, mbu.nwmbp,
//    // 		     ((waddr === 5'b01100 || waddr === 5'b01101) ? 1'b0 : 1'b1));
//    // 	    $error("assertion failure");
//    // 	    #100 $finish;
//    // 	 end

//    // 	 else if (t34 !== 1'b0 && mbu.nwmbp !== 1'b1) begin
//    // 	    $display("346 FAIL waddr decoding failure, nwbmp=%b during t34=%b (should never happen!)",
//    // 	  	     mbu.nwmbp, t34);
//    // 	    $error("assertion failure");
//    // 	    #100 $finish;
//    // 	 end
//    // 	 else $display("345 OK waddr");
//    //    end
//    // end

//    // always @(raddr, t34) begin
//    //    if ($time > 100) #30 begin
//    // 	 if (t34 === 1'b1 && mbu.nrmbp !== 1'b1) begin
//    // 	    $display("346 FAIL nrmbp went low outside of t34");
//    // 	    $error("assertion failure");
//    // 	    #100 $finish;
//    // 	 end
	 
//    // 	 if (t34 === 1'b0 && mbu.nrmbp !== (raddr[4:0] === 5'b01101 ? 1'b0 : 1'b1)) begin
//    // 	    $display("346 FAIL raddr decoding failure, raddr=%b, nrmbp=%b (should be %b)",
//    // 	 	     raddr, mbu.nrmbp, (raddr[4:1] === 4'b0110 ? 1'b0 : 1'b1));
//    // 	    $error("assertion failure");
//    // 	    #100 $finish;
//    // 	 end
	 
//    // 	 else $display("345 OK raddr");
//    //    end
//    // end

//    always @(ab) begin
//       #30 begin
// 	 // Verify selection
// 	 if (nsysdev === 1'b0 && ab >= 16'h8 && ab <= 16'hf) begin
// 	    if (mbu.niombr !== 1'b0) begin
//    	       $display("I/O space decoding failure. nsysdev=%b, ab=%04h, but mbu.niombr=%b (should be 0)",
// 			nsysdev, ab, mbu.niombr);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	    else $display("345 OK OUT decoding");
// 	 end else begin
// 	    if (mbu.niombr !== 1'b1) begin
//    	       $display("I/O space decoding failure. nsysdev=%b, ab=%04h, but mbu.niombr=%b (should be 1)",
// 			nsysdev, ab, mbu.niombr);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	    else $display("345 OK OUT decoding");
// 	 end
//       end
//    end // always @ (ab)
   
//    always @(mbu.niombr, negedge nw) begin
//       #30 begin
// 	 // Verify selection
// 	 if (mbu.niombr === 1'b0 && nw === 1'b0) begin
// 	    if (mbu.niowmbr !== 1'b0) begin
//    	       $display("I/O space write enable failure. mbu.niombr=%b, nw=%b, but mbu.niowmbr=%b (should be 0)",
// 			mbu.niombr, nw, mbu.niowmbr);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	    else $display("345 OK OUT decoding");
// 	 end else begin
// 	    if (mbu.niowmbr !== 1'b1) begin
//    	       $display("I/O space write enable failure. mbu.niombr=%b, nw=%b, but mbu.niowmbr=%b (should be 1)",
// 			mbu.niombr, nw, mbu.niowmbr);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	    else $display("345 OK OUT decoding");
// 	 end
//       end
//    end
   
//    ///////////////////////////////////////////////////////////////////////////////
//    //
//    // VERIFY ENABLING OF THE MBU
//    //
//    ///////////////////////////////////////////////////////////////////////////////

//    // Verify the MBU can be enabled by a write.
//    always @(posedge nw) #80 begin
//       if ($time > 250 && (mbu.ndis !== 1'b1 || mbu.nen !== 1'b0)) begin
//    	 $sformat(msg, "After an OUT instruction, mbu.ndis=%b, mbu.nen=%b (should be 1, 0).",
// 		  mbu.ndis, mbu.nen);
//       end

//       // Fail if we've logged an issue.
//       if (msg[7:0]) begin
//    	 $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
//    	 $error("assertion failure");
//    	 #100 $finish;
//       end
//       else begin
//    	 $display("345 OK INIT");
//       end
//    end // always @ (posedge nw)

//    ///////////////////////////////////////////////////////////////////////////////
//    //
//    // VERIFY THE I/O SPACE INTERFACE
//    //
//    ///////////////////////////////////////////////////////////////////////////////

//    // Verify OUT behaviour
//    always @(posedge nw) begin
//       // Don't test until 250ns after start, to allow the clock to work properly.
//       if ($time > 250 && nw === 1'b0) begin
//    	 // Test that the correct value was written.
//    	 begin
//    	    ab_snoop = ab_real;
//    	    db_snoop = db_real;
//    	    #0 if (mbu.mb[ab_real[2:0]] !== db_real[7:0]) begin
//    	       $sformat(msg, "OUT %03x <- %02x, but mbu.mb[%d] = %02x (should be %02x)",
//    			ab_real[10:0], db_real, ab_real[2:0],
//    			mbu.mb[ab_real[2:0]], db_real[2:0]);
//    	    end
//    	 end

//    	 // Fail if we've logged an issue.
//    	 if (msg[7:0]) begin
//    	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
//    	    $error("assertion failure");
//    	    #1000 $finish;
//    	 end
//    	 else $display("345 OK OUT");
//       end
//    end


//    ///////////////////////////////////////////////////////////////////////////////
//    //
//    // VERIFY WADDR WRITES
//    //
//    ///////////////////////////////////////////////////////////////////////////////
   
//    always @(waddr, ibus[7:0]) begin
//       if (waddr === 5'b01100 || waddr === 5'b01101) #250 begin
// 	 // if (ibus[7:0] !== 8'bZ && mbu.regfile.mem[0] !== ibus[7:0]) begin
// 	 //    $sformat(msg, "waddr=%b, ibus=%02x but mbp=%02x (should be %02x)",
// 	 // 	     waddr, ibus[7:0], mbu.regfile.mem[0], ibus[7:0]);
// 	 // end;	      

// 	 // // Fail if we've logged an issue.
// 	 // if (msg[7:0]) begin
// 	 //    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	 //    $error("assertion failure");
// 	 //    #100 $finish;
// 	 // end
// 	 // else $display("345 OK WADDR write");
//       end
//    end // always @ (waddr, ibus[7:0])


//    ///////////////////////////////////////////////////////////////////////////////
//    //
//    // VERIFY INDEXING READS
//    //
//    ///////////////////////////////////////////////////////////////////////////////

//    always @(waddr, ir) begin
//       if ($time > 250 && mbu.ndis == 1 && waddr >= 5'b00100 && waddr <= 5'b00111) begin
// 	 casex (waddr)
// 	   5'b00100: begin
// 	      what = "write_ar_mbp";
// 	      correct_value1 = 0;
// 	   end
// 	   5'b00101: begin
// 	      what = "write_ar_mbd";
// 	      correct_value1 = 1;
// 	   end
// 	   5'b00110: begin
// 	      what = "write_ar_mbs";
// 	      correct_value1 = 2;
// 	   end
// 	   5'b00111: begin
// 	      what = "write_ar_mbz";
// 	      if (ir[11:0] < 12'b11_1100000000) begin
// 		 correct_value1 = 3;
// 	      end else begin
// 		 // I & R set, op >= 0x300: the MBU register depends on IR[2:0].
// 		 correct_value1 = ir[2:0];
// 	      end
// 	   end
// 	 endcase // casex (waddr)

// 	 #80 begin
// 	    // if (mbu.nibusen !== 1'b1) begin
// 	    //    $sformat(msg, "waddr=%05b (%0s), mbu.nibusen=%b (should be 0, MBU should not be driving the IBUS!)",
// 	    // 		waddr, what, mbu.nibusen);
// 	    // end
	    
// 	    // else if (mbu.sel !== correct_value1) begin
// 	    //    $sformat(msg, "waddr=%05b (%0s), ir=%b:%b:%02b_%04b_%04b, sel=%02b (should be %02b)",
// 	    // 		waddr, what, ir[11], ir[10], ir[9:8], ir[7:4], ir[3:0], mbu.sel, correct_value1[2:0]);
// 	    // end

// 	    // // Fail if we've logged an issue.
// 	    // if (msg[7:0]) begin
// 	    //    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	    //    $error("assertion failure");
// 	    //    #100 $finish;
// 	    // end
// 	    // else $display("345 OK index");
// 	 end
//       end
//    end // always @ (waddr, ir)


//    ///////////////////////////////////////////////////////////////////////////////
//    //
//    // BUS CONTENTION CHECKS
//    //
//    ///////////////////////////////////////////////////////////////////////////////

//    // Check for bus contention
//    always @(aext) begin
//       if ($time > 250) begin
// 	 for (k = 0; k < 8; k++) begin
// 	    if (aext[k] === 1'bX) begin
// 	       $sformat(msg, "AEXT contention (%08b, %02x)", aext, aext);
// 	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	 end
//       end // if ($time > 250)
//    end // always @ (aext)
   
//    // Check for bus contention on DB[7:0]
//    always @(db_low) begin
//       if ($time > 250) begin
// 	 for (k = 0; k < 8; k++) begin
// 	    if (db_low[k] === 1'bX) begin
// 	       $sformat(msg, "DB[7:0] (db_low) contention (%08b, %02x)", db_low, db_low);
// 	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	 end
//       end
//    end // always @ (db_low)
   
//    // Check for bus contention on AB[7:0]
//    always @(ab_real[7:0]) begin
//       if ($time > 250) begin
// 	 for (k = 0; k < 8; k++) begin
// 	    if (ab_real[k] === 1'bX) begin
// 	       $sformat(msg, "AB[7:0] contention (%08b, %02x)", ab_real[7:0], ab_real[7:0]);
// 	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	       $error("assertion failure");
// 	       #100 $finish;
// 	    end
// 	 end
//       end
//    end // always @ (ab_real)
   
//    // Check for bus contention on SEL (the MBU register file's address)
//    // always @(mbu.sel) begin
//    //    if ($time > 250) begin
//    // 	 for (k = 0; k < 3; k++) begin
//    // 	    if (mbu.sel[k] === 1'bX) begin
//    // 	       $sformat(msg, "SEL contention (%03b)", mbu.sel);
//    // 	       $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
//    // 	       $error("assertion failure");
//    // 	       #100 $finish;
//    // 	    end
//    // 	 end
//    //    end
//    // end // always @ (mbu.sel)

// ///////////////////////////////////////////////////////////////////////////////   
// ///////////////////////////////////////////////////////////////////////////////   
// ///////////////////////////////////////////////////////////////////////////////   
// ///////////////////////////////////////////////////////////////////////////////   
// ///////////////////////////////////////////////////////////////////////////////   

// `ifdef never
//    // MBn register snooping to facilitate further testing.
//    always @(waddr, ir, ibus_real) begin
//       if (waddr === 5'b01111) #30 begin
// 	 mbn[ir[2:0] ] = ibus_real[7:0];
// 	 // After the first MBR register is written to, the MBR is
// 	 // enabled. Default values are no longer put on AEXT.
// 	 if (ir[2:0] < 3'b100) default_values = 0;
//       end

//       //       waddr      ==? 5'b001??
//       else if (waddr[4:2] == 3'b001) #100 begin
// 	 // write_agl_mbX decoding is complicated. The correct register to use
// 	 // is selected based on the exact write_agl_mb[pdsz] signal. In the
// 	 // case of the write_agl_mbz signal, auto-index locations are also
// 	 // decoded, but only if I=R=1.
// 	 casex ({waddr[1:0], ir})
// 	   { 2'b00, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbp;
// 	   { 2'b01, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbd;
// 	   { 2'b10, 16'b????_??_?????????? }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbs;
// 	   { 2'b11, 16'b????_0?_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
// 	   { 2'b11, 16'b????_10_?????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
// 	   { 2'b11, 16'b????_11_0????????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
// 	   { 2'b11, 16'b????_11_10???????? }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz;
// 	   { 2'b11, 16'b????_11_11?????000 }: { n, correct_value1 } = { 3'd0, mb0 }; // write_agl_mbz: MB0 auto-index;
// 	   { 2'b11, 16'b????_11_11?????001 }: { n, correct_value1 } = { 3'd1, mb1 }; // write_agl_mbz: MB1 auto-index;
// 	   { 2'b11, 16'b????_11_11?????010 }: { n, correct_value1 } = { 3'd2, mb2 }; // write_agl_mbz: MB2 auto-index;
// 	   { 2'b11, 16'b????_11_11?????011 }: { n, correct_value1 } = { 3'd3, mb3 }; // write_agl_mbz: MB3 auto-index;
// 	   { 2'b11, 16'b????_11_11?????100 }: { n, correct_value1 } = { 3'd4, mb4 }; // write_agl_mbz: MB4 auto-index;
// 	   { 2'b11, 16'b????_11_11?????101 }: { n, correct_value1 } = { 3'd5, mb5 }; // write_agl_mbz: MB5 auto-index;
// 	   { 2'b11, 16'b????_11_11?????110 }: { n, correct_value1 } = { 3'd6, mb6 }; // write_agl_mbz: MB6 auto-index;
// 	   { 2'b11, 16'b????_11_11?????111 }: { n, correct_value1 } = { 3'd7, mb7 }; // write_agl_mbz: MB7 auto-index;
// 	 endcase // case ({waddr[1:0], ir})

// 	 if (aext !== correct_value1) begin
// 	    $sformat(msg, "waddr=%b, ir[11:0]=%b_%b, registered mb%1d=%02x, but aext=%02x",
// 		     waddr, ir[11:10], ir[9:0], n, correct_value1, aext);
// 	 end;

// 	 // Fail if we've logged an issue.
// 	 if (msg[7:0]) begin
// 	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	    $error("assertion failure");
// 	    #100 $finish;
// 	 end
// 	 else $display("345 OK write");
//       end // if (waddr[4:2] == 3'b001)
//    end

//    // Verify reading. We'll peer into the '670 to do this properly.
//    always @ (raddr) begin
//       #30 begin
// 	 msg[7:0] = "";		// Use the msg as a flag.

// 	 if (raddr === 5'b01111) begin
// 	    // Snoop the MBn register to compare against later

// 	    if (default_values) begin
// 	       correct_value2 = { nfpram_rom, 7'd0 };
// 	    end else begin
// 	       // The stupid way round
// 	       case (ir[2:0])
// 		 3'd0: correct_value2 = mb0;
// 		 3'd1: correct_value2 = mb1;
// 		 3'd2: correct_value2 = mb2;
// 		 3'd3: correct_value2 = mb3;
// 		 3'd4: correct_value2 = mb4;
// 		 3'd5: correct_value2 = mb5;
// 		 3'd6: correct_value2 = mb6;
// 		 3'd7: correct_value2 = mb7;
// 	       endcase
// 	    end // else: !if(default_values)

// 	    case (default_values)
// 	      1: if (ibus_real !== correct_value2) begin
// 		 $sformat(msg, "raddr=%b, n=%1d, registered mb%1d=%02x, but ibus=%04x",
// 			  raddr, ir[2:0], ir[2:0], correct_value2, ibus_real);
// 	      end
	      
// 	      0: if (ibus_real !== mbn[ir[2:0]] || ibus_real !== correct_value2) begin
// 		 $sformat(msg, "raddr=%b, n=%1d, snooped mb%1d=%02x, registered mb%1d=%02x, but ibus=%04x",
// 			  raddr, ir[2:0], ir[2:0], mbn[ir[2:0]], ir[2:0], correct_value2, ibus_real);
// 	      end

// 	    endcase // case (default_values)
// 	 end
	 
// 	 // Fail if we've logged an issue.
// 	 if (msg[7:0]) begin
// 	    $display("346 FAIL assertion failed at t=%0d: %0s", $time, msg);
// 	    $error("assertion failure");
// 	    #100 $finish;
// 	 end
// 	 else $display("345 OK read");
//       end
//    end







endmodule // reg_mbr_tb


// End of file.
