#!/bin/bash

file=$1; shift
basedir=`dirname $0`

prefix=`basename $file`
prefix=${prefix%%.jpg}
prefix=${prefix%%.png}

if [ ! -r "$file" ]; then
    echo "Syntax: $0 FILE"
    exit 1
fi

# MC modes
for h in 30 60 120 240 480; do
    for w in 40 80 160; do
	echo "$file: ${w}x${h} Multicolour"
	$basedir/mkimage.py "${w}x${h}MC" $file
    done
done

# HGR modes
for h in 30 60 120 240 480; do
    for w in 320 640; do
	echo "$file: ${w}x${h} Graphics"
	$basedir/mkimage.py "${w}x${h}HGR" $file
    done
done

# End of file.

