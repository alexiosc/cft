// -*- c -*-
// 
// rtc.h — Real-Time Clock (RTC) definitions
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef RTC_H
#define RTC_H 1

#include "cftemu.h"

void rtc_init();

void rtc_done();

int rtc_read(longaddr_t addr, word * data);

int rtc_write(longaddr_t addr, word data);

#endif // RTC_H

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
