NAME	=	libdfp
LIBV1	=	1
LIBV2	=	0
LIBV3	=	1
LIBVERS	=	$(LIBV1).$(LIBV2).$(LIBV3)
OUT	=	$(NAME).so.$(LIBVERS)
#OBJS	=	proto.o input.o output.o driver_cftemu.o buscmd.o
#OBJS	=	driver_cftemu.o

VERSION	=	1.2
BUFSIZE =	512

CFLAGS 	+=	-fPIC -DCFTEMU $(DEFINES) -Wall -pedantic
CFLAGS	+=	-std=c99 -D_GNU_SOURCE -fgnu89-inline

# LDFLAGS +=	-lpthread

DEFINES +=	-DDEBUG
DEFINES +=	-DDISASSEMBLE
DEFINES +=	-DVERSION='"$(VERSION) $(shell date +%Y-%m-%d)"'
DEFINES +=	-DBUFSIZE=$(BUFSIZE) -DBUFSIZE_S='"$(shell printf "%x\n" $(BUFSIZE))"'
DEFINES +=	-DF_CPU=$(CPU_FREQ) -DF_CPU_S='"$(CPU_FREQ)"'
DEFINES +=	-DSERIAL_BPS=$(SERIAL_BPS) -DSERIAL_BPS_S='"$(SERIAL_BPS)"'


.PHONEY: all clean

all:	$(OUT)

clean:	
	rm -f *.o $(OUT)

$(OUT): $(OBJS)
	$(CC) $(LDFLAGS) -shared -fPIC -Wl,-soname,libdfp.so.1 -o $@ $^
	-ln -sf $@ $(NAME).so
	-ln -sf $@ $(NAME).so.$(LIBV1)
