/* 
   
ide.c - Emulates the dual IDE card (two Philips/NXP 26C92 IDEs)

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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h> 
#include <unistd.h>
#include <assert.h>
#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#include "io.h"
#include "fifo.h"
#include "ide.h"
// #include "cftemu.h"
#include "log.h"
#include "util.h"



void irq();


int ide;

int ide_speed = 10;

int debug_ide = 0;


#define IDE_CS3_ASTATUS 6
#define IDE_CS3_DCTL    6
#define IDE_CS3_DRADDR  7

#define IDE_CS1_DATA    0	/* rw */
#define IDE_CS1_ERR     1	/* r- */
#define IDE_CS1_FEAT    1	/* -w */
#define IDE_CS1_SCOUNT  2	/* rw */
#define IDE_CS1_LBA0    3	/* rw */
#define IDE_CS1_LBA1    4	/* rw */
#define IDE_CS1_LBA2    5	/* rw */
#define IDE_CS1_DHEAD   6	/* rw */
#define IDE_CS1_STATUS  7	/* r- */
#define IDE_CS1_CMD     7	/* -w */

#define SR_BUSY 128
#define SR_DRDY 64
#define SR_DWF  32
#define SR_DSC  16 
#define SR_DRQ  8
#define SR_CORR 4
#define SR_IDX  2
#define SR_ERR  1

#define DCR_BASE 8
#define DCR_SRST 4
#define DCR_nIEN 2

#define ERR_BBK    0x80
#define ERR_UNC    0x40
#define ERR_MC     0x20
#define ERR_IDENF  0x10
#define ERR_MCR    0x08
#define ERR_ABRT   0x04
#define ERR_TK0NF  0x02
#define ERR_AMNF   0x01

#define NUM_IDEHD 4

#define MAX_MULTI 16


///////////////////////////////////////////////////////////////////////////////
//
// IDE DEFINITIONS
//
///////////////////////////////////////////////////////////////////////////////


typedef struct {
	char     *fname;
	FILE     *fp;

	uint16_t  status;	/* Status register */
	uint16_t  error;	/* Error register */
	uint16_t  scount;
	uint8_t   lba0;
	uint8_t   lba1;
	uint8_t   lba2;
	uint8_t   lba3;

	uint16_t  multiple;
	uint32_t  size;
	int       present;
	int       irqen;
	int       irqpending;
	int       reset;

	uint16_t  buf[256 * MAX_MULTI];
	uint16_t  bp;		/* Buf pointer */

	uint32_t  delay;
	int       cmd;
	int       c;
	void      (*callback)();
	void      (*buf_callback)();
} idehd_t;




idehd_t idehd[NUM_IDEHD];

int drsel [(NUM_IDEHD + 1) >> 1];


static void
callback_diags(int unit)
{
	idehd_t * hd = &idehd[unit];

	/* Simulate successful diagnostics */
	hd->error = 0x01;
	hd->scount = 0x01;
	hd->lba0 = 0x01;	/* LBA0 == sector number register */
	hd->lba1 = 0x00;	/* Cylinder low */
	hd->lba2 = 0x00;	/* Cylinder high */
	hd->lba3 = 0x00;	/* Drive/head */

	ideinfo2("IDEHD %d: Reset complete.\n", unit);
}


void
idehd_set(uint32_t n, char *fname)
{
	struct stat st;
	assert(fname != NULL);
	assert(n < NUM_IDEHD);
	idehd[n].fname = strdup(fname);

	if ((idehd[n].fp = fopen(fname, "r+")) == NULL) {
		fatal("Unable to open HD image '%s': %m\n", fname);
	}

	if(fstat(fileno(idehd[n].fp), &st) < 0) {
		fatal("Unable to stat HD image '%s': %m\n", fname);
	}

	ideinfo("Disk image %d: file %s, %d kwords\n", n, fname, (uint32_t)st.st_size >> 11);

	idehd_t * hd = &idehd[n];

	hd->size = st.st_size;

	hd->present = 1;	/* Reset counterNo current command */

	hd->delay = 15;		/* Unit: 1024 clock ticks */
	hd->cmd = -1;		/* No current command */
	hd->c = 2500;		/* Reset counter */
	hd->bp = 0;
	hd->error = 0;
	hd->irqen = 0;
	hd->irqpending = 0;
	hd->status = SR_BUSY;
	hd->scount = 1;
	hd->callback = callback_diags;
	hd->buf_callback = NULL;

	ide = 1;
}


