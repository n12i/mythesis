#!/usr/local/bin/perl

sub min {
  my $min=shift(@_);
  foreach $foo (@_) {
    $min = $foo if $min > $foo;
  }
  return $min;
}

$Fe=180.0;
$gamma = $Fe/1350.0;
$K=200;

$C1 = sqrt(2.0+2.0/3.0*$gamma*((1.2/3.0)**2))-1.0;
$C2 = 1.2/3.0 * sqrt(2.0/3.0 * $gamma);
$C = min(1.0, $C1, $C2);
$Py = $C * $Fe * 1.2 * 3.0;
$Pnail = $K * (0.4**1.8);
print "$gamma\t$C1\t$C2\t$C\t$Py\t$Pnail\n";

$Fe=225.0;
$gamma = $Fe/1350.0;
$K=255;

$C1 = sqrt(2.0+2.0/3.0*$gamma*((1.2/3.0)**2))-1.0;
$C2 = 1.2/3.0 * sqrt(2.0/3.0 * $gamma);
$C = min(1.0, $C1, $C2);
$Py = $C * $Fe * 1.2 * 3.0;
$Pnail = $K * (0.4**1.8);
print "$gamma\t$C1\t$C2\t$C\t$Py\t$Pnail\n";

$rho = 0.32;
print 870.0 * ($rho**1.8) * (0.5**2) * 8.0, "\n";
$rho = 0.42;
print 870.0 * ($rho**1.8) * (0.5**2) * 8.0, "\n";
