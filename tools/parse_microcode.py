#!/usr/bin/python3

import os
import re
import sys
import json
import pprint
import argparse

from collections import OrderedDict


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
            for f in ['RST', 'INT', 'RESERVED', 'OP']:
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
                ('disasm', OrderedDict([('instr', bin_opcode),
                                        ('mask', bin_mask),
                                        ('weight', sum(int(x) for x in bin(bin_mask)[2:]))])),
                ('name', comm.get('name', '')),
                ('mode', comm.get('mode', '')),
                ('desc', comm.get('desc', '')),
                ('flags', self.parse_flagspec(comm.get('flags', ''))),
                ('groups', re.split('\s*,\s*', comm.get('group', ''))),
            ]))
                


    def report(self):
        #pprint.pprint(self.data, width=200)
        print(json.dumps(self.data, indent=4))

            
    def run(self):

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
