// -*- asm -*-
//
// Video board.

	.page

	.equ VDU_BASE R &1f0
	
	.equ VDU_SR    VDU_BASE &0
	.equ VDU_MCR0  VDU_BASE &0
	.equ VDU_MCR1  VDU_BASE &1
	.equ VDU_SCR0  VDU_BASE &2
	.equ VDU_SCR1  VDU_BASE &3
	.equ VDU_SAR0  VDU_BASE &4
	.equ VDU_SAR1  VDU_BASE &5
	.equ VDU_MAR0  VDU_BASE &6
	.equ VDU_MAR1  VDU_BASE &7
	.equ VDU_CCR   VDU_BASE &8
	.equ VDU_CAR   VDU_BASE &9
	.equ VDU_HAR   VDU_BASE &a
	.equ VDU_KBD   VDU_BASE &b
	.equ VDU_RSVD  VDU_BASE &c ;reserved
	.equ VDU_CRR   VDU_BASE &d
	.equ VDU_CPORT VDU_BASE &e
	.equ VDU_CMD   VDU_BASE &f

	;;                   fedcba9876543210
	.equ VDU_MCR_EN     #1_______________
	.equ VDU_MCR_VMASK  #_11111__________
	.equ VDU_MCR_VERS   #_00101__________
	.equ VDU_MCR_KBI    #______1_________
	.equ VDU_MCR_VRI    #_______1________
	.equ VDU_MCR_SCI    #________1_______
	.equ VDU_MCR_VSI    #_________1______
	.equ VDU_MCR_C40    #____________1___
	.equ VDU_MCR_R30    #_____________000
	.equ VDU_MCR_R60    #_____________001
	.equ VDU_MCR_R120   #_____________010
	.equ VDU_MCR_R240   #_____________011
	.equ VDU_MCR_R480   #_____________100

	;; Default mode settings: video on, keyboard interrupts
	.equ VDU_MCR_DEF    VDU_MCR_EN VDU_MCR_KBI

	.equ VDU_CCR_OFF    #________00______
	.equ VDU_CCR_ON     #________01______
	.equ VDU_CCR_FBLN   #________10______
	.equ VDU_CCR_SBLN   #________11______

	.equ VDU_CURSOR VDU_CCR_FBLN &0b00

	;; Commands

	.equ VDU_INCX       #_______1________
	.equ VDU_INCY       #______1_________
	.equ VDU_WBC        #__0000__________
	.equ VDU_WB         #__0001__________
	.equ VDU_ODBC       #__0010__________
	.equ VDU_ORB        #__0011__________
	.equ VDU_ANDBC      #__0100__________
	.equ VDU_ANDB       #__0101__________
	.equ VDU_XORBC      #__0110__________
	.equ VDU_XORB       #__0111__________
	.equ VDU_WC         #__1000__________
	.equ VDU_WCG        #__1011__________
	.equ VDU_RBC        #__1101__________






	;; word:  VDU.INIT
	;; flags: CODE ROM CFT
	;; notes: VDU.INIT ( -- )
	;;        Detect and initialise the video display unit (VDU). This
	;;        includes the PS/2 keyboard input.

	;; Ensure the emulator doesn't crash at this point. On hardware, these
	;; instructions are basically NOPs.
	LI EMF_SANITY
	DISEF

	LIA _vdu_init_data
	STORE I0
	IN VDU_SR
	AND I I0		; Mask
	XOR I I0		; Compare

	SNZ
	JMP _vdu_init_present

	LI 0			; Not found
	JMP _vdu_init_done
	
_vdu_init_present:

	;; Initialise the keyboard state
	LI 0
	STORE VDUKBST
	STORE VDUKBM
	
	;; Set 80x30 mode
	FORTH(dw_VDU_80x30)
	FORTH(dw_VDU_CLS)
	LI 1			; VDU detected
	
