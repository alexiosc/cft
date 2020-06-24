// -*- c -*-
// 
// log.c — Loggind and debugging
// 
// Copyright © 2011–2020 Alexios Chouchoulas
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.


#include <stdio.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <errno.h>
#ifdef _POSIX_C_SOURCE
#  include <unistd.h>
#endif
#include <string.h>
#include <assert.h>

#include "util.h"
#include "log.h"


#define UNIT_NAME_LEN 32


typedef struct {
    char  name[UNIT_NAME_LEN];
    int   colour;
    int   level;
    int   enabled:1;
} log_unitdesc_t;


static FILE *              log_fp = NULL;
static int                 log_have_colour;
static int                 log_level = 0;
static char *              log_prefix = NULL;
static log_unitdesc_t *    log_units = NULL;
static int                 log_numunits;


int
log_init(char * filename)
{
    assert(log_fp == NULL);

    log_numunits = 0;
    
    if (filename == NULL) {
#ifdef _POSIX_C_SOURCE
        // Log to standard output
        log_have_colour = isatty(fileno(stdout));
#else
        log_have_colour = 0;
#endif
        log_fp = stdout;
        // TODO: Do we need stdout to be unbuffered?
        setvbuf(stdout, (char *)NULL, _IONBF, 0); // Make stdout unbuffered. 
    } else {
        log_fp = fopen(filename, "a");
        log_have_colour = 0;
        return errno;
    }

    return 0;
}


log_unit_t
log_add_unit(char *name, int level, int colour)
{
    log_numunits++;
    log_units = reallocarray(log_units, log_numunits, sizeof(log_unitdesc_t));

    assert (log_units != NULL);
    assert (strlen(name) < UNIT_NAME_LEN);

    log_unitdesc_t * p = &log_units[log_numunits - 1];
    strncpy(p->name, name, UNIT_NAME_LEN);
    p->colour = colour;
    p->level = level >= 0 ? level : log_level;
    p->enabled = 1;

    // Return the index of this unit to be used as a handle.
    return log_numunits - 1;
}


void
log_set_colour(int on)
{
    log_have_colour = on;
}


void
log_set_level(int level)
{
    log_level = level;
}


void
log_set_prefix(char *prefix)
{
    maybe_free(log_prefix);
    log_prefix = strdup(prefix);
}


static char * sigils = SIGILS "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD";

#define NUM_COLOURS 30
#define CSI "\033["
static char * colours[NUM_COLOURS] = {
    CSI "38;5;226;48;5;196;1m", // Fatal: yellow on red bg
    CSI "38;5;196m",            // Errors: red
    CSI "38;5;214m",            // Warnings: orange
    CSI "38;5;226m",            // Notices: yellow
    CSI "38;5;46m",             // Info: green
    CSI "38;5;250m",            // Debug: grey
    CSI "38;5;247m",            // Debug: grey
    CSI "38;5;244m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey

    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey

    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m",            // Debug: grey
    CSI "38;5;241m"             // Debug: grey
};


int
log_enabled(int level, log_unit_t unit)
{
    assert (level < 30);
    assert (unit < log_numunits);
    if (unit >= 0) {
        if (level > log_level || level > log_units[unit].level) return 0;
    } else {
        if (level > log_level) return 0;
    }
    return 1;
}
    

void
log_msg(int level, log_unit_t unit, char * fmt, ...)
{
    va_list ap;
    char * buf;

    assert (level < 30);
    assert (fmt != NULL);
    va_start(ap, fmt);
    int result = vasprintf(&buf, fmt, ap);
    assert (result >= 0);
    va_end(ap);

    if (unit >= 0)
    {
        assert (unit < log_numunits);
        log_unitdesc_t * up = &log_units[unit];
        if (level > log_level || level > up->level) return;
        fprintf(log_fp, "%s%c: L%d [%s] %s%s%s\n",
                log_have_colour ? colours[level] : "",
                sigils[level],
                level,
                up->name,
                log_prefix ? log_prefix : "",
                buf,
                log_have_colour ? "\033[0m" : ""
            );
    } else {
        if (level > log_level) return;
        fprintf(log_fp, "%s%c: L%d %s%s%s\n",
                log_have_colour ? colours[level] : "",
                sigils[level],
                level,
                log_prefix ? log_prefix : "",
                buf,
                log_have_colour ? "\033[0m" : ""
            );
    }

    free(buf);
}


void
log_done()
{
    maybe_free(log_prefix);
    maybe_free(log_units);
}


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
