#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include "../../microcode/build/microcode.h"

#define add(t,s) { \
		if(t[0] && s[0]) {		\
			strcat(t," ");		\
		}				\
		strcat(t,s);			\
	}

int main(int argc, char **argv)
{
	while(!feof(stdin))
	{
		char buf[1025], buf2[1025], col[1024];
		buf[0] = 0;
		col[0] = 0;
		if (fscanf(stdin, "%s", buf) != 1) continue;
		if(buf[0]) {
			unsigned int hx;
			sscanf(buf, "%x", &hx);
			buf2[0] = '\0';

			if (IS_READ_CS0(hx)) add(buf2, "read-cs0");
			if (IS_READ_CS1(hx)) add(buf2, "read-cs1");
			if (IS_READ_CS2(hx)) add(buf2, "read-cs2");
			if (IS_READ_CS3(hx)) add(buf2, "read-cs3");
			if (IS_READ_PC(hx)) add(buf2, "read-pc");
			if (IS_READ_DR(hx)) add(buf2, "read-dr");
			if (IS_READ_AC(hx)) add(buf2, "read-ac");
			if (IS_READ_SP(hx)) add(buf2, "read-sp");
			if (IS_READ_AGL(hx)) add(buf2, "read-agl");
			if (IS_READ_ALU_ADD(hx)) add(buf2, "read-alu-add");
			if (IS_READ_ALU_AND(hx)) add(buf2, "read-alu-and");
			if (IS_READ_ALU_OR(hx)) add(buf2, "read-alu-or");
			if (IS_READ_ALU_XOR(hx)) add(buf2, "read-alu-xor");
			if (IS_READ_ALU_NOT(hx)) add(buf2, "read-alu-not");
			if (IS_READ_ALU_Y(hx)) add(buf2, "read-alu-y");
			if (IS_READ_ALU_B(hx)) add(buf2, "read-alu-b");
			if (IS_READ_MBN(hx)) add(buf2, "read-mbn");
			if (IS_READ_MBP(hx)) add(buf2, "read-mbp");
			if (IS_READ_CTX(hx)) add(buf2, "read-ctx");
			if (IS_READ_CTX_FLAGS(hx)) add(buf2, "read-ctx+flags");
			//if (IS_READ_FLAGS(hx)) add(buf2, "read-flags");
			
			if (IS_WRITE_AR_MBP(hx)) add(buf2, "write-ar-mbp");
			if (IS_WRITE_AR_MBD(hx)) add(buf2, "write-ar-mbd");
			if (IS_WRITE_AR_MBS(hx)) add(buf2, "write-ar-mbs");
			if (IS_WRITE_AR_MBZ(hx)) add(buf2, "write-ar-mbz");
			if (IS_WRITE_PC(hx)) add(buf2, "write-pc");
			if (IS_WRITE_DR(hx)) add(buf2, "write-dr");
			if (IS_WRITE_AC(hx)) add(buf2, "write-ac");
			if (IS_WRITE_SP(hx)) add(buf2, "write-sp");
			if (IS_WRITE_IR(hx)) add(buf2, "write-ir");
			if (IS_WRITE_ALU_B(hx)) add(buf2, "write-alu-b");
			if (IS_WRITE_MBN(hx)) add(buf2, "write-mbn");
			if (IS_WRITE_MBP(hx)) add(buf2, "write-mbp");
			if (IS_WRITE_CTX(hx)) add(buf2, "write-ctx");
			if (IS_WRITE_CTX_FLAGS(hx)) add(buf2, "write-ctx+flags");
			if (IS_WRITE_FLAGS(hx)) add(buf2, "write-flags");

			if (IS_IF_IR0(hx)) add(buf2, "if-ir0");
			if (IS_IF_IR1(hx)) add(buf2, "if-ir1");
			if (IS_IF_IR2(hx)) add(buf2, "if-ir2");
			if (IS_IF_IR3(hx)) add(buf2, "if-ir3");
			if (IS_IF_IR4(hx)) add(buf2, "if-ir4");
			if (IS_IF_IR5(hx)) add(buf2, "if-ir5");
			if (IS_IF_IR6(hx)) add(buf2, "if-ir6");
			if (IS_IF_V(hx)) add(buf2, "if-v");
			if (IS_IF_L(hx)) add(buf2, "if-l");
			if (IS_IF_Z(hx)) add(buf2, "if-z");
			if (IS_IF_N(hx)) add(buf2, "if-n");
			if (IS_IF_BRANCH(hx)) add(buf2, "if-branch");

			if (IS_ACTION_CPL(hx)) add(buf2, "cpl");
			if (IS_ACTION_CLL(hx)) add(buf2, "cll");
			if (IS_ACTION_STI(hx)) add(buf2, "sti");
			if (IS_ACTION_CLI(hx)) add(buf2, "cli");
			if (IS_ACTION_IDX(hx)) add(buf2, "idx");
			if (IS_ACTION_SRU(hx)) add(buf2, "sru");

			if (IS_ACTION_INCPC(hx)) add(buf2, "pc++");
			if (IS_ACTION_INCDR(hx)) add(buf2, "dr++");
			if (IS_ACTION_DECDR(hx)) add(buf2, "dr--");
			if (IS_ACTION_INCAC(hx)) add(buf2, "ac++");
			if (IS_ACTION_DECAC(hx)) add(buf2, "ac--");
			if (IS_ACTION_INCSP(hx)) add(buf2, "sp++");
			if (IS_ACTION_DECSP(hx)) add(buf2, "sp--");

			if (IS_MEM(hx)) add(buf2, "mem");
			if (IS_IO(hx)) add(buf2, "io");
			if (IS_REN(hx)) {
				strcpy(col, "?green4?");
				add(buf2, "ren");
			}
			if (IS_WEN(hx)) {
				strcpy(col, "?orange4?");
				add(buf2, "wen");
			}
			if (IS_END(hx)) {
				strcpy(col, "?cyan4?");
				add(buf2, "end");
			}
			
			if (!buf2[0]) add(buf2, "?blue4?idle");
			printf("%s%s\n", col, buf2);
			fflush(stdout);
		}
	}
	return(0);
}
