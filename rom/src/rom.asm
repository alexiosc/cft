; -*- cftasm -*_

.include "asm/dfp2.asm"

boot:
		SUCCESS
		dfp.PRINTC
		HALT
		JMP @

; End of file.