uint16_t ident[256] = {
	0x444,			/* 00: fast, fixed, MFM drive */
	0,			/* 01: number of cylinders */
	0,			/* 02: reserved */
	0,			/* 03: number of heads */
	65535,			/* 04: number of unformatted bytes per track */
	520,			/* 05: number of unformatted bytes per sector */
	0,			/* 06: sectors per track */
	0, 0, 0,		/* 07-09: vendor unique */
	'N', '/', 'A', 0, 0, 	/* 10-19 */
	
};


static void
idehd_identify(int unit)
{
	idehd_t * hd = &idehd[unit];
	uint16_t * b = hd->buf;

	hd->bp = 0;
	memset(hd->buf, 0, sizeof(hd->buf));
	b[0] = 0x0444;	/* 00: fast, fixed, MFM drive */
	/*              bytes: 12345678901234567890 */
	/*              words: 00112233445566778899 */
	strcpy((char*)&b[10], "                 N/A");
	/*              bytes: 12345678 */
	/*              words: 33445566 */
	strcpy((char*)&b[23], "0.01    ");
	/*               bytes: 12345678901234567890 */
	/*               words: 7788990011223344556677889900112233445566 */
	//strcpy((char*)&b[27],  "ST3%uA-DISKIMAGE                         ", hd->size >> 20);
	sprintf((char*)&b[27], "ST3%04uA-EMU                               ", hd->size / 1000000);
	//sprintf((char*)&b[31],        "%dM image%c                       ", hd->size >> 20, 0);

	b[47] = MAX_MULTI;	/* Max sectors per transfer */
	b[57] = (hd->size >> 9) & 0xffff;
	b[58] = ((hd->size >> 9) >> 16) & 0xffff;
	b[59] = 0x110;		/* Yes, transfer up to 16 sectors. */
	b[60] = b[57];
	b[61] = b[58];
}


static void
idehd_err(int unit, uint16_t flags)
{
	idehd_t * hd = &idehd[unit];
	hd->c = 0;
	hd->bp = 0;
	hd->scount = 0;
	hd->error = flags;
	hd->status |= SR_ERR;
}


static void
idehd_read(int unit)
{
	idehd_t * hd = &idehd[unit];
	int n;

	n = hd->scount;
	if (n < 0 || n > MAX_MULTI) n = 1;

	uint32_t ofs = (hd->lba0 & 0xff) | 
		((hd->lba1 & 0xff) << 8) | 
		((hd->lba2 & 0xff) << 16) | 
		((hd->lba3 & 0xf) << 24);

	idedebug("IDEHD %u: read %d sector(s) starting with %d\n", unit, n, ofs);
	ofs = ofs << 9;		/* LBA unit: 512-byte sector */

	if (ofs >= hd->size) {
		warning("IDEHD %d: sector %d is past end of device (%d sectors total)\n",
			unit, ofs, hd->size);
		idehd_err(unit, ERR_ABRT);
	}
	fseek(hd->fp, ofs, SEEK_SET);

	idedebug("IDEHD %u: read %d bytes from ofs %u\n", unit, n * 512, ftell(hd->fp));

	if (fread(&hd->buf, 512, n, hd->fp) != n) {
		fatal("IDEHD %d: failed to read %d bytes from %s: %m\n", 
		     unit, 512 * n, hd->fname);
	}
	hd->status &= ~SR_DRQ;
	hd->bp = 0;
	hd->scount = 0;
}




static void
idehd_write(int unit)
{
	idehd_t * hd = &idehd[unit];
	int n;

	n = hd->scount;
	if (n < 0 || n > MAX_MULTI) n = 1;

	uint32_t ofs = (hd->lba0 & 0xff) | 
		((hd->lba1 & 0xff) << 8) | 
		((hd->lba2 & 0xff) << 16) | 
		((hd->lba3 & 0xf) << 24);

	idedebug("IDEHD %u: write %d sector(s) starting at %d (waiting for data)\n", unit, n, ofs);
	hd->status |= SR_DRQ;
	hd->status &= ~SR_BUSY;
	hd->c = -1;
	hd->bp = 0;
	void callback_idehd_write(int);
	hd->buf_callback = callback_idehd_write;
}



