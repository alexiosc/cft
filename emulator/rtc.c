// -*- c -*-
// 
// rtc.c — Real-Time Clock (and NVRAM)
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <assert.h>
#include <termios.h>
#include <errno.h>
#include <time.h>
#include <sys/types.h>
#include <sys/time.h>

#include "cftemu.h"
#include "cft.h"

#define DEB_MACROS_UNIT rtc_log_unit
#include "log.h"

#include "rtc.h"
#include "util.h"


// The NVRAM chip has 2,048 locations, but we only have access to the lower 256
// ones.

#define _RTC_BASE  0x1c

#define RTC_ADDR      _RTC_BASE
#define RTC_DATA      (_RTC_BASE | 2)

#define RTC_ADDR_MASK 0xff          // Keep 8 bits of address

#define NVRAM_FNAME "nvram.bin"
#define NVRAM_SIZE 2048

#define RTC_YEAR    0x7ff
#define RTC_MONTH   0x7fe
#define RTC_MDAY    0x7fd
#define RTC_WDAY    0x7fc
#define RTC_HOUR    0x7fb
#define RTC_MIN     0x7fa
#define RTC_SEC     0x7f9
#define RTC_CONTROL 0x7f8

#define bcd(x) ((x) % 10) | ((((x) % 100) / 10) << 4)

#define RTC_MSB 0x0f00

static log_unit_t   rtc_log_unit;
static uint8_t      nvram[NVRAM_SIZE];
static uint32_t     nvram_ofs = 0;


void rtc_init()
{
        rtc_log_unit = log_add_unit("RTC", -1, -1);
        debug("Initialised Real-Time Clock");

	FILE * fp = fopen(NVRAM_FNAME, "rb");
	if (fp == NULL) {
		debug("NVRAM image file " NVRAM_FNAME " not found, initialising.\n");
		memset(nvram, 0, NVRAM_SIZE);
		nvram[RTC_SEC] = 0x80; /* chip ships with oscillator stopped */
		return;
	}

	if (fread(nvram, NVRAM_SIZE, 1, fp) != 1) {
		cft_perror("reading " NVRAM_FNAME);
		return;
	}
	info("Successfully read NVRAM image from file %s\n", NVRAM_FNAME);

	if (fclose(fp) != 0) {
		cft_perror("closing " NVRAM_FNAME);
		return;
	}
}

void
rtc_done()
{
	FILE * fp = fopen(NVRAM_FNAME, "wb");
	if (fp == NULL) {
		cft_perror("opening " NVRAM_FNAME " for writing");
		return;
	}

	if (fwrite(nvram, NVRAM_SIZE, 1, fp) != 1) {
		cft_perror("writing to " NVRAM_FNAME);
		return;
	}

	if (fclose(fp) != 0) {
		cft_perror("closing " NVRAM_FNAME);
		return;
	}
}


int
rtc_read(longaddr_t addr, word * data)
{
	struct tm tm;
	time_t t = time(0);

        // Read from NVRAM (this is the easy bit)
        if (nvram_ofs < RTC_CONTROL) {
		*data = nvram[nvram_ofs] | RTC_MSB;
                return 1;
        }

        // The rest is the RTC
	t = time(NULL);
	localtime_r(&t, &tm);

	/*
	info("Current time: %04d-%02d-%02d %02d:%02d:%02d\n",
	     tm.tm_year + 1900, tm.tm_mon+1, tm.tm_mday,
	     tm.tm_hour, tm.tm_min, tm.tm_sec);
	*/

        // Sanity checks
	if ((nvram_ofs >= RTC_MIN) && (nvram_ofs <= RTC_YEAR)) {
                if (nvram[RTC_SEC] & 0x80) {
                        warning("The RTC oscillator is stopped, do not read time.");
                        // Return random values. We don't care.
                        *data = nvram[nvram_ofs] | RTC_MSB;
                        return 1;
                }

                if (nvram[RTC_WDAY] & 0x40) {
                        info("Warning: the FT bit is set, do not read time.");
                        // Return whatever. We don't care.
                        return nvram[nvram_ofs];
                }

                if ((nvram[RTC_CONTROL] & 0x40) == 0) {
                        warning("Set the READ bit (CONTROL bit 6) before "
                                "reading date/time (clear it afterwards).");
                }
        }

	switch (nvram_ofs) {
	case RTC_CONTROL:
		*data = nvram[nvram_ofs] | RTC_MSB;
                return 1;

	case RTC_YEAR:
		*data = bcd(tm.tm_year) | RTC_MSB; /* Year % 100 is returned */
                return 1;

	case RTC_MONTH:
		*data = bcd(tm.tm_mon + 1) | RTC_MSB; /* The RTC returns 1..12 */
                return 1;

	case RTC_MDAY:
		*data = bcd(tm.tm_mday) | RTC_MSB;
                return 1;
                
	case RTC_WDAY:
		// Return day of week plus FT (frequency test) value in high
		// nybble.
                *data = (nvram[nvram_ofs] & 0xf0) | ((tm.tm_wday & 0xf) + 1) | RTC_MSB;
                return 1;
        
	case RTC_HOUR:
		*data = bcd(tm.tm_hour) | RTC_MSB;
                return 1;

	case RTC_MIN:
		*data = bcd(tm.tm_min) | RTC_MSB;
                return 1;

	case RTC_SEC:
		// Return seconds and the ST (Stop bit) value in bit7
		*data = (nvram[nvram_ofs] & 0x80) | bcd(tm.tm_sec) | RTC_MSB;
                return 1;

	default:
		fatal("Invalid RTC address read, default case reached.");
	}
	
	return 0;
}


int
rtc_write(longaddr_t addr, word data)
{
	static int warned_rtc = 0;

        if (addr == RTC_ADDR) {
                nvram_ofs = 0x700 | (data & RTC_ADDR_MASK);
                return 1;
        } else if (addr == RTC_DATA) {
                switch (nvram_ofs) {
                case RTC_YEAR:
                case RTC_MONTH:
                case RTC_MDAY:
                case RTC_WDAY:
                case RTC_MIN:
                        if ((nvram[RTC_CONTROL] & 0x80) == 0) {
                                warning("Set the WRITE bit (CONTROL bit 7) before setting date/time.");
                        } else if (!warned_rtc) {
                                warned_rtc = 1;
                                info("The RTC is simulated using the host's RTC. "
                                     "Updating not supported.");
                        }
                        // Fall through.
                case RTC_SEC:
                case RTC_CONTROL:
                        nvram[nvram_ofs] = data;
                        break;

                default:
                        fatal("Invalid RTC address %03x read, default case reached.", nvram_ofs);
                }

                return 1;
        }
        return 0;
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
