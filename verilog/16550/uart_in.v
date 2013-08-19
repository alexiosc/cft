// synopsys translate_off 
`include "timescale.v" 
// synopsys translate_on 
 
'include "uart_defines.v" 
 
module uart_in 
( 
	clk, 
	reset, 
	enable, 
	data_len, par_ena, par_even, par_stk, frame_len, 
	serial_in, 
	rf_push, 
	rx_data, 
	rx_epar, rx_efrm, rx_ebrk 
); 
 
input			clk; 
input			reset; 
input			enable; 
 
input [1:0]		data_len;			// data bits - 1 
input			par_ena, par_even, par_stk; 
input [7:0]		frame_len; 
input			serial_in; 
 
output			rf_push; 
output [7:0]	rx_data; 
output			rx_epar, rx_efrm, rx_ebrk; 
 
reg				rf_push; 
reg [7:0]		rx_data; 
reg				rx_epar, rx_efrm, rx_ebrk; 
 
/////////////////////////////////////// 
 
reg [7:0]		brk_timer; 
reg				rx_frame; 
reg [3:0]		cnt16; 
//reg				bit_pulse, half_pulse; 
reg				half_pulse; 
// ============ sample pulse 
 
always @( posedge clk or posedge reset ) 
begin 
	if( reset ) 
	begin 
		cnt16 &lt;= #1 4'd14; 
		//bit_pulse &lt;= #1 1'b0; 
		half_pulse &lt;= #1 1'b0; 
	end 
	else if( enable ) 
	begin 
		if( !rx_frame ) 
		begin 
			cnt16 &lt;= #1 4'd14; 
			//bit_pulse &lt;= #1 1'b0; 
			half_pulse &lt;= #1 1'b0; 
		end 
		else 
		begin 
			//bit_pulse &lt;= #1 (cnt16==4'd0); 
			half_pulse &lt;= #1 (cnt16==4'd8); 
			cnt16 &lt;= #1 cnt16 - 4'd1; 
		end 
	end 
end 
 
// ========= Rx state machine 
 
parameter S_RX_IDLE		= 3'd0; 
parameter S_RX_START	= 3'd1; 
parameter S_RX_WAIT1	= 3'd2; 
parameter S_RX_BYTE		= 3'd3; 
parameter S_RX_PARITY	= 3'd4; 
parameter S_RX_STOP		= 3'd5; 
parameter S_RX_PUSH		= 3'd6; 
parameter S_RX_BREAK	= 3'd7; 
 
reg [2:0]		rx_state; 
reg [2:0]		bit_cnt; 
reg [7:0]		rx_shift; 
 
always @(data_len or rx_shift) 
	case (data_len) 
	2'b00: rx_data = {3'b000, rx_shift[7:3]}; 
	2'b01: rx_data = {2'b00, rx_shift[7:2]}; 
	2'b10: rx_data = {1'b0, rx_shift[7:1]}; 
	2'b11: rx_data = {     rx_shift[7:0]}; 
	endcase 
 
always @(posedge clk or posedge reset) 
begin 
	if( reset ) 
	begin 
		rx_state	&lt;= #1 S_RX_IDLE; 
		rx_frame	&lt;= #1 1'b0; 
		rf_push		&lt;= #1 1'b0; 
		rx_shift	&lt;= #1 8'd0; 
		rx_epar	&lt;= #1 1'b0; 
		rx_efrm	&lt;= #1 1'b0; 
	end 
	else if( enable ) 
	begin 
		case( rx_state ) 
		S_RX_IDLE: 
			if( !serial_in ) 
			begin 
				rx_frame &lt;= 1'b1; 
				rx_state &lt;= S_RX_START; 
			end 
 
		S_RX_START: 
			if( half_pulse ) 
			begin 
				if( serial_in ) 
				begin 
					rx_frame &lt;= #1 1'b0; 
					rx_state &lt;= #1 S_RX_IDLE; 
				end 
				else 
				begin 
					bit_cnt &lt;= #1 {1'b1,data_len}; 
					rx_state &lt;= #1 S_RX_BYTE; 
				end 
			end 
 
		S_RX_WAIT1: 
			if( serial_in ) 
			begin 
				rf_push  &lt;= #1 1'b1; 
				rx_state &lt;= #1 S_RX_PUSH; 
			end 
			else if( rx_ebrk ) 
			begin 
				rx_epar	&lt;= #1 1'b0; 
				rx_efrm	&lt;= #1 1'b0; 
				rx_frame &lt;= #1 1'b0; 
				rx_shift &lt;= #1 8'd0; 
				rf_push  &lt;= #1 1'b1; 
				rx_state &lt;= #1 S_RX_BREAK; 
			end 
 
		S_RX_BYTE: 
			if( half_pulse ) 
			begin 
				rx_shift[7:0] &lt;= #1 {serial_in, rx_shift[7:1]}; 
				bit_cnt &lt;= #1 bit_cnt - 3'd1; 
				if( ~|bit_cnt ) 
				begin 
					if( par_ena ) 
						rx_state &lt;= #1 S_RX_PARITY; 
					else 
						rx_state &lt;= #1 S_RX_STOP; 
				end 
			end 
 
		S_RX_PARITY: 
			if( half_pulse ) 
			begin 
				case ({par_stk,par_even}) 
					2'b00: rx_epar &lt;= #1 ~^{rx_shift,serial_in};	// no error if parity 1 
					2'b01: rx_epar &lt;= #1  ^{rx_shift,serial_in};	// error if parity is odd 
					2'b10: rx_epar &lt;= #1 ~serial_in;				// parity should sticked to 1 
					2'b11: rx_epar &lt;= #1  serial_in;				// parity should be sticked to 0 
				endcase 
				rx_state &lt;= #1 S_RX_STOP; 
			end 
 
		S_RX_STOP: 
			if( half_pulse ) 
			begin 
				if( serial_in ) 
				begin 
					rf_push  &lt;= #1 1'b1; 
					rx_state &lt;= #1 S_RX_PUSH; 
				end 
				else 
				begin 
					rx_efrm &lt;= #1 1'b1; 
					rx_state &lt;= #1 S_RX_WAIT1; 
				end 
			end 
 
		S_RX_PUSH: 
		begin 
			rx_epar	&lt;= #1 1'b0; 
			rx_efrm	&lt;= #1 1'b0; 
			rx_frame &lt;= #1 1'b0; 
			rx_shift &lt;= #1 8'd0; 
			rx_state &lt;= #1 S_RX_IDLE; 
		end 
 
		S_RX_BREAK: 
			if( serial_in ) rx_state &lt;= #1 S_RX_PUSH; 
 
		default:		// should never get here 
		begin 
			rx_state &lt;= #1 S_RX_IDLE; 
			rx_frame &lt;= #1 1'b0; 
		end 
		endcase 
	end 
	else 
		rf_push &lt;= #1 1'b0; 
end 
 
///////////////////////////////// 
 
always @( posedge clk or posedge reset ) 
begin 
	if( reset ) 
	begin 
		rx_ebrk &lt;= #1 1'b0; 
		brk_timer &lt;= #1 8'd160; 
	end 
	else if( enable ) 
	begin 
		if( serial_in || !rx_frame ) 
		begin 
			rx_ebrk &lt;= #1 1'b0; 
			brk_timer &lt;= #1 frame_len; 
		end 
		else 
		begin 
			if( brk_timer == 8'd1 ) 
				rx_ebrk &lt;= #1 1'b1; 
			else 
				brk_timer &lt;= #1 brk_timer - 8'd1; 
		end 
	end 
end 
 
endmodule 
