#! /usr/local/bin/bash

FILES=$(echo *.dat)

for file in $FILES; do
    out=$(echo $file | sed -e 's/dat/txt/')
    ident=$(echo $file | sed -e 's/no\([1-5][ab]\).*\.dat/\1/')
    ./envelope.pl $file $ident >$out
done

dFILES=$(echo *++.txt)

for file in $dFILES; do
    out=$(echo $file | sed -e 's/++//')
    ano=$(echo $file | sed -e 's/++/--/')

    cat $file | sed 's/,/	/g' | head -1 >$out
    cat $ano | sed 's/,/	/g' | grep -v '^#' | tac >>$out
    cat $file | sed 's/,/	/g' | grep -v '^#' >>$out
done
