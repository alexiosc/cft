#include <stdio.h>
#include <string.h>

char *col[] = {
	"",
	"?red4?",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"?cyan4?",
	"?green4?",
	"",
	"",
};

char *instr[] = {
	"TRAP",
	"IOT",
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
	"OP1",
	"OP2",
	"ISZ",
	"LI",
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
			unsigned int hx;
			//, opcode;
			sscanf(buf, "%x", &hx);
			buf2[0] = '\0';

			/* RIVLOOOOISIAAAA          */
			/* -----------------------  */
			/* 123456789abcdeR = >>14 */
			/*  123456789abdI = >>13   */
			/*  123456789abV = >>12   */
			/*  123456789abL = >>11   */
			/*   1234567OOOO = >>7    */
			/*       123456I = >>6    */
			/*        12345S = >>5    */
			/*         1234I = >>4    */
			/*          xxxx = & 0xf  */

			//opcode = (hx >> 12) & 0xf;
			int rst = (hx >> 14) & 1;
			int irq = (hx >> 13) & 1;
			int v = (hx >> 12) & 1;
			int l = (hx >> 11) & 1;
			sprintf(buf2, "%sUCB:%x RST:%d IRQ:%d V:%d L:%d OP:%s I:%d SKIP:%d INC:%d uA:%d ",
				(rst == 0) ? "?red4?" : (irq == 0) ? "?magenta4?" : col[(hx >> 7) & 0xf],
				(hx >> 14) & 0xf,
				rst,
				irq,
				v,
				l,
				instr[(hx >> 7) & 0xf],
				(hx >> 6) & 1,
				(hx >> 5) & 1,
				(hx >> 4) & 1,
				hx & 0xf);

			printf("%s\n", buf2);
			fflush(stdout);
		}
	}
 	return(0);
}
