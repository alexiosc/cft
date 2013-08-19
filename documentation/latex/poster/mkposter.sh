#!/bin/bash

date=`date '+%A, %e %B %Y'`

f () {
    #printf "%'d\n" $*
    LC_ALL=en_US.UTF-8 gawk "{ printf(\"%'d\", \$1); }"
}


processor_chips=`sed 's/^/./'  ../../../eagle/cft.netlist |
gawk -- '/IC/ { if ($5 <= 21) print; }' | 
sed 's/IC//'|sort -nk2|grep -v '* none *' | tail -n1|gawk -- '{ print $2 }' | f`
echo "Processor chips (99,990): $processor_chips"

echo 'Working...'
n=`pdftops ../../../eagle/cft.pdf /dev/stdout | grep -c showpage`
schematics=`echo $(($n+1)) | f`
tput cuu1
echo "Schematic sheets (99,991): $schematics"

numchips=`sed 's/^/./'  ../../../eagle/cft.netlist |
sed 's/IC//'|sort -nk2|grep -v '* none *' | tail -n1|gawk -- '{ print $2 }' | f`
echo "Processor chips (99,992): $numchips"

numcaps=`sed 's/^/./'  ../../../eagle/cft.netlist |
grep C[0-9] |
sed 's/C//'|sort -nk2|grep -v '* none *' | tail -n1|gawk -- '{ print $2 }' | f`
echo "Capacitors (99,993): $numcaps"

numleds=`sed 's/^/./'  ../../../eagle/cft.netlist |
grep LED[0-9] |
sed 's/LED//'|sort -nk2|grep -v '* none *' | tail -n1|gawk -- '{ print $2 }' | f`
echo "LEDs (99,994): $numleds"

numnets=`awk '/^[^ ]/ { print $1 }' ../../../eagle/cft.netlist | sort | uniq | wc -l | f`
echo "Nets (99,995): $numnets"

n=$((`tr -s '\n' <../../../eagle/cft.netlist|wc -l` -3))
numj=`echo $n | f`
echo "Connections (99,996): $numj"

clines=`find ../../.. -name '*.[ch]' | fgrep -v .svn | xargs wc -l|tail -n1|awk '{ print $1 }' | f`
echo "C lines (99,997): $clines"

vlines=`find ../../.. -name '*.v' | fgrep -v .svn | xargs wc -l|tail -n1|awk '{ print $1 }' | f`
echo "C lines (99,980): $vlines"

echo 'Working...'
pylines=`(find ../../.. -name '*.py';
    find ../../.. -type f | fgrep -v .svn | fgrep -v \~ | xargs 2>/dev/null file | grep Python | cut -d: -f1) |
fgrep -v .svn | sort | uniq | xargs 2>/dev/null wc -l | tail -n1 | awk '{ print $1 }' | f `
tput cuu1
echo "Python lines (99,997): $pylines"

asmlines=`find ../../.. -name '*.asm' | fgrep -v .svn | fgrep -v generated |
xargs 2>/dev/null wc -l |tail -n1|awk '{ print $1 }' | f`
echo "Assembly lines (99,998): $asmlines"

docpages=`grep "^Output written.*[0-9]" ../cft_book/cft-book.log | sed 's/[^0-9]//g' | f`
echo "Pages of documentation (99,983): $docpages"

words=`pdftotext ../cft_book/cft-book.pdf - | wc -w|f`
echo "Words of documentation (99,984): $words"

numparts=`grep -c '{part}' ../cft_book/cft-book.toc | f`
numchaps=`grep -c '{chapter}' ../cft_book/cft-book.toc|f`
numsecs=`grep -c '{section}' ../cft_book/cft-book.toc|f`
n1=`grep -c '{figure}' ../cft_book/cft-book.lof`
n2=`grep -c '{table}' ../cft_book/cft-book.lot`
numft=`echo $(($n1 + $n2)) | f`
echo "Parts of documentation (99,985): $numparts"
echo "Chapters of documentation (99,986): $numchaps"
echo "Sections of documentation (99,987): $numsecs"

sed <poster-template.svg >poster-`date '+%Y-%m-%d'`.svg \
    -e "s/99,990/$processor_chips/g" \
    -e "s/99,991/$schematics/g" \
    -e "s/99,992/$numchips/g" \
    -e "s/99,993/$numcaps/g" \
    -e "s/99,994/$numleds/g" \
    -e "s/99,995/$numnets/g" \
    -e "s/99,996/$numj/g" \
    -e "s/99,997/$clines/g" \
    -e "s/99,998/$pylines/g" \
    -e "s/99,999/$asmlines/g" \
    -e "s/99,980/$vlines/g" \
    -e "s/99,983/$docpages/g" \
    -e "s/99,984/$words/g" \
    -e "s/99,985/$numparts/g" \
    -e "s/99,986/$numchaps/g" \
    -e "s/99,987/$numsecs/g" \
    -e "s/99,988/$numft/g" \
    -e "s/__DATE__/$date/g" \

# End of file.