_vdu_init_done:	
	PUSH(SP)
	;; Restore sanity settings.
	LI EMF_SANITY
	ENEF

	FORTH(dw_KBD_INIT)	; Also initialise the keyboard interface



	;; Subroutine to initialise the ROM font using a table of
	;; stored repeat/CG write commands.
	
	;; Initialise the basic ROM font.
	LIA _romfont0
	STORE I0		; Autoindex
	LI 0
	STORE TMP1		; Address counter

	LOAD I I0		; This is the data count, negated
	STORE TMP2		; TMP2 = loop counter

_romfont_dl_loop:
	LOAD TMP1		; Set the address
	OUT VDU_HAR

	LOAD I I0
	STORE TMP0
	RNR
	RNR
	AND BYTELO
	OUT VDU_CRR
	//PRINTD			; Print out the length

	ADD PLUS1		; Update the address
	ADD TMP1
	STORE TMP1
	//PRINTA			; Print out the new address

	LOAD TMP0
	AND BYTELO
	OR @_vdu_init_data+2
	OUT VDU_CMD		; Go for it.

	ISZ TMP2
	JMP _romfont_dl_loop
	
	NEXT
	
_vdu_init_data:
	.word VDU_MCR_VMASK	; VDU version mask
	.word VDU_MCR_VERS	; version expected value
	.word VDU_WCG VDU_INCX	; Character pattern command



.include "_generated_romfont.asm"
	

	;; SYSTEM VARIABLES

	;; word:  VDU.ATTR
	;; flags: CONST ROM CFT
	;; notes: VDU.ATTR ( -- a )
	;;        The address of the VDU.ATTR variable, which holds the current
	;;        colour attribute.
	
	REGADDR(VDUATTR)


	;; word:  VDU.STADDR
	;; flags: CONST ROM CFT
	;; notes: VDU.STADDR ( -- a )
	;;        The address of the VDU.STADDR variable, which holds the address of the
	;;        top left corner of the viewport.
	
	REGADDR(VDUSTADDR)


	;; word:  VDU.ROWS
	;; flags: CONST ROM CFT
	;; notes: VDU.ROWS ( -- a )
	;;        The address of the VDU.ROWS variable, which holds the height of the viewport.
	
	REGADDR(VDUROWS)


	;; word:  VDU.COLS
	;; flags: CONST ROM CFT
	;; notes: VDU.COLS ( -- a )
	;;        The address of the VDU.COLS variable, which holds the width of the viewport.
	
	REGADDR(VDUCOLS)


	;; word:  VDU.CRSADDR
	;; flags: CONST ROM CFT
	;; notes: VDU.CRSADDR ( -- a )
	;;        The address of the VDU.CRSADDR variable, which holds the VDU address of the cursor.
	
	REGADDR(VDUCRSADDR)


	
	;; DISPLAY MODES


	
	;; word:  VDU.80x30
	;; flags: CODE ROM CFT
	;; notes: VDU.80x30 ( -- )
	;;        Sets a basic 80x25 mode.

	LIA _80x30_data
	JMP _vdu_mode

_80x30_data:
	.word VDU_MCR_DEF VDU_MCR_R30   ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 80			; columns
	.word 30			; rows

_vdu_mode:
	STORE I0		; Source address for autoincrement

	LOAD I I0		; 
	OUT VDU_MCR0		; Set the MCR0
	LOAD I I0		; 
	OUT VDU_MCR1		; Set the MCR1
	LOAD I I0		; 
	OUT VDU_SAR1		; Set the SAR1
	LOAD I I0		; 
	OUT VDU_MAR0		; Set the MAR0
	LOAD I I0		; 
	OUT VDU_MAR1		; Set the MAR1
	LOAD I I0		; 
	OUT VDU_CCR		; Set the CCR

	LI 0
	OUT VDU_SCR0		; SCR0 = 0
	OUT VDU_SCR1		; SCR1 = 0
	OUT VDU_SAR0		; SAR0 = 0
	OUT VDU_CAR		; CAR = 0
	OUT VDU_HAR		; HAR = 0
	STORE VDUSTADDR		; Store start of screen
	STORE VDUCRSADDR	; And cursor address
	LI &3f			; White on black
	OUT VDU_CPORT
	STORE VDUATTR		; Also store it internally

	;; Set housekeeping variables

	RMOV(VDUCOLS, I I0)	; Set number of columns
	RMOV(VDUROWS, I I0)	; Set number of rows

	//JMP _vdu_page		; Reset the terminal
	NEXT


	
	;; word:  VDU.40x30
	;; flags: CODE ROM CFT
	;; notes: VDU.40x30 ( -- )
	;;        Sets a basic 40x30 mode.

	LIA _40x30_data
	LJMP(_vdu_mode)

