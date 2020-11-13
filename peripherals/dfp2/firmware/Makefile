#!/usr/bin/make -f

###############################################################################
#
# THE DFP 2 FIRMWARE
#
###############################################################################

PROG	=	dfp

###############################################################################
#
# COMMON VARIABLES
#
###############################################################################

VERSION		=	2.0
THISYEAR	= 	"$(shell date +%Y)"

DEFINES		=	-DDEBUG
DEFINES		+=	-DVERSION='"$(VERSION) $(shell date +%Y-%m-%d)"'
DEFINES		+=	-DTHISYEAR='"$(shell date +%Y)"'
DEFINES		+=	-DBUFSIZE=$(BUFSIZE) -DBUFSIZE_S='"$(shell printf "%x\n" $(BUFSIZE))"'
DEFINES		+=	-DF_CPU=$(CPU_FREQ) -DF_CPU_S='"$(CPU_FREQ)"'
DEFINES		+=	-DSERIAL_BPS=$(SERIAL_BPS) -DSERIAL_BPS_S='"$(SERIAL_BPS)"'
DEFINES		+=	-D__DELAY_BACKWARD_COMPATIBLE__
DEFINES		+=	-DDISASSEMBLE
DEFINES		+=	-DDUMP_TEXT
#DEFINES	+=	-DLIGHT_MODULE_TESTING


###############################################################################
#
# AVR VARIABLES
#
###############################################################################

# Hint: to list MCU targets, change the name of MCU_TARGET to an invalid value.
#MCU_TARGET	=	atmega168
#MCU_TARGET	=	atmega328p
#MCU_TARGET     =	atmega128
MCU_TARGET     =	atmega64

#CPU_FREQ	=	1000000  # Hz (Factory default)
#CPU_FREQ	=	14745600 # Hz (DFP1, 14.7456 MHz crystal)
CPU_FREQ	=	16000000 # Hz (DFP2, 16.0 MHz crystal)

#SERIAL_BPS	= 	921600
#SERIAL_BPS	=	460800   # DFP1
#SERIAL_BPS	=	230400
#SERIAL_BPS	=	115200
#SERIAL_BPS	=	57600
#SERIAL_BPS	=	38400
#SERIAL_BPS	=	9600
#SERIAL_BPS	=	250000
SERIAL_BPS      =       500000   # DFP2

BUFSIZE		=	512

OPTIMIZE	=	-Os -mcall-prologues

AVRCFLAGS	+=	-DAVR
AVRCFLAGS	+=	-std=gnu99
#AVCRFLAGS	+=	-gstabs
#AVRCFLAGS	+=	-Wl,-static
AVRCFLAGS	+=	-fdata-sections
AVRCFLAGS	+=	-ffunction-sections
AVRCFLAGS	+=	-funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums
AVRCFLAGS	+=	-fno-inline-small-functions -fno-tree-scev-cprop -fno-split-wide-types
AVRCFLAGS	+=	-ffreestanding
AVRCFLAGS	+=	-finline-limit=5
#AVRCFLAGS	+=	-flto -fwhole-program
AVRCFLAGS	+=	-fverbose-asm
AVRCFLAGS	+=	$(DEFINES)

AVRLDFLAGS	+=	-Wl,-static -Wl,--gc-sections
#AVRLDFLAGS	+=	-Wl,-s
AVRLDFLAGS	+=	-fdata-sections
AVRLDFLAGS	+=	-ffunction-sections
AVRLDFLAGS	+=	-gdwarf-2 -Wl,--undefined=_mmcu,--section-start=.mmcu=0x910000



###############################################################################
#
# SIMAVR DEFINES (OBSOLETE)
#
###############################################################################

###############################################################################
#
# CFTEMU DEFINES
#
###############################################################################

EMULIBNAME	=	lib$(PROG)
EMULIBV1	=	2
EMULIBV2	=	0
EMULIBV3	=	1
EMULIBVERS	=	$(EMULIBV1).$(EMULIBV2).$(EMULIBV3)
EMULIBOUT	=	$(EMULIBNAME).so.$(EMULIBVERS)


LIBS		=

HFILES		=	dfp.h driver.h hwcompat.h proto.h output.h input.h \
			panel.h buscmd.h proto-cmds.h
