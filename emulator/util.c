/* 
   
util.c - CFT emulator utilities

Copyright (C) 2011 Alexios Chouchoulas

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software Foundation,
Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>

#include "cftemu.h"

char *
to_bin(uint32_t n, char *s, int slen)
{
	uint32_t mask;
	int i = 0;
	s[slen] = 0;
	for (i = 0, mask = 1<<(slen - 1); mask > 0; mask >>= 1) {
		s[i++] = n & mask ? '1' : '0';
	}
	return s;
}

/* Dump state */
void
dump_state()
{
	//printf("t:   %luus (uaddr %d)\n", cpu.tick, cpu.ustate.uaddr);
	printf("IR:  %s%04x%s  (OP: %01x I: %01d R: %01d V: %03x) %s%s %s%s%03x%s",
	       COL_WHI, cpu.ir, COL_NOR,
	       get_op(cpu.ir), get_i(cpu.ir), get_r(cpu.ir), get_lo(cpu.ir),
	       COL_MAG, ops[get_op(cpu.ir)],
	       get_i(cpu.ir)? "I ": "",
	       get_r(cpu.ir)? "R ": "",
	       get_lo(cpu.ir), COL_NOR);
	printf("\n");
	printf("PC:  %s%04x%s  ", COL_WHI, cpu.pc, COL_NOR);
	printf("MAR: %s%04x%s  ", COL_WHI, cpu.mar, COL_NOR);
	printf("DR:  %s%04x%s  ", COL_WHI, cpu.dr, COL_NOR);
	printf("\n");
	printf("L,A: %s%d%04x%s  Flags: %s%s%s%s%s%s%s  ",
	       COL_WHI, cpu.l, cpu.a, COL_NOR,
	       COL_WHI,
	       cpu.v ? "V" : "v",
	       cpu.n ? "N" : "n",
	       cpu.z ? "Z" : "z",
	       cpu.i ? "I" : "i", /* I is active low */
	       cpu.irq ? "Q" : "q", /* So is IRQ */
	       COL_NOR);
	printf("\n");
	printf("IBUS: %s%04x%s  ", COL_GRE, cpu.ibus, COL_NOR);
	printf("DBUS: %s%04x%s  ", COL_GRE, cpu.dbus, COL_NOR);
	printf("\n");
	printf("0000: %s%04x%s  ", COL_GRE, cpu.mem[0], COL_NOR);
	printf("0001: %s%04x%s  ", COL_GRE, cpu.mem[0], COL_NOR);
	printf("0002: %s%04x%s  ", COL_GRE, cpu.mem[0], COL_NOR);
	printf("\n");
	printf("\n");
}


/* Dump micro state */ 
void
dump_ustate()
{
	printf("uSTATE:\n");
	printf("RST: %s%d%s ", COL_YEL, cpu.ustate.rst, COL_NOR);
	printf("INT: %s%d%s ", COL_YEL, cpu.ustate.int_, COL_NOR);
	printf("V: %s%d%s ", COL_YEL, cpu.v, COL_NOR);
	printf("L: %s%d%s ", COL_YEL, cpu.l, COL_NOR);
	printf("OP:  %s%x (%s)%s ", COL_YEL, cpu.ustate.op, ops[cpu.ustate.op], COL_NOR);
	printf("I: %s%d%s ", COL_YEL, cpu.ustate.i, COL_NOR);
	printf("SKIP: %s%d%s ", COL_YEL, cpu.ustate.skip, COL_NOR);
	printf("INC: %s%d%s ", COL_YEL, cpu.ustate.inc, COL_NOR);
	printf("uADDR: %s%d%s\n", COL_YEL, cpu.ustate.uaddr, COL_NOR);
	printf("uPC: %s%06x%s ", COL_YEL, cpu.upc, COL_NOR);
	char s[MICROCODE_TOTALSIGS + 1];
	to_bin(cpu.control, s, MICROCODE_TOTALSIGS);
	printf("Control: %s%06x (%s)%s ", COL_YEL, cpu.control, s, COL_NOR);
	
	if(IS_R_DBUS(cpu.control)) printf("r_dbus ");
	if(IS_R_AGL(cpu.control)) printf("r_agl ");
	if(IS_R_PC(cpu.control)) printf("r_pc ");
	if(IS_R_DR(cpu.control)) printf("r_dr ");
	if(IS_R_A(cpu.control)) printf("r_a ");
	if(IS_R_CS1(cpu.control)) printf("r_cs1 ");
	if(IS_R_CS2(cpu.control)) printf("r_cs2 ");
	if(IS_ALU_ADD(cpu.control)) printf("alu_add ");
	if(IS_ALU_AND(cpu.control)) printf("alu_and ");
	if(IS_ALU_OR(cpu.control)) printf("alu_or ");
	if(IS_ALU_XOR(cpu.control)) printf("alu_xor ");
	if(IS_ALU_NOT(cpu.control)) printf("alu_not ");
	if(IS_ALU_ROLL(cpu.control)) printf("alu_roll ");
	if(IS_W_DBUS(cpu.control)) printf("w_dbus ");
	if(IS_W_MAR(cpu.control)) printf("w_mar ");
	if(IS_W_PC(cpu.control)) printf("w_pc ");
	if(IS_W_IR(cpu.control)) printf("w_ir ");
	if(IS_W_DR(cpu.control)) printf("w_dr ");
	if(IS_W_A(cpu.control)) printf("w_a ");
	if(IS_IF3(cpu.control)) printf("if3 ");
	if(IS_IF4(cpu.control)) printf("if4 ");
	if(IS_IF5(cpu.control)) printf("if5 ");
	if(IS_IF6(cpu.control)) printf("if6 ");
	if(IS_IF7(cpu.control)) printf("if7 ");
	if(IS_IF8(cpu.control)) printf("if8 ");
	if(IS_IF9(cpu.control)) printf("if9 ");
	if(IS_IFROLL(cpu.control)) printf("ifroll ");
	if(IS_IFBRANCH(cpu.control)) printf("ifbranch ");
	if(IS_INC_A(cpu.control)) printf("inc_a ");
	if(IS_CPL(cpu.control)) printf("cpl ");
	if(IS_CLL(cpu.control)) printf("cll ");
	if(IS_STI(cpu.control)) printf("sti ");
	if(IS_CLI(cpu.control)) printf("cli ");
	if(IS_PC_INC(cpu.control)) printf("pc_inc ");
	if(IS_INC_DR(cpu.control)) printf("inc_dr ");
	if(IS_MEM(cpu.control)) printf("mem ");
	if(IS_IO(cpu.control)) printf("io ");
	if(IS_R(cpu.control)) printf("r ");
	if(IS_W(cpu.control)) printf("w ");
	if(IS_END(cpu.control)) printf("end ");
	printf("\n");
	printf("\n");
}