_40x30_data:
	.word VDU_MCR_DEF VDU_MCR_C40 VDU_MCR_R30    ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 40			; columns
	.word 30			; rows


	
	;; word:  VDU.80x60
	;; flags: CODE ROM CFT
	;; notes: VDU.80x60 ( -- )
	;;        Sets a basic 40x50 mode.

	LIA _80x60_data
	LJMP(_vdu_mode)

_80x60_data:
	.word VDU_MCR_DEF VDU_MCR_R60   ; MCR0
	.word 0				; MCR1
	.word 0				; SAR1
	.word &ffff			; MAR0
	.word &ffff			; MAR1
	.word VDU_CURSOR		; CCR
	.word 80			; columns
	.word 50			; rows



	;; VDU OPERATIONS



	;; word:  VDU.BCFILL
	;; flags: CODE ROM CFT
	;; notes: VDU.BCFILL ( a w h b c -- )
	;;        Fill a part of the VDU memory with character `b` and
	;;        colour/attributes `c`.  The filled area starts at address `a`
	;;        and is `w` columns wide and `h` columns high.
	;;
	;;        Only the lower 8 bits of `b` are used. The VDU registers `MAR0/1` are
	;;        ignored when performing the fill, so wrapping around may not
        ;;        work as expected.

	POP(SP)
	OUT VDU_CPORT		; Pop c, set it.

	POP(SP)
	AND BYTELO		; Safety first! Ensure b is 0-255.
	OR _vdu_cmd_wbc		; Set VDU command (write B & C, inc X)
	STORE TMP4		; TMP4 = B port and VDU command

	POP(SP)
	NEG
	STORE TMP2		; TMP2 = -h (for looping)

	POP(SP)
	ADD MINUS1		; w-1
	STORE TMP1		; TMP1 = w-1 (for VDU repetition register)

	RPOP(TMP3, SP)		; TMP3 = a

_bcfill_loop:	
	LOAD TMP1
	OUT VDU_CRR		; Set repetitions
	LOAD TMP3
	OUT VDU_HAR		; Set address
	LOAD TMP4
	OUT VDU_CMD		; Write B and command

	LADD(TMP3, TMP3, &80)
	ISZ TMP2
	JMP _bcfill_loop

	NEXT

_vdu_cmd_wbc:
	.word VDU_WBC VDU_INCX ; VDU command: write B & C, X increment

	
	
	;; word:  VDU.CLS
	;; flags: DOCOL ROM CFT
	;; notes: VDU.CLS ( -- )
	;;        Clear the current viewport using the current attribute.
	;; code: : VDU.CLS ( -- ) VDU.HOME VDU.STADDR @ VDU.COLS @ VDU.ROWS BL VDU.ATTR VDU.BCFILL ;

	.word dw_VDU_HOME
	.word dw_VDU_STADDR
	.word dw_fetch
	.word dw_VDU_COLS
	.word dw_fetch
	.word dw_VDU_ROWS
	.word dw_fetch
	doLIT(32)
	.word dw_VDU_ATTR
	.word dw_fetch
	.word dw_VDU_BCFILL
	.word dw_EXIT
	

	
	;; word:  VDU.HOME
	;; flags: CODE ROM CFT
	;; notes: VDU.HOME ( -- )
	;;        Move the cursor to the top left of the viewport.
	;; code: : VDU.HOME ( -- ) VDU.STADDR @ DUP VDU.CRSADDR ! &1f9 IO!

	LOAD VDUSTADDR
	STORE VDUCRSADDR
	OUT VDU_CAR
	NEXT
	

	
	;; word:  VDU.EMIT
	;; flags: CODE ROM CFT
	;; notes: VDU.EMIT ( c -- )
	;;        Draw a character at the current location, advancing the location (and cursor).
	;;        Interpret terminal characters.
	POP(SP)
	AND BYTELO
	STORE TMP0

	LI 10			; New line?
	XOR TMP0
	SNZ
	JMP _vdu_nl

	LI 7			; Bell?
	XOR TMP0
	SNZ
	NEXT			; Ignore for now.

	JMP _vdu_putc
	


	;; word:  VDU.PUTC
	;; flags: CODE ROM CFT
	;; notes: VDU.PUTC ( c -- )
	;;        Draw a character at the current location, advancing the location (and cursor).
	;;        No character interpretation is performed.

	POP(SP)
	AND BYTELO
	STORE TMP0

