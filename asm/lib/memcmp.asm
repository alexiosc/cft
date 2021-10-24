;;; -*- cftasm -*-

;;; Subroutine:	 memcmp: compare two MBD-relative blocks of memory.
;;;
;;; Stack:   ( ADDR1 ADDR2 -- )
;;; AC:	     LENGTH in words
;;;
;;; Returns: 0 if blocks are equal. Non-zero otherwise.
;;; 
;;; This routine compares two blocks of LENGTH words, stopping when the first
;;; unequal word is found, or when LENGTH words have been compared.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; memcmp -- compare two blocks of memory
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

memcpy:

.scope
.equ addr1+  MBD I7
.equ addr2+  MBD I6
.equ len      R 15

		STORE      len		; length is in AC
		POP
		STORE      addr2+	; Get SRC from stack
		POP
		STORE      addr1+	; Get DST from stack

loop:		DSZ        len		; Are we done?
		RET
		LOAD I     addr1+
		XOR I      addr2+
		SNZ			; Are they equal?
		RET			; No. Return.
		JMP        loop		; They are. Loop again
.endscope
		
;;; End of file
