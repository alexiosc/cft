; -*- cftasm -*_

.include "asm/dfp2.asm"
.include "asm/regs.asm"
.include "asm/mbu.asm"

boot:
		LI         0
		SCT
                LI         &80
		SMB        mbu.MBP	; Enable MBU, program in ROM
		SMB        mbu.MBD	; Data in ROM
		LI         0
		SMB        mbu.MBZ	; Zero page at start of RAM
		SMB        mbu.MBS	; Also stack.

		SUCCESS
		LIA        hello
		STORE R    B1AI0
loop:		LOAD I R   B1AI0
		dfp.PRINTC
		SNZ
		JMP end
		JMP loop
		
end:		HALT
		JMP @

hello:		.str "Hello, world!" 0

; End of file.