# CFILES		=	dfp.c driver_test.c driver_avr.c proto.c output.c input.c \
# 			panel.c bus.c buscmd.c serial.c

# TODO: Adapt sources from above one by one.
CFILES		=	dfp.c serial.c proto.c output.c microcode_disassembly.c

#HFILES		=	serial.h hw.h proto.h utils.h
#CFILES		=	dfp.c serial.c hw.c proto.c utils.c
SOURCES		=	$(CFILES) $(HFILES)

DRIVER_AVR      =       driver_avr.c
DRIVER_CFTEMU   =       driver_cftemu.c

#TESTS		=	test_$(PROG)

AVRCC		=	avr-gcc
HOSTCC		=	gcc
HOSTDEFS	=	-DHOST -D_GNU_SOURCE
HOSTCFLAGS	=	-O2 -g -Wall $(HOSTDEFS) $(DEFINES) -fpack-struct=1 -std=c99 -Dasm=__asm

AVRDUDE		=	sudo avrdude -c avrisp2 -p $(MCU_TARGET) -P usb

# Override is only needed by avr-lib build system.

override CFLAGS =	-fpack-struct=1 -g -Wall \
				$(OPTIMIZE) -mmcu=$(MCU_TARGET) $(AVRCFLAGS)
override LDFLAGS =	-Wl,-Map,$(PROG).map $(AVRLDFLAGS)

OBJCOPY		=	avr-objcopy
OBJDUMP        	=	avr-objdump

SIMCFILES	=	simulate.c simulate_parts.c simulate_uart.c
SIMHFILES	=	simulate_parts.h simulate_uart.h

SIMAVRDIR	=	$(realpath ../../../external/simavr)
SIMAVRLIBS	=	-lsimavr -lelf -lpthread -lutil -lncurses
SIMAVRLIBDIR	=	$(SIMAVRDIR)/simavr/obj-$(shell arch)-linux-gnu/
SIMAVRFLAGS	+=	$(DEFINES) -DSIMAVR -g -Wall -std=gnu99 -O0 \
			-I$(SIMAVRDIR)/simavr/sim -I$(SIMAVRDIR)/examples/parts \
			-DMCU_TARGET='"$(MCU_TARGET)"' -DFIRMWARE='"$(PROG).elf"' \
			-L$(SIMAVRLIBDIR) $(SIMAVRLIBS) -Wl,-rpath,$(SIMAVRLIBDIR)

.PHONY:		all dep clean veryclean download verify reset test fuses sim lib

all: 		sim_$(PROG) $(PROG).elf lst text eeprom $(TESTS) $(EMULIBOUT)
#all: 		test_$(PROG)

dep .depends:   $(GENERATED)
		$(HOSTCC) $(HOSTCFLAGS) -M $(CFILES) >.depends

$(PROG).elf:	$(SOURCES) $(DRIVER_AVR)
		@/bin/echo -e "\033[7m  Compiling AVR Firmware  \033[0m\n"
		-@$(AVRCC) -S $(INCLUDES) $(CFLAGS) $(DEFINES) $(LDFLAGS) $(CFILES) $(DRIVER_AVR) $(LIBS)
		$(AVRCC) $(INCLUDES) $(CFLAGS) $(DEFINES) $(LDFLAGS) -o $@ $(CFILES) $(DRIVER_AVR) $(LIBS)
		@echo; avr-size -C --mcu=$(MCU_TARGET) $(PROG).elf

fuses:		.stamp-fuses

# Fuses for 64A (to double-check: http://eleccelerator.com/fusecalc/fusecalc.php?chip=atmega64)
# Changes from defaults:
# (a) set lfuse.CKSEL = 0000 (external clock)
# (b) set lfuse.SUT = 10 (wait for 64ms for clock to stabilise)

# .stamp-fuses:
# 		$(AVRDUDE) -s -u -v -U lfuse:w:0xff:m -U hfuse:w:0x99:m -U efuse:w:0xff:m

.stamp-fuses:
		$(AVRDUDE) -s -u -v -U lfuse:w:0xe0:m -U hfuse:w:0x99:m -U efuse:w:0xff:m

# Fuses for 168
#.stamp-fuses:
#		$(AVRDUDE) -U lfuse:w:0xff:m -U hfuse:w:0xdf:m -U efuse:w:0xf9:m

