///////////////////////////////////////////////////////////////////////////////
//
// Early vector table
//
///////////////////////////////////////////////////////////////////////////////

&0300:
ramvectable:	
		.reg ISRV R @ 		; Interrupt Service Routine vector
		.reg PUTSP R @
		.reg PUTUD R @
		.reg PUTH R @
		.reg MEMCPY R @
		.reg MEMSET R @
		.reg DELAY R @
		.reg POSTFAIL R @
		.reg MEMFREE R @
		.reg MEMALLOC R @

		;; Useful constants
		
		.reg MINUS1 R @
		.reg MINUS2 R @
		.reg MINUS3 R @
		.reg MINUS4 R @
		.reg MINUS5 R @
		.reg MINUS6 R @
		.reg MINUS7 R @
		.reg BYTELO R @
		.reg BYTEHI R @
		.reg NYBBLE0 R @
		.reg NYBBLE1 R @
		.reg NYBBLE2 R @
		.reg NYBBLE3 R @
		.reg BIT0 R @
		.reg BIT1 R @
		.reg BIT2 R @
		.reg BIT3 R @
		.reg BIT4 R @
		.reg BIT5 R @
		.reg BIT6 R @
		.reg BIT7 R @
		.reg BIT8 R @
		.reg BIT9 R @
		.reg BIT10 R @
		.reg BIT11 R @
		.reg BIT12 R @
		.reg BIT13 R @
		.reg BIT14 R @
		.reg BIT15 R @

