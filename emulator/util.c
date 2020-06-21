// -*- c -*-
// 
// util.h — Various utility functions
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

#include "util.h"

#define __instruction_set_t instruction_t
#define bool bit
#include "microcode/build/disasm.h"

char *
format_longaddr(longaddr_t addr, char *buf)
{
    static char _buf[8];
    char * s = buf ? buf : _buf;
    snprintf(s, 8, "%02x:%04x", (addr >> 16) & 0xff, (addr & 0xffff));
    return s;
}


char *
format_bin(uint32_t x, int numbits)
{
    static char res[33];
    char *cp = res;
    for (int i = 0x80000000; i; i>>=1) {
        *cp++ = (x & i) ? '1': '0';
    }
    *cp = 0;
    if (numbits < 0 || numbits > 32) numbits = 32;
    return &res[32 - numbits];
}

char *
disasm(word ir, int full_dis, char *buf)
{
    static char _buf[80];
    char * s = buf ? buf : _buf;

    static int offsets[16] = { -1, -1, -1, -1, -1, -1, -1, -1,
                               -1, -1, -1, -1, -1, -1, -1, -1 };
    if (offsets[0] < 0) {
        for (int i = NUM_INSTRUCTIONS - 1; i >= 0; i--) {
            offsets[(instruction_set[i].instr >> 12) & 0xf] = i;
        }
    }

    int i = offsets[(ir >> 12) & 0xf];

    // The easy work first
    if (i < 0) {
        return strcpy(s, "?");
    }

    // Okay, now we search.
    while (instruction_set[i].mnemonic != NULL) {
        instruction_t * instr = &instruction_set[i];
        if ((ir & instr->instr_mask) ==  instr->instr) {
            if (full_dis) {
                if (instr->bitmap) {
                    // Not really properly implemented yet
                    snprintf("%s #%s", 80, instr->mnemonic, format_bin(ir, 7));
                } else {
                    switch (instr->operand_mask) {
                    case 0:
                        // No operand
                        return strncpy(s, instr->mnemonic, 80);
			
                    case 7:
                        // An MBR reference (e.g. IND)
                        snprintf(s, 80, "%s %d", instr->mnemonic, ir & 7);
                        return buf;
			
                    case 0xf:
                        // Used mostly for rolls, so use integers
                        snprintf(s, 80, "%s %d", instr->mnemonic, ir & 0xf);
                        return buf;
			
                    default:
                        snprintf(s, 80, "%s %x", instr->mnemonic, ir & instr->operand_mask);
                        return buf;
                    }
                }
            } else {
                // Simple disassembly, just the instruction
                return strncpy(s, instr->mnemonic, 80);
            }
        }
    }

    // Unknwown instruction
    return strncpy(s, "?", 80);
}


// /* Dump state */
// void
// dump_state()
// {
// 	//printf("t:   %luus (uaddr %d)\n", cpu.tick, cpu.ustate.uaddr);
// 	printf("IR:  %s%04x%s  (OP: %01x I: %01d R: %01d V: %03x) %s%s %s%s%03x%s",
// 	       COL_WHI, cpu.ir, COL_NOR,
// 	       get_op(cpu.ir), get_i(cpu.ir), get_r(cpu.ir), get_offset(cpu.ir),
// 	       COL_MAG, ops[(cpu.ir >> 11) & 0x1f],
// 	       get_i(cpu.ir)? "I ": "",
// 	       get_r(cpu.ir)? "R ": "",
// 	       get_offset(cpu.ir), COL_NOR);
// 	printf("\n");
// 	printf("PC:  %s%04x%s  ", COL_WHI, cpu.pc, COL_NOR);
// 	printf("MAR: %s%04x%s  ", COL_WHI, cpu.ar, COL_NOR);
// 	printf("DR:  %s%04x%s  ", COL_WHI, cpu.dr, COL_NOR);
// 	printf("\n");
// 	printf("L,A: %s%d%04x%s  Flags: %s%s%s%s%s%s%s  ",
// 	       COL_WHI, cpu.l, cpu.a, COL_NOR,
// 	       COL_WHI,
// 	       cpu.v ? "V" : "v",
// 	       cpu.n ? "N" : "n",
// 	       cpu.z ? "Z" : "z",
// 	       cpu.i ? "I" : "i", /* I is active low */
// 	       cpu.irq ? "Q" : "q", /* So is IRQ */
// 	       COL_NOR);
// 	printf("\n");
// 	printf("IBUS: %s%04x%s  ", COL_GRE, cpu.ibus, COL_NOR);
// 	printf("DBUS: %s%04x%s  ", COL_GRE, cpu.dbus, COL_NOR);
// 	printf("\n");
// 	printf("0000: %s%04x%s  ", COL_GRE, memory_read(0), COL_NOR);
// 	printf("0001: %s%04x%s  ", COL_GRE, memory_read(0), COL_NOR);
// 	printf("0002: %s%04x%s  ", COL_GRE, memory_read(0), COL_NOR);
// 	printf("\n");
// 	printf("\n");
// }


