; -*- cftasm -*_

.include "asm/dfp2.asm"
.include "asm/regs.asm"
.include "asm/mbu.asm"

boot:
		;;  Configure memory management
		LI         0
		SCT
                LI         &80
		SMB        mbu.MBP	; Enable MBU, program in ROM
		SMB        mbu.MBD	; Data in ROM
		LI         0
		SMB        mbu.MBZ	; Zero page at start of RAM
		SMB        mbu.MBS	; Also stack.

		;; Print "Hello, World!" message
		LIA        hello
		STORE R    B1AI0	; Data bank, auto-inc reg 0

loop:		LOAD I R   B1AI0
		dfp.PRINTC
		SNZ
		JMP end
		JMP loop
		
end:		HALT
		JMP @

hello:		.str "Hello, world!" 10 0

; End of file.
