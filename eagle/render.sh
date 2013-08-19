#!/bin/bash

source=$1; shift

if [ .$source = . ]; then
    echo "$0: specify a .pov filename"
    exit 1
fi

base=`echo $source | sed 's/\.pov$//'`
out=render-out

aa=+a0.3
width=2048
height=1536
#aa=''
#width=600
#height=450

e3d_dir="/home/alexios/eagle/eagle3d/povray"

# Adjust the source file, if it isn't already adjusted.

# Remove the light sources
grep -q '^light_source{' $source && sed -i -e 's/^light_source{/\/\/light_source{/' $source
grep -q e3d_megapov $source || sed -i -e '/^#include "e3d_tools.inc"/ i #include "radiosity/e3d_megapov.inc"' $source
 
# Render

i=0
start=0
end=0

num=1
fname=$out/$base
# Don't clobber any files.
while [ -f $fname-$num.png ]; do
	num=$[ $num + 1 ]
done
fname=${fname}-${num}.png

megapov -visual DirectColor $aa +SP1 \
	+W$width +H$height +FN \
	+L /usr/share/povray/include/ \
	+L"/usr/local/share/fonts/truetype/winxp" \
	+L"$e3d_dir" \
	+O"$fname" $* $source

#echo $fname
#exit 1

#while [ $i -lt $numcpus ]; do
#    start=`dc -e "3 k $step $i * p"`
#    end=`dc -e "3 k 1 $step $i 1 + * p"`
#    i=$[ $i + 1 ]
#    if [ $i -lt $numcpus ]; then
#	end=`dc -e "3 k $end 0.05 + p"`
#    fi
#    start=`printf "%5.3f" $start`
#    end=`printf "%5.3f" $end`
#    #echo $start $end
#    #continue
#
#    megapov -visual DirectColor $aa +SP1 \
#	+W$width +H$height +FN \
#	+L /usr/share/povray/include/ \
#	+L"/usr/local/share/fonts/truetype/winxp" \
#	+L"$e3d_dir" \
#	+O"$fname" $source &
#
#done

#wait

# End of file.
