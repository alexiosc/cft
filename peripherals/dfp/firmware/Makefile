SERIAL_BPS	= 921600
#SERIAL_BPS	= 460800
#SERIAL_BPS	= 230400
#SERIAL_BPS	= 9600
VERSION		= 0.5
BUFSIZE		= 512
#CPU_FREQ	= 7372800 # Hz
CPU_FREQ	= 14745600 # Hz = 14.7456 MHz
#CPU_FREQ	= 1000000 # Hz (Factory default)

DEFINES		= -DDEBUG \
			-DVERSION=\"$(VERSION)\" \
			-DBUFSIZE=$(BUFSIZE) -DBUFSIZE_S=\"$(shell printf "%x\n" $(BUFSIZE))\" \
			-DF_CPU=$(CPU_FREQ) \
			-DSERIAL_BPS=$(SERIAL_BPS) -DSERIAL_BPS_S=\"$(SERIAL_BPS)\" \

PROG	= deb
#MCU_TARGET     = at90s2313
#MCU_TARGET     = at90s2333
#MCU_TARGET     = at90s4414
#MCU_TARGET     = at90s4433
#MCU_TARGET     = at90s4434
#MCU_TARGET     = at90s8515
#MCU_TARGET     = at90s8535
#MCU_TARGET     = atmega128
#MCU_TARGET     = atmega1280
#MCU_TARGET     = atmega1281
#MCU_TARGET     = atmega1284p
#MCU_TARGET     = atmega16
#MCU_TARGET     = atmega163
#MCU_TARGET     = atmega164p
#MCU_TARGET     = atmega165
#MCU_TARGET     = atmega165p
MCU_TARGET	= atmega168
#MCU_TARGET     = atmega169
#MCU_TARGET     = atmega169p
#MCU_TARGET     = atmega2560
#MCU_TARGET     = atmega2561
#MCU_TARGET     = atmega32
#MCU_TARGET     = atmega324p
#MCU_TARGET     = atmega325
#MCU_TARGET     = atmega3250
#MCU_TARGET     = atmega329
#MCU_TARGET     = atmega3290
#MCU_TARGET     = atmega48
#MCU_TARGET     = atmega64
#MCU_TARGET     = atmega640
#MCU_TARGET     = atmega644
#MCU_TARGET     = atmega644p
#MCU_TARGET     = atmega645
#MCU_TARGET     = atmega6450
#MCU_TARGET     = atmega649
#MCU_TARGET     = atmega6490
#MCU_TARGET     = atmega8
#MCU_TARGET     = atmega8515
#MCU_TARGET     = atmega8535
#MCU_TARGET     = atmega88
#MCU_TARGET     = attiny2313
#MCU_TARGET     = attiny24
#MCU_TARGET     = attiny25
#MCU_TARGET     = attiny26
#MCU_TARGET     = attiny261
#MCU_TARGET     = attiny44
#MCU_TARGET     = attiny45
#MCU_TARGET     = attiny461
#MCU_TARGET     = attiny84
#MCU_TARGET     = attiny85
#MCU_TARGET     = attiny861
OPTIMIZE	= -O2

#OPTFLAGS	= --param inline-call-cost=2 -finline-limit=3
OPTFLAGS	= -finline-limit=3

AVRCFLAGS	= -Wl,-static -fdata-sections -ffunction-sections -Wl,--gc-sections -Wl,-s \
			-funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums \
			$(OPTFLAGS) \
			-fno-inline-small-functions -fno-tree-scev-cprop -fno-split-wide-types \
			-ffreestanding
AVRLDFLAGS	= -Wl,-static -fdata-sections -ffunction-sections \
			-Wl,--gc-sections -Wl,-s

DEFS		=

# If you have a part with enough Flash memory, you can enable this to
#allow text dumps for interactive use.
DEFS += -DDUMP_TEXT

LIBS		=

HFILES		= i2cmaster.h serial.h hw.h proto.h utils.h
CFILES		= deb.c i2cmaster.c serial.c hw.c proto.c utils.c
SOURCES		= $(CFILES) $(HFILES)

TESTS		= test

CC		= avr-gcc
HOSTCC		= gcc
HOSTCFLAGS	= -O2 -g -Wall $(HOSTDEFS) -fpack-struct=1
HOSTDEFS	= -DHOST -D_GNU_SOURCE

AVRDUDE		= sudo avrdude -c avrisp2 -p $(MCU_TARGET) -P usb

# Override is only needed by avr-lib build system.

override CFLAGS        = -fpack-struct=1 -g -Wall \
				$(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS) $(AVRCFLAGS)
override LDFLAGS       = -Wl,-Map,$(PROG).map $(AVRLDFLAGS)

OBJCOPY        = avr-objcopy
OBJDUMP        = avr-objdump

.PHONY:		all dep download verify reset test

all: 		$(PROG).elf lst text eeprom # $(TESTS)

dep .depends:   $(GENERATED)
		$(CC) $(CFLAGS) -M *.c >.depends

$(PROG).elf:	$(SOURCES)
		$(CC) -S $(INCLUDES) $(CFLAGS) $(DEFINES) $(LDFLAGS) $(CFILES) $(LIBS)
		$(CC) $(INCLUDES) $(CFLAGS) $(DEFINES) $(LDFLAGS) -o $@ $(CFILES) $(LIBS)

download:	.stamp-dl

.stamp-dl:	$(PROG).bin
		$(AVRDUDE) -U flash:w:$(PROG).bin
		touch $@

verify:		$(PROG).bin
		$(AVRDUDE) -U flash:v:$(PROG).bin

reset:		
		$(AVRDUDE) -v

# dependency:
#$(PROG).o: $(SOURCES)

test:	deb.c
	$(HOSTCC) $(HOSTCFLAGS) -DTEST -o $@ $^

# test_led: led.c led.h led.c led.h
# 	$(HOSTCC) $(HOSTCFLAGS) -DTEST -DTEST_LED -o $@ $^

# test_serial: serial.c serial.h utils.c utils.h
# 	$(HOSTCC) $(HOSTCFLAGS) -DTEST -DTEST_SERIAL -o $@ $^

# test_xbee: xbee.c xbee.h serial.c serial.h utils.c utils.h
# 	$(HOSTCC) $(HOSTCFLAGS) -DTEST -DTEST_XBEE -o $@ $^

# test_protocol: protocol.c protocol.h serial.c serial.h utils.c utils.h
# 	$(HOSTCC) $(HOSTCFLAGS) -DTEST -DTEST_PROTOCOL -o $@ $^

#test_%: %.c %.h
#	$(HOSTCC) $(HOSTCFLAGS) -DTEST -o $@ $<

clean:
	rm -rf *.o $(PROG).elf *.eps *.png *.pdf *.bak *.s
	rm -rf *.lst *.map $(EXTRA_CLEAN_FILES) .stamp-dl
	rm -rf $(TESTS)

lst:  $(PROG).lst

%.lst: %.elf
	$(OBJDUMP) -h -S $< > $@

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
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@ \
	|| { echo empty $@ not generated; exit 0; }

%_eeprom.srec: %.elf
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O srec $< $@ \
	|| { echo empty $@ not generated; exit 0; }

%_eeprom.bin: %.elf
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O binary $< $@ \
	|| { echo empty $@ not generated; exit 0; }

# Every thing below here is used by avr-libc's build system and can be ignored
# by the casual user.

include .depends

# End of file.
