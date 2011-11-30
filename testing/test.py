#!/usr/bin/python2.6

import os, sys, unittest, optparse

def die(msg):
    sys.stderr.write(sys.argv[0] + ': ' + msg + '\n')
    sys.exit(1)
    

p = optparse.OptionParser()
#p.add_option('-v', '--verbose', action='store_true',
#             help='Print out assembled code')
#p.add_option('-l', '--leave', action='store_true',
#             help='Do not delete the test directory at the end of the test.')

opts, args = p.parse_args()


if not args:
    die('specify the filenames of one or more Python test programs.')

try:
    suite = unittest.TestSuite()

    for fname in args:
        # Just cause an exception if we can't open the file.
        open(fname).close()
    
        x = __import__(os.path.splitext(fname)[0].replace('/','.'))
    
        suite.addTests(unittest.TestLoader().loadTestsFromModule(x))

except IOError, e:
    die(str(e))


# Run the tests.    
unittest.TextTestRunner(verbosity=2).run(suite)

# End of file.