_vdu_putc:
	LOAD VDUATTR
	OUT VDU_CPORT
	LOAD VDUCRSADDR
	OUT VDU_HAR
	LOAD TMP0
	OUT VDU_CMD		; Command 0 = Write B & C

	;; Step the cursor.
	LI 1
	ADD VDUCRSADDR
	STORE VDUCRSADDR
	OUT VDU_CAR

	;; Do we need to go to the next line?
	LOAD VDUSTADDR
	ADD VDUCOLS
	STORE TMP1
	XOR VDUCRSADDR
	AND PLUS127
	SZA
	NEXT			; No need to wrap

	;; Wrap to next line
_vdu_nl:
	LOAD VDUCRSADDR
	ADD PLUS128
	AND VDUROWMASK
	STORE VDUCRSADDR
	OUT VDU_CAR

	;; Do we need to scroll?
	LOAD VDUROWS
	RNL
	RNL
	RBR
	AND VDUROWMASK
	STORE TMP0
	ADD VDUSTADDR
	STORE TMP0
	LOAD VDUCRSADDR
	XOR TMP0
	AND VDUROWMASK
	SZA
	NEXT			; No need to scroll

	LOAD VDUSTADDR
	ADD PLUS128
	STORE VDUSTADDR
	OUT VDU_SAR0

	JSR _vdu_clreol
	NEXT


	;; word:  VDU.NL
	;; flags: CODE ROM CFT
	;; notes: VDU.NL ( -- )
	;;        Start a new line on the VDU.
	JMP _vdu_nl
	


	;; word:  VDU.CLREOL
	;; flags: CODE ROM CFT
	;; notes: VDU.CLREOL ( -- )
	;;        Clears from the current position to the end of the line,
	;;        setting the current attribute.

	JSR _vdu_clreol
	NEXT

_vdu_clreol:
	LOAD VDUCRSADDR
	AND PLUS127
	//PRINTD
	NEG
	STORE TMP1
	//PRINTD
	
	LOAD VDUCOLS
	ADD MINUS1
	ADD TMP1
	//PRINTD
	OUT VDU_CRR

	LOAD VDUCRSADDR
	//PRINTA
	OUT VDU_HAR

	LOAD VDUATTR
	OUT VDU_CPORT

	LI &120		; Command: write B & C, inc x, ASCII 32
	OUT VDU_CMD
	RET



	;; word:  VDU.X
	;; flags: CODE ROM CFT
	;; notes: VDU.X ( -- )
	;;        Temp

	POP SP
	NEG
	STORE TMP9
	LI 33
	STORE TMP8

_x_loop:	
	LOAD TMP8
	PUSH SP
	FORTH(dw_VDU_EMIT)
	LI 1
	ADD TMP8
	STORE TMP8

	ISZ TMP9
	JMP _x_loop
	NEXT
	

	;; word:  VDU.HELLO
	;; flags: CODE ROM CFT
	;; notes: VDU.HELLO ( -- )
	;;        Temporary

	LI 0
	OUT VDU_HAR
	LIA _hello_data
	STORE I0
