// -*- c -*-
// 
// log.h — Logging and debugging interface
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
#include <sys/types.h>
#include <argp.h>


#define LOG_FATAL   0
#define LOG_ERROR   1
#define LOG_WARN    2
#define LOG_NOTICE  3
#define LOG_INFO    4
#define LOG_DEBUG   5
#define LOG_DEBUG2  6
#define LOG_DEBUG3  7
#define LOG_DEBUG4  8
#define LOG_DEBUG5  9

#define LOG_NO_UNIT -1

// Greppable log prefixes for each level.
#define SIGILS "EEWNID"


typedef int log_unit_t;         // A Unit handle.

extern int log_strict_sanity;   // Sanity failures are fatal.


int log_init(char * filename);

log_unit_t log_add_unit(char *name, int level, int colour);

void log_set_strict_sanity(int on);

void log_set_colour(int on);

void log_set_level(int level);

void log_set_prefix(char *prefix);

void log_msg(int level, log_unit_t unit, char * fmt, ...);

void log_done();

// Return non-zero if a message for that level and unit would be logged. Useful
// in if() statements to avoid formatting something complicated that would then
// be discarded.
int log_enabled(int level, log_unit_t unit);


// Sanity checking with strict sanity support.
#define sanity(msg, ...) {                                      \
        if (log_strict_sanity) { fatal(msg, ## __VA_ARGS__) }   \
        else { error(msg, ## __VA_ARGS__); }                    \
    }

#ifdef LOG_MACROS_UNIT
#  define fatal(msg, ...) {                                             \
        log_msg(LOG_FATAL, LOG_MACROS_UNIT, msg, ## __VA_ARGS__);       \
        exit(1);                                                        \
    }
#  define error(msg, ...)   log_msg(LOG_ERROR, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define warning(msg, ...) log_msg(LOG_WARN, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define warn(msg, ...)    log_msg(LOG_WARN, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define notice(msg, ...)  log_msg(LOG_NOTICE, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define info(msg, ...)    log_msg(LOG_INFO, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define debug(msg, ...)   log_msg(LOG_DEBUG, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define debug2(msg, ...)  log_msg(LOG_DEBUG2, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define debug3(msg, ...)  log_msg(LOG_DEBUG3, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define debug4(msg, ...)  log_msg(LOG_DEBUG4, LOG_MACROS_UNIT, msg, ## __VA_ARGS__)
#  define log_enabeld(l)    log_enabled(level, LOG_MACROS_UNIT)
#else
#  define fatal(msg, ...) {                                        \
        log_msg(LOG_FATAL, LOG_NO_UNIT, msg, ## __VA_ARGS__);      \
        exit(1);                                                   \
    }
#  define error(msg, ...)   log_msg(LOG_ERROR, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define warning(msg, ...) log_msg(LOG_WARN, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define warn(msg, ...)    log_msg(LOG_WARN, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define notice(msg, ...)  log_msg(LOG_NOTICE, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define info(msg, ...)    log_msg(LOG_INFO, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define debug(msg, ...)   log_msg(LOG_DEBUG, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define debug2(msg, ...)  log_msg(LOG_DEBUG2, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define debug3(msg, ...)  log_msg(LOG_DEBUG3, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#  define debug4(msg, ...)  log_msg(LOG_DEBUG4, LOG_NO_UNIT, msg, ## __VA_ARGS__)
#endif


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