void
callback_idehd_write(int unit)
{
	idehd_t * hd = &idehd[unit];
	int n;

	n = hd->scount;
	if (n < 0 || n > MAX_MULTI) n = 1;

	uint32_t ofs = (hd->lba0 & 0xff) | 
		((hd->lba1 & 0xff) << 8) | 
		((hd->lba2 & 0xff) << 16) | 
		((hd->lba3 & 0xf) << 24);

	idedebug("IDEHD %u: write %d sector(s) starting at %d (data received, writing)\n", unit, n, ofs);

	ofs = ofs << 9;		/* LBA unit: 512-byte sector */
	if (ofs >= hd->size) {
		warning("IDEHD %d: sector %d is past end of device (%d sectors total)\n",
			unit, ofs, hd->size);
		idehd_err(unit, ERR_ABRT);
	}
	fseek(hd->fp, ofs, SEEK_SET);

	if (fwrite(&hd->buf, 512, n, hd->fp) != n) {
		fatal("IDEHD %d: failed to write %d bytes to %s: %m\n", 
		     unit, 512 * n, hd->fname);
	}

	idedebug("IDEHD %u: wrote %d bytes to ofs %u\n", unit, n * 512, ofs);

	hd->bp = 0;
	hd->scount = 0;
}


void idehd_command(int unit, uint16_t cmd)
{
	idehd_t * hd = &idehd[unit];
	
	// If a new command arrives while processing an existing
	// command, ignore it and run the new command anyway.

	switch(cmd) {
	case 0xec:		/* Identify drive */
		idedebug("IDEHD %d: Identify\n", unit);
		idehd_identify(unit);
		hd->c = 100;
		break;

	case 0x10:		/* Recalibrate */
		ideinfo("IDEHD %d: Crrrck. Crrrrck. (recalibrating)\n", unit);
		hd->lba0 = 0;
		hd->lba1 = 0;
		hd->lba2 = 0;
		hd->lba3 = 0;
		hd->c = 50000 + (random() % 10000);
		break;

	case 0xc4:		/* Read multiple */
		hd->scount = hd->multiple;
		/* Fall through. */
	case 0x20:		/* Read with retry */
	case 0x21:		/* Read without retry */
		idehd_read(unit);
		hd->c = 50;
		break;

	case 0x70:		/* Seek */
		/* No need to seek the disk image. Just emulate track access */
		hd->c = 50;
		break;

	case 0xc6:		/* Set multiple mode */
		hd->multiple = hd->scount;
		hd->c = 10;
		break;

	case 0xc5:		/* Write multiple */
		hd->scount = hd->multiple;
		/* Fall through. */
	case 0x30:		/* Write sectors with retry */
	case 0x31:		/* Write sectors without retry */
		idehd_write(unit);
		hd->c = 70;
		break;

	case 0xe0:		/* Spin down */
	case 0xe1:		/* Spin up */
		hd->c = 50000 + (random() % 10000);
		break;

	case 0xe4:		/* Read buffer */
	case 0xe8:		/* Write buffer */
		hd->c = 10;
		hd->bp = 0;
		break;

	default:
		warning2("IDEHD %d: unknown command %02x.\n", unit, cmd);
		idehd_err(unit, ERR_ABRT);
		return;
	}

	hd->status &= ~SR_DRDY;
	hd->status |= SR_BUSY;
	hd->cmd = cmd;
}


///////////////////////////////////////////////////////////////////////////////
//
// Board-level emulation
//
///////////////////////////////////////////////////////////////////////////////


void
ide_early_init()
{
	int i;
	for (i = 0; i < NUM_IDEHD; i++) {
		memset(&idehd[i], 0, sizeof(idehd_t));
		//idehd[i].fp = NULL;
		drsel[i >> 1] = 0;
	}
}


void
ide_init()
{
}