/* Dump the state of the CPU on a single line. */
void
dump_mini(word oldpc)
{
	static word oldoldpc = 0xffff;
	static word olda = 0xffff;
	static word olddr = 0xffff;
	static word oldip = 0xffff;
	static word oldpfa = 0xffff;
	const char * source = pasm_get(oldpc);
	const char * loc = map_get(oldpc);

	char buf0[4096];
	char buf1[4096];
	char buf2[4096];

	int pc_changed = (oldoldpc + 1) != oldpc;
	int a_changed = olda != cpu.a;
	int dr_changed = olddr != cpu.dr;
	int ip_changed = oldip != cpu.mem[0x91];
	int pfa_changed = oldpfa != cpu.mem[0x41];
	oldoldpc = oldpc;
	olda = cpu.a;
	olddr = cpu.dr;
	oldip = cpu.mem[0x91];
	oldpfa = cpu.mem[0x41];

	/* The address part of the dump */
	if (loc) {
		snprintf(buf2, sizeof(buf2), "%s:", loc);
		snprintf(buf0, sizeof(buf0), "%s%04x%s  %-20.20s %04x: ",
			 pc_changed ? COL_YEL ">" : COL_YEL " ",
			 oldpc, COL_NOR, buf2,
			 cpu.mem[oldpc]);
	} else {
		snprintf(buf0, sizeof(buf0), "%s%04x%s  %04x: ",
			 pc_changed ? COL_YEL ">" : COL_YEL " ",
			 oldpc,
			 COL_NOR, cpu.mem[oldpc]);
	}

	/* The register/info part of the dump */
	snprintf(buf1, sizeof(buf1), "%s%s%s%s%s%s %sA:%s%04x %sDR:%s%04x %s%s [IP:%s%04x%s %s] [PFA:%s%04x%s %s]",
		 cpu.v ? COL_GRE "V" COL_NOR : COL_NOR "-",
		 cpu.l ? COL_GRE "L" COL_NOR : COL_NOR "-",
		 cpu.n ? COL_GRE "N" COL_NOR : COL_NOR "-",
		 cpu.z ? COL_GRE "Z" COL_NOR : COL_NOR "-",
		 cpu.i ? COL_NOR "-" : COL_GRE "I" COL_NOR,
		 cpu.irq ? COL_NOR "-" : COL_GRE "Q" COL_NOR,
		 COL_NOR, a_changed? COL_YEL : "", cpu.a,
		 COL_NOR, dr_changed? COL_YEL : "", cpu.dr,
		 COL_NOR, cpu.irq ? "" : "IRQ",
		 ip_changed? COL_YEL : "", cpu.mem[0x91], COL_NOR, map_get(cpu.mem[0x91]),
		 pfa_changed? COL_YEL : "", cpu.mem[0x41], COL_NOR, map_get(cpu.mem[0x41])
		);

	if (source == NULL) {
		info("%s%s%s %s%s%03x%s\t\t%s\n",
		     buf0, COL_NOR COL_MAG, ops[get_op(cpu.ir)],
		     get_i(cpu.ir)? "I ": "",
		     get_r(cpu.ir)? "R ": "",
		     get_lo(cpu.ir), COL_NOR,
		     buf1);
	} else {
		info("%s%s%-60.60s  %s\n",
		     buf0,
		     COL_WHI, source,
		     buf1);
	}
}

/* Dump all state */
void
dump()
{
	dump_state();
	dump_ustate();
}


void
dumpmem(word addr, int count)
{
	int columns = 0;
	for (; count > 0; count--, addr++, columns--) {
		if (!columns) {
			printf("\nD: %04x|  ", addr);
			columns = 8;
		}
		printf("%04x  ", cpu.mem[addr]);
	}
	printf("\n");
}


void
dumpstack(word addr, int usemap)
{
	word sp = cpu.mem[addr];
        word numel = sp - addr - 2;
	word maxp = cpu.mem[addr + 1];
        if ((numel > maxp) || (numel > 100)) printf(COL_RED);
	else printf(COL_CYA);
        if (sp == 0x208) exit(1);
	printf("D: STACK %04x sp=%04x mp=%04x n=%-2hd |  ", addr, sp, maxp, numel);
	++addr;
	while (++addr < sp) {
		word x = cpu.mem[addr];
		const char * loc = map_get(x);
		printf("%04x ", x);
		if (loc != NULL) printf("(%s)  ", loc);
	}
	printf("\n");
}


/* End of file. */
