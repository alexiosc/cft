;;; A test program.

&c000:
	;; A null-terminated string.
hello:	.str "Hello, world!" 10 0
	
	;; A string terminated by setting bit 15.
	.strn "Hello, world"

	;; Fill a region with any word (.fill NUM-WORDS WORD)
	.fill 10 0xbeef
	.fill 10 HALT

;;; Programs usually start on page 2 (0800)
&8000:
	;; Hello World!
	PRINTH
	HALT
	CLA CLL
	CPL
	CPL
	CPL
	CPL
	LI 10
	NOT
	STORE R 10
	ADD R 10
	//HALT
	
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
baddr:	.word 0x8000

&fff8:
	JMP I isr_vec
isr_vec:
	.word 0xf000

;;; End of file.
