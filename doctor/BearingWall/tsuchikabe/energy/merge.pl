#!/usr/local/bin/perl

$file1="che/che.tex";
$file2="che/che--.tex";

open(IN1, "<$file1");
open(IN2, "<$file2");

$i = 0;
while (<IN1>) {
  $line1[$i] = $_;
  $i ++;
}

$i = 0;
while (<IN2>) {
  $line2[$i] = $_;
  $i ++;
}

for ($j = 0; $j <= $i; $j++) {
  print $line1[$j];
  print $line2[$j];
}