hello_loop:
	LOAD I I0
	SNZ
	JMP hello_done

	OR _hello_cmd
	OUT VDU_CMD
	JMP hello_loop

hello_done:
	LI 4
	OUT R &1f3
	IN VDU_HAR
	OUT VDU_CAR
	NEXT

_hello_cmd:
	.word VDU_WBC VDU_INCX
_hello_data:
	.str "Hello, world! This is the new VDU in the CFT emulator." 0


	


	
	
	
	





















	


	

	
	;; ;; word:  VDU.CA
	;; ;; flags: USER ROM CFT
	;; ;; notes: VDU.CA ( -- a )
	;; ;;        The address of the VDU.CA variable, which holds the VDU cursor address.
	
	;; .word	UAOFS_VDU_CA
	

	
	;; ;; word:  VDU.SSZ
	;; ;; flags: USER ROM CFT
	;; ;; notes: VDU.SSZ ( -- a )
	;; ;;        The address of the VDU.SSZ variable, which holds the current
	;; ;;        number of characters per screen.
	
	;; .word	UAOFS_VDU_SSZ



;; _vdu_dat:
;; 	.word &1000
;; 	.word &0fff
	
;; 	;; word:  VDU.CHAR
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VDU.CHAR ( c -- )
;; 	;;        Output a character to the VDU.

;; 	;; Display the character
;; 	RPOP(TMP1, SP)		; TMP1 = character to output.
;; 	JSR _vdu_char
;; 	JSR _vdu_step
;; 	NEXT

;; _vdu_char:
;; 	RMOV(I VDUBPOS, TMP1) ; Put the character onto the character plane
;; 	RMOV(I VDUCPOS, VDUATTR) ; Set the attribute
;; 	RET

;; _vdu_step:
;; 	;; Move the cursor left, update.

;; 	;; Update the cursor address.
;; 	LI 1
;; 	ADD VDUCA
;; 	STORE VDUCA
;; 	OUT VDU_CAR

;; 	;; Update the cursor co-ordinates.
;; 	INCM(VDUCPX)		; VDUCPX++
;; 	XOR VDUSCNC		; Reached the right edge?
;; 	SZA
;; 	RET			; No. End here.
	
;; _vdu_step_line:
;; 	LSET(VDUCPX, 0)		; VDUCPX = 0
;; 	INCM(VDUCPY)		; VDUCPY++
;; 	XOR VDUSCNR		; Reached the bottom edge?
;; 	SZA
;; 	RET

;; _vdu_step_scroll:
;; 	RMOV(TMP15, RETV)
;; 	JSR _vdu_home
;; 	JSR _vdu_roll
;; 	JSR _vdu_clreol
;; 	JMP I TMP15		; Return to saved address
	

	
;; _vtest_dat:
;; 	.word -1000
;; 	.word _vdu_char

;; 	;; word:  VTEST
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VTEST ( w -- )
;; 	;;        Writes to the Cursor Control Register.

;; 	LSET(R0, 32)		; R0 = 32
;; 	RMOV(R1, _vtest_dat)	; R1 = -4000

;; _vtest_loop:
;; 	RADD(R0, R0, PLUS1)	; R0++
;; 	STORE TMP1
;; 	JSR _vdu_char
;; 	JSR _vdu_step
;; 	ISZ R1
;; 	JMP _vtest_loop

;; 	NEXT



;; 	;; word:  VTEST2
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VTEST ( w -- )
;; 	;;        Writes to the Cursor Control Register.

;; _vtest2_loop:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	LI 80
;; 	ADD VDUSCR
;; 	STORE TMP1

;; 	XOR VDUSCRSZ
;; 	SNZ
;; 	JMP _vtest2_mod

;; 	LOAD TMP1
;; 	STORE VDUSCR
;; 	OUT VDU_SCR
;; 	JMP _vtest2_loop

;; _vtest2_mod:
;; 	LOAD VDUSSR
;; 	STORE VDUSCR
;; 	OUT VDU_SCR
;; 	JMP _vtest2_loop