void
ide_done() 
{
	int i;
	for (i = 0; i < NUM_IDEHD; i++) {
		if(idehd[i].present) {
			free(idehd[i].fname);
			fclose(idehd[i].fp);
		}
	}
}


static int
get_unit(uint16_t addr)
{
	switch (addr & 0xfff0) {
	case IO_IDEA_CS3:
	case IO_IDEA_CS1:
		return drsel[0];
	case IO_IDEB_CS3:
	case IO_IDEB_CS1:
		return 2 + drsel[1];
	}
	
	return -1;
}


static void
ide_reset(int unit)
{
	int i;
	unit = unit & ~1;
	for (i = 0; i < 2; i++, unit++) {
		idehd_t * hd = &idehd[unit];
		if (!hd->present) continue;
		ideinfo2("IDEHD %d: Resetting...\n", unit);
		hd->c = 100000;	/* Reset counter */
		hd->callback = callback_diags;
		hd->bp = 0;
		hd->error = 0;
		hd->irqen = 0;
		hd->irqpending = 0;
		hd->status = SR_BUSY;
	}
}


int 
ide_write(uint16_t addr, uint16_t dbus)
{
	int unit = get_unit(addr);

	if (unit < 0) return 0;
	idehd_t *hd = &idehd[unit];
	int tmp;

	/* All IDE registers are 8 bits. */
	uint8_t data = dbus & 0xff;

	switch(addr) {
	case IO_IDEA_CS3|IDE_CS3_DCTL:
	case IO_IDEB_CS3|IDE_CS3_DCTL:
		if ((data & 9) != 8) {
			warning2("IDEHD %d: DCR value must be xxxx1xx0.\n", unit);
		}
		/* Reset: bit 2. IRQ enabled: bit 1 */
		hd->irqen = (data & 2) == 0;
		tmp = hd->reset;
		hd->reset = data & 4;
		if (hd->reset && !tmp) {
			warning2("IDEHD %d: SRST (reset) asserted.\n", unit);
			hd->status |= SR_BUSY; /* Per IDE spec section 8.1 */
		} else if (tmp && !hd->reset) {
			warning2("IDEHD %d: SRST (reset) cleared.\n", unit);
			ide_reset(unit);
		}
		return 1;

	case IO_IDEB_CS1|IDE_CS1_DATA:
	case IO_IDEA_CS1|IDE_CS1_DATA:
		hd->buf[hd->bp & 0xfff] = dbus;
		idedebug("IDEHD %u: buf[%d] = %04x\n", unit, hd->bp & 0xfff, dbus);

		// End of buffer?uffer
		hd->bp = (hd->bp + 1) & 0xfff;
		if (hd->bp >= hd->scount * 256) {
			hd->bp = 0;
			if (hd->buf_callback != NULL) {
				idedebug("IDEHD %u: buffer fully written (%d bytes)\n",
					 unit, hd->scount * 512);
				(*(hd->buf_callback))(unit);
				hd->buf_callback = NULL;
			}
		}
		return 1;

	case IO_IDEB_CS1|IDE_CS1_SCOUNT:
	case IO_IDEA_CS1|IDE_CS1_SCOUNT:
		hd->scount = data ? data : 256;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_FEAT:
	case IO_IDEA_CS1|IDE_CS1_FEAT:
		warning2("IDEHD %d: Features register ignored.\n", unit);
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA0:
	case IO_IDEA_CS1|IDE_CS1_LBA0:
		hd->lba0 = data & 0xff;
		//info("LBA0 = %d\n", data & 0xff);
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA1:
	case IO_IDEA_CS1|IDE_CS1_LBA1:
		hd->lba1 = data & 0xff;
		//info("LBA1 = %d\n", data & 0xff);
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA2:
	case IO_IDEA_CS1|IDE_CS1_LBA2:
		hd->lba2 = data & 0xff;
		//info("LBA2 = %d\n", data & 0xff);
		return 1;

	case IO_IDEA_CS1|IDE_CS1_DHEAD:
	case IO_IDEB_CS1|IDE_CS1_DHEAD:
		if ((data & 0xa0) != 0xa0) {
			warning2("IDEHD %d: Drive/Head value must be 1x1xxxxx.\n", unit);
		}
		if ((data & 0x40) != 0x40) {
			warning("IDEHD %d: Selected unimplemented CHS mode.\n", unit);
		}
		drsel[unit >> 1] = data & 0x10 ? 1 : 0;
		//info2("Selected bus=%d unit=%d\n", unit >> 1, drsel[unit >> 1]);
		hd->lba3 = data & 0xf;
		//info("LBA3 = %d\n", hd->lba3);
		return 1;

	case IO_IDEB_CS1|IDE_CS1_CMD:
	case IO_IDEA_CS1|IDE_CS1_CMD:
		idehd_command(unit, data);
		return 1;
	}

	return 0;
}



