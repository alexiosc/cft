
// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// ROM VECTOR TABLE
//
// WARNING: Generated automatically from vectable.asm. Please do not modify.
//
///////////////////////////////////////////////////////////////////////////////

;; System vector and trap table


v_TFORTH:            .word  &beef ; TFORTH
v__NEXT:             .word  &beef ; _NEXT
v__doLIST:           .word  &beef ; _doLIST
v__doCOL:            .word  &beef ; _doCOL
v__doVAR:            .word  &beef ; _doVAR
v__doCONST:          .word  &beef ; _doCONST
v__do2CONST:         .word  &beef ; _do2CONST
v__doUSER:           .word  &beef ; _doUSER
v__doVOC:            .word  &beef ; _doVOC
v__doDOES:           .word  &beef ; _doDOES
v__EXIT:             .word  &beef ; _EXIT

;; Constant definitions

.equ	BYTELO       R @_const_table+0
.equ	PLUS0FFF     R @_const_table+1
.equ	PLUSFFF0     R @_const_table+2
.equ	BYTEHI       R @_const_table+3
.equ	PLUS1        R @_const_table+4
.equ	PLUS2        R @_const_table+5
.equ	PLUS3        R @_const_table+6
.equ	PLUS15       R @_const_table+7
.equ	PLUS127      R @_const_table+8
.equ	PLUS128      R @_const_table+9
.equ	PLUS256      R @_const_table+10
.equ	BIT15        R @_const_table+11
.equ	MINUS1       R @_const_table+12
.equ	MINUS2       R @_const_table+13
.equ	MINUS3       R @_const_table+14
.equ	MS_4MHZ      R @_const_table+15
.equ	VDUROWMASK   R @_const_table+16

;; Vector definitions for convenience

.equ	vec_TFORTH           I R v_TFORTH
.equ	vec_NEXT             I R v__NEXT
.equ	vec_doLIST           I R v__doLIST
.equ	vec_doCOL            I R v__doCOL
.equ	vec_doVAR            I R v__doVAR
.equ	vec_doCONST          I R v__doCONST
.equ	vec_do2CONST         I R v__do2CONST
.equ	vec_doUSER           I R v__doUSER
.equ	vec_doVOC            I R v__doVOC
.equ	vec_doDOES           I R v__doDOES
.equ	vec_EXIT             I R v__EXIT

// End of file.
