; -*- cftasm -*_

.include "asm/dev/dfp2.asm"
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

		;;  Set the stack pointer above Page Zero
		LOAD       spinit
		TAS

		;; Print "Hello, World!" message
		LIA        hello
		STORE R    MBD I0	; Data bank, auto-inc reg 0

loop:		LOAD I R   MBD I0
		SNZ
		JMP        end
		dfp.PRINTC
		JMP        loop
end:		
		LOAD       num
		JSR        putud
		dfp.PRINTNL

		LOAD       @num+1
		JSR        putud
		dfp.PRINTNL
		
		LOAD       @num+2
		JSR        putud
		dfp.PRINTNL
		
		LOAD       @num+3
		JSR        putud
		dfp.PRINTNL
		
		LOAD       @num+4
		JSR        putud
		dfp.PRINTNL
		
		LOAD       @num+5
		JSR        putd
		dfp.PRINTNL
		
		LOAD       @num+6
		JSR        putd
		dfp.PRINTNL
		
		LOAD       @num+7
		JSR        putd
		dfp.PRINTNL
		
		LOAD       @num+8
		JSR        puth
		dfp.PRINTNL
		
		LOAD       @num+9
		JSR        puth
		dfp.PRINTNL
		
		LOAD       @num+10
		JSR        puth
		dfp.PRINTNL
		
		LOAD       @num+11
		JSR        puth
		dfp.PRINTNL
		
		HALT
		JMP @

hello:		.str "Hello, world!" 10 0
spinit:		.data &400
num:		.data 12345 666 65535 9 0 -1 -12345 32768 &1234 &5678 &9abc &def0

.include "asm/lib/putud.asm"

; End of file.
