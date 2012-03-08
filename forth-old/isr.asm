///////////////////////////////////////////////////////////////////////////////
//
// Interrupt Service Routine (ISR)
//
///////////////////////////////////////////////////////////////////////////////

isr:
	;; ISR entry code
	
	STORE ISRABKP		; Save A
	LOAD R 0		; Save &0000
	STORE ISRR0BKP
	LOAD R 1		; Save &0001
	STORE ISRR1BKP

isr_tty0_loop:
	IN TTY0 TTYPOLL		; Is there anything to input?
	SNZ			; If zero:
	JMP isr_done_tty0	;   No input. We're done.

	LI IFL_NEWCHAR		; We have input. Set the IFL_NEWCHAR flag.
	OR R input_flags
	STORE R input_flags
	
	IN TTY0 TTYDATA		; Read data.
	STORE R last_inp_char	; Store it for later

	JMP isr_tty0_loop	; Read more characters

isr_done_tty0:

	;; Invoke user ISR
	JSR I R v_user_isr

	;; ISR exit code
	LOAD ISRR1BKP		; Restore &0001
	STORE R 1
	LOAD ISRR0BKP		; Restore &0000
	STORE R 0
	LOAD ISRABKP		; Restore A
	SEI			; Re-enable interrupts
	RTI			; Return

	;; The ISR also JSRs to the vector_isr user function.
	;; At startup, this vector points here.

_rom_user_isr:
	RET


// End of file.	
