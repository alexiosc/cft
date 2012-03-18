#!/usr/bin/env python2.6

import os
import sys
import array
import romtables
import threading

class SkipTable(threading.Thread):
    """

    ==Skip Table==

    The skip table supplies the next uPC value for OP1/OP2 instructions.

    Truth table inputs:

    * Operand (10 bits)
    * uPC (4 bits)
    * OP1/OP2 (1 bit)

    Truth table outputs:
    
    * uPC' (4 bits)
    """

    PC_OFFSET = 3

    def __init__(self, tt):
        self.tt = tt
        threading.Thread.__init__(self)
        #print "Thread %s: (%d,%d)" % (self.name, a0, a1)


    def run(self):
        """
        Run the thread.
        """
        tt = self.tt
        for op2 in xrange(2):
            for operand in xrange(1024):
                for upc_in in xrange(16):

                    pat = bin(operand)[2:].zfill(10)
                    try:
                        upc_out = self.PC_OFFSET + pat.index('1')
                    except ValueError:
                        upc_out = 15
                    print "%d %010s uPC=%2d ==> uPC <- %d" % (op2, pat, upc_in, upc_out)
                    continue

                    # Store it in the Function Table.
                    addr = tt.make_vector(tt.inputs, op=op, l_in=l_in, a=a, b=b)
                    data = tt.make_vector(tt.outputs, v_out=v_out, l_out=l_out, x=x)
                    tt.put(addr, data)
    
                    if debug:
                        print '%s %05x %d %s (%2d) %s %s (%2d) = %s (%2d) %s%s' % \
                            (self.opcodes[op],
                             addr,
                             l_in,
                             romtables.mybin(a, 6), a,
                             self.syms[op],
                             romtables.mybin(b, 6), b,
                             romtables.mybin(x, 6), x,
                             "-L"[l_out],
                             "-V"[v_out],
                             )
                    else:
                        tt.progress(dt=5)




# Set debugging.
debug = False
#debug = True

# The main Unary ROM, as per the documentation above.
skipTableROM = romtables.FunctionTable('operand:10 upc:4 op2:1', 'upc_out:4', singleROM=True)
SkipTable(skipTableROM).run()

skipTableROM.report()
print 'Writing Verilog files.'
skipTableROM.writeVerilog('skiptable')
print 'Writing binary images.'
skipTableROM.writeBin('skiptable')

# End of file.
