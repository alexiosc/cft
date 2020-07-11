// -*- c -*-
// 
// mem.c — MEM board emulation
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <argp.h>

#include "cft.h"
#include "cftemu.h"
#include "memory.h"
#include "util.h"
#include "mem.h"

#define LOG_MACROS_UNIT mem_log_unit
#include "log.h"


#define MAX_MEMORY 16777216

#define MEM_TYPE_NONE 255
#define MEM_TYPE_RAM  254

typedef struct {
    uint32_t    size;           // Size in Words
    longaddr_t  start;          // Base address
    longaddr_t  end;            // Last address +1
    word *      mem;            // Memory
    char *      pasm;           // PASM source (could be NULL)
    char *      map;            // Map file (could be NULL)
    int         is_ram:1;       // Is it RAM?
    int         is_wrom:1;      // Is it writeable ROM?
} mem_t;


static mem_t *      mem_map;
static int          mem_num_regions;
static log_unit_t   mem_log_unit;


void
mem_init()
{
    mem_num_regions = emu.num_roms + 1;

    mem_log_unit = log_add_unit("MEM", -1, -1);
    debug("Initialising memory");
    info("%d memory region(s) defined", mem_num_regions);

    mem_map = (mem_t *)safe_malloc(sizeof(mem_t) * mem_num_regions);

    // Allocate ROM and RAM in the reverse order, so the last specified region
    // takes precedence.
    mem_t *memp = mem_map;
    char start_addr[8], end_addr[8];
    int kw_rom = 0;
    for (int i = emu.num_roms - 1 ; i >= 0; i--, memp++) {
        romspec_t * romp = &emu.roms[i];
        memp->size = romp->size << 10;
        memp->start = romp->addr << 10;
        memp->end = memp->start + memp->size;

        memp->mem = safe_malloc(sizeof(word) * memp->size);
        memp->pasm = NULL;
        memp->map = NULL;

	debug("ROM: %s - %s (%dK) is %s",
	      format_longaddr(memp->start, start_addr),
	      format_longaddr(memp->end - 1, end_addr),
	      memp->size >> 10,
	      romp->fname);

        // Read the ROM.
	FILE *fp;
	if ((fp = fopen(romp->fname, "rb")) == NULL) {
            fatal("Unable to open %s: %m", romp->fname);
	}
        int num_read = fread(memp->mem, sizeof(word), memp->size, fp);
        if (num_read != memp->size) {
            fatal("Read %dW instead of %dW from ROM image file %s: %m\n",
                  num_read, memp->size, romp->fname);
        }

        // Check for a MAP file.
        char * map_fname = change_ext(romp->fname, ".map");
        struct stat st;
        if (stat(map_fname, &st) == 0) {
            warning("TODO: Load map file %s", map_fname);
        }
        free(map_fname);

        // Check for a PASM file.
        char * pasm_fname = change_ext(romp->fname, ".pasm");
        if (stat(pasm_fname, &st) == 0) {
            warning("TODO: Load pasm file %s", pasm_fname);
        }
        free(pasm_fname);

        // TODO: Load ROM image, PASM and MAP
        memp->is_ram = 0;
        memp->is_wrom = 0;
        kw_rom += memp->size;
    }

    // Finally, allocate RAM.
    memp->size = emu.ram_size << 10;
    memp->start = 0;
    memp->end = memp->start + memp->size;
    memp->mem = safe_malloc(sizeof(word) * memp->size);
    memp->pasm = NULL;
    memp->map = NULL;
    memp->is_ram = 1;
    memp->is_wrom = 0;

    // Initialise the RAM with the sentinel value.
    for (int i = 0; i < memp->size; i++) memp->mem[i] = emu.ram_sentinel;

    debug("RAM: %s - %s (%dK)",
	  format_longaddr(memp->start, start_addr),
	  format_longaddr(memp->end - 1, end_addr),
	  memp->size >> 10);

    info("%dK RAM, %dK ROM", memp->size >> 10, kw_rom >> 10);

    if (emu.writeable_rom) mem_writeable_rom();
}


void
mem_done()
{
    // Nothing here for now.
}


// Change all loaded ROMs into RAM. This is used to simulate manually entered
// programs during testing.
void mem_writeable_rom()
{
    int i;
    mem_t * memp;
    for (i = 0, memp = mem_map; i < mem_num_regions; i++, memp++) {
        if (!memp->is_ram) memp->is_wrom = 1;
    }
}


int
mem_read(longaddr_t a, word * d)
{
    assert (d != NULL);

    int i;
    mem_t * memp;
    for (i = 0, memp = mem_map; i < mem_num_regions; i++, memp++) {
        if (a >= memp->start && a < memp->end) {
            // Get an address relative to the memory block start.
            uint32_t ofs = a - memp->start;
            *d = memp->mem[ofs];
            if (log_enabled(LOG_DEBUG3, mem_log_unit)) {
                log_msg(LOG_DEBUG3, mem_log_unit, "R %s[%s] → %04x (region %d, ofs %06x)",
                        memp->is_ram ? "RAM" : "ROM", format_longaddr(a, NULL), *d, i, ofs);
            }
            return 1;
        }
    }

    sanity("R MEM[%s]: no memory at this address", format_longaddr(a, NULL));
    return 0;
}
         

int
mem_write(longaddr_t a, word d)
{
    int i;
    mem_t * memp;
    for (i = 0, memp = mem_map; i < mem_num_regions; i++, memp++) {
        if (a >= memp->start && a < memp->end) {
            // Get an address relative to the memory block start.
            uint32_t ofs = a - memp->start;
            if (memp->is_ram || memp->is_wrom) {
                memp->mem[ofs] = d;
            } else {
                sanity("Attempt to write to read-only %s[%s] ← %04x (region %d, ofs %06x)",
                        memp->is_ram ? "RAM" : "ROM", format_longaddr(a, NULL), d, i, ofs);
            }
            if (log_enabled(LOG_DEBUG3, mem_log_unit)) {
                log_msg(LOG_DEBUG3, mem_log_unit, "W %s[%s] ← %04x (region %d, ofs %06x)",
                        memp->is_ram ? "RAM" : "ROM", format_longaddr(a, NULL), d, i, ofs);
            }
            return 1;
        }
    }

    sanity("W MEM[%s]: no memory at this address", format_longaddr(a, NULL));
    return 0;
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