// /* Dump micro state */ 
// void
// dump_ustate()
// {
// 	printf("uSTATE:\n");
// 	printf("RST: %s%d%s ", COL_YEL, cpu.ustate.rst, COL_NOR);
// 	printf("INT: %s%d%s ", COL_YEL, cpu.ustate.int_, COL_NOR);
// 	printf("V: %s%d%s ", COL_YEL, cpu.v, COL_NOR);
// 	printf("L: %s%d%s ", COL_YEL, cpu.l, COL_NOR);
// 	printf("OP:  %s%x (%s)%s ", COL_YEL, cpu.ustate.op, ops[cpu.ustate.op << 1], COL_NOR);
// 	printf("I: %s%d%s ", COL_YEL, cpu.ustate.i, COL_NOR);
// 	printf("SKIP: %s%d%s ", COL_YEL, cpu.ustate.skip, COL_NOR);
// 	printf("INC: %s%d%s ", COL_YEL, cpu.ustate.inc, COL_NOR);
// 	printf("uADDR: %s%d%s\n", COL_YEL, cpu.ustate.uaddr, COL_NOR);
// 	printf("uPC: %s%06x%s ", COL_YEL, cpu.upc, COL_NOR);
// 	char s[MICROCODE_TOTALSIGS + 1];
// 	to_bin(cpu.control, s, MICROCODE_TOTALSIGS);
// 	printf("Control: %s%06x (%s)%s ", COL_YEL, cpu.control, s, COL_NOR);
	
// 	if(IS_R_DBUS(cpu.control)) printf("r_dbus ");
// 	if(IS_R_AGL(cpu.control)) printf("r_agl ");
// 	if(IS_R_PC(cpu.control)) printf("r_pc ");
// 	if(IS_R_DR(cpu.control)) printf("r_dr ");
// 	if(IS_R_AC(cpu.control)) printf("r_ac ");
// 	if(IS_R_CS1(cpu.control)) printf("r_cs1 ");
// 	if(IS_R_CS2(cpu.control)) printf("r_cs2 ");
// 	if(IS_ALU_ADD(cpu.control)) printf("alu_add ");
// 	if(IS_ALU_AND(cpu.control)) printf("alu_and ");
// 	if(IS_ALU_OR(cpu.control)) printf("alu_or ");
// 	if(IS_ALU_XOR(cpu.control)) printf("alu_xor ");
// 	if(IS_ALU_NOT(cpu.control)) printf("alu_not ");
// 	if(IS_ALU_ROLL(cpu.control)) printf("alu_roll ");
// 	if(IS_W_DBUS(cpu.control)) printf("(w_dbus) ");
// 	if(IS_W_AR(cpu.control)) printf("w_ar ");
// 	if(IS_W_PC(cpu.control)) printf("w_pc ");
// 	if(IS_W_IR(cpu.control)) printf("w_ir ");
// 	if(IS_W_DR(cpu.control)) printf("w_dr ");
// 	if(IS_W_AC(cpu.control)) printf("w_ac ");
// 	if(IS_IF3(cpu.control)) printf("if3 ");
// 	if(IS_IF4(cpu.control)) printf("if4 ");
// 	if(IS_IF5(cpu.control)) printf("if5 ");
// 	if(IS_IF6(cpu.control)) printf("if6 ");
// 	if(IS_IF7(cpu.control)) printf("if7 ");
// 	if(IS_IF8(cpu.control)) printf("if8 ");
// 	if(IS_IF9(cpu.control)) printf("if9 ");
// 	if(IS_IFV(cpu.control)) printf("ifv ");
// 	if(IS_IFL(cpu.control)) printf("ifl ");
// 	if(IS_IFZERO(cpu.control)) printf("ifzero ");
// 	if(IS_IFNEG(cpu.control)) printf("ifneg ");
// 	if(IS_IFROLL(cpu.control)) printf("ifroll ");
// 	if(IS_IFBRANCH(cpu.control)) printf("ifbranch ");
// 	if(IS_CPL(cpu.control)) printf("cpl ");
// 	if(IS_CLL(cpu.control)) printf("cll ");
// 	if(IS_STI(cpu.control)) printf("sti ");
// 	if(IS_CLI(cpu.control)) printf("cli ");
// 	if(IS_INCPC(cpu.control)) printf("inc_pc ");
// 	if(IS_STPDR(cpu.control)) printf("stp_dr ");
// 	if(IS_STPAC(cpu.control)) printf("stp_ac ");
// 	if(IS_DEC(cpu.control)) printf("dec ");
// 	if(IS_MEM(cpu.control)) printf("mem ");
// 	if(IS_IO(cpu.control)) printf("io ");
// 	if(IS_R(cpu.control)) printf("r ");
// 	if(IS_WEN(cpu.control)) printf("wen ");
// 	if(IS_END(cpu.control)) printf("end ");
// 	printf("\n");
// 	printf("\n");
// }


