// -*- asm -*-
//
// The PS/2 interface on the Video board.

	.page

	
	.equ VDU_KBD R &1fb


	;; word:  KBD.INIT
	;; flags: CODE ROM CFT
	;; notes: KBD.INIT ( -- x )
	;;        Initialise keyboard state machines.

	;; Keyboard interrupts are enabled when modes are set.
	LI 0
	STORE VDUKBST
	STORE VDUKBM

	;; The keyboard may have already sent a byte. This will be
	;; ignored, so clear and re-enable the receiver now.
	IN VDU_KBD

	;; TODO: Move this elsewhere
	;; Enable interrupts
	LI #0011		; IRQ1, enable
	OUT R &30		; IRQ 1

	NEXT

	
	;; word:  VDU.KBD
	;; flags: CODE ROM CFT
	;; notes: VDU.KBD ( -- x )
	;;        PS/2 keyboard state machine.


	;; bits 0-7: key
	;; bit 8: ext
	;; bit 15: 1 = release, 0 = press

	;; Algorithm:
	;; 	* Read port
	;;      * E0? Flag extended
	;;      * F0? Flag release
	;;      * Otherwise, store flags & clear

	IN VDU_KBD
	STORE TMP0
	SNA
	JMP _kbd_have_byte

_kbd_have_nothing:
	LI 0			; We have nothing
	PUSH(SP)
	NEXT

_kbd_have_byte:
	LI &e0
	XOR TMP0
	SNZ
	JMP _kbd_have_e0
	
	LI &f0
	XOR TMP0
	SNZ
	JMP _kbd_have_f0

	LOAD TMP0
	AND BYTELO		; Return last byte + flags
	OR VDUKBST
	PUSH(SP)

	JSR _kbd_mods

	LI 0			; Clear state
	STORE VDUKBST
	NEXT

_kbd_have_e0:
	LI &100
	OR VDUKBST
	STORE VDUKBST
	JMP _kbd_have_nothing
	
_kbd_have_f0:
	LOAD BIT15
	OR VDUKBST
	STORE VDUKBST
	JMP _kbd_have_nothing



	;; Keyboard Modifier State machine
	;;

	;; This subroutine reads output from the PS/2 keyboard state machine
	;; and updates the VDUKBM modifier bitmap. The map is as follows:
	;;
	;; -------1 Left Shift
	;; ------1- Right Shift
	;; -----1-- Left Ctrl
	;; ----1--- Right Ctrl
	;; ---1---- Left Alt
	;; --1----- Right Alt
	;; -1------ Left Super
	;; 1------- Right Super

	.equ KBM_LSHIFT #-------1
	.equ KBM_RSHIFT #------1-
	.equ KBM_LCTRL  #-----1--
	.equ KBM_RCTRL  #----1---
	.equ KBM_LALT   #---1----
	.equ KBM_RALT   #--1-----
	.equ KBM_LSUPER #-1------
	.equ KBM_RSUPER #1-------

	.equ KBM_SHIFT KBM_LSHIFT KBM_RSHIFT
	.equ KBM_CTRL KBM_LCTRL KBM_RCTRL
	.equ KBM_ALT KBM_LALT KBM_RALT
	.equ KBM_SUPER KBM_LSUPER KBM_RSUPER


_kbd_mods:
	STORE TMP0
	LI 1
	STORE TMP9		; TMP9 = bit value
	LIA _kbd_modtable
	STORE I0
	RMOV(TMP8, I I0)	; TMP8 = count

_kbd_modloop:
	LOAD I I0
	XOR TMP0		; match make code?
	SNZ
	JMP _kbd_modloop_make

	XOR BIT15		; match break code?
	SNZ
	JMP _kbd_modloop_break

_kbd_modloop2:
	RSBL(TMP9, TMP9)	; next bit value

	ISZ TMP8
	JMP _kbd_modloop

	RET			; Done!

_kbd_modloop_make:
	ROR(VDUKBM, VDUKBM, TMP9) ; Set a bit.
	JMP _kbd_modloop2
	
