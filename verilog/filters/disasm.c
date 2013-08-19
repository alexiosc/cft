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
	"ISN",
	"LI",
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
	while(!feof(stdin))
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
				if (hx & 0x200) strcat(buf2, "IFL ");
				if (hx & 0x100) strcat(buf2, "IFV ");
				if (hx & 0x080) strcat(buf2, "CLA ");
				if (hx & 0x040) strcat(buf2, "CLL ");
				if (hx & 0x020) strcat(buf2, "NOT ");
				if (hx & 0x010) strcat(buf2, "INC ");
				if (hx & 0x008) strcat(buf2, "CPL ");
				if (hx & 0x007) {
					/* Decode rolls */
					strcat(buf2, roll[hx & 7]);
				}
			} else if (opcode == 13) {
				/* Decode OP2 */
				sprintf (buf2, "%s ", instr[opcode]);
				if (hx & 0x01f) {
					strcat(buf2, "skip:");
					/* Decode braches. */
					if (hx & 0x10) strcat(buf2, "!");
					if (hx & 0x8) strcat(buf2, "N");
					if (hx & 0x4) strcat(buf2, "Z");
					if (hx & 0x2) strcat(buf2, "L");
					if (hx & 0x1) strcat(buf2, "V");
					strcat(buf2, "?");
				}
				if (hx & 0x080) strcat(buf2, "CLA ");
				if (hx & 0x040) strcat(buf2, "CLI ");
				if (hx & 0x020) strcat(buf2, "STI ");
			} else {
				sprintf(buf2, "%s%s%s %03x",
					instr[opcode],
					(hx & (1 << 11)) ? " I" : "",
					(hx & (1 << 10)) ? " R" : "",
					hx & 0x3ff);
			}
			printf("%s\n", buf2);
			fflush(stdout);
		}
	}
 	return(0);
}
