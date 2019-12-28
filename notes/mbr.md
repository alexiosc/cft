# MBR register selection patterns

The register selection logic has become quite complicated with all the
different addresses that can select an MBR register.

For the address selector alone, there are seven SOIC packages and
counting and I'm running out of space on the BUS board. Pretty soon
the MBR will need a board of its own.

I'm also pushing the processor's timings with all this sequential
logic and I need 74xxx building blocks that are no longer available.

Also, 74x670 are now an unusual chip, and we need eight of them. Four
(8×8 bits) for the main bank, and another for the shadow copy queries
by the front panel. This is basically a triple port 64 byte RAM, where
one port is write-only and two are read-only.

So, try this plan:

* Replace the banks of 670s with one of the smallest/cheapest static
  RAM chips.
* Dump the front panel parts. The front panel can only read the
  current bank selected from the AR. To read all the MBRs, the
  processor should be halted and it can perform IN transactions.
* Consider using one of the original PAL/GAL/SPLDs (e.g. 22V10?) to
  select addresses.
  
This can reduce ~25 ICs to ~16 or better.


## Preconditions:

### MBR registers are never read from and written to at the same time

This is true as of the current implementation of the microcode
(version 7f). Reads and writes can happen in consecutive processor
cycles, though. E.g. the IRET instruction will address the stack
(reading the MBS register) and immediately afterwards, write to the
MBP register. Different ops, different registers, all within 250ns.

That shouldn't be a problem, given the MBR needs to respond to reads
and writes within 125–150ns anyway.

### The DFP will never need to read the whole set of registers while the processor is running

I can live with that and build functionality around this
limitation. Bank registers aren't displayed on the front panel
anyway. Just the *value* of the last used register is shown, which is
actually more convenient.


## Logic

What we need to generate:

* A 3-bit register address SEL₀–SEL₂.
* Read strobes.
* Write strobes.
* To connect the SRAM's bus to the right bus (IBUS, AEXT) depending on
  operation. AEXT should be the default because its timing is more
  critical.



| group | SYSDEV | AB        | R | W | RADDR | WADDR | IR              |   | ABSEL | ZEROSEL | WADDRSEL | IRSEL | RMBR | WMBR | SEL | IBUSEN | IBUSW |
|-------|--------|-----------|---|---|-------|-------|-----------------|---|-------|---------|----------|-------|------|------|-----|--------|-------|
| 1     | 0      | 0000 1aaa | 0 | x | xxxxx | xxxxx | xx xx xxxx xxxx |   | 0     |         |          |       | 0    | 1    | aaa | 0      | 1     |
| 1     | 0      | 0000 1aaa | x | 0 | xxxxx | xxxxx | xx xx xxxx xxxx |   | 0     |         |          |       | 1    | 0    | aaa | 0      | 0     |
|-------|--------|-----------|---|---|-------|-------|-----------------|---|-------|---------|----------|-------|------|------|-----|--------|-------|
| 2     | 1      | xxxx xxxx | x | x | 0110x | xxxxx | xx xx xxxx xxxx |   |       | 0       |          |       | 0    | 1    | 000 | 0      | 1     |
| 2     | 1      | xxxx xxxx | x | x | xxxxx | 0110x | xx xx xxxx xxxx |   |       | 0       |          |       | 1    | 0    | 000 | 0      | 0     |
|-------|--------|-----------|---|---|-------|-------|-----------------|---|-------|---------|----------|-------|------|------|-----|--------|-------|
| 3     | 1      | xxxx xxxx | x | x | xxxxx | 00100 | xx xx xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 000 | 1      | 1     |
| 3     | 1      | xxxx xxxx | x | x | xxxxx | 00101 | xx xx xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 001 | 1      | 1     |
| 3     | 1      | xxxx xxxx | x | x | xxxxx | 00110 | xx xx xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 010 | 1      | 1     |
|-------|--------|-----------|---|---|-------|-------|-----------------|---|-------|---------|----------|-------|------|------|-----|--------|-------|
| 4     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 0x xx xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 011 | 1      | 1     |
| 4     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 00 xx xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 011 | 1      | 1     |
| 4     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 00 0x xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 011 | 1      | 1     |
| 4     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 00 00 xxxx xxxx |   |       |         | 0        | 1     | 0    | 1    | 011 | 1      | 1     |
|-------|--------|-----------|---|---|-------|-------|-----------------|---|-------|---------|----------|-------|------|------|-----|--------|-------|
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x000 |   |       |         | 1        | 0     | 0    | 1    | 000 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x001 |   |       |         | 1        | 0     | 0    | 1    | 001 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x010 |   |       |         | 1        | 0     | 0    | 1    | 010 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x011 |   |       |         | 1        | 0     | 0    | 1    | 011 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x100 |   |       |         | 1        | 0     | 0    | 1    | 100 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x101 |   |       |         | 1        | 0     | 0    | 1    | 101 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x110 |   |       |         | 1        | 0     | 0    | 1    | 110 | 1      | 1     |
| 5     | 1      | xxxx xxxx | x | x | xxxxx | 00111 | 11 11 xxxx x111 |   |       |         | 1        | 0     | 0    | 1    | 111 | 1      | 1     |

Notes:

* All non-bussed signals are active low.
* ~FROM_AB: the MBR is accessed via a macrocode I/O space transaction. SEL comes from AB.
* ~IBUSEN: connect AEXT to IBUS.
* ~IBUSW: read from IBUS, write to MBR.
* Group 3, with WADDR = 001aa uses WADDR[1:0] to select one of the first four MBRs. These
  are the `write_ar_mbx` microcode addresses.
* Group 4/5 can also use the three bits IR[2:0] to select one of the MBRs when Zero Page is
  addressed in Indirect mode (relative to MBZ aka MB3).

Simpler equations: (warning: negative logic!)

* ~IBUSEN = ~FROM_AB or ~
* ~IBUSW = ~W
* ~RMBR = 
