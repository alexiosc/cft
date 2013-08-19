CC	=	gcc
CFLAGS	=	-Wall -pedantic -O3 -s -std=c99

.PHONY: 	all clean veryclean mrproper

all:		control disasm uaddr

clean:
		rm -f *.o

veryclean:	clean

mrproper:	veryclean
		rm -f *~
