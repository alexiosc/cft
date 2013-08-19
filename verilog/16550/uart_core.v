// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
`include "uart_defines.v" 
 
`define UART_DL1 7:0 
`define UART_DL2 15:8 
 
module uart_core 
( 
	clk_i, 
	reset_i, 
	addr_i, 
	data_i, 
	data_o, 
	rd_i, 
	we_i, 
	stx_pad_o, srx_pad_i, 
	rts_pad_o, cts_pad_i, 
	dtr_pad_o, dsr_pad_i, 
	dcd_pad_i, ri_pad_i, 
	int_o 
); 
 
input			clk_i; 
input			reset_i; 
input [2:0]		addr_i; 
input [7:0] 	data_i; 
output [7:0] 	data_o; 
input			rd_i; 
input			we_i; 
 
output			stx_pad_o; 
input			srx_pad_i; 
output			dtr_pad_o; 
input			dsr_pad_i; 
input			dcd_pad_i; 
input			ri_pad_i; 
output			rts_pad_o; 
input			cts_pad_i; 
output			int_o; 
 
wire [2:0]		addr_i; 
wire [7:0]		data_i; 
reg [7:0]		data_o; 
 
reg				stx_pad_o;		// received from transmitter module 
wire			srx_pad_i; 
wire			dtr_pad_o, dsr_pad_i; 
wire			dcd_pad_i, ri_pad_i; 
 
wire			int_o; 
 
////////////////////////////////////// 
 
// user registers 
 
reg [3:0]		r_ier; 
reg [3:0]		r_iir; 
reg [1:0]		r_fcr;		// bits 7 and 6 of fcr. Other bits are ignored 
reg [5:0]		r_mcr; 
reg [7:0]		r_lcr; 
reg [7:0]		r_msr; 
reg [7:0]		r_scratch;	// UART scratch register 
reg [15:0]		r_dl; 		// 16-bit divisor latch 
wire [7:0]		r_lsr; 
 
// internal registers & counters 
reg				srx_pad; 
 
// register bit alias 
wire			b_dlab;		// divisor latch access bit 
wire			b_loopbk;	// b_loopbk bit (MCR bit 4) 
wire			b_afc;		// !!NEW auto flow control (MCR bit5) 
wire			b_out1, b_out2, b_rts, b_dtr; 
reg				rf_reset, tf_reset; 
 
// input signal alias 
wire			serial_in; 
wire			bus_rd_rbr; 
wire			bus_rd_lsr; 
wire			bus_rd_iir; 
wire			bus_rd_msr; 
wire			bus_wr_dl1; 
wire			bus_wr_dl2; 
wire			bus_wr_thr; 
wire			bus_wr_ier; 
wire			bus_wr_fcr; 
wire			bus_wr_lcr; 
wire			bus_wr_mcr; 
wire			bus_wr_scr; 
 
// internal variables 
wire			serial_out; 
wire			afc_rts, afc_cts; 
reg				enable; 
 
wire			tf_push; 
wire			tf_empty; 
wire			tf_full; 
 
wire			tx_empty; 
 
wire			rf_push; 
wire			rf_pop; 
wire			rf_empty; 
wire			rf_full; 
wire			rf_level; 
wire			rf_overrun; 
wire			rf_fifoerr; 
 
wire [10:0]		rf_dataout; 
reg [7:0]		frame_len; 
 
///////////////////////////////////// 
 
always @(r_lcr[3:0]) 
	case (r_lcr[3:0]) 
		4'b0000								: frame_len = 8'd112; // 7 bits 
		4'b0100								: frame_len = 8'd120; // 7.5 bits 
		4'b0001, 4'b1000					: frame_len = 8'd128; // 8 bits 
		4'b1100								: frame_len = 8'd136; // 8.5 bits 
		4'b0010, 4'b0101, 4'b1001			: frame_len = 8'd144; // 9 bits 
		4'b0011, 4'b0110, 4'b1010, 4'b1101	: frame_len = 8'd160; // 10 bits 
		4'b0111, 4'b1011, 4'b1110			: frame_len = 8'd176; // 11 bits 
		4'b1111								: frame_len = 8'd192; // 12 bits 
	endcase // case(lcr[3:0]) 
 
assign afc_cts = !b_afc || r_msr[`UART_MS_CCTS]; 
 
