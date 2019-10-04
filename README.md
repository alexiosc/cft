


!(CFT Logo)[./documentation/logo/cft-logo-v2-banner-plain.svg]

# The CFT Home-Brew 16-bit Mini-Computer

The CFT is a home-designed, home-built mini-computer made from
scratch.

I've designed and built the instruction set, data path, processor,
computer, software stack, cross-assembler, emulator, software
toolchain and even some of the tools needed to do all this. You can
call this a ‘fantasy mini’.

This project has been going since approximately 2001, in my Copious
Free Time.


## Audience

There isn't one, so I couldn't tell you what it's like. This project
has been online since 2005 and it's been noticed by four or five
people. Not quite enough for statistics.

**This is a personal project, and the repository is made public as a
curiosity. Expect everything to be wrong, broken, or dangerous.**

## Why?

Because it's fun.

To see how it's done.

To recall Those Heady Times.

To prove to myself I can do this.


## What?

The CFT is a long-term project built in my Copious Free Time. (a term used, as
always, sarcastically, hence the name) It's a homebrew, self-designed,
self-built Sixties-style 16-bit mini computer built out of 74-family integrated
circuits. Check out the
[ChangeLog](https://github.com/alexiosc/cft/blob/master/Changelog) for the
current status.

There may possibly be more stuff to look at, at https://www.bedroomlan.org/cft.

The project consists of:

* The CFT processor.
* Peripherals and cards, some implementing extensions to the CFT instruction set.
* A front panel with blinkenlights.
* A case for the lot.
* Documentation for everything, including the website and this.
* A cross-toolchain for working on the computer from a PC.

### The CFT Processor

* A 4 MHz clock. (250ns processor cycle)
* 16-bit word length. No byte access.
* 24-bit memory address bus.
* 16-bit I/O bus shared with the address bus. (the lower 1,024 addresses are easier to use)
* All instructions are exactly one 16-bit word long.
* Some instructions follow the PDP-8 ‘microcoded’ format with bitfields cotrolling combinations of actions. Bitwise negation, two's complement negation and incrementation are the same instruction with slightly different options.
* A relatively simple instruction set inspired by the PDP-8. This has moved on
  to something slightly more reminiscent of a modern processor.
* Microcoded design.
* Accumulator based architecture.
* Four user-accessible 16-bit registers with increment and decrement. Only the
  Accumulator (AC) is general purpose.
* PDP-8 style magic addresses working like auto-increment or auto-decrement
  index registers, or stack pointers.

### Peripherals

I originally sat down with Eagle CAD and went *crazy* with it. I had 50 sheets
of schematics for boards, all with a three-letter designator:

* MEM: A memory board with 512 KWords of RAM and 512 KWords of ROM.
* TTY: A quadruple serial board including both DCE and DTE
  connections, and a TTL one for an FTDI USB adaptor.
* INT: 8-interrupt controller board.
* IDE: Twin IDE bus interface for up to four drives.
* RTC: A real-time card with some NVRAM and three or six programmable timers.
* ETH: An offloaded Ethernet interface using the WIZ812 chip.
* KBD: A PS/2 Keyboard interface in pure discrete logic.
* PSG: A sound board with one or two AY-3-8910 chips and a SpeakJet® speech synthesiser.
* PFP: A Programmer's Front Panel capable of debugging microcode as well as full machine code.
* DEB: A DEBugging card to help diagnose problems with the hardware
  using a remote controller. (this was basically a simple, slow, specialised logic analyser)
* FDC: A Floppy Drive Controller for up to four drives, including 8-inch 50-pin ones.
* GIO: General Purpose I/O board including some digital I/O, two
  Atari-style digital joystick ports, a unidirectional parallel
  printer port, four user-controllable LEDs on the front panel (the
  PFP already had 16) and (on a whim) a cassette tape interface.
* MBU: processor extension to allow 21-bit memory addressing (up to 2 MWords).
* µCB: processor extension to allow multiple versions of microcode to co-exist. (I had spare space in the Microcode ROMs)
* VDU: a graphics card that does text at 80×25 and 40×25, and graphics
  at combinations of 160, 320, 640 columns and 100, 200, 400 rows with
  64 colours.

The currently planned peripherals are much more modest in scope, but
they also morphed quite a bit. The processor can now do 24-bit
addressing natively, the current microcode uses all of the available
ROM space and a bunch of cards have joined forces. The current state
of affairs looks like this:

* MEM: (tentative design) 512 kWords or 1 MWord of RAM, 512 KWords of
  ROM. Multiple cards can be installed. If density allows, there'll be
  more chip sockets for RAM.
* INT: 8 interrupt controller board.
* DFP: a big card containing both a remote debugging system and front panel drivers.
* TTY: serial port card, possibly colocated with…
* IDE: one or two IDE sockets for two or four IDE drives. (or CF
  cards, but I like the possibility of having some clunky old drive)
* SND: MIDI sound output. Possibly collocated with…
* VDU: a graphics card that does text at 80×30 and 40×30, and graphics
  at combinations of 160, 320, 640 columns and 120, 240, 480 rows
  using 64 colours. The new VDU card fits inside a CPLD and also
  includes a PS/2 interface.
* RTC: Real-time clock, timers.

I've built the MEM and DFP boards to pre-2019 specs and the computer was
working on them.

The 2019 redesign goes for proper PCBs for everything, so things are
taking a little extra time.

### Front Panel

I was really proud of the front panel before the 2019 redesign, it
worked great and showed the computer's entire status. There's support
for up to 160 lights, 31 switches and two keylocks for that PDP-8
feel.

The downside was the wiring: there were no fewer than *five* 50-wire
ribbon cables going to this crazy bastard.

The 2019 redesign keeps the layout, but can no longer display as much
of the computer's status on the front panel. I'm working on it. On the
upside, it now serialises data transmission and only a single 40-pin
cable is needed.

To cut costs, the original front panel was made out of eight modules,
each with up to 20 LEDs. The new front panel is made out of four
modules, each with up to 40 LEDs. Each module daisy-chains to the
next.

Switches are mounted on a separate plate and wired to a break-out
board, or the closest front panel modules on the 2019 version.


### The Case

Two words: wood paneling. Well, and a black acrylic front piece. The
rest will depend on how big the card cage gets, but I'll scratch make
the case out of sheet aluminium and wood.


### Documentation

There's just too much of it. The documentation was initially in LaTeX
and got up to 500 pages before I gave that up and started converting
it to HTML.

The 2019 redesign will need a redo of most of this, sadly, but the
current documents for hardware that's currently around are available
at https://www.bedroomlan.org/hardware/cft/book/.


### Software and Hardware Tools

I had to make my own tools for some of this, and *wanted* to make my
own for some other parts.

Hardware tools include
[Flashprog](https://www.bedroomlan.org/hardware/flashprog/), a
zero-parts flash programmer with a modern serial interface. The
interface formed the basis of the DEB and DFP cards' remote debugging
interface and I'm quite happy with it.

Software tools include:

*  The [Microcode Assembler](https://www.bedroomlan.org/projects/mcasm/),
   also available on Github as https://github.com/alexiosc/mcasm.
*  The CFT Assembler, written purely in Python and roughly based on
   PDP-8 Assemblers, but with some modern extras like namespaces and
   simple macros.
*  Too many emulators to speak of!
   * A basic microcode-level emulator in Python to verify the original
          design. This one is dead and buried, but still in the repository.
   * A Verilog emulator used to verify the hardware.
   * A C emulator that's fast enough to run software on.
   * A [Javascript microcode-level emulator](https://www.bedroomlan.org/hardware/cft/microcode-emulator/)
          that runs on the web. It's very slow, but it shows how the front
          panel works.
   * A newer JS-based emulator meant to me much faster. Still
          largely in the works, because I prefer the C-based emulator for
          testing.
* A testing framework that can run test suites on any emulator we can use.
* A basic Operating System for the CFT.
* A self-documenting Forth interpreter written in Assembly and Forth.
