#include <stdio.h>
#include <string.h>

char *instr[] = {
	"TRAP",
	"?red4?XXX",
	"LOAD",
	"STORE",
	"IN",
	"OUT",
	"JMP",
	"JSR",
	"ADD",
	"AND",
	"OR",
	"XOR",
	"?cyan4?OP1",
	"?magenta4?OP2",
	"?red4?XXX",
	"LI",
};

char *branch[] = {
	"NOP ",			/* 0000 */
	"L=1? ",		/* 0001 */
	"A=0? ",		/* 0010 */
	"A=0 | L=1? ",		/* 0011 */
	"A<0? ",		/* 0100 */
	"A<0 | L=1? ",		/* 0101 */
	"A<=0? ",		/* 0110 */
	"A<0 | L=1?",		/* 0111 */
	"SKIP ",		/* 1000 */
	"L=0? ",		/* 1001 */
	"A!=0? ",		/* 1010 */
	"A!=0 & L=0? ",		/* 1011 */
	"A>=0? ",		/* 1100 */
	"A>=0 & L=0? ",		/* 1101 */
	"A>0? ",		/* 1110 */
	"A>0 & L=0?"		/* 1111 */
};

char *roll[] = {
	"",			/* 000 */
	"RBR ",			/* 001 */
	"RBL ",			/* 010 */
	"ROLL3? ",		/* 011 */
	"ROLL4? ",		/* 100 */
	"RNR ",			/* 101 */
	"RNL ",			/* 110 */
	"ROLL7? "		/* 111 */
};

char * bin(int x)
{
	static char res [16];
	int i;
	for (i = 9; i >= 0; i--) {
		res[9-i] = (x & (1<<i)) ? '1': '0';
	}
	res[10] = 0;
	return res;
}

int main(int argc, char **argv)
{
	while(1)
	{
		char buf[1025], buf2[1025];
		buf[0] = 0;
		fscanf(stdin, "%s", buf);
		if(buf[0]) {
			unsigned int hx, opcode;
			sscanf(buf, "%x", &hx);
			buf2[0] = '\0';
			opcode = (hx >> 12) & 0xf;
			if (opcode == 12) {
				sprintf (buf2, "%s ", instr[opcode]);
				if (hx & 0x200) strcat(buf2, "CLA ");
				if (hx & 0x100) strcat(buf2, "CLL ");
				if (hx & 0x080) strcat(buf2, "NOT ");
				if (hx & 0x040) strcat(buf2, "INC ");
				if (hx & 0x020) strcat(buf2, "CPL ");
				if (hx & 0x007) {
					/* Decode rolls */
					strcat(buf2, roll[hx & 7]);
				}
				if (hx & 0x008) strcat(buf2, "HALT ");
			} else if (opcode == 13) {
				/* Decode OP2 */
				sprintf (buf2, "%s ", instr[opcode]);
				if (hx & 0x200) strcat(buf2, "LPG ");
				if (hx & 0x100) strcat(buf2, "SPG ");
				if (hx & 0x080) strcat(buf2, "CPG ");
				if (hx & 0x00f) {
					/* Decode braches. */
					strcat(buf2, branch[hx & 0xf]);
				}
				if (hx & 0x040) strcat(buf2, "CLA2 ");
				if (hx & 0x020) strcat(buf2, "CLI ");
				if (hx & 0x010) strcat(buf2, "CPI ");
			} else {
				sprintf(buf2, "%s%s%s %03x",
					instr[opcode],
					(hx & (1 << 11)) ? " I" : "",
					(hx & (1 << 10)) ? "" : " R",
					hx & 0x3ff);
			}
			printf("%s\n", buf2);
			fflush(stdout);
		}
	}
 	return(0);
}