;; 	NEXT



;; 	;; word:  VTEST3
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VTEST ( w -- )
;; 	;;        Play with the screen end register.

;; 	FORTH(dw_VDU_640x400)
;; 	LOAD VDUSSR
;; 	OUT VDU_SSR
;; 	OUT VDU_SCR
	
;; 	RMOV(TMP2, VDUSCNC)	; TMP2 = 80
;; 	NEG
;; 	STORE TMP3		; TMP3 = -80
;; 	RADD(TMP1, VDUSSR, VDUSCNC) ; TMP1 = current value of SER
;; 	OUT VDU_SER

;; _vtest3_loop1:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	RADD(TMP1, TMP1, TMP2)
;; 	OUT VDU_SER

;; 	XOR VDUSCRSZ
;; 	SZA
;; 	JMP _vtest3_loop1	; Keep incrementing

;; _vtest3_loop2:
;; 	LI 50
;; 	PUSH(SP)
;; 	FORTH(dw_MS)

;; 	RADD(TMP1, TMP1, TMP3)
;; 	OUT VDU_SER

;; 	XOR VDUSSR
;; 	SZA
;; 	JMP _vtest3_loop2	; Keep decrementing
;; 	JMP _vtest3_loop1	; Back to the top
	


	;; word:  VDU.ROLL
	;; flags: CODE ROM CFT
	;; notes: VDU.ROLL ( -- )
	;;        Scrolls the VDU display downwards by one line.
	;;        Does not clear the new bottom line.

	;; Calculate the new top-left origin address

;; 	JSR _vdu_roll
;; 	NEXT
	
;; _vdu_roll:
;; 	RADD(TMP1, VDUSCR, VDUSCNC)

;; 	;; Check if we need to wrap around (mod VDUSCRSZ)
;; 	NEG
;; 	ADD VDUSCRSZ		; size - top_left_address
;; 	SPA			; if size >= top_left_address...
;; 	JMP _vdu_roll_mod	; ... then wrap around

;; 	;; Set the scroll register
;; 	RMOV(VDUSCR, TMP1)
;; 	OUT VDU_SCR
;; 	RET

;; _vdu_roll_mod:
;; 	RMOV(VDUSCR, VDUSSR)	; Back to the starting address
;; 	OUT VDU_SCR
;; 	RET



	;; word:  VDU.SCROLL
	;; flags: CODE ROM CFT
	;; notes: VDU.SCROLL ( -- )
	;;        Scrolls the VDU display downwards by one line.
	;;        Clears the new bottom line and places the cursor
	;;        on column 0 of that line.

	;; JSR _vdu_home
	;; JSR _vdu_roll
	;; JSR _vdu_clreol
	;; NEXT





	

;; 	;; word:  VDU.160x100
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VDU.160x100 ( -- )
;; 	;;        Sets 160x100 mode

;; 	LIA _160x100_data
;; 	JMP _vdu_mode
	
;; _160x100_data:
;; 	.word VDU_MCR_VEN VDU_MCR_CLH4  ; MCR
;; 	.word 8000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 100

	

;; 	;; word:  VDU.320x200
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VDU.320x200 ( -- )
;; 	;;        Sets 320x200 mode

;; 	LIA _320x200_data
;; 	JMP _vdu_mode
	
;; _320x200_data:
;; 	.word VDU_MCR_VEN VDU_MCR_CLH2  ; MCR
;; 	.word 16000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 200



;; 	;; word:  VDU.640x400
;; 	;; flags: CODE ROM CFT
;; 	;; notes: VDU.640x400 ( -- )
;; 	;;        Sets 640x400 mode

;; 	LIA _640x400_data
;; 	JMP _vdu_mode
	
;; _640x400_data:
;; 	.word VDU_MCR_VEN VDU_MCR_HGR   ; MCR
;; 	.word 32000			; SER
;; 	.word 0				; CCR (cursor off)
;; 	.word 80
;; 	.word 400

	

	
// End of file.
