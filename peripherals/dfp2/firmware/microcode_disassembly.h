// -*- c -*-

///////////////////////////////////////////////////////////////////////////////
//
// MICROCODE DISASSEMBLY
//
///////////////////////////////////////////////////////////////////////////////

#ifndef __MICROCODE_DISASSEMBLY_H__
#define __MICROCODE_DISASSEMBLY_H__

#include <stdint.h>

// Sanity check
#ifdef AVR
#  ifdef HOST
#    error "Both -DAVR and -DHOST have been passed to the compiler."
#  endif // HOST
#endif // AVR


// TODO: Remove these.
#define BRD_CTL 1
#define BRD_REG 2
#define BRD_ALU 3
#define BRD_BUS 4

#define BRD_PB0 5
#define BRD_PB1 6

typedef enum {
        UNT_NONE = 0,
        UNT_CLOCK,
        UNT_RESET,
        UNT_IR,
        UNT_CU,
        UNT_FLAGS,
        UNT_MBU_FL,
        UNT_AGL,
        UNT_PC,
        UNT_DR,
        UNT_CS,
        UNT_MBU,
        UNT_MBU_AR,
        UNT_AR,
        UNT_BUS,
        UNT_ISM,
        UNT_ALU_A,
        UNT_ALU_B,
        UNT_ALU,
        UNT_FL,
        UNT_FV,
        UNT_SRU,
        UNT_SWAB,
        UNT_AC,
        UNT_SP
} unit_t;

typedef struct {
        uint8_t   board;
        unit_t    unit;
        char      name[12];
        char      desc[16];
} microcode_disassembly_t;

extern const uint8_t disasm_raddr_ofs[32];

extern const microcode_disassembly_t disasm_raddr[];

extern const uint8_t disasm_waddr_ofs[32];

extern const microcode_disassembly_t disasm_waddr[];

extern const uint8_t disasm_action_ofs[16];

extern const microcode_disassembly_t disasm_action[];



#endif // _MICROCODE_DISASSEMBLY_H__

// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 8
// indent-tabs-mode: nil
// fill-column: 79
// End:
