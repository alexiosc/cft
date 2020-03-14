;;; -*- cftasm -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; SUBROUTING ENTRY/EXIT CONVENTION MACROS
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Macro: enter_sub()
;;;
;;; Subroutine entry point. Clobbers AC.
;;;
;;; Side effects:
;;;   [RP++] = return vector
;;;   AC = return vector
.macro enter_sub()
		LOAD RETV		; enter_sub()
		PUSH RP
.endmacro

		
;;; Macro: enter_sub_ac()
;;;
;;; Subroutine entry point. Stores AC in TMP15.
;;;
;;; Side effects:
;;;   TMP15 = AC
;;;   [RP++] = return vector
;;;   AC = return vector
.macro enter_sub_ac()
		enter_sub_acr(TMP15)
.endmacro

		
;;; Macro: enter_sub_acr(reg)
;;;
;;; Subroutine entry point. Stores AC in %reg.
;;;
;;; Side effects:
;;;   %reg = AC
;;;   [RP++] = return vector
;;;   AC = return vector
.macro enter_sub_acr(reg)
		STORE %reg		; enter_sub_acr(%reg)
		enter_sub()
.endmacro

		
;;; Macro: return()
;;;
;;; Exit a subroutine, clobbering AC and TMP15.
;;;
;;; Side effects:
;;;   TMP15 = return vector
;;;   AC = return vector
.macro return()
		POP RP			; return()
		STORE RETV
		RET
.endmacro

		
;;; Macro: pop_retv()
;;;
;;; Restores a clobbered RETV vector but does not return. Useful for,
;;; e.g. system calls.
;;;
;;; Side effects:
;;;   TMP15 = return vector
;;;   AC = return vector
.macro pop_retv()
		POP RP			; pop_retv()
		STORE RETV
.endmacro

		
;;; Macro: return_ac(addr)
;;;
;;; Exit a subroutine, keeping AC intact. Uses TMP14 to do
;;; this.
;;;
;;; Side effects:
;;;   TMP15 = return vector
;;;   TMP14 = copy of AC
;;;   AC = return value
.macro return_ac()
		STORE TMP14		; return_ac(%addr)
		POP RP
		STORE TMP15
		LOAD TMP14		; restore AC
		JMP I TMP15
.endmacro

;;; End of file.
