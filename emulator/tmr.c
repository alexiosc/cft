// -*- c -*-
// 
// tmr.c — Real-Time Clock (and NVRAM)
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

#define DEB_MACROS_UNIT tmr_log_unit
#include "log.h"

#include "tmr.h"
#include "util.h"


static log_unit_t   tmr_log_unit;


void tmr_init()
{
        tmr_log_unit = log_add_unit("TMR", -1, -1);
        debug("Initialised Real-Time Clock");
	tmr_reset();
}


void
tmr_reset() {
}


void
tmr_tick()
{
}


int
tmr_read(longaddr_t addr, word * data)
{
        return 0;
}


int
tmr_write(longaddr_t addr, word data)
{
        return 0;
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