uart_send transmitter 
( 
	.clk(clk_i), 
	.reset(reset_i), 
	.r_lcr(r_lcr), 
	.enable(enable), 
	.afc_cts(afc_cts), 
	.serial_out(serial_out), 
	.tf_push(tf_push), 
	.tf_reset(tf_reset), 
	.tf_empty(tf_empty), 
	.tf_full(tf_full), 
	.tx_empty(tx_empty), 
	.tf_datain(data_i) 
); 
 
uart_recv receiver 
( 
	.clk(clk_i), 
	.reset(reset_i), 
	.r_lcr(r_lcr), 
	.r_fcr(r_fcr), 
	.frame_len(frame_len), 
	.enable(enable), 
	.afc_rts(afc_rts), 
	.serial_in(serial_in), 
	.rf_reset(rf_reset), 
	.rf_push(rf_push), 
	.rf_pop(rf_pop), 
	.rf_empty(rf_empty), 
	.rf_full(rf_full), 
	.rf_level(rf_level), 
	.rf_dataout(rf_dataout), 
	.rf_fifoerr(rf_fifoerr), 
	.rf_overrun(rf_overrun) 
); 
 
// ============= register bit alias 
 
assign b_dlab = r_lcr[`UART_LC_DL]; 
assign b_loopbk = r_mcr[`UART_MC_LB]; 
assign b_afc  = r_mcr[`UART_MC_AFC]; 
assign b_dtr  = r_mcr[`UART_MC_DTR]; 
assign b_rts  = r_mcr[`UART_MC_RTS]; 
assign b_out1 = r_mcr[`UART_MC_OUT1]; 
assign b_out2 = r_mcr[`UART_MC_OUT2]; 
 
// ============= input/output signals 
assign bus_rd_rbr = (rd_i && addr_i == `UART_REG_RB && !b_dlab); 
assign bus_rd_lsr = (rd_i && addr_i == `UART_REG_LS); 
assign bus_rd_iir = (rd_i && addr_i == `UART_REG_II); 
assign bus_rd_msr = (rd_i && addr_i == `UART_REG_MS); 
assign bus_wr_dl1 = (we_i && addr_i == `UART_REG_DL1 && b_dlab); 
assign bus_wr_dl2 = (we_i && addr_i == `UART_REG_DL2 && b_dlab); 
assign bus_wr_thr = (we_i && addr_i == `UART_REG_TR && !b_dlab); 
assign bus_wr_ier = (we_i && addr_i == `UART_REG_IE && !b_dlab); 
assign bus_wr_fcr = (we_i && addr_i == `UART_REG_FC); 
assign bus_wr_lcr = (we_i && addr_i == `UART_REG_LC); 
assign bus_wr_mcr = (we_i && addr_i == `UART_REG_MC); 
assign bus_wr_scr = (we_i && addr_i == `UART_REG_SR); 
 
always @ (posedge clk_i or posedge reset_i) 
	if (reset_i) 
		srx_pad <= #1 1'b1; 
	else 
		srx_pad <= #1 srx_pad_i; 
 
assign serial_in = b_loopbk ? serial_out : srx_pad; 
assign rts_pad_o = b_afc ? ~afc_rts : r_mcr[`UART_MC_RTS]; 
assign dtr_pad_o = r_mcr[`UART_MC_DTR]; 
 
always @( b_loopbk or r_lcr or serial_out ) 
	case ({b_loopbk,r_lcr[`UART_LC_BC]}) 
	2'b00: stx_pad_o = serial_out; 
	2'b01: stx_pad_o = 1'b0; 
	2'b10, 2'b11: stx_pad_o = 1'b1; 
	endcase 
 
// ============= Async register reading 
 
always @(	b_dlab or rf_dataout or addr_i or 
			r_dl or r_ier or r_iir or r_lcr or r_lsr or r_msr or r_scratch ) 
begin 
	case (addr_i) 
		`UART_REG_RB	: data_o = rf_dataout[7:0];		// r_dl is write-only 
		`UART_REG_IE	: data_o = r_ier;				// r_dl is write-only 
		`UART_REG_II	: data_o = {4'b1100,r_iir}; 
		`UART_REG_LC	: data_o = r_lcr; 
		`UART_REG_LS	: data_o = r_lsr; 
		`UART_REG_MS	: data_o = r_msr; 
		default			: data_o = r_scratch;			// UART_REG_SR 
	endcase // case(addr_i) 
end 
 
