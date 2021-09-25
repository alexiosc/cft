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
       int                 log_have_colour;
static int                 log_level = 0;
static char *              log_prefix = NULL;
static log_unitdesc_t *    log_units = NULL;
static int                 log_numunits;

int                        log_strict_sanity;

// Suppressing duplicate lines
static char *              oldbuf = NULL;
static int                 identical_lines = 0;
int                        log_suppress_after = 10;
int                        log_hung_after = 0;

static int                 num_disabled_units = 0;
static char **             disabled_units = NULL;


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

        oldbuf = strdup("");
        identical_lines = 0;

        return 0;
}


void
log_disable_unit(char *unit)
{
        disabled_units = realloc(disabled_units, sizeof(char*) * ++num_disabled_units);
        assert(disabled_units != NULL);
        assert(num_disabled_units > 0);
        assert(unit != NULL);

        disabled_units[num_disabled_units - 1] = strdup(unit);
}


static int
log_unit_is_disabled(char *unit)
{
        if (num_disabled_units == 0) return 0;

        for (int i = 0; i < num_disabled_units; i++) {
                //printf("%s, %s\n", unit, disabled_units[i]);
                if (!strcasecmp(unit, disabled_units[i])) {
                        return 1;
                }
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
        p->enabled = !log_unit_is_disabled(name);

        // Return the index of this unit to be used as a handle.
        return log_numunits - 1;
}


void
log_set_strict_sanity(int on)
{
        log_strict_sanity = on;
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
//static char * codes[] = { "900", "800", "400", "200", "200", "200" };


#define NUM_COLOURS 30
#define CSI "\033["
static char * colours[NUM_COLOURS] = {
        CSI "38;5;226;48;5;196;1m", // Fatal: yellow on red bg
        CSI "38;5;196m",            // Errors: red
        CSI "38;5;214m",            // Warnings: orange
        CSI "38;5;226m",            // Notices: yellow
        CSI "38;5;46m",             // Info: green
        CSI "38;5;15m",             // Trace: white
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
    

inline static int
suppress(char * buf) {
        // Is this line different from the previous one? (or the first one?)
        if (oldbuf == NULL || strcmp(buf, oldbuf)) {
                if (oldbuf != NULL) {
                        free (oldbuf);
                        if (identical_lines > log_suppress_after) {
                                fprintf(log_fp, "[Suppressed %d identical messages.]\n", identical_lines);
                        }
                }

                oldbuf = strdup(buf);
                identical_lines = 1;
                return 0;
        }

        // We've seen this one before.
        identical_lines++;      // Resisted the urge to say ++identical_lines below

        if (identical_lines < log_suppress_after) {
                return 0;
        } else if (identical_lines == log_suppress_after) {
                fprintf(log_fp, "[Suppressing further identical messages...]\n");
        } else if (identical_lines >= log_hung_after) {
                fatal("The emulation has hung");
        } else if ((identical_lines % 2000000) == 0) {
                fprintf(log_fp, "[Suppressed %d identical messages so far...]\n", identical_lines);
        }

        return 1;
}
        

int
log_is_enabled(int level, log_unit_t unit)
{
        if (unit >= 0) {
                assert (unit < log_numunits);
                log_unitdesc_t * up = &log_units[unit];
                if (!up->enabled) return 0;
                if (level > log_level || level > up->level) return 0;
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
        if (unit >= 0)
        {
                assert (unit < log_numunits);
                log_unitdesc_t * up = &log_units[unit];
                if (!up->enabled) return;
                if (level > log_level || level > up->level) return;

                va_start(ap, fmt);
                int result = vasprintf(&buf, fmt, ap);
                assert (result >= 0);
                va_end(ap);

                if (!suppress(buf)) {
                        fprintf(log_fp, "%s%c: L%d [%s] %s%s%s\n",
                                log_have_colour ? colours[level] : "",
                                sigils[level],
                                level,
                                up->name,
                                //level < 2 ? codes[level] : "   ",
                                log_prefix ? log_prefix : "",
                                buf,
                                log_have_colour ? "\033[0m" : ""
                                );
                }
        } else {
                if (level > log_level) return;

                va_start(ap, fmt);
                int result = vasprintf(&buf, fmt, ap);
                assert (result >= 0);
                va_end(ap);

                if (!suppress(buf)) {
                        fprintf(log_fp, "%s%c: L%d %s%s%s\n",
                                log_have_colour ? colours[level] : "",
                                sigils[level],
                                level,
                                //level < 2 ? codes[level] : "   ",
                                log_prefix ? log_prefix : "",
                                buf,
                                log_have_colour ? "\033[0m" : ""
                                );
                }
        }

        //fflush(log_fp);
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
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
