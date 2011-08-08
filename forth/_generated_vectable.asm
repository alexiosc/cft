
// -*- asm -*-

///////////////////////////////////////////////////////////////////////////////
//
// ROM VECTOR TABLE
//
// WARNING: Generated automatically from vectable.asm. Please do not modify.
//
///////////////////////////////////////////////////////////////////////////////

	;; System vector and trap table

&0100:
vector_table:

v_user_isr:     .word  &beef ; ISR vector
v_nl:           .word  &beef ; Newline
v_puts:         .word  &beef ; print string
v_puth:         .word  &beef ; Print hex
v_newstack:     .word  &beef ; Create a stack
v_push:         .word  &beef ; Push a value onto a stack
v_pop:          .word  &beef ; Pop a value from a stackCreate a stack
v_peek:         .word  &beef ; Return the stack's top value without popping
v_npeek:        .word  &beef ; Return the stack's n-th topmost value without popping
v_strlen:       .word  &beef ; Length of a string
v_strcpy:       .word  &beef ; Copy a string
v_upcase:       .word  &beef ; Convert a string to upper case
v_strcmp:       .word  &beef ; Compare two strings
v_strspn:       .word  &beef ; String Span function (C strspn(), skip delimiter)
v_strcspn:      .word  &beef ; String Non-Span function (C strcspn(), find delimiter)
v_strtok:       .word  &beef ; String Tokeniser
v_forth_word:   .word  &beef ; Tokenise a Forth word
v_memcpy:       .word  &beef ; Copy a block of memory
v_newdictkey:   .word  &beef ; Create a new dict key
v_dictfind:     .word  &beef ; Find a dict key, return body
v_digit:        .word  &beef ; Parse a digit
v_mul16:        .word  &beef ; 16bit integer multiplication
v_div16:        .word  &beef ; 16bit unsigned integer division
v_neg32:        .word  &beef ; 32bit negation
v_add32:        .word  &beef ; 32bit addition
v_mul32:        .word  &beef ; 32bit integer multiplication
v_div32:        .word  &beef ; 32bit unsigned integer division

	;; Trap definitions for convenience

        .equ T_USER_ISR     I R v_user_isr
        .equ T_NL           I R v_nl
        .equ T_PUTS         I R v_puts
        .equ T_PUTH         I R v_puth
        .equ T_NEWSTACK     I R v_newstack
        .equ T_PUSH         I R v_push
        .equ T_POP          I R v_pop
        .equ T_PEEK         I R v_peek
        .equ T_NPEEK        I R v_npeek
        .equ T_STRLEN       I R v_strlen
        .equ T_STRCPY       I R v_strcpy
        .equ T_UPCASE       I R v_upcase
        .equ T_STRCMP       I R v_strcmp
        .equ T_STRSPN       I R v_strspn
        .equ T_STRCSPN      I R v_strcspn
        .equ T_STRTOK       I R v_strtok
        .equ T_FORTH_WORD   I R v_forth_word
        .equ T_MEMCPY       I R v_memcpy
        .equ T_NEWDICTKEY   I R v_newdictkey
        .equ T_DICTFIND     I R v_dictfind
        .equ T_DIGIT        I R v_digit
        .equ T_MUL16        I R v_mul16
        .equ T_DIV16        I R v_div16
        .equ T_NEG32        I R v_neg32
        .equ T_ADD32        I R v_add32
        .equ T_MUL32        I R v_mul32
        .equ T_DIV32        I R v_div32

// End of file.
