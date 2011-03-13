#!/usr/bin/python2.6

import sys
import array
import random
import optparse

def group(x, gs=4): 
    for i in range(0, len(x), gs):
        yield x[i:i+gs]
    

def binary(x, pad=16):
    return ' '.join(group(bin(x)[2:].zfill(pad), 4))


class Emulator(object):
    
    # Opcodes

    OPS = {
        # Address operand
        0b0000: 'TRAP',
        0b0001: '*RESERVED1',
        0b0010: 'LOAD',
        0b0011: 'STORE',
        0b0100: 'IN',
        0b0101: 'OUT',
        0b0110: 'JMP',
        0b0111: 'JSR',
        0b1000: 'ADD',
        0b1001: 'AND',
        0b1010: 'OR',
        0b1011: 'XOR',

        # Non-address operand.

        0b1100: 'OP1',
        0b1101: 'OP2',
        0b1110: '*RESERVED2',
        0b1111: 'LI',
    }

    BIT_R = 1<<10
    BIT_I = 1<<11

    def __init__(self, fname, otions):
        self.output = file('output', 'w')
        self.options = options
        self.reset()
        self.mem = array.array('H')
        self.mem.fromfile(open(fname, 'rb'), 65536)

        self.opacct = dict()
        for op, name in self.OPS.items():
            setattr(self, 'OP_' + name, op)
            self.opacct[op] = 0
            
        

    def reset(self):
        # Programming model registers
        self.pr = 0x3f
        self.ir = 0
        self.pc = 0xfffe
        self.l = 1
        self.a = 0b1111111111111111
        self.i = 1

        # Internal registers/latches
        self.mar = 0
        self.dr = 0
        self.y = 0

        self.phase = 0
        self.go_fetch = True
        self.go_exec = False
        self.fetching = False
        self.executing = False
        self.addr0 = False
        self.addr1 = False

        # Accounting
        self.ntick = 0
        self.PHI_EXEC = 6
        self.max_phi = 0
        self.nfetch = 0


    def run(self):
        while True:
            self.tick()


    def state(self):
        curstate = list()
        if self.go_fetch:
            curstate.append('go_fetch')
        if self.fetching:
            curstate.append('fetching')
        if self.go_exec:
            curstate.append('go_exec')
        if self.executing:
            curstate.append('executing')

        print "\ntick = %d, phase = %d (%s)" % (self.ntick, self.phase, ', '.join (curstate))
        print "PC    = %04x       (%s)" % (self.pc, binary(self.pc))
        print "PR    = %02x         (%s.. .... ....)" % (self.pr, binary(self.pr, 6))
        print "IR    = %04x       (%s)  %s %s%s%10s" % (self.ir, binary(self.ir),
                                                          self.OPS[self.ir >> 12],
                                                          self.ir & self.BIT_I and 'I ' or '',
                                                          self.ir & self.BIT_R and 'R ' or '',
                                                          binary(self.ir & 0x3ff, 12)[2:])
        print "DR    = %04x       (%s)" % (self.dr, binary(self.dr))
        print "MAR   = %04x       (%s)" % (self.mar, binary(self.mar))
        print "<L,A> = <%01x,%04x> (%s,%s)" % (self.l, self.a, self.l, binary(self.a))
        print


    def mkaddr(self):
        """
        Make a full 16-bit address out of the PR (page register) and
        the IR.
        
        The address is made up of the least significant 10 bits of the
        IR, with the most significant 6 bits provided by the PR.
        
        When the register bit (zero page) is set, the most significant
        6 bits of the address are zero.
        """
        # Register (zero) page?
        if self.ir & self.BIT_R:
            return self.ir & 0x3ff
        else:
            return ((self.pr & 0x3f) << 10) | (self.ir & 0x3ff)


    UNIT_A = 'a'
    UNIT_MAR = 'mar'
    UNIT_PC = 'pc'
    UNIT_DR = 'dr'
    UNIT_IR = 'ir'
    UNIT_DBUS = "[Data bus]"
    UNIT_ABUS = "[Address bus]"
    UNIT_ADDRGEN = "<PR,IR>"
    UNIT_LITERAL = "IR[9:0]"
    UNIT_ZERO = "#0"
    UNIT_ONE = "#1"


    def latch(self, tgt, src):
        """
        Latch data from one unit to another.
        """
        print "*** LATCH %s <- %s" % (tgt.upper(), src.upper())
        
        # Read from unit.
        if src == self.UNIT_DBUS:
            data = self.memread()
        elif src == self.UNIT_ABUS:
            raise RuntimeError("The ABUS is write-only.")
        elif src == self.UNIT_ADDRGEN:
            # Generate an address using the address generation logic (PR, Zero
            # page, 10 bits from IR).
            data = self.mkaddr()
        elif src == self.UNIT_LITERAL:
            # The literal field only reads the lower 10 bits of the IR.
            data = self.ir & 0x3ff
        elif src == self.UNIT_ZERO:
            # The constant 0
            data = 0
        elif src == self.UNIT_ONE:
            # The constant 0
            data = 1
        else:
            try:
                data = getattr(self, src)
            except AttributeError:
                raise RuntimeError("Unknown unit '%s'!" % src)

        # Write to unit.
        if tgt == self.UNIT_DBUS:
            self.memwrite(data)
        elif tgt == self.UNIT_ADDRGEN:
            raise RuntimeError("The <PR,IR> address generation logic is read-only.")
        elif tgt == self.UNIT_ABUS:
            # Nothing to do here... this is implicit *IN THE EMULATOR*.
            pass
        else:
            # Default case.
            try:
                setattr(self, tgt, data)
            except AttributeError:
                raise RuntimeError("Unknown or read-only unit '%s'!" % tgt)


    def has_address_operand(self):
        # The four instructions with opcode 11xx do not take address
        # operands. The rest do. Memory reads are only triggered for
        # address operand instructions.
        return (self.ir & 0xc000) != 0xc000


    def memread(self):
        res = self.mem[self.mar]
        print "*** ASSERT MR"
        print "*** MEMREAD [%04x] = %04x ('%16s, #%d)" % \
            (self.mar, res, bin(res)[2:].zfill(16), res)
        return res


    def memwrite(self, res=None):
        if res is None:
            res = self.a

        addr = self.mar
        if self.addr0:
            addr = 0x0000
            print "*** ADDR0 (0000) DRIVING ADDRESS BUS"
        elif self.addr1:
            addr = 0x0001
            print "*** ADDR1 (0001) DRIVING ADDRESS BUS"
    
        print "*** ASSERT MW"
        print "*** MEMWRITE [%04x] <- %04x ('%16s, #%d)" % \
            (addr, res, bin(res)[2:].zfill(16), res)
        self.mem[addr] = res


    def tick(self):
        """
        Simulate one tick of the clock.
        """
        self.ntick += 1
        # Reset the state machine after an instruction has finished
        # executing.
        if self.go_fetch:
            print "-"*79
            print "*** FETCHING"
            print
            self.nfetch += 1
            self.phase = 0
            self.executing = False
            self.go_fetch = False
            self.fetching = True

        if self.fetching:
            self.fetch()

        # In the emulator, the last work done in the fetch() method
        # happens on the same clock tick as the first entry of the
        # execute() method. This is not pipelining, and only happens
        # in the emulator because of the way programs are executed.

        # Handle the transition
        if self.go_exec:
            print "*** EXECUTING"
            self.go_exec = False
            self.fetching = False
            self.executing = True

        if self.executing:
            self.execute()
        
        self.next_state()


    def fetch(self):
        """
        Handle the various fetch states.
        """
        print "\n*** STATE:", self.phase
        if self.phase == 0:
            # Fetch cycle: put MAR on address bus.
            self.latch(self.UNIT_MAR, self.UNIT_PC)
            print "*** MAR <- PC = %04x" % (self.pc)

        elif self.phase == 1:
            # Fetch cycle: latch IR from data bus.
            self.latch(self.UNIT_IR, self.UNIT_DBUS)
            print "*** READ IR <- mem[%04x] = %04x" % (self.mar, self.ir)

        elif self.phase == 2:
            # Operand read, phase 1: latch MAR from IR address generation
            # logic, put MAR on address bus.
            if self.has_address_operand():
                self.latch(self.UNIT_MAR, self.UNIT_ADDRGEN)

        elif self.phase == 3:
            # Operand read, phase 2, indirection
            if self.has_address_operand():
                self.latch(self.UNIT_DR, self.UNIT_DBUS)
                # Select target of memory read
                if self.ir & self.BIT_I:
                    print "+++ TODO: THIS SHOULD BE A SEPARATE STATE +++"
                    print "*** INDIRECTION READ (MAR=%04x) ***" % (self.mar,)
                    #self.mar = self.dr = self.memread() # Memory read
                    self.latch(self.UNIT_DR, self.UNIT_DBUS)
                    self.latch(self.UNIT_MAR, self.UNIT_DBUS)

        elif self.phase == 4:
            # Operand read, phase 2, memory read
            if self.has_address_operand():
                if self.ir & self.BIT_I:
                    pass
                else:
                    # self.mar = self.mkaddr() # Memory read
                    self.latch(self.UNIT_MAR, self.UNIT_ADDRGEN)
                    print "*** ARG MAR=%04x" % self.mar

        elif self.phase == 5:
            print "*** STEP PC"
            self.pc = (self.pc + 1) & 0xffff
            
        else:
            # Move to the execute cycle.
            self.go_exec = True


    def execute(self):
        """
        The execute states.
        """
        opcode = self.ir >> 12
        fxname = 'exec_' + self.OPS[opcode].lower()

        # Accounting
        self.opacct[opcode] += 1

        print '\n*** %s (A=%04x \'%16s #%d)' % \
            (fxname, self.a, bin(self.a)[:2].zfill(16),
             self.a)
        getattr(self, fxname)()


    def next_state(self):
        """
        Move to the next state in a controlled (and instrumnted) way.
        """
        # Next state.
        self.phase = self.phase + 1

        # Print out diagnostics and debugging.
        if self.options.microstate or (self.options.state and self.go_fetch):
            self.state()
        # Something's wrong if we get to phase >= 20
        self.max_phi = max(self.phase, self.max_phi)
        assert self.phase < 20


    def get_la(self):
        return (self.l << 16) | (self.a & 0xffff)

    def set_la(self, la):
        self.a = la & 0xffff
        self.l = (la & 0x10000) >> 16

    def exec_li(self):
        if self.phase == self.PHI_EXEC:
            #self.a = self.ir & 0x3ff
            self.latch(self.UNIT_A, self.UNIT_LITERAL)
            self.go_fetch = True

    def exec_load(self):
        if self.phase == self.PHI_EXEC:
            self.latch(self.UNIT_A, self.UNIT_DBUS)
            self.go_fetch = True

    def exec_store(self):
        if self.phase == self.PHI_EXEC:
            self.latch(self.UNIT_MAR, self.UNIT_ADDRGEN)
        elif self.phase == self.PHI_EXEC + 1:
            print "*** STORE TO %04x: %04x" % (self.ir & 0x3ff, self.a)
            self.latch(self.UNIT_DBUS, self.UNIT_A)
            #self.mem[self.mar] = self.a
            self.go_fetch = True

    def exec_out(self):
        if self.phase == self.PHI_EXEC:
            # For now, every OUT statement just prints out the contents of A
            ioaddr = self.ir & 0x3ff
            if ioaddr == 0x101:
                print "*** OUT TO %04x (print char): %04x" % (ioaddr, self.a)
                self.output.write(chr(self.a & 0xff))
            elif ioaddr == 0x102:
                print "*** OUT TO %04x (print int): %04x (#%d)" % (ioaddr, self.a, self.a)
                self.output.write("%d" % self.a)
            else:
                print "*** UNHANDLED OUT %04x <- %04x" % (ioaddr, self.a)
            self.go_fetch = True


    def exec_in(self):
        if self.phase == self.PHI_EXEC:
            ioaddr = self.ir & 0x3ff
            if ioaddr == 1:
                self.a = random.randint(0, 65535)
                print "*** IN FROM %04x (random word): %04x" % (ioaddr, self.a)
            else:
                print "*** UNHANDLED IN %04x <- %04x" % (ioaddr, self.a)
            self.go_fetch = True


    def exec_jmp(self):
        if self.phase == self.PHI_EXEC:
            self.latch(self.UNIT_PC, self.UNIT_MAR)
            #self.pc = self.mar
            # PG gets the top 6 bits of the DR.
            self.pr = (self.pc & 0x3f00) >> 10
            print "*** LATCH PR <- PC(15:10)"
            print "*** JUMP TO %04x (PR=%02x)" % (self.pc, self.pr)
            self.go_fetch = True


    def exec_jsr(self):
        if self.phase == self.PHI_EXEC:
            # Memory write cycle (to save the PC at address 0001)
            self.addr1 = True
            self.latch(self.UNIT_DBUS, self.UNIT_PC)
        else:
            # Allow the MAR to drive the address bus
            self.addr1 = False
            # This is just like a jump now.
            self.latch(self.UNIT_PC, self.UNIT_MAR)
            # PG gets the top 6 bits of the DR.
            self.pr = (self.pc & 0x3f00) >> 10
            print "*** LATCH PR <- PC(15:10)"
            print "*** JSR TO %04x (PR=%02x)" % (self.pc, self.pr)
            self.go_fetch = True


    def exec_trap(self):
        if self.phase == self.PHI_EXEC:
            self.i = 0
            # Memory write cycle (to save the PC at address 0000)
            self.addr0 = True
            self.latch(self.UNIT_DBUS, self.UNIT_PC)
        else:
            self.addr0 = False
            # This is just like a jump now.
            self.latch(self.UNIT_PC, self.UNIT_MAR)
            # PG gets the top 6 bits of the DR.
            self.pr = (self.pc & 0x3f00) >> 10
            print "*** LATCH PR <- PC(15:10)"
            print "*** JSR TO %04x (PR=%02x)" % (self.pc, self.pr)
            self.go_fetch = True


    def exec_add(self):
        if self.phase == self.PHI_EXEC:
            print "*** LATCH ALU_A <- A"
            print "*** LATCH ALU_B <- DR"
        elif self.phase == self.PHI_EXEC + 1:
            self.y = self.get_la() + self.dr
            print "*** LATCH A <- ALU_Y"
            print "*** ADD (wait for ALU to settle)"
        elif self.phase == self.PHI_EXEC + 2:
            self.set_la(self.y)
            print "*** ADD (latch results)"
            self.go_fetch = True


    def exec_and(self):
        if self.phase == self.PHI_EXEC:
            print "*** LATCH ALU_A <- A"
            print "*** LATCH ALU_B <- DR"
        elif self.phase == self.PHI_EXEC + 1:
            print "*** LATCH A <- ALU_Y"
            self.y = (self.a & 0xffff) & (self.dr & 0xffff)
            print "*** AND (wait for ALU to settle)"
        elif self.phase == self.PHI_EXEC + 2:
            self.set_la(self.y)
            print "*** AND (latch results)"
            self.go_fetch = True


    def exec_or(self):
        if self.phase == self.PHI_EXEC:
            print "*** LATCH ALU_A <- A"
            print "*** LATCH ALU_B <- DR"
        elif self.phase == self.PHI_EXEC + 1:
            print "*** LATCH A <- ALU_Y"
            self.y = (self.a & 0xffff) | (self.dr & 0xffff)
            print "*** OR (wait for ALU to settle)"
        elif self.phase == self.PHI_EXEC + 2:
            self.set_la(self.y)
            print "*** OR (latch results)"
            self.go_fetch = True


    def exec_xor(self):
        if self.phase == self.PHI_EXEC:
            print "*** LATCH ALU_A <- A"
            print "*** LATCH ALU_B <- DR"
        elif self.phase == self.PHI_EXEC + 1:
            print "*** LATCH A <- ALU_Y"
            self.y = (self.a & 0xffff) ^ (self.dr & 0xffff)
            print "*** OR (wait for ALU to settle)"
        elif self.phase == self.PHI_EXEC + 2:
            self.set_la(self.y)
            print "*** OR (latch results)"
            self.go_fetch = True


    def exec_op1(self):
        if self.phase == self.PHI_EXEC:
            # CLA
            if self.ir & 0b1000000000:
                self.a = 0
                print "*** CLA"
            # CLL
            if self.ir & 0b0100000000:
                self.l = 0
                print "*** CLL"
        elif self.phase == self.PHI_EXEC + 1:
            # NOT
            if self.ir & 0b0010000000:
                self.a = (self.a ^ 0xffff) & 0xffff
                print "*** NOT %04x" % (self.a,)
        elif self.phase == self.PHI_EXEC + 2:
            # INC
            if self.ir & 0b0001000000:
                self.set_la(self.get_la() + 1)
                print "*** INC"
        elif self.phase == self.PHI_EXEC + 3:
            # NTL
            if self.ir & 0b0000100000:
                self.l = (~self.l) & 1
                print "*** NTL"
        elif self.phase == self.PHI_EXEC + 4:
            # Shifts/rotates
            #return

            if ((self.ir & 0b11100) >> 2) == 0b010:
                # RBL (rotate 1 bit left through L)
                # <L,FEDC BA98 7654 3210> -> <F,EDCB A987 6543 210L>
                l, a = self.l, self.a # For printing purposes.

                x = self.get_la()
                #self.set_la(x << 1 || self.l)

                print "*** RBL <%d,%16s> -> <%d,%16s>" % (l, bin(a)[2:].zfill(16), \
                                                              self.l, bin(self.a)[2:].zfill(16))

            elif ((self.ir & 0b11100) >> 2) == 0b001:
                # RBR (rotate 1 bit right through L)
                # <L,FEDC BA98 7654 3210> -> <0,LFED CBA9 8765 4321>
                l, a = self.l, self.a # For printing purposes.

                x = self.get_la()
                #self.set_la(x >> 1 || (x & 1 << 16))
                print "*** RBR <%d,%16s> -> <%d,%16s>" % (l, bin(a)[2:].zfill(16), \
                                                              self.l, bin(self.a)[2:].zfill(16))
            elif ((self.ir & 0b11100) >> 2) == 0b110:
                # RNL (rotate 4 bits right through L)
                # <L,FEDC BA98 7654 3210> -> <3,210L FEDC BA98 7654>
                l, a = self.l, self.a # For printing purposes.

                x = self.get_la()
                #self.set_la((x & 8) ||
                print "*** RBR <%d,%16s> -> <%d,%16s>" % (l, bin(a)[2:].zfill(16), \
                                                              self.l, bin(self.a)[2:].zfill(16))
            elif ((self.ir & 0b11100) >> 2) == 0b101:
                # RNR (rotate 4 bits right through L)
                # <L,FEDC BA98 7654 3210> -> <C,BA98 7654 3210 LFED>
                l, a = self.l, self.a # For printing purposes.

                x = self.get_la()
                #self.set_la(((x << 4) & 0x1fff) || (self.l << 3) || (x >> 13)

                print "*** RBR <%d,%16s> -> <%d,%16s>" % (l, bin(a)[2:].zfill(16), \
                                                              self.l, bin(self.a)[2:].zfill(16))
                
        elif self.phase == self.PHI_EXEC + 5:
            if self.ir & 0b0000000001:
                print "*** HALT"
                print
                print "End of simulation."
                sys.exit(0)

            # End of instruction
            self.go_fetch = True
        

    def exec_op2(self):
        if self.phase == self.PHI_EXEC:
            # LPC
            if self.ir & 0b0000010000:
                self.a = self.pc
                print "*** LATCH A <- PC"
                print "*** LPC"
            # SPG
            if self.ir & 0b0000001000:
                self.pr = (self.a >> 10) & 0x3f
                print "*** LATCH PR <- A(15:10)"
                print "*** SPG (PR <= %02x)" % (self.pr)
            # CPG
            if self.ir & 0b0000000100:
                self.pr = (self.pc & 0x3f00) >> 10
                print "*** LATCH PR <- PC(15:10)"
                print "*** SPG (PR <= %02x)" % (self.pr)

        elif self.phase == self.PHI_EXEC + 1:
            op = (self.ir & 0b0111100000) >> 5
            if op:
                # Initialise skip
                do_skip = bool(op & 0b1000)
                s1, s2, s3 = False, False, False

                s1 = bool(op & 0b0100) and bool(self.a & 0x8000)
                s2 = bool(op & 0b0010) and bool(self.a == 0)
                s3 = bool(op & 0b0001) and bool(self.l & 1)

                do_skip = (s1 or s2 or s3) ^ bool(op & 0b1000)

                # Debugging (lots of it)
                instr = list()
                if (op & 0b1111) == 0b0000:
                    instr.append('NOP')
                if (op & 0b1100) == 0b0100:
                    instr.append('SNA (A<0? %s)' % s1)
                if (op & 0b1010) == 0b0010:
                    instr.append('SZA (A=0? %s)' % s2)
                if (op & 0b1001) == 0b0001:
                    instr.append('SSL (L=1? %s)' % s3)

                if (op & 0b1111) == 0b1000:
                    instr.append('SKIP')
                if (op & 0b1100) == 0b1100:
                    instr.append('SNN (A>=0? %s)' % (not s1,))
                if (op & 0b1010) == 0b1010:
                    instr.append('SNZ (A!=0? %s)' % (not s2,))
                if (op & 0b1001) == 0b1001:
                    instr.append('SCL (L=0? %s)' % (not s3,))

                if bool(op & 0b1000):
                    print "*** SKIP: %s => %s" % (' && '.join(instr), do_skip)
                else:
                    print "*** SKIP: %s => %s" % (' || '.join(instr), do_skip)

                # Skip
                if do_skip:
                    print "*** SKIPPING NEXT INSTRUCTION!"
                    self.pc += 1

        elif self.phase == self.PHI_EXEC + 2:
            if self.ir & 0b0000000010:
                self.i = 0
                print "*** CLI (i=0)"

        elif self.phase == self.PHI_EXEC + 3:
            if self.ir & 0b0000000001:
                self.i ^ 1
                print "*** CLI (i=%d)" % self.i
            
            # End of instruction
            self.go_fetch = True
            


p = optparse.OptionParser()
#p.add_option('-o', '--out', metavar='FILENAME', default='a.obj',
#             help='Output object file to FILENAME.')
p.add_option('-m', '--microstate', action='store_true',
             help='Print out CPU state while processing instructions.')
p.add_option('-s', '--state', action='store_true',
             help='Print out CPU state after processing each instruction.')

(options, args) = p.parse_args()

if len(args) != 1:
    sys.stderr.write('Syntax: %s FILE.obj (memory image file)\n' % (sys.argv[0],))
    sys.exit(1)

emu = Emulator(args[0], options)
try:
    emu.run()

except:
    raise

finally:
    print "Statistics:"
    print "  Clock ticks:     %5d" % emu.ntick
    print "  Fetches:         %5d" % emu.nfetch
    print "  Max phase:       %5d" % emu.max_phi
    if emu.nfetch > 0:
        print "  Avg phase/instr: %9.3f" % (float(emu.ntick) / emu.nfetch)
    print "\nInstructions executed:"
    for op, num in emu.opacct.items():
        comment = num == 0 and " *** UNTESTED ***" or ''
        print "%5s (%4s): %4d%s" % (emu.OPS[op][:4], bin(op)[2:].zfill(4), num, comment)

# End of file.
