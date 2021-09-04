// -*- c -*-
// 
// ide.h — Interface to the IDE Adapter Board 
// 
// Copyright © 2012–2021 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#ifndef IDE_H
#define IDE_H 1


#include <stdint.h>
#include <sys/types.h>


// extern int ide;

// extern int ide_speed;

// extern int debug_ide;

void ide_set_speed(int ide_speed);

void ide_set_image(uint32_t a, char *fname);

// void ide_early_init();

void ide_init();

void ide_reset();

void ide_tick(int tick);

void ide_done();

// int ide_write(uint16_t addr, uint16_t data);

// int ide_read(uint16_t addr, uint16_t * data);

#endif /* IDE_H */

/* End of file. */
