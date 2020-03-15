;;; -*- cftasm -*-
;;; 
;;; OR Light patterns used during POST

.pushns post

;;; Macro: post.fail()
;;;
;;; Sets the value of OR (and AC) to a negated error code (all OK = all lights
;;; on), sets L, clears I, issues a FAIL and HALT, and goes into a tight loop
;;; (should execution be continued).

; .macro FAIL ()
; 		NOT			; FAIL()
; 		SEL
; 		CLI
; 		FAIL
; 		HALT
; 		JMP @
; .end

; .macro FAILL (lit)
; 		LI %lit			; FAIL(%lit)
; 		NOT
; 		SEL
; 		CLI
; 		FAIL
; 		HALT
; 		JMP @
; .end

.equ ERR_MBU   #----'----'----'---1	; MBU failed to map pages
.equ ERR_NCONS #----'----'----'--1-	; No console detected

.popns post

;;; End of file.
