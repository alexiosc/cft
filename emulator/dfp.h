// -*- c -*-
// 
// io.h — I/O definitions
// 
// Copyright © 2012–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef DFP_H
#define DFP_H 1


#include <stdint.h>
#include <sys/types.h>

#include "cftemu.h"


#if 0

// UNPORTED CODE BELOW

extern int      dfp_enabled;
extern int      dfp_testmode;
extern int      dfp_pts;
extern uint16_t reg_features;
extern uint16_t reg_sr;
extern uint16_t reg_or;
extern uint16_t reg_dsr;

extern char *   dfp_out_name;
extern FILE *   dfp_out_fp;

#define FTR_HOB 0x0001
#define FTR_TRC 0x0010
#define FTR_UTR 0x0020
#define FTR_HOS 0x0200

// Feature set: 1101000011111111
//              110-------------  Running on emulator
//              -----?----------  Front panel is locked
//              ------?---------  Halt on SENTINEL enabled (ORred later)
//              -------?--------  Halt on FAIL enabled (ORred later)
//              --------1-------  SENTINEL available
//              ---------1------  DUMP available
//              ----------1-----  Microcode tracing available
//              -----------1----  Tracing available
//              ------------1---  Testing interface available
//              -------------1--  Debug TTY available
//              --------------1-  DEB available (PFP + DEB = DFP)
//              ---------------1  PFP available
#define QEF_BASE 0xc0ff

#define QEF_HOF  0x0100
#define QEF_HOS  0x0200
#define QEF_LOCK 0x0400


// Note: ICR_TTY is used to enable IRQ6# when console characters received.

#define ICR_IFR6 2
#define ICR_IFR1 4
#define ICR_TTY  8

#define ISR_IRQ6 1
#define ISR_IRQ1 2
#define ISR_IFR6 4
#define ISR_TTY  8

#endif



void dfp_init();

int dfp_read(longaddr_t addr, word * data);

int dfp_write(longaddr_t addr, word data);

void dfp_tick();

void dfp_done();

void dfp_queue_char(uint8_t c);

void dfp_sr_changed(uint16_t sr);

#endif /* DFP_H */

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
