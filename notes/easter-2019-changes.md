## Architecture

### Buses

* 24-bit address bus. Upgraded from 16 bits (and from 21 bits with SMB).
* 16-bit data bus.

### Registers

* PC
* AC
* DR
* Flags
* 8×8-bit bank registers for extending addresses.

### Memory Bank Registers

* MB0: code executes using this.
* MB1: call stack pointer.
* MB2: memory reads (also page zero offset).
* MB3–7: user defined.

8-bit address extension. 16 MW total memory space.

* Switch to 1 MW RAM chips, up to 4 per card. We'll never need all of them.
* Allow some devices to be memory mapped. E.g. VDU card should be
  memory mapped too. It'll just take one 64 KW bank anyway.


### I/O Space Mapped stuff

A number of units can me moved from microcode to I/O space.

* The bank registers (already there!)
* The SBL minor instructions (use an IN or OUT, not IOT, but modify microcode)
* It would be great if we could do the same for the ALU. ALU unary ops
  can move to I/O space, but not binary ones.
* Load flags (L & V currently. Popping the AC from stack restores N & Z).
* Store flags (L & V currently. Popping the AC from stack restores N & Z).


### Magic Page Zero locations

Magic addresses:

* Some auto-increment
* Some auto-decrement
* Some index based on MB0–MB7.
* Partial overlap of each group.

Current scheme:

* &0080–&00FF: autoindex

Suggested scheme:

* &0000–&003F: page zero ‘registers’.
* &0040–&0080: indexes. &0041 is the Call stack pointer.
* &0080–&00BF: auto-increment.
* &00C0–&00FF: auto-decrement.
* &0b100—&01FF: clear interrupt flag if LJMP I x involves an address in
  this range. No effect on other instructions.

### Boot Vectors

Boot vector &FF:FFF8?
Interrupt vector &FF:FFF0?

If &FF is used, ROM must be mapped *downwards* from bank &ff. But,
really, who cares? We're only ever going to have one ROM bank.


## Microcode


* Add `r_mem` to perform a memory read cycle.
* Add `r_io` to perform an I/O read cyrle.
* Add `w_mem` to perform a memory write cycle.
* Add `w_io` to perform an I/O write cycle.


## Instruction Set

### Issue One: long jumps & re-entrancy

To support both long jumps and re-entrancy, RET can no longer be an
alias of JMP. We need short and long returns with actual
microprograms.

| Instruction | Needs I | Notes                     |
|-------------|---------|---------------------------|
| TRAP        |         | Replace with LJMP or LJSR |
| TRAP I      |         | Replace with LJMP or LJSR |
| IOT         |         |                           |
| IOT I       |         |                           |
| LOAD        |         |                           |
| LOAD I      |         |                           |
| STORE       |         |                           |
| STORE I     |         |                           |
| IN          |         |                           |
| IN I        |         |                           |
| OUT         |         |                           |
| OUT I       |         |                           |
| JMP         |         |                           |
| JMP I       |         |                           |
| ADD         |         |                           |
| ADD I       |         |                           |
| AND         |         |                           |
| AND I       |         |                           |
| OR          |         |                           |
| OR I        |         |                           |
| XOR         |         |                           |
| XOR I       |         |                           |
| OP1         | No      |                           |
| Reserved?   | No      |                           |
| OP2         | No      |                           |
| POP         | No      |                           |
| JMPII       |         | Candidate for removal?    |

Since RET takes no arguments, we can use OP2 for it. Current state:

| Bitfield   | OP2 Instruction                    | Notes                                        |
|------------|------------------------------------|----------------------------------------------|
| -----01--- | SNA — Skip if AC negative (G1)     | These can be replaced by an I/O mapped unit. |
| -----0-1-- | SZA — Skip if AC zero (G1)         |                                              |
| -----0--1- | SSL — Skip if L set (G1)           |                                              |
| -----0---1 | SSV — Skip if V set (G1)           |                                              |
| -----10000 | SKIP — Always skip (G2)            |                                              |
| -----11--- | SNN — Skip if AC non-negative (G2) |                                              |
| -----1-1-- | SNZ — Skip if AC non-zero (G2)     |                                              |
| -----1--1- | SCL — Skip if L clear (G2)         |                                              |
| -----1---1 | SCV — Skip if V clear (G2)         |                                              |
| --1------- | CLA — Clear AC                     | Remove                                       |
| ---1------ | asm:CLI — Clear I flag             | Relegate to I/O space macros.                |
| ----1----- | asm:STI — Set I flag               | Keep!                                        |

New state:

| Bitfield   | OP2 Instruction                    | Notes |
|------------|------------------------------------|-------|
| 010------- | RET — Return from subroutine       |       |
| 110------- | LRET — Long return from subroutine |       |
| 111------- | RTI — Return from interrupt        |       |
| 001------- | STI — Set interrupt flag           |       |
| 100------- | pops from stack onto code bank     |       |
| -----01--- | SNA — Skip if AC negative (G1)     |       |
| -----0-1-- | SZA — Skip if AC zero (G1)         |       |
| -----0--1- | SSL — Skip if L set (G1)           |       |
| -----0---1 | SSV — Skip if V set (G1)           |       |
| -----10000 | SKIP — Always skip (G2)            |       |
| -----11--- | SNN — Skip if AC non-negative (G2) |       |
| -----1-1-- | SNZ — Skip if AC non-zero (G2)     |       |
| -----1--1- | SCL — Skip if L clear (G2)         |       |
| -----1---1 | SCV — Skip if V clear (G2)         |       |

