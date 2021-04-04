#!/usr/bin/python3

import os
import re
import sys
import json
import pprint
import argparse

from collections import OrderedDict


C_DISASM_PREAMBLE = """/* Automatically generated, do not modify! */

#ifndef __DISASM_H__
#define __DISASM_H__ 1

typedef struct {
        char *    mnemonic;
        bool      bitmap;
        uint16_t  instr;
        uint16_t  instr_mask;
        uint16_t  operand_mask;
} __instruction_set_t;

__instruction_set_t instruction_set[] = {
"""

C_DISASM_POSTAMBLE = """}};

#define NUM_INSTRUCTIONS {num_instr}

#endif /* __DISASM_H__ */

/* End of file. */
"""


CFTASM_PREAMBLE = """;;; -*- cftasm -*-
;;; CFT Assembler Built-ins, Microcode Version 7.x.

;;; Machine mnemonics

;           OP..IR SUB/OPERAND
;          -----|| |||-------

"""

CFTASM_POSTAMBLE = """

;;; 1.1.1. Instruction flags.

.equ R     0x0400 ; Specify to reference a register (zero page).
.equ I     0x0800 ; Indirection

;;; End of file.
"""


class ParseMicrocode(object):
    def __init__(self):
        self.parse_command_line()
        

    def parse_command_line(self):
        p = argparse.ArgumentParser(description="Assemble simple microcode into various output files.")

        # p.add_argument('-p', '--preprocess', action='store_true',
        #                help="""Preprocess to standard output and stop.
        #                Useful for debugging preprocessing bugs. As of mcasm 1.4, this also includes
        #                any comments in the source file, which in turn is useful for post-processing
        #                the microcode to parse To-Do tags etc.""")

        p.add_argument('-v', '--verbose', action='store_true',
                       help="""Print out lines as they are read.""")

        p.add_argument('-j', '--json', action='store_true',
                       help="""Print out the instruction set in JSON format.""")

        p.add_argument('-d', '--disassembly-table', action='store_true',
                       help="""Print out a C-format disassembly table.""")

        p.add_argument('-a', '--cftasm', action='store_true',
                       help="""Print out an include file for cftasm to define the builtins for the current microcode.""")

        p.add_argument("filename", metavar="INPUT-FILENAME", nargs="?",
                       help="""An input file specifying proprocessed microcode to parse. The default is to
                       parse standard input.""")

        
        self.args = p.parse_args()

        # Sanity checks
        # if self.args.output and len(self.args.files) > 1:
        #     p.error("-o makes no sense if multiple input files are provided.")


    def fail(self, msg):
        sys.stderr.write("{}:{}: {}\n".format(self.fname, self.linenum, msg))
        sys.exit(1)

            
    def process_queue(self, comments, uprograms):
        # print("\n\n")
        # pprint.pprint(uprograms, width=200)
        # print("")
        # pprint.pprint(comments, width=200)
        # print("\n\n")

        # Some sanity checks
        try:
            if len(set(x['OP'] for x in uprograms)) != 1:
                # print(set(x['OP'] for x in uprograms))
                self.fail("OP fields are not all identical for instruction ending on this line")
                
        except IndexError:
            self.fail("OP fields not parsed, this is not a valid mcasm file.")


    def parse_mnemonic(self, mn):
        retval = []
        for x in mn.split():
            if x.startswith('('):
                continue
            retval.append(x)
        return retval


    def parse_flagspec(self, flagspec):
        retval = OrderedDict()
        for fs in re.split('\s*,\s*', flagspec):
            m = re.match(r'^([*]?)([nN-])([zZ-])([vV-])([iI-])([lL-])$', fs)
            if not m:
                self.fail("Flag spec '{}' is invalid.".format(flagspec))
            mode, n, z, v, i, l = m.groups()
            if mode == '*':
                retval['change'] = [ x.upper() for x in (n, z, v, i, l) if x != '-' ]
            elif mode == '':
                retval['set'] = [ x.upper() for x in (n, z, v, i, l) if x.isupper() ]
                retval['clear'] = [ x for x in (n, z, v, i, l) if x.islower() ]
            else:
                self.fail("Unknown flag mode '{}' in flag spec '{}'".format(mode, flagspec))

            return OrderedDict([(k, v) for k, v in retval.items() if v])
                
        return retval


    def process(self, block):
        re_field = re.compile("^// ([A-Z]+): +(.+?)$")
        re_start = re.compile("^\s*start (.+);?$")
        re_conds = re.compile("([A-Z]+)=([A-Za-z0-9_-]+)")
        re_comment = re.compile(r"(/\*.+?\*/|//.*$)")

        # print("--------------------------------------------------------------------------------")
        # print("\n".join(block))
        # print("--------------------------------------------------------------------------------")

        comms = []
        progs = []
        obj = OrderedDict()
        for line in block:
            # Parse documentation comments
            m = re_field.match(line)
            if m:
                k, v = m.groups()
                if k == 'MNEMONIC' and obj:
                    comms.append(obj)
                    obj = OrderedDict({k.lower(): v})
                else:
                    if k not in ['TODO', 'CAUTION']:
                        if k in obj:
                            self.fail("Key {} used twice for this mnemonic".format(k))
                        obj[k.lower()] = v
                continue

            # Parse microprogram start lines
            m = re_start.match(line)
            if m:
                new_line = m.groups()[0].rstrip(";")
                new_line = re_comment.sub('', new_line)
                m = re_conds.findall(new_line)
                if m:
                    conds = OrderedDict()
                    for k, v in m:
                        conds[k] = v
                    progs.append(conds)
            else:
                # Count processor cycles
                new_line = re_comment.sub('', line)
                #print("PROG", new_line)
                if progs:
                    progs[-1]['cycles'] = progs[-1].get('cycles', 0) + sum(int(x == ';') for x in new_line)
                
                #m = re_conds.findall(new_line)

        if obj:
            comms.append(obj)

        # pprint.pprint(comms)
        # pprint.pprint(progs, width=200)
        # print("================================================================================\n\n")

        # Sanity check what we have so far.
        try:
            #for f in ['RST', 'INT', 'RESERVED', 'OP']:
            #for f in ['RST', 'RESERVED', 'OP']:
            for f in ['RST', 'OP']:
                if len(set(x[f] for x in progs)) != 1:
                    values = ", ".join(set(x[f] for x in progs))
                    self.fail("{} fields are not all identical for this instruction. Values: {}".format(f, values))
                
        except IndexError:
            self.fail("Some microcode fields not parsed, this is not a valid mcasm file.")

        # Build the full instruction format. The sanity checks ensure the opcode is identical.
        instr = 0
        opcode = progs[0]['OP']
        ifield = progs[0]['I']
        rfield = progs[0]['R']
        subop = progs[0]['SUBOP']

        if ifield not in "01X":
            self.fail("I Field value '{}' is not 0, 1 or X.".format(ifield))
        if rfield not in "01X":
            self.fail("R Field value '{}' is not 0, 1 or X.".format(rfield))

        for comm in comms:
            mn = comm['mnemonic']
            cf = comm.get('format', '').replace(':', '')
            if len(cf) not in (0, 7, 10, 16):
                self.fail("Unrecognised FORMAT: '{}' soon after this line.".format(cf))
            if len(cf) == 0:
                comm['format'] = '{}:I:R:mmmmmmmmmm'.format(opcode)
            elif len(cf) == 7:
                comm['format'] = '{}:{}:{}:{}:{}'.format(opcode, ifield, rfield, subop, cf)

            opw = 0
            m = re.search('([a-zA-z]+)$', comm['format'])
            if m:
                opw = len(m.groups()[0])

            # For disassemblers, generate the opcode and mask.
            opc = comm['format'].replace(':', '')
            assert len(opc) == 16
            bin_opcode, bin_mask = 0, 0
            for i in range(16):
                if opc[15 - i] == '1':
                    bin_opcode |= 1 << i
                if opc[15 - i] in "10":
                    bin_mask |= 1 << i
                    
            # print("CF {:<10s} {:<4s} {:<18s} {:<18s} {:04x} {:04x} len={}".format(
            #     mn, opcode, comm.get('format'), cf, bin_opcode, bin_mask, len(cf)))

            self.data.append(OrderedDict([
                ('mnemonic', mn),
                ('split_mnemonic', self.parse_mnemonic(mn)),
                ('microprograms', progs),
                ('format', comm['format']),
                ('operand_width', opw),
                ('disasm', OrderedDict([('instr', bin_opcode),
                                        ('mask', bin_mask),
                                        ('priority', sum(int(x) for x in bin(bin_mask)[2:]))])),
                ('name', comm.get('name', '')),
                ('mode', comm.get('mode', '')),
                ('desc', comm.get('desc', '')),
                ('flags', self.parse_flagspec(comm.get('flags', ''))),
                ('groups', re.split('\s*,\s*', comm.get('group', ''))),
            ]))
                


    def report(self):
        #pprint.pprint(self.data, width=200)

        if self.args.json:
            self.report_json_instruction_set()

        if self.args.disassembly_table:
            self.report_disassembly_table()

        if self.args.cftasm:
            self.report_cftasm()


    def report_json_instruction_set(self):

        # We'll be skipping instructions in brackets, because these are there
        # only for disassembly and completeness, and not formally part of the
        # instruction set.

        jsout = json.dumps([x for x in self.data if '[' not in x['mnemonic']],
                           indent=4)
        self.out.write (jsout)


    def report_disassembly_table(self):
        rd = []
        for datum in self.data:
            m = datum['mnemonic']
            instr = datum['disasm']['instr']
            mask = datum['disasm']['mask']
            pr = datum['disasm']['priority']
            opmask = (1 << datum['operand_width']) - 1

            # If this has a prefix, remove it and assume it's a bitmapped
            # instruction.
            disasm_m = re.sub(r'\(.+?\)\s*', '', m)
            is_bitmap = int(disasm_m != m or ' ' in disasm_m or '[' in disasm_m)

            # Provide I, I and I R variants if needed. Modify the mask and priority accordingly.
            set_i = [("", 0)]
            set_r = [("", 0)]
            if (mask & 0b0000101111111111) == 0:
                set_i.append((' I', 0x0800))
                mask |= 0x0800
                pr += 1
            if (mask & 0b0000011111111111) == 0:
                set_r.append((' R', 0x0400))
                mask |= 0x0400
                pr += 1

            # Append all the combinations
            for i, mode_i in set_i:
                for r, mode_r in set_r:
                    rd.append((disasm_m + i + r,
                               is_bitmap,
                               instr | mode_i | mode_r,
                               mask,
                               pr,
                               opmask,
                               "{:<21} {}".format(datum['format'], datum['name'])))

        rd.sort(key=lambda x: (x[2] & 0xff80, -x[4], len(x[0])))
        #pprint.pprint(rd, width=200)
        maxlen = max(len(x[0]) for x in rd)
        fmt = '\t{{ "{mn}",{pad}{is_bitmap}, 0x{instr:04x}, 0x{mask:04x}, 0x{opmask:04x}}}, /* {comment} */\n'

        self.out.write(C_DISASM_PREAMBLE)
        oldinstr = 0
        for mn, is_bitmap, instr, mask, pr, opmask, comment in rd:
            pad = " " * (maxlen - len(mn))
            if oldinstr != instr & 0xf000:
                self.out.write("\n")
            oldinstr = instr &  0xf000
            self.out.write(fmt.format(**locals()))
        self.out.write('\n\t{{ NULL,     {pad}0,      0,      0,      0}}  /* End. */\n'.format(**locals()))

        self.out.write(C_DISASM_POSTAMBLE.format(num_instr=len(rd)))

            
    def report_cftasm(self):
        rd = []
        for datum in self.data:
            m = datum['mnemonic']
            instr = datum['disasm']['instr']
            mask = datum['disasm']['mask']
            pr = datum['disasm']['priority']
            opmask = (1 << datum['operand_width']) - 1

            # If this has a prefix, remove it and assume it's a bitmapped
            # instruction.
            #disasm_m = re.sub(r'\(.+?\)\s*', '', m)
            disasm_m = m
            is_bitmap = int(disasm_m != m or ' ' in disasm_m or '[' in disasm_m)

            # if is_bitmap and '[' not in m:
            #     print("***", m, datum['split_mnemonic'])

            if '[' in m:
                continue

            rd.append((disasm_m,
                       is_bitmap,
                       instr,
                       mask,
                       pr,
                       opmask,
                       "{:<21} {}".format(datum['format'], datum['name'])))

        rd.sort(key=lambda x: (x[2] & 0xff80, -x[4], len(x[0])))
        #pprint.pprint(rd, width=200)
        maxlen = max(len(x[0]) for x in rd)
        fmt1 = ".equ    {mn:<7} &{instr:04x}            ; {comment}\n"
        fmt2 = ".equ    {mn1:<7} {mn0:<7} #{mnb} ; {comment}\n"
        #fmt = '\t{{ "{mn}",{pad}{is_bitmap}, 0x{instr:04x}, 0x{mask:04x}, 0x{opmask:04x}}}, /* {comment} */\n'

        self.out.write(CFTASM_PREAMBLE)

        superinstrs = dict()
        subinstrs = dict()
        
        oldinstr = 0
        for mn, is_bitmap, instr, mask, pr, opmask, comment in rd:
            #print("***",mn, file=sys.stderr)
            pad = " " * (maxlen - len(mn))
            # if oldinstr != instr & 0xf000:
            #     self.out.write("\n")
            oldinstr = instr &  0xf000

            if is_bitmap:
                mn0, mn1 = mn.split()
                mn0 = re.sub(r'\((.+?)\)\s*', r'\1', mn0)
                #print("***",mn0, file=sys.stderr)

                if mn0 not in superinstrs:
                    superinstrs[mn0] = instr
                    self.out.write("\n" + fmt1.format(mn=mn0, instr=instr, comment=mn0 + " bitmap instruction"))
                    #print("\n" + fmt1.format(mn=mn0, instr=instr, comment=mn0 + " bitmap instruction"), file=sys.stderr)

                #print("---", mn, mn0, mn1)
                mnb = bin(instr & 0x7f)[2:].zfill(7)
                self.out.write(fmt2.format(**locals()))
            else:
                self.out.write(fmt1.format(**locals()))

        self.out.write(CFTASM_POSTAMBLE.format(num_instr=len(rd)))

            
    def run(self):
        self.out = sys.stdout
        self.data = []

        
        re_linemarker = re.compile(r"^# (\d+) \"(.+)\"$")
        re_mnemonic = re.compile("^//\s+MNEMONIC:\s+")
        re_start = re.compile("^\s*start\s+")

        try:
            if self.args.filename is None:
                f = sys.stdin
                self.fname = self.args.filename
            else:
                f = open(self.args.filename)
                self.fname = '<stdin>'

            # comment_queue = []
            # uprogram_queue = []
            # obj = OrderedDict()
            block = []
            self.linenum = 0
            state = 0
            for line in f:
                line = line.strip()
                self.linenum += 1
                if self.args.verbose:
                    print(state, line)

                # Is this a preprocessor linemarker?
                m = re_linemarker.match(line)
                if m:
                    linenum, fname = m.groups()
                    linenum = int(linenum)

                if state == 0 and re_mnemonic.match(line):
                    state = 1
                    if block:
                        self.process(block)
                    block = [ line ]
                    continue

                if state == 1:
                    block.append(line)
                    if re_start.match(line):
                        state = 2
                        continue

                if state == 2:
                    if re_mnemonic.match(line):
                        state = 1
                        if block:
                            self.process(block)
                        block = [ line ]
                        continue
                    else:
                        block.append(line)
                        continue

            # At the end, process any remaining blocks, provided we've seen
            # documentation comments and micoprograms (state 2).
            if state == 2 and block:
                self.process(block)

        except BrokenPipeError:
            sys.write("Broken pipe\n")
            sys.exit(1)

        self.report()
        


if __name__ == '__main__':
    ParseMicrocode().run()

# End of file.