// /* Dump the state of the CPU on a single line. */
// void
// dump_mini(word oldpc)
// {
// 	static word oldoldpc = 0xffff;
// 	static word olda = 0xffff;
// 	static word olddr = 0xffff;
// 	static word oldip = 0xffff;
// 	static word oldpfa = 0xffff;
// 	const char * source = pasm_get(oldpc);
// 	const char * loc = map_get(oldpc);

// 	char buf0[4096];
// 	char buf1[4096];
// 	char buf2[4096];

// 	int pc_changed = (oldoldpc + 1) != oldpc;
// 	int a_changed = olda != cpu.a;
// 	int dr_changed = olddr != cpu.dr;
// 	int ip_changed = oldip != memory_read(REG_IP);
// 	int pfa_changed = oldpfa != memory_read(REG_PFA);
// 	oldoldpc = oldpc;
// 	olda = cpu.a;
// 	olddr = cpu.dr;
// 	oldip = memory_read(REG_IP);
// 	oldpfa = memory_read(REG_PFA);

// 	/* The address part of the dump */
// 	if (loc) {
// 		snprintf(buf2, sizeof(buf2), "%s:", loc);
// 		snprintf(buf0, sizeof(buf0), "%s%04x%s  %-20.20s %04x: ",
// 			 pc_changed ? COL_YEL ">" : COL_YEL " ",
// 			 oldpc, COL_NOR, buf2,
// 			 memory_read(oldpc));
// 	} else {
// 		snprintf(buf0, sizeof(buf0), "%s%04x%s  %04x: ",
// 			 pc_changed ? COL_YEL ">" : COL_YEL " ",
// 			 oldpc,
// 			 COL_NOR, memory_read(oldpc));
// 	}

