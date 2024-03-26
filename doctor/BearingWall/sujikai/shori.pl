#!/usr/local/bin/perl
#  ��¬�����ͥ������
#  00ch�ĺܲٲٽ�              kgf
#  01ch�ķ������Ѱ�            mm
#  02ch��������Ѱ�            mm
#  03ch��������⤭�夬��(��)  mm
#  04ch��������⤭�夬��(��)  mm
#  05ch�����ȴ��(����)        mm
#  06ch�����ȴ��(����)        mm
#  07ch�����ȴ��(����)        mm
#  08ch�����ȴ��(����)        mm
#  09ch�Ķڤ�����ȴ��(��)      mm
#  10ch�Ķڤ�����ȴ��(��)      mm
#  11ch�Ķڤ����ο���(���)    mm
#  12ch��01ch��ͽ��(�����)    mm
#  13ch��02ch��ͽ��(���첼)    mm
#  14ch�Ķڤ����μ���          kgf

#  ������
#  �ش��ѷ��Ѧ�                rad
#  ����Ψ��
#  ����ٽ� Pmax

#  $Id: shori.pl,v 1.3 1999/03/30 09:40:21 nakaji Exp $

sub min {
  my $min=shift(@_);
  foreach $foo (@_) {
    $min = $foo if $min > $foo;
  }
  return $min;
}

$Pmax=0.0;     # ��������
$Nmax=0.0;     # �������ϻ��ζڤ�������
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
      print "#�ѷ���","\tgamma","\tgamma2\t";
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