//always @(posedge clk_i) 
//begin 
//	case (addr_i) 
//		`UART_REG_RB	: data_o <= #1 rf_dataout[7:0];		// r_dl is write-only 
//		`UART_REG_IE	: data_o <= #1 r_ier;				// r_dl is write-only 
//		`UART_REG_II	: data_o <= #1 {4'b1100,r_iir}; 
//		`UART_REG_LC	: data_o <= #1 r_lcr; 
//		`UART_REG_LS	: data_o <= #1 r_lsr; 
//		`UART_REG_MS	: data_o <= #1 r_msr; 
//		default			: data_o <= #1 r_scratch;			// UART_REG_SR 
//	endcase // case(addr_i) 
//end 
 
// ================ register write 
 
// Line Control Register 
always @(posedge clk_i or posedge reset_i) 
	if (reset_i) 
		r_lcr <= #1 8'b00000011; // 8N1 setting 
	else if (bus_wr_lcr) 
		r_lcr <= #1 data_i; 
 
// Interrupt Enable Register 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		r_ier <= #1 4'b0000; // no interrupts after reset 
	else if (bus_wr_ier) 
		r_ier <= #1 data_i[3:0]; // ier uses only 4 lsb 
end 
 
//  UART_DL2 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		r_dl[`UART_DL2] <= #1 8'h00; 
	else if (bus_wr_dl2) 
		r_dl[`UART_DL2] <= #1 data_i; 
end 
 
// FIFO Control Register and rf_reset, tf_reset signals 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) begin 
		r_fcr <= #1 2'b11;			// Receiver FIFO trigger level = 14 
		rf_reset <= #1 1'b0; 
		tf_reset <= #1 1'b0; 
	end else 
	if (bus_wr_fcr) 
	begin 
		r_fcr <= #1 data_i[7:6]; 
		rf_reset <= #1 data_i[1]; 
		tf_reset <= #1 data_i[2]; 
	end 
	else 
	begin 
		rf_reset <= #1 1'b0; 
		tf_reset <= #1 1'b0; 
	end 
end 
 
// Modem Control Register 
always @(posedge clk_i or posedge reset_i) 
	if (reset_i) 
		r_mcr <= #1 5'b0;  
	else if (bus_wr_mcr) 
		r_mcr <= #1 data_i[5:0]; 
 
// Scratch register 
always @(posedge clk_i or posedge reset_i) 
	if (reset_i) 
		r_scratch <= #1 8'd0; // 8n1 setting 
	else if (bus_wr_scr) 
		r_scratch <= #1 data_i; 
 
// UART_DL1 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		r_dl[`UART_DL1]  <= #1 8'd0; 
	else if (bus_wr_dl1) 
		r_dl[`UART_DL1] <= #1 data_i; 
end 
 
// ============= generate 16x bit rate pulse 
reg [15:0]		divc;		// 16-bit divisor latch counter 
reg				start_dlc; 
reg				reload; 
 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		start_dlc <= #1 1'b0; 
	else if (bus_wr_dl1) 
		start_dlc <= #1 1'b1; 
	else 
		start_dlc <= #1 1'b0; 
end 
 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
	begin 
		reload <= #1 1'b0; 
		divc <= #1 16'd0; 
	end 
	else if( start_dlc || divc == 16'd1 )	// write a new divisor or counter reach 0 
	begin 
		reload <= #1 1'b1; 
		divc <= #1 {r_dl[12:0],3'b000}; 
	end 
	else 
	begin 
		reload <= #1 1'b0; 
		divc <= #1 divc - 16'd1;	// dec counter 
	end 
end 
 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		enable <= #1 1'b0; 
	else if( |r_dl[15:1] & reload )		// r_dl != 0 && divc == 0 
		enable <= #1 1'b1; 
	else 
		enable <= #1 1'b0; 
end 
 
// ============ FIFO read & write 
 
// TX_FIFO tf_push signal 
// always @(posedge clk_i or posedge reset_i) 
// begin 
// 	if (reset_i) 
// 		tf_push   <= #1 1'b0; 
// 	else if (bus_wr_thr) 
// 		tf_push   <= #1 1'b1; 
// 	else 
// 		tf_push   <= #1 1'b0; 
// end 
assign tf_push  = bus_wr_thr; 
 
// rf_pop signal handling 
// always @(posedge clk_i or posedge reset_i) 
// begin 
// 	if (reset_i) 
// 		rf_pop <= #1 0;  
// 	else if (bus_rd_rbr) 
// 		rf_pop <= #1 1; // advance read pointer 
// 	else 
// 		rf_pop <= #1 0; 
// end 
assign rf_pop = bus_rd_rbr; 
 
// ============ status registers 
 
// ------- MSR --------- 
reg [3:0]	msr_d;			// DCD, RI, DSR, CTS 
wire [3:0]	modem_in;		// DCD, RI, DSR, CTS 
wire [3:0]	modem_pad;		// DCD, RI, DSR, CTS 
 
assign modem_pad = ~{ dcd_pad_i, ri_pad_i, dsr_pad_i, cts_pad_i }; 
assign modem_in  = b_loopbk ? { b_out2, b_out1, b_dtr, b_rts } : modem_pad; 
 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
	begin 
  		r_msr <= #1 8'd0; 
	  	msr_d <= #1 4'd0; 
	end 
	else 
	begin 
		msr_d <= #1 modem_pad; 
		r_msr[`MSR_CSIGS] <= #1 modem_in; 
		if( bus_rd_msr ) 
			r_msr[`MSR_DSIGS] <= #1 4'd0; 
		else 
			r_msr[`MSR_DSIGS] <= #1 r_msr[`MSR_DSIGS] | (modem_pad ^ msr_d); 
	end 
