///////////////////////////////////////////////////////////////////////////////
//
// REDESIGNED IN 2019
//
///////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: DFP Scanning function
//
///////////////////////////////////////////////////////////////////////////////

// The DFP uses a counter and decoders to produce 32 pulses which
// drive various quantities on the 8-bit FPD (Front Panel Data)
// bus. These are synchronised with the front panel modules to update
// the front panel lights, and can also be used by the DFP itself to
// read the state of the computer in detail. The DFP needs to
// interrupt the automatic scan featuer when it needs to read, but
// hopefully this happens so quickly that the panel user is none the
// wiser.
//
// And it saves approximately 160 wires!

///////////////////////////////////////////////////////////////////////////////
//
// ADDRESSING NOTES
//
///////////////////////////////////////////////////////////////////////////////

// The rough address space layout is as follows:
//            __   __
// 76543210   RD   WR   Notes
// -------------------------------------------------------------------------------
// 00xAAAAA    0    1   Read from processor units. (2 copies)
// 00xAAAAA    1    0   Write to front panel light modules. (2 copies)
// 01xxxAAA    1    0   Write to processor bus, part 1 of 2 (8 copies)
// 10xxxAAA    1    0   Write to processor bus, part 2 of 2 (8 copies)
// 10xxxAAA    0    1   Read from processor bus (8 copies)
// -------------------------------------------------------------------------------
//
// Full list of addresses:
//
// 00       Write to FP byte A1, µCV high order.
// 01       Write to FP byte B1, µCV medium order.
// 02       Write to FP byte C1, µCV low order.
// 03       Write to FP byte D1, IRQs active
// 04       Write to FP byte A2, AEXT.
// 05       Write to FP byte B2, PC high order.
// 06       Write to FP byte C2, PC low order.
// 07       Write to FP byte D2, IRQs enabled.
// 08       Write to FP byte A3, flags.
// 09       Write to FP byte B3, AC high order.
// 0a       Write to FP byte C3, AC low order.
// 0b       Write to FP byte D3, (future expansion).
// 0c       Write to FP byte A4, (TBD).
// 0d       Write to FP byte B4, MFD high order.
// 0e       Write to FP byte C4, MFD low order.
// 0f       Write to FP byte D4, (TBD).
// 10       Write to FP byte A5, machine state lights.
// 11       Write to FP byte B5, IR high order.
// 12       Write to FP byte C5, IR low order.
// 13       Write to FP byte D5, µCA low order bits. (high order in IR).
// 14       Reading or writing resets FP counter.
// 15       Reading or writing strobes nFPOE21 (brought to backplane)
// 16       Reading or writing strobes nFPOE22 (brought to backplane)
// 17       Reading or writing strobes nFPOE23 (brought to backplane)
// 18       Reading or writing strobes nFPOE24 (brought to backplane)
// 19       Reading or writing strobes nFPOE25 (brought to backplane)
// 1a       Reading or writing strobes nFPOE26 (brought to backplane)
// 1b       Reading or writing strobes nFPOE27 (brought to backplane)
// 1c       Reading or writing strobes nFPOE28 (brought to backplane)
// 1d       Reading or writing strobes nFPOE29 (brought to backplane)
// 1e       Reading or writing strobes nFPOE30 (brought to backplane)
// 1f       Reading or writing strobes nFPOE31 (broken out to TP108 on DFP board)
// 20-3f    (Copy of functions 00-1f do to partial addressing. Do not use.)
// 40       Read or write low order byte from 24-bit Address Bus.
// 41       Read or write medium order byte from 24-bit Address Bus.
// 42       Read or write high order byte from 24-bit Address Bus.
// 43       Read or write low order byte from 16-bit Data Bus.
// 44       Read or write high order byte from 16-bit Data Bus.
// 45       Read or write low order byte from 16-bit IBus.
// 46       Read or write high order byte from 16-bit IBus.
// 47       Write low order byte of 16-bit Output Register (OR).
// 48-7f    (7 copies of the above due to partial addressing. Do not use.)
// 80       Write to OR high. Read AB low.
// 81       Write to RADDR microcontrol. Read AB medium.
// 82       Write to WADDR microcontrol. Read AB high.
// 83       Write to ACTION microcontrol. Read DB low.
// 84       Write to strobe TP104 (on DFP board). Read DB high.
// 85       Write to strobe TP105 (on DFP board). Read IBus low.
// 86       Write to strobe TP106 (on DFP board). Read IBus high.
// 87       Write to strobe TP107 (on DFP board). Read DIP switches on DFP board.
// 88-ff    (15 copies of the above due to partial addressing. Do not use.)
// -------------------------------------------------------------------------------
//
// Bus considerations:
// ______    _______
// SCANEN    PANELEN    Function
// -------------------------------------------------------------------------------
//   0          0       Normal operation. MCU should tri-state FPD.
//   0          1       Do not use. (will turn off all panel lights)
//   1          0       MCU may only READ from &00–&3F. Front panel snooping. (1)
//   1          1       MCU has free access to bus. (2)
//
// (1) Regardless of whether the MCU is reading or writing, accessing an
//     address between &00 and &3F will cause an enable to be sent to a
//     processor module, which will drive the FPD bus. The front panel lights
//     corresponding to that 8-bit quantity will latch in the data. So the MCU
//     can read from the bus in this case, and any value read will update the
//     relevant portion of the front panel, but it can't write to addresses
//     &00–&3F.
//
// (2) Scanning is disabled, and no enables are sent to the processor. Reading
//     from OR WRITING TO addresses &00–&3F will set the corresponding front
//     panel lights. If reading, the last value put on the FPD bus will be used
//     (due to the bus hold circuitry). When writing, the MCU can freely
//     control the front panel lights for as long as this mode is active. This
//     can be used, e.g. to implement a ‘test lights’ function or light diagnostics.


