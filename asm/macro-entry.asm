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
.end

		
;;; Macro: enter_sub_ac()
;;;
;;; Subroutine entry point. Stores AC in TMP15.
;;;
;;; Side effects:
;;;   TMP15 = AC
;;;   [RP++] = return vector
;;;   AC = return vector
.macro enter_sub_ac()
		STORE TMP15		; enter_sub_ac()
		enter_sub()
.end

		
;;; Macro: return()
;;;
;;; Exit a subroutine, clobbering AC and TMP15.
;;;
;;; Side effects:
;;;   TMP15 = return vector
;;;   AC = return vector
.macro return()
		POP RP			; return()
		STORE TMP15
		JMP I TMP15
.end

		
;;; Macro: return_ac(addr)
;;;
;;; Exit a subroutine, keeping AC intact. Uses TMP14 to do
;;; this.
;;;
;;; Side effects:
;;;   TMP15 = return vector
;;;   TMP14 = copy of AC
;;;   AC = return value
.macro return_ac(%addr)
		STORE TMP14		; return_ac(%addr)
		POP RP
		STORE TMP15
		LOAD TMP14		; restore AC
		JMP I TMP15
.end

;;; End of file.
