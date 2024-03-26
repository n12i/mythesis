#! /usr/local/bin/bash

VEL="50 75 100 125"
SITES="ElCentro Hachinohe JMA-Kobe JR-Nisiakasi JR-Takarazuka JR-Takatori O_GAS_Fukiai"

D=$(pwd)

for v in $VEL; do
    for s in $SITES; do
	cd $D/$v/$s
	case $s in
	"ElCentro") suf="elcn" ;;
	"Hachinohe") suf="hach" ;;
	"JMA-Kobe") suf="kob" ;;
	"JR-Nisiakasi") suf="nsak" ;;
	"JR-Takarazuka") suf="tkrz" ;;
	"JR-Takatori") suf="tktr" ;;
	"O_GAS_Fukiai") suf="ogas" ;;
	esac

	for txt in *.txt; do
	    w=$(echo $txt | sed 's/\(.\).*\.txt/\1/' | tr [:upper:] [:lower:])
	    add="-$suf$v$w"
	    echo $txt $add
	    rm -f $(basename $txt .txt).dat
	    $D/header.pl $txt $add >$(basename $txt .txt).dat
	done
	cd $D
    done
done