end 
 
// ------- LSR --------- 
// errors in FIFO 
reg		lsr_fifoerr; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_fifoerr <= #1 1'b0; 
	else if( bus_rd_lsr && !rf_fifoerr ) 
		lsr_fifoerr <= #1 1'b0; 
	else if( !rf_empty ) 
		lsr_fifoerr <= #1 rf_fifoerr; 
end 
assign r_lsr[`UART_LS_EI] = lsr_fifoerr; 
 
// Rx overrun 
reg		lsr_overrun; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_overrun <= #1 1'b0; 
	else if( bus_rd_lsr ) 
		lsr_overrun <= #1 1'b0; 
	else if( rf_overrun ) 
		lsr_overrun <= #1 1'b1; 
end 
assign r_lsr[`UART_LS_OE] = lsr_overrun; 
 
// Framing error 
reg		lsr_fe; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_fe <= #1 1'b0; 
	else if( rf_empty ) 
		lsr_fe <= #1 1'b0; 
	else 
		lsr_fe <= #1 rf_dataout[`UART_RF_FE]; 
end 
assign r_lsr[`UART_LS_FE] = lsr_fe; 
 
// parity error 
reg		lsr_pe; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_pe <= #1 1'b0; 
	else if( rf_empty ) 
		lsr_pe <= #1 1'b0; 
	else 
		lsr_pe <= #1 rf_dataout[`UART_RF_PE]; 
end 
assign r_lsr[`UART_LS_PE] = lsr_pe; 
 
// break indication 
reg		lsr_bi; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_bi <= #1 1'b0; 
	else if( rf_empty ) 
		lsr_bi <= #1 1'b0; 
	else 
		lsr_bi <= #1 rf_dataout[`UART_RF_BI]; 
end 
assign r_lsr[`UART_LS_BI] = lsr_bi; 
 
// FIFO empty 
reg		lsr_tfempty; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_tfempty <= #1 1'b1; 
//	else if( bus_wr_thr ) 
//		lsr_tfempty <= #1 1'b0; 
	else 
		lsr_tfempty <= #1 tf_empty; 
end 
assign r_lsr[`UART_LS_TFE] = lsr_tfempty; 
 
// FIFO and SHIFT empty 
reg		lsr_txempty; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_txempty <= #1 1'b1; 
//	else if( bus_wr_thr ) 
//		lsr_txempty <= #1 1'b0; 
	else 
		lsr_txempty <= #1 tf_empty & tx_empty; 
end 
assign r_lsr[`UART_LS_TE] = lsr_txempty; 
 
// Data ready 
reg		lsr_dataready; 
always @( posedge clk_i or posedge reset_i ) 
begin 
	if( reset_i ) 
		lsr_dataready <= #1 1'b0; 
	else 
		lsr_dataready <= #1 ~rf_empty; 
end 
// wire		lsr_dataready; 
// assign lsr_dataready = ~rf_empty; 
assign r_lsr[`UART_LS_DR] = lsr_dataready; 
 
// ------- interrupt pending --------- 
wire		int_dataready;		// receiver data available interrupt 
wire		int_modemsig;		// modem status interrupt 
 
wire		rf_timeout; 
 
assign int_dataready	= r_ier[`UART_IE_RDA] & ( rf_full || rf_level ); 
assign int_modemsig		= r_ier[`UART_IE_MS] & (| r_msr[3:0]); 
 
// rx timeout 
reg	[9:0]	rto_timer; 
 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		rto_timer <= #1 10'd640;			// 10 bits for the default 8N1 
	else if( bus_rd_rbr || rf_empty || rf_push ) 
		rto_timer <= #1 {frame_len, 2'b00}; 
	else if (enable && (|rto_timer))		// we don't want to underflow 
		rto_timer <= #1 rto_timer - 10'd1;		 
end 
 
reg			pend_linestatus; 
reg			pend_timeout; 
reg			pend_tfempty, tfempty_d; 
reg			pend_modemsig, int_modemsig_d; 
wire		tfempty_pulse, int_modemsig_pulse; 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i ) 
		pend_linestatus <= #1 1'b0; 
	else 
		pend_linestatus <= #1 r_ier[`UART_IE_RLS] & (|r_lsr[`UART_LS_ERR]); 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i ) 
		pend_timeout <= #1 1'b0; 
	else if(bus_rd_rbr) 
		pend_timeout <= #1 1'b0; 
	else if( r_ier[`UART_IE_RDA] & ~(|rto_timer) ) 
		pend_timeout <= #1 1'b1; 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i )	tfempty_d <= #1 1'b1; 
	else			tfempty_d <= #1 tf_empty; 
assign tfempty_pulse = tf_empty & ~tfempty_d; 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i ) 
		pend_tfempty <= #1 1'b0; 
	else if( tf_push || (bus_rd_iir && r_iir=={`UART_II_THRE,1'b0}) ) 
		pend_tfempty <= #1 1'b0; 
	else if( tfempty_pulse && r_ier[`UART_IE_THRE] ) 
		pend_tfempty <= #1 1'b1; 
	else 
		pend_tfempty <= #1 pend_tfempty & r_ier[`UART_IE_THRE]; 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i )	int_modemsig_d <= #1 1'b0; 
	else			int_modemsig_d <= #1 int_modemsig; 
assign int_modemsig_pulse = int_modemsig & ~int_modemsig_d; 
 
always  @(posedge clk_i or posedge reset_i) 
	if( reset_i ) 
		pend_modemsig <= #1 1'b0; 
	else if( bus_rd_msr ) 
		pend_modemsig <= #1 1'b0; 
	else if( int_modemsig_pulse && r_ier[`UART_IE_MS] ) 
		pend_modemsig <= #1 1'b1; 
	else 
		pend_modemsig <= #1 pend_modemsig & r_ier[`UART_IE_MS]; 
 
// ------- IIR --------- 
// Interrupt Identification register 
always @(posedge clk_i or posedge reset_i) 
begin 
	if (reset_i) 
		r_iir <= #1 4'b0001; 
	else if (pend_linestatus) 
	begin 
		r_iir[`UART_II_II] <= #1 `UART_II_RLS; 
		r_iir[`UART_II_IP] <= #1 1'b0; 
	end 
	else if (int_dataready)			// !! NOT pend_dataready but int_dataready 
	begin 
		r_iir[`UART_II_II] <= #1 `UART_II_RDA; 
		r_iir[`UART_II_IP] <= #1 1'b0; 
	end 
	else if (pend_timeout) 
	begin 
		r_iir[`UART_II_II] <= #1 `UART_II_TI; 
		r_iir[`UART_II_IP] <= #1 1'b0; 
	end 
	else if (pend_tfempty) 
	begin 
		r_iir[`UART_II_II] <= #1 `UART_II_THRE; 
		r_iir[`UART_II_IP] <= #1 1'b0; 
	end 
	else if (pend_modemsig) 
	begin 
		r_iir[`UART_II_II] <= #1 `UART_II_MS; 
		r_iir[`UART_II_IP] <= #1 1'b0; 
	end 
	else	// no interrupt is pending 
	begin 
		r_iir[`UART_II_II] <= #1 3'd0; 
		r_iir[`UART_II_IP] <= #1 1'b1; 
	end 
end 
 
assign int_o = ~r_iir[`UART_II_IP]; 
 
endmodule 
