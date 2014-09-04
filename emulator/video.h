/* 

video.h - Emulates the video card

Copyright (C) 2012 Alexios Chouchoulas

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  

*/

#ifndef VIDEO_H
#define VIDEO_H 1


#include <stdint.h>
#include <sys/types.h>

#include <SDL.h>

#define STATUS_SIZE   1024
#define CHAR_RAM_SIZE 131072 	/* 64kB */
#define PLANE_SIZE    65536

#define CHAR_RAM_MASK ((CHAR_RAM_SIZE) - 1)
#define PLANE_SIZE_MASK ((PLANE_SIZE) - 1)

#define CURSOR_ON 1
#define BLINK_ON 1


#define __get(x, m, s) (((x) & (m)) >> (s))
#define __bit(x, m) (((x) & (m)) != 0)
#define __make(x, m, s) (((x) << (s)) & (m))


/* Colour fields */

#define COL_R_MASK             0x03
#define COL_R_SHIFT            0
#define COL_G_MASK             0x0c
#define COL_G_SHIFT            2
#define COL_B_MASK             0x30
#define COL_B_SHIFT            4

#define col_get_r(x) __get(x, COL_R_MASK, COL_R_SHIFT)
#define col_get_g(x) __get(x, COL_G_MASK, COL_G_SHIFT)
#define col_get_b(x) __get(x, COL_B_MASK, COL_B_SHIFT)

#define rgb(r,g,b) (((r) & 3) | (((g) & 3) << 2) | (((b) & 3) << 4))

/* C Plane fields */

#define CPL_FG_MASK            0x3F
#define CPL_FG_SHIFT           0

#define CPL_CS1_MASK           0x00c0
#define CPL_CS1_SHIFT          6

#define CPL_BG_MASK            0x3F00
#define CPL_BG_SHIFT           8

#define CPL_INV                0x4000
#define CPL_BLN                0x8000

#define cpl_get_fg(x) __get(x, CPL_FG_MASK, CPL_FG_SHIFT)
#define cpl_get_bg(x) __get(x, CPL_BG_MASK, CPL_BG_SHIFT)
#define cpl_get_cs1(x) __get(x, CPL_CS1_MASK, CPL_CS1_SHIFT)
#define cpl_is_inv(x) __bit(x, CPL_INV)
#define cpl_is_bln(x) __bit(x, CPL_BLN)

#define color(fg, bg) (					\
		__make(fg, CPL_FG_MASK, CPL_FG_SHIFT) | \
		__make(bg, CPL_BG_MASK, CPL_BG_SHIFT)	\
		)

/* MCR0/1 fields */

#define MCR_CRH_MASK           0x0007
#define MCR_CRH16              0x0000 /* 16 lines per row */
#define MCR_CRH8               0x0001 /* 8 lines per row */
#define MCR_CRH4               0x0002 /* 4 lines per row */
#define MCR_CRH2               0x0003 /* 2 lines per row */
#define MCR_CRH1               0x0004 /* 2 lines per row */
#define MCR_RSVD5              0x0005 /*  **RESERVED */
#define MCR_RSVD6              0x0006 /*  **RESERVED */
#define MCR_RSVD7              0x0007 /*  **RESERVED */

#define MCR_C40                0x0008 /* 40 columns */

#define MCR_CS2_MASK           0x0030
#define MCR_CS2_SHIFT          4

#define MCR0_VSI               0x0040 /* Interrupt on vsync */
#define MCR0_SCI               0x0080 /* Interrupt on split compare */
#define MCR0_VRI               0x0100 /* Interrupt on VDU ready */
#define MCR0_KBI               0x0200 /* Interrupt on keyboard input */

#define MCR0_EN                0x8000 /* Interrupt on split compare */

#define MCR1_SEN               0x0080 /* Enable split screen */

#define MCR1_SCL_MASK          0xFF00 /* Split line */
#define MCR1_SCL_SHIFT         8

#define MCR0_80x30             MCR0_EN /* All other bits at are 0 */
#define MCR0_40x30             MCR0_EN | MCR0_C40
#define MCR0_80x60             MCR0_EN | MCR0_CRH8

#define mcr_get_crh(x) __get(x, MCR_CRH_MASK, 0)
#define mcr_is_c40(x) __bit(x, MCR_C40)
#define mcr_get_cs2(x) __get(x, MCR_CS2_MASK, MCR_CS2_SHIFT)

#define mcr0_is_vsi(x) __bit(x, MCR0_VSI)
#define mcr0_is_sci(x) __bit(x, MCR0_SCI)
#define mcr0_is_vri(x) __bit(x, MCR0_VRI)
#define mcr0_is_kbi(x) __bit(x, MCR0_KBI)
#define mcr0_is_en(x) __bit(x, MCR0_EN)

#define mcr1_is_sen(x) __bit(x, MCR1_SEN)
#define mcr1_get_scl(x) __get(x, MCR1_SCL_MASK, MCR1_SCL_SHIFT)


/* SR fields: same as for MCR except these: */

#define SR_VSIS                0x0040 /* Interrupt source: vsync */

#define SR_SCIS                0x0080 /* Interrupt source: split compare */

#define SR_VERS_MASK           0xec00
#define SR_VERS_SHIFT          10

#define SR_VERSION             (5 << SR_VERS_SHIFT)