_kbd_modloop_break:
	LOAD TMP9		; Clear a bit.
	NOT
	AND VDUKBM
	STORE VDUKBM
	JMP _kbd_modloop2

_kbd_modtable:
	.word -8		; 8 modifier bits
	.word &12		; left shift
	.word &59		; right shift
	.word &14		; left ctrl
	.word &114		; right ctrl
	.word &11		; left alt
	.word &111		; right alt
	.word &11f		; left super
	.word &127		; right super

	

	;; word:  EMITBOTH
	;; flags: DOCOL ROM CFT
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_DUP
	.word dw_TTY_EMIT
	.word dw_VDU_EMIT
	.word dw_EXIT
	

	;; word:  A
	;; flags: DOCOL ROM CFT
	;; notes: A ( -- x )
	;;        Temporary

	.word dw_VDU_CLS
	doLIT(dw_EMITBOTH)
	.word dw_tick_EMIT
	.word dw_store
	.word dw_EXIT


	;; word:  S
	;; flags: DOCOL ROM CFT
	;; notes: S ( -- x )
	;;        Temporary

	doLIT(&1f0)
	.word dw_IO_fetch
	.word dw_BINARY
	.word dw_dot
	.word dw_HEX
	.word dw_EXIT


	;; word:  X
	;; flags: DOCOL ROM CFT
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_HEX
	.word dw_VDU_KBD
	.word dw_dot
	.word dw_EXIT


	;; word:  KBD.MODS
	;; flags: CONST ROM
	;; notes: KBD.MODS ( -- a )
	;;   	  The address of a word where current keyboard modifiers are stored.

	REGADDR(VDUKBM)


	.word @+1
	.word 0
	;; word:  T
	;; flags: DOCOL ROM CFT
	;; notes: X ( -- x )
	;;        Temporary

	.word dw_A

_testkbd_loop:	
	.word dw_VDU_KBD	; VDU_KBD ?DUP ( loop until non-zero)
	.word dw_if_DUP
	.word dw_if_branch
	.word _testkbd_loop

	.word dw_DUP		; DUP ( sc )
	.word dw_DUP		; DUP ( sc sc )

	.word dw_KBD_MODS	; KBD.MODS BINARY @. SPACE
	.word dw_BINARY		; 
	.word dw_fetch_dot	;
	.word dw_SPACE		; (sc sc)

	.word dw_HEX		; HEX . SPACE ( sc )
	.word dw_dot		;
	.word dw_SPACE		;

	.word dw_KBD_MODS	; KBD.MODS @ SWAP ( mods sc )
	.word dw_fetch		;
	.word dw_SWAP

	.word dw_KBD_SC2C	; KBD.SC2C
	.word dw_if_branch
	.word _testkbd1
	.word dw_SPACE
	.word dw_EMIT		; EMIT
	.word dw_branch
	.word _testkbd2

_testkbd1:
	.word dw_DROP
	.word dw_DROP

_testkbd2:
	.word dw_CR

	doLIT(118)		; 118 ( scancode of Esc )
	.word dw_not_equal	; <>
	.word dw_if_branch	; no? Then loop again
	.word _testkbd_done

	.word dw_branch
	.word _testkbd_loop

_testkbd_done:	
	.word dw_EXIT



	;; word:  z
	;; flags: DOCOL ROM
	;; notes: Z ( u -- u f )
	;;   	  Temporary.

	doLIT(0)
	.word dw_SWAP
	.word dw_KBD_SC2C
	.word dw_if_branch	; f = 0
	.word _z1
	.word dw_EMIT		; EMIT char

