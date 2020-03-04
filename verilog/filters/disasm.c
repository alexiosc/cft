#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define bool unsigned char
#define __instruction_set_t instruction_t

#include "../../microcode/build/disasm.h"

char * bin(int x, uint8_t numbits)
{
	static char res [16];
	char *cp = res;
	for (int i = 0x8000; i; i>>=1) {
		*cp++ = (x & i) ? '1': '0';
	}
	*cp = 0;
	if (numbits < 0 || numbits > 16) numbits = 16;
	return numbits > 16 ? &res[16 - numbits] : res;
}

int main(int argc, char **argv)
{
	int i;

        // Store offsets in the instruction set table to the first instruction
        // (by top nibble). Any instructions not used (e.g. instruction 0xb)
        // will have an index of -1. This speeds up lookups by a maximum factor
        // of 16.
	int offsets[16] = { -1, -1, -1, -1, -1, -1, -1, -1,
			    -1, -1, -1, -1, -1, -1, -1, -1 };
	for (i = NUM_INSTRUCTIONS - 1; i >= 0; i--) {
		offsets[(instruction_set[i].instr >> 12) & 0xf] = i;
	}

	// Next, get our personality. The method is a little naïve, but it
	// works.
	int full_dis = strstr(argv[0], "_ir10") == NULL;

	while(!feof(stdin))
	{
		char buf[1025];
		buf[0] = 0;
		if (fscanf(stdin, "%s", buf) != 1) continue;
		if(buf[0]) {
			unsigned int hx;
			sscanf(buf, "%x", &hx);

			int i = offsets[(hx >> 12) & 0xf];

			// The easy work first
			if (i < 0) {
				printf("?red4?%04x\n", hx);
				fflush(stdout);
				continue;
			}

			// Okay, now we search.
			while (instruction_set[i].mnemonic != NULL) {
				instruction_t * instr = &instruction_set[i];
				if ((hx & instr->instr_mask) ==  instr->instr) {
					if (full_dis) {
						if (instr->bitmap) {
							// Not really properly implemented, so red colour
							printf("?red4?%s %s\n", instr->mnemonic, bin(hx, 7));
						} else {
							switch (instr->operand_mask) {
							case 0:
								// No operand
								printf("%s\n", instr->mnemonic);
								break;
								
							case 0xf:
								// Mostly used for rolls, so use integers
								printf("%s %d\n", instr->mnemonic, hx & 0xf);
								break;
								
							default:
								// software interrupt operand
								printf("%s &%x\n", instr->mnemonic, hx & instr->operand_mask);
								break;
							}
						}
					} else {
						// Simple disassembly, just the instruction
						printf("%s\n", instr->mnemonic);
					}
					fflush(stdout);
					goto nextline;
				}
				i++;
			}
			printf("?red4?%04x\n", hx);
			fflush(stdout);
			continue;
			
			// if (!full_dis) {
			// 	printf("%s%s%s %03x\n",
			// 	       operand_colours[(hx >> 10) & 3],
			// 	       (hx & (1 << 11)) ? " I" : "",
			// 	       (hx & (1 << 10)) ? " R" : "",
			// 	       hx & 0x3ff);
			// 	fflush(stdout);
			// 	continue;
			// }

			// // Full disassembly
			// if (opcode == 12) {
			// 	sprintf (buf2, "%s ", instr[opcode]);
			// 	if (hx & 0x200) strcat(buf2, "IFL ");
			// 	if (hx & 0x100) strcat(buf2, "IFV ");
			// 	if (hx & 0x080) strcat(buf2, "CLA ");
			// 	if (hx & 0x040) strcat(buf2, "CLL ");
			// 	if (hx & 0x020) strcat(buf2, "NOT ");
			// 	if (hx & 0x010) strcat(buf2, "INC ");
			// 	if (hx & 0x008) strcat(buf2, "CPL ");
			// 	if (hx & 0x007) {
			// 		/* Decode rolls */
			// 		strcat(buf2, roll[hx & 7]);
			// 	}
			// } else if (opcode == 13) {
			// 	/* Decode OP2 */
			// 	sprintf (buf2, "%s ", instr[opcode]);
			// 	if (hx & 0x01f) {
			// 		strcat(buf2, "skip:");
			// 		/* Decode braches. */
			// 		if (hx & 0x10) strcat(buf2, "!");
			// 		if (hx & 0x8) strcat(buf2, "N");
			// 		if (hx & 0x4) strcat(buf2, "Z");
			// 		if (hx & 0x2) strcat(buf2, "L");
			// 		if (hx & 0x1) strcat(buf2, "V");
			// 		strcat(buf2, "?");
			// 	}
			// 	if (hx & 0x080) strcat(buf2, "CLA ");
			// 	if (hx & 0x040) strcat(buf2, "CLI ");
			// 	if (hx & 0x020) strcat(buf2, "STI ");
			// } else {
			// 	sprintf(buf2, "%s%s%s %03x",
			// 		instr[opcode],
			// 		(hx & (1 << 11)) ? " I" : "",
			// 		(hx & (1 << 10)) ? " R" : "",
			// 		hx & 0x3ff);
			// }
			// printf("%s\n", buf2);
			// fflush(stdout);
		}

	nextline:;
	}
 	return(0);
}
