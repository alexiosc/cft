//////////////////////////////////////////////////////////////////////////////
//
// Division routines
//
///////////////////////////////////////////////////////////////////////////////

// Notes:
//
//   Optimisations:
//     If divident is 1, return trivial result.
//     If high words of divident and divisor are 0, use div16.
//     If high word is 0, quotient will fit in 16 bits.
//     If high byte of low word is 0, quotient will fit in 8 bits.


	;; A 32-bit unsigned division routine based on div16.
	;; Inputs (HI,LO)
	;;   TR0,TR1 = dividend
	;;   TR2,TR3 = divisor
	;; Output:
	;;   TR0,TR1 = remainder
	;;   R30,R31 = quotient
	;;   errno = ERR_SUCCESS => division by zero.
	;;   errno = ERR_DIV0 => division by zero.
	;; Registers:
	;;   R28,R29: shift mask
	;;   R26,R27: temporary

_rom_div32:
	LI	0
	STORE 	R30		; Quotient = 0
	STORE 	R31
	
	LOAD 	TR2		; divisor == 0?
	OR	TR3
	SNZ
	JMP	div_by0		; yes: return division by zero from div16

	;; TODO: perhaps optimise for divident < divisor and divident == divisor, like
	;;   we do in int16?

	
	;; Step one: shift divisor left while it's less than the
	;; divident.

	LI	1
	STORE 	R29		; Keep track of how many shifts we've done.
	LI	0
	STORE	R28

	LI 65
	PRINTC
	
_rom_div32_step1:
	LI 10
	PUTCHAR
	
	;; Mask (R28,R29) <<= 1
	LOAD	R29		; Shift low word
	CLL RBL			; A <<= 1
	STORE	R29
	LOAD	R28		; Roll high word
	RBL
	STORE 	R28

	LOAD R28
	PRINTHI
	LOAD R29
	PRINTLO

	;; Divisor (TR2,TR3) <<= 1
	LOAD	TR3		; Shift low word
	CLL RBL			; A <<= 1
	STORE	TR3
	LOAD	TR2		; Roll high word
	RBL
	STORE 	TR2

	;; Repeat step1 while dividend (TR0,TR1) > (TR2,TR3)
	LOAD TR0		; debugging
	PRINTHI			; debugging
	LOAD TR1		; debugging
	PRINTLO			; debugging
	LOAD TR2		; debugging
	PRINTHI			; debugging
	LOAD TR3		; debugging
	PRINTLO			; debugging

	LOAD TR0
	NEG
	ADD TR2			; Compare TR0  and TR2
	SNN
	JMP _rom_div32_step1	; TR0 > TR2. Loop again.
	SZA			; 
	JMP _rom_div32_step1a	; TR0 < TR2. End step1.
	;; TR0 == TR2. Compare TR1 and TR3.
	LOAD TR1
	NEG
	ADD TR3
	SNN
	JMP _rom_div32_step1	; TR1 > TR3. Loop again.

_rom_div32_step1a:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 66			; debugging
	PRINTC			; debugging
	
	;; Negate the last roll to make sure the divisor is less than
	;; the divident.
	;; Mask (R28,R29) >>= 1
	LOAD	R28		; Shift high word
	CLL RBR			; A >>= 1
	STORE	R28
	LOAD	R29		; Roll low word
	RBR
	STORE 	R29

	;; Divisor (TR2,TR3) >>= 1
	LOAD	TR2		; Shift high word
	CLL RBR			; A >>= 1
	STORE	TR2
	LOAD	TR3		; Roll low word
	RBR
	STORE 	TR3

	LOAD TR0		; debugging
	PRINTHI			; debugging
	LOAD TR1		; debugging
	PRINTLO			; debugging
	LOAD TR2		; debugging
	PRINTHI			; debugging
	LOAD TR3		; debugging
	PRINTLO			; debugging

	;; Get the rest from div16 and adapt.
_rom_div32_step2:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 67			; debugging
	PRINTC			; debugging

	;; Check if (TR0,TR1) is larger than (TR2,TR3). If it is,
	;; (TR0,TR1) -= (TR2,TR3). Strategy: subtract anyway, store in
	;; temporary registers, and simply check the resultant sign.
	;; If it's positive, use it.


	;; (R26,R27) = -(TR2,TR3) [hi,lo]
_rom_div32_step2_sub:
	LOAD TR2		; High word: ones' complement
	NOT
	STORE R26
	
	LOAD TR3		; Low order word (easy)
	NEG
	STORE R27
	
	SZA			; If A == 0, there was carry
	JMP _rom_div32_step2_add ; No increment

	LOAD R26		; Increment TR0
	INC
	STORE R26

	;; (R26,R27) += (TR0,TR1), i.e (R26,R27) = (TR0,TR1) - (TR2,TR3)
_rom_div32_step2_add:
	LOAD TR1		; low word of divident
	ADD R27			; add it
	STORE R27	 	; store it back

	LOAD TR0		; high word of divident
	SCL			; Skip if no carry
	INC			;   if carry set, increase
	ADD R26
	STORE R26

	LOAD R26		; debugging
	PRINTHI			; debugging
	LOAD R27		; debugging
	PRINTLO			; debugging

	;; Is the result negative? If not, 'it goes'. Add to the quotient.
	;; Otherwise it's a 'no go'. Shift right and go again.
_rom_div32_step2_cmp:
	LI 10			; debugging
	PUTCHAR			; debugging
	LI 68			; debugging
	PRINTC			; debugging
	LOAD R26		; debugging

	SNN
	JMP _rom_div32_step2_ng	; Didn't fit.

	;; It goes. (TR0,TR1) = (R26,R27), i.e. (TR0,TR1) -= (TR2,TR3)
	LOAD R26
	STORE TR0
	LOAD R27
	STORE TR1

	;; Turn on bit in the quotient.
	LOAD R29		; bit mask low
	ADD R31			; quotient low
	STORE R31		; update quotient

	LOAD R28
	SCL			; Skip if no carry
	INC			;   If carry set, increase
	ADD R30			; Add
	STORE R30		; And update quotient.

_rom_div32_step2_ng:
	LOAD R30
	PRINTHI
	LOAD R31
	PRINTLO

	;; Shift the divisor (TR2,TR3) right.
	LOAD TR2
	CLL RBR			; shift right A >>= 1
	STORE TR2
	LOAD TR3
	RBR			; roll right
	STORE TR3
	LOAD TR2
	PRINTHI
	LOAD TR3
	PRINTLO

	;; Shift the mask right the same way.
	LOAD R28
	CLL RBR			; shift right
	STORE R28
	LOAD R29
	RBR			; roll right
	STORE R29

	;; Is the shift mask zero?
	LOAD R28
	OR R29
	SZA
	JMP	_rom_div32_step2

	LI 10
	PUTCHAR
	LI 64
	PRINTC
	RTT
	

// End of file