`ifndef dfp_scan_v
`define dfp_scan_v

`include "counter.v"
`include "demux.v"

`timescale 1ns/10ps


module dfp_scan (nscanen, npanelen,
		 fpa,
		 nfpoe, nlmoe, nrow);

   parameter scanfreq = 52.63; // 19 MHz oscillation as an example.

   input         nscanen;
   input 	 npanelen;
   
   inout [7:0] 	 fpa;		// The Front Panel address bus
   
   output [31:0] nfpoe;	        // Decoded enables to CPU boards
   output [3:0]  nlmoe;		// Front panel Light Module enables (0-3)
   output [5:1]  nrow;		// Front panel Light row enables (1-5)

   reg 		 scanclk;

   // Simulate the oscillator
   initial begin
      scanclk = 0;
   end
   always begin
      #(scanfreq / 2) scanclk = ~scanclk;
   end


   // The scan counter.
   wire [7:0] q;
   wire       nscanclr;
   counter_590i scan_ctr (.clk(scanclk), .rck(scanclk),
			 .ccken(1'b0), .g(nscanen),
			 .cclr(nscanclr),
			 .q(q));
   assign fpa[4:0] = q[4:0];

   // Pull down FPA5, FPA6 and FPA7.
   // Note: moved to the testbed; this is just a wire now.
   wire [2:0] q_pulldn;
   assign fpa[7:5] = q_pulldn;

   // The Light Module decoder
   wire [7:0] lmy;
   demux_138 lm_demux (.g1(1'b1), .g2a(npanelen), .g2b(1'b0), .a({1'b1, fpa[1:0]}), .y(lmy));
   assign nlmoe = lmy[7:4];

   // The Light Row decoder decodes (FPA / 4) into five row enables.
   wire [7:0] rowy;
   demux_138 row_demux (.g1(1'b1), .g2a(fpa[6]), .g2b(fpa[7]), .a(fpa[4:2]), .y(rowy));
   assign nrow = rowy[4:0];

   // The four enable decoders. Their outputs are 4-way interleaved and each
   // decoder drives outputs corresponding to each light module. Remember:
   // vectors are high to low bit order, so the indexes are reversed on every row.
   demux_138 fpoe_demux0 (.g1(1'b1), .g2a(nlmoe[0]), .g2b(1'b0), .a(fpa[4:2]),
     .y({ nfpoe[28], nfpoe[24], nfpoe[20], nfpoe[16], nfpoe[12], nfpoe[8],  nfpoe[4], nfpoe[0] }));

   demux_138 fpoe_demux1 (.g1(1'b1), .g2a(nlmoe[1]), .g2b(1'b0), .a(fpa[4:2]),
     .y({ nfpoe[29], nfpoe[25], nfpoe[21], nfpoe[17], nfpoe[13], nfpoe[9],  nfpoe[5], nfpoe[1] }));

   demux_138 fpoe_demux2 (.g1(1'b1), .g2a(nlmoe[2]), .g2b(1'b0), .a(fpa[4:2]),
     .y({ nfpoe[30], nfpoe[26], nfpoe[22], nfpoe[18], nfpoe[14], nfpoe[10], nfpoe[6], nfpoe[2] }));

   demux_138 fpoe_demux3 (.g1(1'b1), .g2a(nlmoe[3]), .g2b(1'b0), .a(fpa[4:2]),
     .y({ nfpoe[31], nfpoe[27], nfpoe[23], nfpoe[19], nfpoe[15], nfpoe[11], nfpoe[7], nfpoe[3] }));

   // npfoe[20] is used to reset the counter and produce a mod 20 count.
   assign nscanclr = nfpoe[20];
   //assign nscanclr = 1'b1;
   
endmodule // dfp_scan

`endif //  `ifndef clock_v

// End of file.
