///////////////////////////////////////////////////////////////////////////////
//
// EARLY VECTOR TABLE (IN-ROM SOURCE TO BE COPIED TO RAM)
//
///////////////////////////////////////////////////////////////////////////////

		.word null_isr		; Vector: ISRV (Interrupt Service Routine)
		.word putsp		; Vector: PUTSP (print out packed string)
		.word putud		; Vector: PUTUD (print unsigned decimal)
		.word puth		; Vector: PUTH (print 16-bit hex)
		.word memcpy		; Vector: MEMCPY
		.word memset		; Vector: MEMSET
		.word delay		; Vector: DELAY (short delays)
		.word postfail		; Vector: POSTFAIL (output error codes)
		.word memfree		; Vector: MEMFREE (free bank of RAM)
		.word memalloc		; Vector: MEMALLOC (allocate bank of RAM)
		
		.word &ffff		; Const:  MINUS1 = FFFF = -1
		.word -2		; Const:  MINUS2
		.word -3		; Const:  MINUS3
		.word -4		; Const:  MINUS4
		.word -5		; Const:  MINUS5
		.word -6		; Const:  MINUS6
		.word -7		; Const:  MINUS7
		.word &00ff		; Const:  BYTELO
		.word &ff00		; Const:  BYTEHI
		.word &000f		; Const:  NYBBLE0
		.word &00f0		; Const:  NYBBLE1
		.word &0f00		; Const:  NYBBLE2
		.word &f000		; Const:  NYBBLE3
		.word #0000000000000001 ; Const:  BIT0
		.word #0000000000000010 ; Const:  BIT1
		.word #0000000000000100 ; Const:  BIT2
		.word #0000000000001000 ; Const:  BIT3
		.word #0000000000010000 ; Const:  BIT4
		.word #0000000000100000 ; Const:  BIT5
		.word #0000000001000000 ; Const:  BIT6
		.word #0000000010000000 ; Const:  BIT7
		.word #0000000100000000 ; Const:  BIT8
		.word #0000001000000000 ; Const:  BIT9
		.word #0000010000000000 ; Const:  BIT10
		.word #0000100000000000 ; Const:  BIT11
		.word #0001000000000000 ; Const:  BIT12
		.word #0010000000000000 ; Const:  BIT13
		.word #0100000000000000 ; Const:  BIT14
		.word #1000000000000000 ; Const:  BIT15
		.word 0			; End of vector table

;;; End of file.
