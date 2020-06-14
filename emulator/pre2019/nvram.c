/* 
   
nvram.c - Emulates much of an ST-M48T02 timekeeper/NVRAM chip.

Copyright (C) 2011 Alexios Chouchoulas

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
#include <sys/types.h>

#include "io.h"
#include "nvram.h"
#include "cftemu.h"
#include "util.h"

static uint8_t _nvram[NVRAM_SIZE];
static int _nvram_ofs = 0;


#define RTC_YEAR    0x7ff
#define RTC_MONTH   0x7fe
#define RTC_MDAY    0x7fd
#define RTC_WDAY    0x7fc
#define RTC_HOUR    0x7fb
#define RTC_MIN     0x7fa
#define RTC_SEC     0x7f9
#define RTC_CONTROL 0x7f8

#define bcd(x) ((x) % 10) | ((((x) % 100) / 10) << 4)


void
nvram_init()
{
	FILE * fp = fopen(NVRAM_FNAME, "rb");
	if (fp == NULL) {
		info("NVRAM image file " NVRAM_FNAME " not found, initialising.\n");
		memset(_nvram, 0, NVRAM_SIZE);
		_nvram[RTC_SEC] = 0x80; /* chip ships with oscillator stopped */
		return;
	}

	if (fread(_nvram, NVRAM_SIZE, 1, fp) != 1) {
		perror("reading " NVRAM_FNAME);
		return;
	}
	info("Read NVRAM image from file %s\n", NVRAM_FNAME);

	if (fclose(fp) != 0) {
		perror("closing " NVRAM_FNAME);
		return;
	}
}


void
nvram_done() 
{
	FILE * fp = fopen(NVRAM_FNAME, "wb");
	if (fp == NULL) {
		perror("writing" NVRAM_FNAME);
		return;
	}

	if (fwrite(_nvram, NVRAM_SIZE, 1, fp) != 1) {
		perror("reading " NVRAM_FNAME);
		return;
	}


	if (fclose(fp) != 0) {
		perror("closing " NVRAM_FNAME);
		return;
	}
}



void
nvram_tick(int tick) 
{
}


static uint16_t
rtc_read (uint16_t chipaddr)
{
	struct tm tm;
	time_t t = time(0);

	t = time(NULL);
	localtime_r(&t, &tm);
	/*
	info("Current time: %04d-%02d-%02d %02d:%02d:%02d\n",
	     tm.tm_year + 1900, tm.tm_mon+1, tm.tm_mday,
	     tm.tm_hour, tm.tm_min, tm.tm_sec);
	*/

	if ((chipaddr != RTC_SEC) && (chipaddr != RTC_CONTROL) && _nvram[RTC_SEC] & 0x80) {
		info("Warning: the RTC oscillator is stopped, do not read time.");
		// Return random values. We don't care.
		return _nvram[chipaddr];
	}

	if (_nvram[RTC_WDAY] & 0x40) {
		info("Warning: the FT bit is set, do not read time.");
		// Return whatever. We don't care.
		return _nvram[chipaddr];
	}

	if ((chipaddr != RTC_CONTROL) && (_nvram[RTC_CONTROL] & 0x40) == 0) {
		warning("Set the READ bit (CONTROL bit 6) before "
			"reading date/time (clear it afterwards).");
	}

	switch (chipaddr) {
	case RTC_CONTROL:
		return _nvram[chipaddr];

	case RTC_YEAR:
		return bcd(tm.tm_year); /* Year % 100 is returned */

	case RTC_MONTH:
		return bcd(tm.tm_mon + 1); /* The RTC returns 1..12 */

	case RTC_MDAY:
		return bcd(tm.tm_mday);

	case RTC_WDAY:
		/* Return day of week plus FT (frequency test) value in high
		 * nybble. */
		return (_nvram[chipaddr] & 0xf0) | ((tm.tm_wday & 0xf) + 1);

	case RTC_HOUR:
		return bcd(tm.tm_hour);

	case RTC_MIN:
		return bcd(tm.tm_min);

	case RTC_SEC:
		/* Return seconds and the ST (Stop bit) value in bit7 */
		return (_nvram[chipaddr] & 0x80) | bcd(tm.tm_sec);
	default:
		fail("Invalid RTC address read, default case reached.");
	}
	
	return 0;
}



static void
rtc_write (uint16_t chipaddr, uint16_t data)
{
	static int warned_rtc = 0;

	switch (chipaddr) {
	case RTC_YEAR:
	case RTC_MONTH:
	case RTC_MDAY:
	case RTC_WDAY:
	case RTC_MIN:
		if ((_nvram[RTC_CONTROL] & 0x80) == 0) {
			warning("Race condition! Set the WRITE bit "
				"(CONTROL bit 7) before setting date/time.");
		} else if (!warned_rtc) {
			warned_rtc = 1;
			info("The RTC is simulated using the host's RTC. "
			     "Updating not supported.");
		}

	case RTC_SEC:
	case RTC_CONTROL:
		_nvram[chipaddr] = data;
		break;

	default:
		fail("Invalid RTC address read, default case reached.");
	}
}



int 
nvram_write(uint16_t addr, uint16_t dbus)
{
	if ((addr & 0xfff8) == IO_NVRAM_WINDOW) {

		/* Set the offset to the NVRAM. We access data through a
		   16-word window. */

		_nvram_ofs = (dbus & 0x7f) << 4;

	} else if ((addr & 0xfff0) == IO_NVRAM_BASE) {

		/* Write to the NVRAM through its 16-word window. */

		int chipaddr = _nvram_ofs | (addr & 0xf);
		if (chipaddr >= 0x7f8 && chipaddr <= 0x7ff) rtc_write(chipaddr, dbus);
		else _nvram[chipaddr] = dbus & 0xff;

	} else return 0;

	return 1;
}


int
nvram_read(uint16_t addr, uint16_t *dbus)
{
	if ((addr & 0xfff0) == IO_NVRAM_BASE) {

		/* Read from the NVRAM through its 16-word window. The */

		int chipaddr = _nvram_ofs | (addr & 0xf);
		//info("chipaddr = %x\n", chipaddr);
		if (chipaddr >= 0x7f8 && chipaddr <= 0x7ff) {
			*dbus = rtc_read(chipaddr);
		} else {
			*dbus = _nvram[_nvram_ofs | (addr & 0xf)] & 0xff;
		}

	} else return 0;

	return 1;
}


/* End of file. */