download:	.stamp-dl

.stamp-dl:	$(PROG).bin
		$(AVRDUDE) -U flash:w:$(PROG).bin
		touch $@

verify:		$(PROG).bin
		$(AVRDUDE) -U flash:v:$(PROG).bin

reset:		
		$(AVRDUDE) -v

# Special source files
proto-cmds.h:	proto-cmds.h.in scripts/mkcmds.py
		chmod +w proto-cmds.h
		scripts/mkcmds.py <proto-cmds.h.in >proto-cmds.h
		chmod a-w proto-cmds.h

# dependency:
#$(PROG).o: $(SOURCES)

# test test_$(PROG):	$(SOURCES) $(HFILES)
# 			@/bin/echo -e "\n\n***  Compiling Test Program  ***\n"
# 			rm -f test_$(PROG)
# 			$(HOSTCC) $(HOSTCFLAGS) -o test_$(PROG) $(CFILES)

sim_$(PROG):		$(SIMCFILES) $(SIMHFILES)
			@/bin/echo -e "\n\n***  Compiling SimAVR Harness  ***\n"
			rm -f sim_$(PROG)
			$(HOSTCC) -o sim_$(PROG) $(SIMCFILES) $(SIMAVRFLAGS)

sim:			sim_$(PROG) $(PROG).elf
			TERM=xterm-256color SIMAVR_UART_XTERM=1 ./sim_$(PROG) || true

clean:
	rm -f *.o $(PROG).elf $(PROG).axf *.eps *.png *.pdf *.bak *.s *.bin *.out *.srec *.hex
	rm -f *.lst *.map $(EXTRA_CLEAN_FILES) .stamp-dl uart[0-9].log log.out [hl]fuse
	rm -f $(EMULIBOUT) $(EMULIBNAME).so $(EMULIBNAME).so.$(EMULIBV1)

veryclean: clean
	rm -f $(PROG).bin $(PROG).hex $(PROG).srec \
		$(PROG)_eeprom.bin $(PROG)_eeprom.hex $(PROG)_eeprom.srec sim_$(PROG)

lst:  $(PROG).lst

$(PROG).lst: $(PROG).elf
	$(OBJDUMP) -l -h -w -f -S $< > $@

# Rules for building the .text rom images

text: hex bin srec

hex:  $(PROG).hex
bin:  $(PROG).bin
srec: $(PROG).srec

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.srec: %.elf
	$(OBJCOPY) -j .text -j .data -O srec $< $@

%.bin: %.elf
	$(OBJCOPY) -j .text -j .data -O binary $< $@

# Rules for building the .eeprom rom images

eeprom: ehex ebin esrec

ehex:  $(PROG)_eeprom.hex
ebin:  $(PROG)_eeprom.bin
esrec: $(PROG)_eeprom.srec

%_eeprom.hex: %.elf
	@$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@

%_eeprom.srec: %.elf
	@$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O srec $< $@ \

%_eeprom.bin: %.elf
	@$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O binary $< $@ \


###############################################################################
#
# THE CFTEMU VERSION
#
###############################################################################

# We build this as a library so cftemu doesn't have to deal with the minutiae.

###############################################################################
#
# THE DFP FIRMWARE FOR THE CFT EMULATOR
#
###############################################################################

# We build this as a library so cftemu doesn't have to deal with the
# minutiae. The emulator runs the whole thing in its own thread.

EMULIBSOURCES	=	driver_cftemu.c

lib \
$(EMULIBOUT): $(EMULIBSOURCES) $(CFILES) $(HFILES)
	@/bin/echo -e "\n\n\033[7m  Compiling CFT Emulator Firmware  \033[0m\n"
	$(HOSTCC) -I ../lib -DCFTEMU $(HOSTCFLAGS) $(HOSTLDFLAG) \
		-shared -fPIC -Wl,-soname,$(EMULIBNAME).so.$(EMULIBV1) \
		-o $@ $(EMULIBSOURCES) $(CFILES)
	ln -sf $@ $(EMULIBNAME).so
	ln -sf $@ $(EMULIBNAME).so.$(EMULIBV1)


###############################################################################
#
# DEPENDENCIES
#
###############################################################################

include .depends

# End of file.
