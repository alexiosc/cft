#!/bin/sh

./emu.py a.obj | grep LATCH | sort | uniq |
    sed -e 's/^.*LATCH //' -e 's/ <- /\"->\"/' -e 's/^/\"/' -e 's/$/\"/' \
	-e 's/PR_UPDATE (//' -e 's/ /_/g' -e 's/->/ -> /' |
    gawk -- '{ print $3, $2, $1; }'

# End of file.
