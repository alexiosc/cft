#include <stdio.h>
#include <string.h>

char *to_unit[8] = {
	"", "dbus=", "mar=", "pc=", "ir=", "dr=", "a=", "b="
};
char *from_unit[16] = {
	"", "", "agl", "pc", "dr", "a", "?", "?", "add", "and", "or", "xor", "roll", "not",
	"cs1", "cs2"
};
char *skip_unit[] = {
	"", "if3", "if4", "if5", "if6", "if7", "if8", "if9", /* 0-7 */
	"", "", "ifv", "ifl", /* 8-11 */
	"ifz", "ifn", "ifroll", "ifbranch" /* 12-15 */
};

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
		fscanf(stdin, "%s", buf);
		if(buf[0]) {
			unsigned int hx;
			sscanf(buf, "%x", &hx);
			buf2[0] = '\0';
			if (feof(stdin)) return 0;

			add(buf2, to_unit[(hx >> 4) & 7]);
			strcat(buf2, from_unit[hx & 15]);
			if ((hx & (1<<19)) == 0) add(buf2, "mem");
			if ((hx & (1<<20)) == 0) add(buf2, "io");

			if ((hx & (1<<11)) == 0) add(buf2, "cpl");
			if ((hx & (1<<12)) == 0) add(buf2, "cll");
			if ((hx & (1<<13)) == 0) add(buf2, "sti");
			if ((hx & (1<<14)) == 0) add(buf2, "cli");

			if ((hx & (1<<15)) == 0) add(buf2, "pc++");
			if ((hx & (1<<16)) == 0) add(buf2, "step_ac");
			if ((hx & (1<<17)) == 0) add(buf2, "step_dr");
			/*if ((hx & (1<<18)) == 0) add(buf2, "dr--");*/
			if ((hx & (1<<21)) == 0) {
				strcpy(col, "?green4?");
				add(buf2, "r");
			}
			if ((hx & (1<<22)) == 0) {
				strcpy(col, "?orange4?");
				add(buf2, "w");
			}

			add(buf2, skip_unit[(hx >> 7) & 15]);

			if ((hx & (1<<23)) == 0) {
				strcpy(col, "?cyan4?");
				add(buf2, "end");
			}
			/*if ((hx & (1<<23)) == 0) add(buf2, "halt");*/
			
			if (!buf2[0]) add(buf2, "?red4?wait");
			printf("%s%s\n", col, buf2);
			fflush(stdout);
		}
	}
	return(0);
}
