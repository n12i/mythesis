#!/usr/bin/perl

#printf("# CH.000,CH.001,CH.002,CH.003,GAMMA,CH000\n");

($file,$ident)=@ARGV;
$ident = "_" . $ident . "_2";

open(FILE, "<$file");

$j = 0;

while (<FILE>) {
  @line=split(/,/);

  if (/^CH.000/) {
    for ($i=0;$i<$#line;$i++) {
      if ($line[$i] eq "CH.000") {
	$p[$j] = $i;
	$line[$i]="#CH_000" . $ident;
	$j++;
      }
      elsif ($line[$i] eq "CH.001") {
	$p[$j] = $i;
	$line[$i]="CH_001" . $ident;
	$j++;
      }
      elsif ($line[$i] eq "CH.002") {
	$p[$j] = $i;
	$line[$i]="CH_002" . $ident;
	$j++;
      }
      elsif ($line[$i] eq "CH.003") {
	$p[$j] = $i;
	$line[$i]="CH_003" . $ident;
	$j++;
      }
      elsif ($line[$i] eq "GAMMA") {
	$p[$j] = $i;
	$line[$i]="GAMMA" . $ident;
	$j++;
      }
    }
    for ($i=0;$i<$j-1;$i++) {
      printf ("%s,", $line[$p[$i]]);
    }
    printf ("%s\n", $line[$p[$j]]);
  }

  for ($i=0;$i<$j-1;$i++) {
    printf ("%f,", $line[$p[$i]]);
  }
  printf ("%f\n", $line[$p[$j]]);
}
