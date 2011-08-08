#!/usr/bin/python2.6
"""
Parse the output of the main CFT testbed and produce an assembled debugging
stream, ignoring machine state etc.
"""

import sys
import time

try:
    num = 0
    t0 = 0
    for line in sys.stdin:
        # Show progress
        t = int(time.time() * 5)
        if t0 != t:
            sys.stderr.write('.')
            t0 = t

        if not line.startswith('D:'):
            continue
        tokens = line.split()[1:]
        cmd = tokens[0].rstrip(':')
        if cmd == 'PRINTC':
            sys.stdout.write(tokens[1])
        elif cmd == 'PRINTU':
            sys.stdout.write(chr(int(tokens[1])))
        elif cmd == 'PRINTD':
            sys.stdout.write(tokens[1])
        elif cmd == 'PRINTH':
            sys.stdout.write(hex(tokens[1])[2:])
        elif cmd == 'PRINTB':
            sys.stdout.write(bin(tokens[1])[2:])
        elif cmd == 'ASSERT':
            if tokens[1] == 'TRUE':
                sys.stdout.write('[ok]')
            else:
                sys.stdout.write('[FAIL!]')
        sys.stdout.flush()

except (KeyboardInterrupt, IOError):
    sys.stderr.write('\n')
    sys.exit(0)
    
# End of file.
    
