#!/usr/local/bin/perl

sub max {
  my $max = shift(@_);
  foreach $foo (@_) {
    $max = $foo if $max < $foo;
  }
  return $max;
}

sub GetPmax {
  my $Pmax =0.0;
  my $infile = shift(@_);
  local(@line);

  open(IN, "<$infile");

  while (<IN>) {
    @line = split;
    $Pmax = max($Pmax, $line[0]);
  }

  close(IN);
  return $Pmax;
}

sub CalcCHE {
  my $che = 0.0;
  my $infile = shift(@_);
  my $load0 = $disp0 = 0.0;
  my $lineno = 0;
  my $j = 0;
  local(@line);

  open(IN, "<$infile");
  $j = 0;
  while (<IN>) {
    ($load1, $disp1) = split;
    if ( $load1 == $pmax ) {
      $LineatPmax = $j;
    }
    $j++;
  }
  $LineatPmax ++;
  print $LineatPmax;
  close(IN);

  open(IN, "<$infile");
  open(OUT, ">$outfile");
  $j = 0;
  while (<IN>) {
    ($load1, $disp1) = split;
    if ( $load1 ne "CH_000" && $j <= $LineatPmax && 
	 $load1 > $load0 && $load1 < $pmax ) {
#       print "$load0\t$disp0\t$load1\t$disp1\t";
      $che += ($load0 + $load1) * ($disp1 - disp0) / 2.0;
#       print "$che\n";
      $gamma1 = $disp1 / 273.;
      print OUT "$lineno\t$gamma1\t$che\n";
      ($load0, $disp0) = ($load1, $disp1);
      $lineno ++;
    }
    $j++;
  }

  close(IN);
  close(OUT);
  1;
}

sub Csv {
  my $infile = shift(@_);
  my @line;
  my $P = $Delta = 0.0;

  $tmpfile = $infile . ".tmp";

  open(IN, "<$infile");
  open(OUT, ">$tmpfile");

  while (<IN>) {
    @line = split;
    $P = $line[0]/1000.0;    # tonf
    $Delta = $line[1]*273.0; # cm
    print OUT "$P\t$Delta\n";
  }
  close(IN);
  close(OUT);
}

#### main
$|=1;
$ext="dat";

use File::Basename;

@CSV = <../data/No*.$ext>;

mkdir("che",0755) unless -d "che";
mkdir("eps",0755) unless -d "eps";

foreach $csv (@CSV) {
  $outfile = "che/" . basename($csv, $ext) . "che";
  $LineatPmax = 0;

  print "$csv -> $outfile\n";

  &Csv($csv);
  $pmax = &GetPmax($tmpfile);
  &CalcCHE($tmpfile);

#   unlink($tmpfile);

  $epsfile = "eps/" . basename($outfile, "che") . "eps";
  $label = basename($outfile, "\.che");

#   open(GP, ">tmp.gp");
#   print GP "set term postscript eps 24\nset xlabel \"step\"\nset ylabel \"energy\"\nset yrange [0:]\nset output \"$epsfile\"\nplot \"$outfile\" u 1:2 title \"$label\" w l\n";
#   close(GP);

#   system("gnuplot", "tmp.gp") && die || unlink "tmp.gp";

}

@CHE = <che/No*[ab].che>;

$texout = "che/che.tex";
unlink $texout if -f $texout;

foreach $chefile ( @CHE ) {
  $specname = basename($chefile, "\.che");
  $specname =~ s/[ab]$//;

  open(IN, "/usr/local/bin/tail -n 1 $chefile|");

  while (<IN>) {
    @line = split;
    $Che{$chefile} = $line[2];
    print "$chefile $Che{$chefile}\n";
  }
  close(IN);
}

open(OUT, ">$texout");
for ($i=1;$i<=7;$i++) {
  printf OUT "No.$i \& %7.2f \& %7.2f \& %7.2f\\\\\\hline\n",
  $Che{"che/No${i}a.che"}, $Che{"che/No${i}b.che"},
  ($Che{"che/No${i}a.che"} + $Che{"che/No${i}b.che"})/2.0;
}
close(OUT);

######
$envelope = "../horakusen/envelope.dat";

open(IN, "<$envelope");
$j = 0;
while (<IN>) {
  if (! /^#/) {
      @line = split;
      if ($#line == 7) {
	$gamma[$j] = @line[0];
	$gamma_Brace[$j] = @line[1];
	$No_1[$j] = @line[2];
	$No_3[$j] = @line[3];
	$No_4[$j] = @line[4];
	$No_5[$j] = @line[5];
	$No_6[$j] = @line[6];
	$No_7[$j] = @line[7];
      } else {  # $#line == 3
	$gamma_Brace[$j] = @line[0];
	$No_5[$j] = @line[1];
	$No_6[$j] = @line[2];
	$No_7[$j] = @line[3];
      }
      $j++;
  }
}
close(IN);

