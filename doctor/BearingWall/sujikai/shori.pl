#!/usr/local/bin/perl
#  計測チャンネルの説明
#  00ch…載荷荷重              kgf
#  01ch…桁部の変位            mm
#  02ch…土台の変位            mm
#  03ch…土台の浮き上がり(左)  mm
#  04ch…土台の浮き上がり(右)  mm
#  05ch…柱の抜け(左上)        mm
#  06ch…柱の抜け(左下)        mm
#  07ch…柱の抜け(右上)        mm
#  08ch…柱の抜け(右下)        mm
#  09ch…筋かいの抜け(上)      mm
#  10ch…筋かいの抜け(下)      mm
#  11ch…筋かいの伸び(中央)    mm
#  12ch…01chの予備(右柱上)    mm
#  13ch…02chの予備(右柱下)    mm
#  14ch…筋かいの軸力          kgf

#  求めるもの
#  層間変形角γ                rad
#  壁倍率α
#  最大荷重 Pmax

#  $Id: shori.pl,v 1.3 1999/03/30 09:40:21 nakaji Exp $

sub min {
  my $min=shift(@_);
  foreach $foo (@_) {
    $min = $foo if $min > $foo;
  }
  return $min;
}

$Pmax=0.0;     # 最大耐力
$Nmax=0.0;     # 最大耐力時の筋かい軸力
$zero=0.0;
$line="";

$file=$ARGV[0];
$haba=$ARGV[1] * 0.91;

print STDERR $file,"\t",$haba,"\n";

open(IN, "<$file");
open(ENVELOPE, '>envelope');

while(<IN>){
  if (! /^/) {
    
    @data = split(/,/);
    $Load = $data[1];
    for ($i = 1; $i <= 13; $i++) {
      $ch[$i] = $data[$i+1];
    }
    $BrLoad = $data[15];
    
#     if ($file =~ /AS2M1/) {
#       $gamma = ( $ch[1] - $ch[2] ) / (2730 - 105 - 200) * 10.;
#     } else {
      $gamma = ( $ch[1] - $ch[2] ) / (2730 - 105 - 200);
#     }
    
#     if ($file =~ /AS1C1/ || $file =~ /AS2M1/) {
#       $gamma2 = ( $ch[12] - $ch[13] ) / (2730 - 105 - 200) * 10.;
#     } else {
      $gamma2 = ( $ch[12] - $ch[13] ) / (2730 - 105 - 200);
#     }
    # print $gamma,"\t",$Load, "\n";
    
    if ($gamma eq "0") {
      print "#変形角","\tgamma","\tgamma2\t";
      for ($i = 1; $i <= 13; $i++) {
	print $ch[$i],"\t";
      }
      print $BrLoad,"\t";
      print $Load,"\n";
    } else {
      print $gamma,"\t",$gamma2,"\t";
      for ($i = 1; $i <= 13; $i++) {
	print $ch[$i],"\t";
      }
      print $BrLoad,"\t";
      print $Load,"\n";    
    }
    
    if ($Load > $Pmax) {
      $Pmax = $Load;
      $Gmax = $gamma;
      $Nmax = $BrLoad;
    }
    if ($Load > $zero) {
      $zero = $Load;
    printf ENVELOPE "$gamma\t$Load\t$gamma2\t$BrLoad\n";
    }
  } # !/^^Z/
} # while(<>)

printf STDERR "Pmax=\t$Pmax\nGmax=\t$Gmax\n";

open(ENVELOPE, "<envelope");

$P1_120=1000.0;
$Pmax2_3 = 2./3.*$Pmax;
$Gmax2 = $Gmax*0.5;

$Pmax4 = $Pmax * 0.4;
$Pmax2 = $Pmax * 0.2;
$Offset = 0.0;

$gamma0=$load0=0.0;

while (<ENVELOPE>) {
  @line=split;
  $gamma=$line[0];
  $load=$line[1];

  if ($load0 <= $Pmax2 && $Pmax2 <= $load ) {
    $gamma2 = ($gamma - $gamma0)*($Pmax2 - $load0)/($load - $load0) + $gamma0;
  }
  if ($load0 <= $Pmax4 && $Pmax4 <= $load ) {
    $gamma4 = ($gamma - $gamma0)*($Pmax4 - $load0)/($load - $load0) + $gamma0;
  }
  $gamma0=$gamma;
  $load0=$load;
}

close(ENVELOPE);

$Offset = ($gamma4-$gamma2)*(0.-$Pmax2)/($Pmax4-$Pmax2)+$gamma2;

if ($Offset < 0.0) {
  $Offset = 0.0;
}

$gamma0=$Offset * (-1.0);
$load0=0.0;
$Gmax2 = ($Gmax - $Offset)*0.5;

open(ENVELOPE, "<envelope");
open(HOSEI, ">hosei");

while (<ENVELOPE>) {
  @line=split;
  $gamma=$line[0] - $Offset;
  $load=$line[1];

  print HOSEI "$gamma\t$load\n";

  if ($gamma0 <= 1./120. && 1./120. <= $gamma ) {
    $P1_120 = ($load - $load0)*(1./120. - $gamma0)/($gamma - $gamma0) + $load0;
  }
  if ($gamma0 < $Gmax2 && $Gmax2 < $gamma ) {
    $P_Gmax2 = ($load - $load0)*($Gmax2 - $gamma0)/($gamma - $gamma0) + $load0;
  }
  
  $gamma0=$gamma;
  $load0=$load;
}

close(ENVELOPE);

$Pmin = min($P1_120,$P_Gmax2,$Pmax2_3);
$Alpha=3./4.*$Pmin/$haba/130.;

$file =~ s/\.euc//;
open(ALPHA, ">alpha2");
printf ALPHA ("%s & %6.2f & %6.2f & %6.2f & %6.2f & %4.2f & %6.4f & %d\\\\\\\hline\n",
	     $file, $P1_120, $Pmax2_3, $P_Gmax2, $Pmin, $Alpha, $Gmax, $Nmax);

