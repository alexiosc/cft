;;; -*- cftasm -*-

;;; Subroutine:	 memcpy: copy a block of memory.
;;;
;;; Stack:   ( DEST SRC -- )
;;; AC:	     LENGTH in words
;;;
;;; Returns: undefined
;;; 
;;; This routine copies a block of LENGTH words starting at MBD-relative
;;; address SRC to MBD-relative address DST.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; memcpy -- copy a block of memory
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

memcpy:

.scope
.equ src+     MBD I7
.equ dst+     MBD I6
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