### load is plus.
$Che{'No_1'}=0.;
$Che{'No_3'}=0.;
$Che{'No_4'}=0.;
$Che{'No_5'}=0.;
$Che{'No_6'}=0.;
$Che{'No_7'}=0.;

open(OUT, ">no-sujikai.dat");
print OUT "0.0\t0.0\t0.0\t0.0\n";
for ($i=0 ; $i < $#No_1 ; $i++) {
  $Che{'No_1'} += ($No_1[$i + 1] + $No_1[$i]) * 
    ($gamma[$i +1] - $gamma[$i]) / 2.0 if $gamma[$i] >= 0.0;
  $Che{'No_3'} += ($No_3[$i + 1] + $No_3[$i]) * 
    ($gamma[$i +1] - $gamma[$i]) / 2.0 if $gamma[$i] >= 0.0;
  $Che{'No_4'} += ($No_4[$i + 1] + $No_4[$i]) * 
    ($gamma[$i +1] - $gamma[$i]) / 2.0 if $gamma[$i] >= 0.0;

  print OUT "$gamma[$i+1]\t$Che{'No_1'}\t$Che{'No_3'}\t$Che{'No_4'}\n" if $gamma[$i] > 0.0;
}
close(OUT);

open(OUT, ">sujikai.dat");
print OUT "0.0\t0.0\t0.0\t0.0\n";
for ($i=0 ; $i < $#No_5 ; $i++) {
  $Che{'No_5'} += ($No_5[$i + 1] + $No_5[$i]) * 
    ($gamma_Brace[$i +1] - $gamma_Brace[$i]) / 2.0 if $gamma_Brace[$i] >= 0.0;
  $Che{'No_6'} += ($No_6[$i + 1] + $No_6[$i]) * 
    ($gamma_Brace[$i +1] - $gamma_Brace[$i]) / 2.0 if $gamma_Brace[$i] >= 0.0;
  $Che{'No_7'} += ($No_7[$i + 1] + $No_7[$i]) * 
    ($gamma_Brace[$i +1] - $gamma_Brace[$i]) / 2.0 if $gamma_Brace[$i] >= 0.0;
  print OUT "$gamma_Brace[$i+1]\t$Che{'No_5'}\t$Che{'No_6'}\t$Che{'No_7'}\n" if $gamma_Brace[$i] > 0.0;
}
close(OUT);

## load is negative.
$Che{'No_1'}=0.;
$Che{'No_3'}=0.;
$Che{'No_4'}=0.;
$Che{'No_5'}=0.;
$Che{'No_6'}=0.;
$Che{'No_7'}=0.;

open(OUT, ">no-sujikai-minus.dat");
print OUT "0.0\t0.0\t0.0\t0.0\n";
for ($i=$#No_1 ; $i > 0 ; $i--) {
  $Che{'No_1'} += ($No_1[$i - 1] + $No_1[$i]) * 
    ($gamma[$i - 1] - $gamma[$i]) / 2.0 if $gamma[$i] <= 0.0;
  $Che{'No_3'} += ($No_3[$i - 1] + $No_3[$i]) * 
    ($gamma[$i - 1] - $gamma[$i]) / 2.0 if $gamma[$i] <= 0.0;
  $Che{'No_4'} += ($No_4[$i - 1] + $No_4[$i]) * 
    ($gamma[$i - 1] - $gamma[$i]) / 2.0 if $gamma[$i] <= 0.0;

  print OUT "$gamma[$i - 1]\t$Che{'No_1'}\t$Che{'No_3'}\t$Che{'No_4'}\n" if $gamma[$i] <= 0.0;
}
close(OUT);

open(OUT, ">sujikai-minus.dat");
print OUT "0.0\t0.0\t0.0\t0.0\n";
for ($i=$#No_5 ; $i > 0 ; $i--) {
  if ($gamma_Brace[$i] <= 0.0) {
    print "$gamma_Brace[$i]\t$No_5[$i]\t$No_6[$i]\t$No_7[$i]\n";
    $Che{'No_5'} += ($No_5[$i - 1] + $No_5[$i]) * 
      ($gamma_Brace[$i - 1] - $gamma_Brace[$i]) / 2.0;
    $Che{'No_6'} += ($No_6[$i - 1] + $No_6[$i]) * 
      ($gamma_Brace[$i - 1] - $gamma_Brace[$i]) / 2.0;
    $Che{'No_7'} += ($No_7[$i - 1] + $No_7[$i]) * 
      ($gamma_Brace[$i - 1] - $gamma_Brace[$i]) / 2.0;
    print OUT "$gamma_Brace[$i - 1]\t$Che{'No_5'}\t$Che{'No_6'}\t$Che{'No_7'}\n";
  }
}
close(OUT);

1;