_z1:
	.word dw_HEX
	.word dw_dot		; Print out keysym
	.word dw_dot		; Print mods
	
	.word dw_EXIT
	
	;; word:  KBD.SC2C
	;; flags: CODE ROM
	;; notes: KBD.SC2C ( mods scancode -- char 1 | mods scancode 0 )
	;;   	  Convert a scancode to a character, if applicable.

	;; Peek two values off the stack
	RADD(I0, SP, MINUS2)	; I0 = SP - 2
	RMOV(TMP3, I I0)	; TMP3 = modifier bitmap, e.g. VDUKBM
	RMOV(TMP1, I I0)	; TMP1 = scancode

	;; Heap traversal code
	;; Size of heap in nodes: _kbd_heapsz
	;; Root = _kbd_heap
	;; Left child of node n: 2n + 1
	;; Right child of node n: 2n + 2
	;; Even nodes: low order byte
	;; Odd nodes: high order byte
	;; Address of node n: _kbd_heap + (n >> 1)

	;; Start with root
	LI 0
	STORE TMP2
	
	;; Read a node.
_kbd_sc2c_loop:
	LIA _kbd_heap
	STORE TMP0

	LOAD TMP2
	SBR			; >> 1, L=parity
	ADD TMP0		; + base addr
	STORE TMP0

	LOAD I TMP0		; Read a pair of nodes

	SSL			; L = 1?
	JMP _kbd_sc2c_even	; No. We want the even node.

_kbd_sc2c_odd:			; Yes. Get the odd node.
	RNR			; >> 4
	RNR			; >> 4
_kbd_sc2c_even:			; Yes, get the even node.
	AND BYTELO		; The even node is in the LSB

	;; Compare the node against the scancode
	NEG
	ADD TMP1		; wanted scancode - node scancode
	SNN			; wanted >= node?
	JMP _kbd_sc2c_lt	; No, it's < node. Use left child.

	SZA			; wanted == node?
	JMP _kbd_sc2c_gt	; No, it's > node. Use right child.
	JMP _kbd_sc2c_found	; Yes. Found.

	;; Branch to the left child.
_kbd_sc2c_lt:
	LOAD TMP2
	SBL			; 2 * node
	ADD PLUS1		; 2 * node + 1
	JMP _kbd_sc2c_go	; Go to node.
	
_kbd_sc2c_gt:	
	LOAD TMP2
	SBL			; 2 * node
	ADD PLUS2		; 2 * node + 2

	;; Are we done with the heap?
_kbd_sc2c_go:
	STORE TMP2
	NEG
	ADD _kbd_heapsz		; new node < heap size?
	SPA			;
	JMP _kbd_sc2c_nfound	; Yes. The scancode wasn't found.
	JMP _kbd_sc2c_loop	; No. Check the next node.

	;; The scancode wasn't found. Return the scancode and FALSE.
_kbd_sc2c_nfound:
	LI 0
	PUSH(SP)		; Push FALSE (the rest of the stack as OK)
	NEXT
	
	;; The scancode was found. Return the character and TRUE.
_kbd_sc2c_found:
	SDROPn(SP, 2)		; Reduce the SP by 2, prepare to push

	// Use TMP2 as an offset into the appropriate table.
	LI KBM_SHIFT
	AND TMP3		; Shifted?
	//PRINTH
	SZA
	JMP _kbd_sc2ct0
	JMP _kbd_sc2ct1

_kbd_sc2ct0:
	LIA _kbd_map_shift	; Yes.
	JMP @+2
	
_kbd_sc2ct1:	
	LIA _kbd_map_plain	; No.

	STORE TMP0

	LOAD TMP2		; node number
	SBR			; >> 1, L=parity
	ADD TMP0
	STORE TMP0
	//PRINTA
	LOAD I TMP0		; Load char value
	SSL			; L = 1?
	JMP _kbd_sc2c_getmsb	; No. We want the even node.
	RNR			; >> 4
	RNR			; >> 4

_kbd_sc2c_getmsb:		; Yes, get the even node.
	AND BYTELO		; The even node is in the LSB

	PUSH(SP)		; Push the character
	LPUSH(SP, 1)
	
	NEXT
	
	;; Include the keymap, which provides _kbd_heapsz, _kbd_heap,
	;; _kdb_map_plain and _kbd_map_shift.
_kbd_sc2c_tables:
	.word _kbd_map_plain
	.word _kbd_map_shift
	
.include "_generated_keymap.asm"


// End of file.