#define sr_is_vsis(x) __bit(x, SR_VSIS)
#define sr_is_scis(x) __bit(x, SR_SCIS)
#define sr_get_version(x) __get(x, SR_VERS_MASK, SR_VERS_SHIFT)

/* SCR0/1 fields */

#define SCR_HSCR_MASK          0x0007
#define SCR_HSCR_SHIFT         0

#define SCR_VSCR_MASK          0x00F0
#define SCR_VSCR_SHIFT         4

#define scr_get_hscr(x) __get(x, SCR_HSCR_MASK, SCR_HSCR_SHIFT)
#define scr_get_vscr(x) __get(x, SCR_VSCR_MASK, SCR_VSCR_SHIFT)

/* Vector address macros */

#define VA_COL_MASK           0x007f
#define VA_COL_SHIFT          0

#define VA_ROW_MASK           0xff80
#define VA_ROW_SHIFT          7

#define get_row(x) __get(x, VA_ROW_MASK, VA_ROW_SHIFT)
#define get_col(x) __get(x, VA_COL_MASK, VA_COL_SHIFT)
#define mask_row(x) ((x) & VA_ROW_MASK)
#define vector(x, y)						\
	(((((y) << VA_ROW_SHIFT) & VA_ROW_MASK) |		\
	  (((x) << VA_COL_SHIFT) & VA_COL_MASK)) & 0xffff)

/* CCR fields */

#define CCR_CURSOR_OFF         (0<<6)
#define CCR_CURSOR_ON          (1<<6)
#define CCR_CURSOR_BLINK_FAST  (2<<6)
#define CCR_CURSOR_BLINK_SLOW  (3<<6)

#define ccr_get_fg(x) cpl_get_fg(x) /* Same as for the C plane */
#define ccr_get_bg(x) cpl_get_bg(x) /* Same as for the C plane */
#define ccr_get_cbc(x) cpl_get_cs1(x) /* Same as CS1 (C plane) */

/* CMD: command/port register */

#define CMD_NDATA_MASK         0xFF00

#define CMD_DATA_MASK          0x00FF
#define CMD_DATA_SHIFT         0

#define CMD_XINC               0x0100
#define CMD_YINC               0x0200

#define CMD_CMD_MASK           0x3C00
#define CMD_CMD_SHIFT          10

#define CMD_GO                 0x8000

#define cmd_get_data(x) __get(x, CMD_DATA_MASK, CMD_DATA_SHIFT)
#define cmd_is_xinc(x) __bit(x, CMD_XINC)
#define cmd_is_yinc(x) __bit(x, CMD_YINC)
#define cmd_get_cmd(x) __get(x, CMD_CMD_MASK, CMD_CMD_SHIFT)
#define cmd_is_go(x) __bit(x, CMD_GO)

// C preprocessor magic to access split mode registers

#define splitreg(x) (v.fb->split ? v.fb->x##1 : v.fb->x##0)

// Calculate character generator addresses

#define cgaddr(l, b, c)				\
	((l) | ((b) << 4) |			\
	 (cpl_get_cs1(c) << 12)			\
	 | (mcr_get_cs2(splitreg(mcr)) << 14))


typedef struct {
	uint8_t       b[PLANE_SIZE]; /* Bitmap plane */
	uint16_t      c[PLANE_SIZE]; /* Colour plane */
	uint8_t       cg[CHAR_RAM_SIZE]; /* CG RAM */

	uint16_t      mcr0, mcr1; /* Mode control */
	uint16_t      scr0, scr1; /* Scrolling control */
	uint16_t      sar0, sar1; /* Start address */
	uint16_t      mar0, mar1; /* Modulo address */

	uint16_t      ccr;	/* Cursor control */
	uint16_t      car;	/* Cursor address */
	uint16_t      har;	/* Host address */
	uint16_t      kbd;	/* PS/2 port */
	uint16_t      crr;	/* Command repetitions */
	uint16_t      cport;	/* C Port */
	uint16_t      cmd;	/* CMD/B/CG Port */

	int           split;	/* Split screen state */
} framebuffer_t;

typedef struct {
	framebuffer_t   fb_cft, fb_menu, fb_status;
	framebuffer_t * fb;

	int             dirty;
	int             stdirty;
	int             cursor_blink;
	int             blink;

	int             irq_vs;	/* VSYNC IRQ */
	int             irq_sc;	/* Split Compare IRQ */
	int             irq_vr;	/* VDU Ready IRQ */
	int             irq_kb;	/* Keyboard IRQ */

	int             kbdata; /* Keyboard data */

	SDL_Surface * screen;
	
	SDL_TimerID   refresh_timer;
	SDL_TimerID   blink_timer;
	SDL_TimerID   cursor_timer;

	/* Pixel drawing engine (buf, ofs, r, g, b) -> new ofs */
	int (*drawpixel)(uint8_t *, int, uint8_t, uint8_t, uint8_t);
	
} video_t;

extern video_t v;

extern int video, vdu_dirty, video_fs, video_2x, debug_video;

void sdl_init();

void sdl_done();

void video_init();

void video_reset();

int video_isvram(uint32_t physaddr);

word video_readmem(uint32_t physaddr);

void video_memwrite(uint32_t physaddr, word data);

void video_tick(int tick);

void video_done();

int video_write(uint16_t addr, uint16_t data);

int video_read(uint16_t addr, uint16_t * data);

void video_kbd_interrupt();


#endif /* VIDEO_H */

/* End of file. */
