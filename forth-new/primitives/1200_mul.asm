// -*- asm -*-
//
// Core arithmetic and logic

//.page
	

	;; word:  *
	;; alias: mul16
	;; flags: CODE ROM
	;; notes: * ( w1 w2 -- w )
	;;   16-bit signed integer multiplication. CFT does multiplication in
	;;   software. The algorithm is faster if w1 > w2.

	RPOP(TMP15, SP)
	RPOP(TMP14, SP)
	JSR _umul16
	RPUSH(SP, TMP13)
	NEXT

	

	;; word:  *10
	;; alias: mul10
	;; flags: CODE ROM CFT
	;; notes: *10 ( w -- w )
	;;        Multiply w by 10. 10w = (w<<1) | (w<<3), considerably cheaper than
	;;        a full 16-bit multiplication.

	RPOP(TMP0,SP)

	SBL			; 2w
	STORE TMP0		; Store it for later
	SBL			; 4w
	SBL			; 8w
	OR TMP0			; 2w | 8w
	PUSH SP
	NEXT

	

	;; word:  BCD8>
	;; alias: BCD8_from
	;; flags: CODE ROM CFT
	;; notes: BCD8> ( bcd -- w bcd )
	;;        Convert the lower 8-bits of bcd from BCD to binary. Push the
        ;;        binary value w on the stack, followed by the upper 8 bits of
        ;;        bcd shifted 8 places right.
	;; 
	;;        TMP1 = bcd
	;;        TMP2 = running total

	RPOP(TMP1,SP)
	STORE TMP1

	;; Units.
	AND PLUS15		; Keep the least significant digit
	STORE TMP2

	;; Tens.
	RRNR(TMP1, TMP1)	; Roll TMP1 4 bits right
	AND PLUS15		; Keep low nybble
	SBL			; Multiply by 10
	STORE TMP0
	SBL
	SBL
	OR TMP0
	ADD TMP2		; Add it to the running total

	;; Push the converted number
	PUSH SP

	;; Push the high byte of bcd.
	RRNR(TMP1, TMP1)
	AND BYTELO
	PUSH SP

	NEXT

	

	;; word:  BCD>
	;; alias: BCD_from
	;; flags: DOCOL ROM CFT
	;; notes: BCD> ( bcd -- w )
	;;        Convert a 16-bit (four digit) BCD to binary.

	.word dw_BCD8_from	; BCD8> ( lo bcd )
	.word dw_BCD8_from	; BCD8> ( lo hi bcd )
	.word dw_DROP		; DROP ( lo hi )
	.word dw_if_DUP		; ?DUP ( lo 0 | lo hi hi )
	.word dw_if_branch	;   if hi == 0: EXIT
	.word _BCD_from_exit
	doLIT(100)		; 100 ( lo hi 100 )
	.word dw_mul16		; * ( lo 100hi )
	.word dw_add		; + ( 100hi + lo )
_BCD_from_exit:	
	.word dw_EXIT
	

	

	;; 16-bit unsigned multiplication (works for signed too)
	;;
	;; Inputs:
	;;   TMP15 smaller number
	;;   TMP14 larger number
	;; 
	;; Side effects:
	;;   L
	;;
	;; Outputs:
	;;   TMP13 product
	
_umul16:
	LI 0
	STORE TMP13		; TMP13 = product = 0

_umul16_loop:
	LOAD TMP15		; a == 0?
	SNZ
	RET			; Then we're done.

	SBR			; L = A & 1, A = A >> 1
	STORE TMP15
	SSL			; L == 0?
	JMP _umul16_noadd

	RADD(TMP13, TMP13, TMP14) ; prod += b

_umul16_noadd:
	LOAD TMP14		; b <<= 1
	SBL
	STORE TMP14

	JMP _umul16_loop	; Loop again


//	.page

	
	;; word:  UM*
	;; alias: UM_times
	;; flags: CODE ROM CFT
	;; notes: * ( w1 w2 -- d )
	;;   16-bit unsigned integer multiplication. Returns 32-bit value.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP2, SP)		; A low
	RPOP(TMP4, SP)		; B low
	LI 0
	STORE TMP1		; A high
	STORE TMP3		; B high
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.


	
	;; word:  UD*
	;; alias: UDtimes
	;; flags: CODE ROM CFT
	;; notes: * ( d d -- d )
	;;   32-bit unsigned integer multiplication.
	;;   Please remember that CFT does multiplication in software. Consider
	;;   using shifts instead of this expensive operation.

	;; Pop 16-bit values, populate 32-bit inputs of mul32.
	RPOP(TMP1, SP)		; A high
	RPOP(TMP2, SP)		; A low
	RPOP(TMP3, SP)		; B high
	RPOP(TMP4, SP)		; B low
	JSR _umul32		; (TMP5,TMP5) = (TMP1,TMP2) * (TMP3,TMP4)
	RPUSH(SP, TMP6)		; Push low result
	RPUSH(SP, TMP5)		; Push high result
	NEXT			; Done.


	
	;; 32-bit unsigned integer multiplication
	;; 
	;; Inputs:
	;;   TMP1 = high word of a
	;;   TMP2 = low word of a
	;;   TMP3 = high word of b
	;;   TMP4 = low word of b
	;; 
	;; Output:
	;;   TMP5 = high word of product
	;;   TMP6 = low word of product
	;; 
	;; Algorithm:
	;; sum = 0
	;; while a >= 1:
	;;   if a & 1:
	;;     sum += b
	;;   a = a >> 1
	;;   b = b << 1


_umul32:
	LI 0
	STORE TMP5 		; product = 0
	STORE TMP6 		; product = 0

	LOAD TMP1		; stop here if a == 0
	OR TMP2
	SNZ
	RET			; return
	
	LOAD TMP4		; stop here if b ==0
	OR TMP5
	SNZ
	RET			; return

_umul32_loop:

	;; Get bit0 of a by shifting right (which we're going to do
	;; anyway) and testing L.

	;; 32-bit shift-right
	RSBR(TMP1, TMP1)	; a = a >> 1
	RRBR(TMP2, TMP2)

	SSL			; L == 1?
	JMP _umul32_noadd	; No. Skip adding to the product.

	;; Add b to product with carry.
	//LOAD TMP3
	//PRINTHI
	//LOAD TMP4
	//PRINTLO

	OP1 CLL			; clear carry
	RADD(TMP6,TMP6,TMP4)	; prod low += b low
	RADC(TMP5,TMP5,TMP3)	; prod high += b high + carry


_umul32_noadd:
	;; 32-bit shift-left
	RSBL(TMP4, TMP4)	; b = b << 1
	RRBL(TMP3, TMP3)	; roll (using L from above)

	;; Are we done?
	LOAD TMP2		; a == 0?
	OR TMP1
	SNZ
	RET			; Then we're done.

	JMP _umul32_loop	; Loop again


	
// End of file.
