#!/usr/local/bin/perl
use File::Basename;

sub p1_120 {
  my $file = shift(@_);
  my $pmax = $xmax = 0.0, $x1 = $x2 = $y1 = $y2 = 0.;
  my $p = 0.0;
  local(@line);

  open(IN, "<$file");

  while (<IN>) {
    @line = split;
    $y2 = $line[0];
    $x2 = $line[1];

    if ($y2 > $pmax && $x2 > $xmax && $x2 > $x1) {

      if ($x1 < 1./120. && 1./120. < $x2 ) {
	$p = ($y2 - $y1)*(1./120. - $x1)/($x2 - $x1) + $y1
      }

      $pmax = $y2;
      $xmax = $x2;

    }

    $x1 = $x2;
    $y1 = $y2;

  }
  close(IN);
  return $p;
}

@files = ("shichijo.dat", "tsuji.dat", "tanaka.dat", "sugiura.dat", "haumesse.dat");

foreach $file (@files) {
  $out = basename($file, "dat") . "out";

  $p1_120 = &p1_120($file);
  print $file,"\t",$p1_120,"\n";

  open(IN, "<$file");
  open(OUT, ">$out");
  $pmax=0;
  while (<IN>) {
    ($load, $gamma2, $gamma1) = split;
    if ($load > $pmax) {
      printf OUT "%7.3f\t%f\n", $load/$p1_120, $gamma2;
      $pmax = $load;
    }
  }
  close(OUT);
  close(IN);
}
