#!/bin/bash

fname=$1; shift
if [ "$fname" = "" ]; then
    echo "Syntax: $0 BASENAME"
    echo
    exit 1
fi
zip -9 alexios-$fname.zip $fname.{TXT,GML,GBP,GTP,GBS,GTS,GBO,GTO,GBL,GTL}

# End of file.