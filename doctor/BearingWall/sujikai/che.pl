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
  local(@line);

  open(IN, "<$infile");
  open(OUT, ">$outfile");

  while (<IN>) {
    ($load1, $disp1) = split;
    if ( $load1 < $pmax ) {
      $che += ($load0 + $load1) * ($disp1 - disp0) / 2.0;
      print OUT "$lineno\t$che\n";
      ($load0, $disp0) = ($load1, $disp1);
      $lineno ++;
    }
  }

  close(IN);
  close(OUT);
}

sub Csv {
  my $infile = shift(@_);
  my @line;
  my $P = $Delta = 0.0;

  $tmpfile = $infile . ".tmp";

  open(IN, "<$infile");
  open(OUT, ">$tmpfile");

  while (<IN>) {
    @line = split(/,/);
    $P = $line[1]/1000.0;   # tonf
    $Delta = ( $line[13] - $line[14] )/( 2730. - 105. - 200. )*273.0; # cm
    print OUT "$P\t$Delta\n";
  }

  close(IN);
  close(OUT);
}

#### main
$|=1;
$ext="csv";

use File::Basename;

@CSV = <csv/*.$ext>;

mkdir("che",0755) unless -d "che";
mkdir("figs/che",0755) unless -s "figs/che";

foreach $csv (@CSV) {
  $outfile = "che/" . basename($csv, $ext) . "che";

  print "$csv -> $outfile\n";

  &Csv($csv);
  $pmax = &GetPmax($tmpfile);
  &CalcCHE($tmpfile);

  unlink($tmpfile);

  $epsfile = "figs/che/" . basename($outfile, "che") . "eps";
  $label = basename($outfile, "\.che");

  open(GP, ">tmp.gp");
  print GP "set term postscript eps 24\nset xlabel \"step\"\nset ylabel \"energy\"\nset yrange [0:]\nset output \"$epsfile\"\nplot \"$outfile\" u 1:2 title \"$label\" w l\n";
  close(GP);

  system("gnuplot", "tmp.gp") && die || unlink "tmp.gp";

}
