;;; A test program.

&0700:
	;; A null-terminated string.
hello:	.str "Hello, world!" 10 0
	
	;; A string terminated by setting bit 15.
	.strn "Hello, world"

	;; Fill a region with any word (.fill NUM-WORDS WORD)
	.fill 10 0xbeef
	.fill 10 HALT

;;; Programs usually start on page 2 (0800)
&0800:
	;; Hello World!
	CLA CLL
	CLI
	LIA hwaddr
	STORE R &ff
hwloop:	LOAD I R &ff
	SNZ
	HALT
	PRINTC
	JMP hwloop	
hwaddr:	.str "Hello, World!" 10 13 0

&fffd:

&fff0:
	JMP I baddr
baddr:	.word 0x0800

&fff8:
	JMP I isr_vec
isr_vec:
	.word 0xf000

;;; End of file.