// 	/* The register/info part of the dump */
// /*
// 	snprintf(buf1, sizeof(buf1), "%s%s%s%s%s%s %sA:%s%04x %sDR:%s%04x %s%s "
// 		 "[IP:%s%04x %s%s] [PFA:%s%04x %s%s] [t:%d.%03d us]",
// 		 cpu.v ? COL_GRE "V" COL_NOR : COL_NOR "-",
// 		 cpu.l ? COL_GRE "L" COL_NOR : COL_NOR "-",
// 		 cpu.n ? COL_GRE "N" COL_NOR : COL_NOR "-",
// 		 cpu.z ? COL_GRE "Z" COL_NOR : COL_NOR "-",
// 		 cpu.i ? COL_NOR "-" : COL_GRE "I" COL_NOR,
// 		 cpu.irq ? COL_NOR "-" : COL_GRE "Q" COL_NOR,
// 		 COL_NOR, a_changed? COL_YEL : "", cpu.a,
// 		 COL_NOR, dr_changed? COL_YEL : "", cpu.dr,
// 		 COL_NOR, cpu.irq ? "" : "IRQ",
// 		 ip_changed? COL_YEL : "", memory_read(REG_IP), map_get(memory_read(REG_IP)), COL_NOR,
// 		 pfa_changed? COL_YEL : "", memory_read(REG_PFA), map_get(memory_read(REG_PFA)), COL_NOR,
//                  cpu.tick / 4, (cpu.tick % 4) * 250
// 		);
// */
// 	snprintf(buf1, sizeof(buf1), "%s%s%s%s%s %sA:%s%04x %sDR:%s%04x %s%s "
// 		 "[IP:%s%04x %s%s]",
// 		 cpu.v ? COL_GRE "V" COL_NOR : COL_NOR "-",
// 		 cpu.l ? COL_GRE "L" COL_NOR : COL_NOR "-",
// 		 cpu.n ? COL_GRE "N" COL_NOR : COL_NOR "-",
// 		 cpu.z ? COL_GRE "Z" COL_NOR : COL_NOR "-",
// 		 cpu.i ? COL_NOR "-" : COL_GRE "I" COL_NOR,
// 		 //cpu.irq ? COL_NOR "-" : COL_GRE "Q" COL_NOR,
// 		 COL_NOR, a_changed? COL_YEL : "", cpu.a,
// 		 COL_NOR, dr_changed? COL_YEL : "", cpu.dr,
// 		 COL_NOR, cpu.irq ? "" : "\033[7m IRQ \033[0m",
// 		 ip_changed? COL_YEL : "", memory_read(REG_IP), map_get(memory_read(REG_IP)), COL_NOR
// 		);

// 	if (source == NULL) {
// 		info("%s%s%s %s%s%03x%s\t\t%s\n",
// 		     buf0, COL_NOR COL_MAG, ops[(cpu.ir >> 11) & 0x1f],
// 		     get_i(cpu.ir)? "I ": "",
// 		     get_r(cpu.ir)? "R ": "",
// 		     get_offset(cpu.ir), COL_NOR,
// 		     buf1);
// 	} else {
// 		info("%s%s%-60.60s  %s\n",
// 		     buf0,
// 		     COL_WHI, source,
// 		     buf1);
// 	}
// }

//
void
dump()
{
    fprintf(stderr, "dump(): not implemented\n");
    // dump_mini(0);
    // dump_state();
    // dump_ustate();
    // //dumpstack(0x500, 0x91, 0);
    // //dumpstack(0x600, 0x92, 1);
}


// void
// dumpmem(word addr, int count)
// {
// 	int columns = 0;
// 	for (; count > 0; count--, addr++, columns--) {
// 		if (!columns) {
// 			printf("\nD: %04x|  ", addr);
// 			columns = 8;
// 		}
// 		printf("%04x  ", memory_read(addr));
// 	}
// 	printf("\n");
// }


// void
// dumpstack(word addr, word sp, int usemap)
// {
// 	int i;
// 	sp = memory_read(sp);
// 	printf("DUMP STACK (base=&%04x, ptr=&%04x)\n", addr, sp);
// 	for (i = addr; i < sp; i++) {
// 		word x = memory_read(i);
// 		const char * loc = map_get(x);
// 		printf("\t%04x: %04x %6d ", i, x, x);
// 		if (usemap && (loc != NULL)) printf("(%s)  ", loc);
// 		printf("\n");
// 	}
// 	printf("\n");
// }


// uint32_t
// parity(uint32_t value)
// {
// 	// Taken from http://graphics.stanford.edu/~seander/bithacks.html#ParityLookupTable
// 	value ^= value >> 16;
// 	value ^= value >> 8;
// 	value ^= value >> 4;
// 	value &= 0xf;
// 	return (0x6996 >> value) & 1;
// }


// End of file.
// Local Variables:
// eval: (c-set-style "K&R")
// c-basic-offset: 4
// indent-tabs-mode: nil
// fill-column: 79
// End:
