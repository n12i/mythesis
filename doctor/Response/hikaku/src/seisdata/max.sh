#! /usr/local/bin/bash

files=$(ls *.{NS,ns,OUT,dat})
out=max.acc

test -f $out && rm $out
for i in $files; do
    maxacc=$(sort -n -k 2 $i | head -1 | awk '{print $2}')
    echo "$i: $maxacc" >>$out
done

exit 0