int
ide_read(uint16_t addr, uint16_t *dbus)
{
	int unit = get_unit(addr);

	if (unit < 0) return 0;
	idehd_t *hd = &idehd[unit];
	if (!hd->present) {
		warning2("IDEHD %d: not present\n", unit);
		*dbus = 0xffff;
		return 1;
	}

	/* When the drive is busy, a read of any of the Command Block
	 * registers will return the value of the status register. */
	if ((hd->status & SR_BUSY) && (((addr & 0xfff0) == IO_IDEA_CS1) ||
				       ((addr & 0xfff0) == IO_IDEB_CS1))) {
		addr = (addr & 0xfff0) | IDE_CS3_ASTATUS;
		idedebug("Still busy, returning status register (%04x)\n", hd->status);
	}

	switch(addr) {
	case IO_IDEA_CS3|IDE_CS3_ASTATUS:
	case IO_IDEB_CS3|IDE_CS3_ASTATUS:
		//info("STATUS %04x\n", hd->status);
		*dbus = hd->status;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_DATA:
	case IO_IDEA_CS1|IDE_CS1_DATA:
		*dbus = hd->buf[hd->bp & 0xfff];
		//info("SOUP: Read: %p (buf=%p, delta=%d) 0x%04x\n", &hd->buf[hd->bp], hd->buf, hd->bp, hd->buf[hd->bp]);
		hd->bp = (hd->bp + 1) & 0xfff;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_SCOUNT:
	case IO_IDEA_CS1|IDE_CS1_SCOUNT:
		*dbus = hd->scount;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_ERR:
	case IO_IDEA_CS1|IDE_CS1_ERR:
		*dbus = hd->error;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA0:
	case IO_IDEA_CS1|IDE_CS1_LBA0:
		*dbus = hd->lba0;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA1:
	case IO_IDEA_CS1|IDE_CS1_LBA1:
		*dbus = hd->lba1;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_LBA2:
	case IO_IDEA_CS1|IDE_CS1_LBA2:
		*dbus = hd->lba2;
		return 1;

	case IO_IDEB_CS1|IDE_CS1_DHEAD:
	case IO_IDEA_CS1|IDE_CS1_DHEAD:
		*dbus = (hd->lba3 & 0xf) | 0xe0 | (drsel[unit>>1]? 0x10: 0);
		return 1;

	case IO_IDEA_CS1|IDE_CS1_STATUS:
	case IO_IDEB_CS1|IDE_CS1_STATUS:
		//info("STATUS %04x\n", hd->status);
		*dbus = hd->status;
		hd->irqpending = 0;
		hd->status |= SR_DRDY;
		return 1;

	}

	return 0;
}


void
ide_tick(int tick)
{
	int i;
	for (i = 0; i < NUM_IDEHD; i++) {
		idehd_t * hd = &idehd[i];
		if(hd->present && hd->c > 0) {
			hd->c -= ide_speed;
			if (hd->c <= 0) {
				idedebug("IDEHD %d: done\n", i);
				hd->status &= ~SR_BUSY;
				hd->status |= SR_DRDY;
				if (hd->callback != NULL) {
					(*(hd->callback))(i);
					hd->callback = NULL;
				}
				switch(hd->cmd){
				case 0xec:
				case 0xe4:
				case 0xc4:
				case 0x20:
				case 0x21:
					hd->status |= SR_DRQ;
				}
				hd->cmd = -1;
			}
		}
	}
}


/* End of file. */
