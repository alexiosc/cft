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


#define BRD_CTL 1
#define BRD_REG 2
#define BRD_ALU 3
#define BRD_BUS 4

typedef struct {
        uint8_t   board;
        char      name[8];
        char      desc[12];
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
