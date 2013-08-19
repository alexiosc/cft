// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
`include "uart_defines.v" 
 
module uart_recv 
( 
	clk, 
	reset, 
	r_lcr, 
	r_fcr, 
	frame_len, 
	enable, 
	afc_rts, 
	serial_in, 
	rf_reset, 
	rf_push, 
	rf_pop, 
	rf_empty, 
	rf_full, 
	rf_level, 
	rf_dataout, 
	rf_fifoerr, 
	rf_overrun 
); 
 
input			clk; 
input			reset; 
input [7:0]		r_lcr; 
input [1:0]		r_fcr; 
input [7:0]		frame_len; 
input			enable; 
output			afc_rts; 
input			serial_in; 
input			rf_reset; 
output			rf_push; 
input			rf_pop; 
output			rf_empty, rf_full, rf_level; 
output [10:0]	rf_dataout; 
output			rf_fifoerr; 
output			rf_overrun; 
 
reg				afc_rts; 
wire			rf_push; 
wire			rf_empty, rf_full; 
reg				rf_level; 
wire [10:0]		rf_dataout; 
wire			rf_fifoerr; 
reg				rf_overrun; 
 
/////////////////////////////// 
 
reg [10:0]		rf_datain; 
wire [4:0]		rf_count; 
wire [7:0]		rx_data; 
wire			err_break, err_frame, err_parity; 
reg				rf_afc_high, rf_afc_low; 
 
// ========== Rx FIFO operations 
 
reg [5:0]		fifo_errcnt; 
wire			in_err, out_err; 
wire			fifo_push, fifo_pop; 
 
assign in_err    = |rf_datain[10:8]; 
assign out_err   = |rf_dataout[10:8]; 
assign rf_fifoerr= |fifo_errcnt; 
assign fifo_push = rf_push & ~rf_full; 
//assign fifo_pop  = rf_pop & ~rf_empty; 
 
//====fifo read signal generate==== 
wire            var_pop; 
reg             var_pop1; 
reg				var_pop2; 
 
always @(posedge clk or posedge reset) 
begin 
	if (reset) 
		var_pop1 &lt;= 1'b0; 
	else 
		var_pop1 &lt;= rf_pop; 
end 
 
always @(posedge clk or posedge reset) 
begin 
	if (reset) 
		var_pop2 &lt;= 1'b0; 
	else 
		var_pop2 &lt;= var_pop1; 
end 
 
assign var_pop = {var_pop1,var_pop2} == 2'b01 ? 1'b1 : 1'b0 ; 
assign fifo_pop = var_pop & ~rf_empty; 
//===David add ending=== 
 
scfifo	rx_fifo 
( 
	.rdreq (fifo_pop), 
	.sclr (rf_reset), 
	.clock (clk), 
	.wrreq (fifo_push), 
	.data (rf_datain), 
	.usedw (rf_count), 
	.empty (rf_empty), 
	.q (rf_dataout), 
	.full (rf_full), 
	.aclr (reset) 
	// synopsys translate_off 
	, 
	.almost_empty (), 
	.almost_full () 
	// synopsys translate_on 
); 
defparam 
	rx_fifo.lpm_width = 11, 
	rx_fifo.lpm_numwords = 32, 
	rx_fifo.lpm_widthu = 5, 
	rx_fifo.intended_device_family = "Cyclone II", 
	rx_fifo.lpm_type = "scfifo", 
	rx_fifo.lpm_showahead = "ON", 
	rx_fifo.overflow_checking = "ON", 
	rx_fifo.underflow_checking = "ON", 
	rx_fifo.use_eab = "ON", 
	rx_fifo.add_ram_output_register = "ON", 
	rx_fifo.lpm_hint = "RAM_BLOCK_TYPE=M4K"; 
 
uart_in uart_shiftin 
( 
	.clk		(clk), 
	.reset		(reset), 
	.enable		(enable), 
	.data_len	(r_lcr[1:0]), 
	.par_ena	(r_lcr[`UART_LC_PE]), 
	.par_even	(r_lcr[`UART_LC_EP]), 
	.par_stk	(r_lcr[`UART_LC_SP]), 
	.frame_len	(frame_len), 
	.serial_in	(serial_in), 
	.rf_push	(rf_push), 
	.rx_data	(rx_data), 
	.rx_epar	(err_parity), 
	.rx_efrm	(err_frame), 
	.rx_ebrk	(err_break) 
); 
 
always @(r_lcr[1:0] or rx_data or err_break or err_parity or err_frame) 
	case (r_lcr[1:0]) 
	2'b00: rf_datain = {err_break, err_parity, err_frame, 3'b000, rx_data[4:0]}; 
	2'b01: rf_datain = {err_break, err_parity, err_frame, 2'b00, rx_data[5:0]}; 
	2'b10: rf_datain = {err_break, err_parity, err_frame, 1'b0, rx_data[6:0]}; 
	2'b11: rf_datain = {err_break, err_parity, err_frame,      rx_data[7:0]}; 
	endcase 
 
always @(posedge clk or posedge reset) 
begin 
	if( reset ) 
		fifo_errcnt &lt;= #1 6'd0; 
	else if( rf_reset ) 
		fifo_errcnt &lt;= #1 6'd0; 
	else 
		casex ({fifo_push, fifo_pop, in_err, out_err}) 
			4'b01x1, 4'b1101: fifo_errcnt &lt;= #1 fifo_errcnt - 6'd1; 
			4'b101x, 4'b1110: fifo_errcnt &lt;= #1 fifo_errcnt + 6'd1; 
			default:; 
		endcase 
end 
 
always @(posedge clk or posedge reset) 
begin 
	if( reset ) 
		rf_overrun &lt;= #1 1'b0; 
	else if( rf_full && rf_push && !rf_reset ) 
		rf_overrun &lt;= #1 1'b1; 
	else 
		rf_overrun &lt;= #1 1'b0; 
end 
 
always @( r_fcr or rf_empty or rf_count or rf_full ) 
	case (r_fcr) 
		`UART_FC_1 : 
		begin 
			rf_level = ~rf_empty;				// >= 1 
			rf_afc_high = |rf_count[4:3] | rf_full;		// >= 8 
			rf_afc_low  = ~|rf_count[4:1];		// &lt; 2 
		end 
 
		`UART_FC_8 : 
		begin 
			rf_level = |rf_count[4:3];			// >= 8 
			rf_afc_high = rf_count[4] | rf_full;			// >= 16 
			rf_afc_low  = ~|rf_count[4:3];		// &lt; 8 
		end 
 
		`UART_FC_16 : 
		begin 
			rf_level = rf_count[4];				// >= 16 
			rf_afc_high = &rf_count[4:3] | rf_full;		// >= 24 
			rf_afc_low  = ~rf_count[4];			// &lt; 16 
		end 
 
		`UART_FC_28 : 
		begin 
			rf_level = &rf_count[4:2];			// >= 28 
			rf_afc_high = &rf_count[4:2] | rf_full;		// >= 28 
			rf_afc_low  = ~&rf_count[4:3];		// &lt; 24 
		end 
	endcase 
 
always @( posedge clk or posedge reset ) 
begin 
	if( reset ) 
		afc_rts &lt;= #1 1'b1; 
	else 
	begin 
		case ({rf_afc_high, rf_afc_low}) 
			2'b01: afc_rts &lt;= #1 1'b1; 
			2'b10: afc_rts &lt;= #1 1'b0; 
		default:; 
		endcase 
	end 
end 
 
endmodule 
