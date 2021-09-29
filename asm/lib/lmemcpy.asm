;;; -*- cftasm -*-

;;; Subroutine:	 lmemcpy: copy LEN words of memory from MB7:SRC to MB6:DEST.
;;;
;;; Stack:   ( DEST SRC -- )
;;; AC:	     LENGTH in words
;;;
;;; Returns: undefined
;;; 
;;; This routine copies a block of LENGTH words starting at MB7-relative
;;; address SRC to MB6-relative address DST. The MBRs must have been setup by
;;; the caller.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; lmemcpy -- copy a block of memory across memory banks.
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

memcpy:

.scope
.equ src+     MB7 I7
.equ dst+     MB6 I6
.equ len      R 15

		STORE      len		; length is in AC
		POP
		STORE      src+		; Get SRC from stack
		POP
		STORE      dst+		; Get DST from stack

loop:		DSZ        len		; Are we done?
		RET
		LOAD I     src+
		STORE I    dst+
		JMP        loop
.endscope
		
;;; End of file
