///////////////////////////////////////////////////////////////////////////////
//
// REGISTER NAMES FOR CONVENIENCE
//
///////////////////////////////////////////////////////////////////////////////

parameter REG_MCR0 = 4'd0;	// Mode control 0 + interrupt
parameter REG_SR = 4'd0;	// Status register (same as MCR0)
parameter REG_MCR1 = 4'd1;	// Mode control 1 + split control
parameter REG_SCR0 = 4'd2;	// Smooth scrolling
parameter REG_SCR1 = 4'd3;
parameter REG_SAR0 = 4'd4;	// Start address
parameter REG_SAR1 = 4'd5;
parameter REG_MAR0 = 4'd6;	// Modulo address
parameter REG_MAR1 = 4'd7;
parameter REG_CCR = 4'd8;	// Cursor control
parameter REG_CAR = 4'd9;	// Cursor address
parameter REG_HAR = 4'd10;	// Host address reg
parameter REG_RSVD1 = 4'd11;	//   *Reserved
parameter REG_RSVD2 = 4'd12;	//   *Reserved
parameter REG_RSVD3 = 4'd13;	//   *Reserved
parameter REG_CPORT = 4'd14;	// CPORT REG
parameter REG_CMD = 4'd15;	// Command and B/CG data
parameter REG_BCGPORT = 4'd15;	// B/CG data (same as CMD)

// End of file.
