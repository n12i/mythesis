#!/usr/local/bin/perl
#
# 七条邸の2層の復元力特性と履歴モデルを比較する。
#
$gosei1 = 12.09;
$gosei2 = 5.58; # tonf/cm

$w1 = 11.0;
$w2 = 8.1;
$Rm = $w2/$w1;

@Area = (70.28,40.61);
$C0=0.5;                # ベースシアー係数の初期値
$dC0=0.05;               # ベースシアー係数の増分
@Height=(275.0,250.0);  # 階高
@XD1=($Height[0]/960.0,$Height[1]/960.0); # 第1折れ曲がり点
@XD2=($Height[0]/120.0,$Height[1]/120.0); # 第2折れ曲がり点
$Damping=0.05;          # 減衰定数(5%)
$dtsec=0.01;            # 入力地震動のサンプリング周期
$ALPH=0.7;
$BETA=0.4;
$calib=2.0;
$gamma=(8.12/5.6-(1.0-$BETA))/$BETA;
$nu = 1.0;
$seisfile="seisdata/takatori.NS";
$siteali = "TEST";

$Lines = 2551;
$format1="%10.3f%10.3f\n";
$format2="%10.5f\n";
$format3="%10.5f%10.5f\n";

open (OUT, ">src/temp.dat") || die;

printf OUT ("%5d%5d%5d%5d%5d\n",$Lines,10,1,1,50);
printf OUT ($format1,$w1,$Rm);
printf OUT ($format1,$Area[0],$Area[1]);
printf OUT ($format3,$C0,$dC0);
printf OUT ($format1,$Height[0],$Height[1]);
printf OUT ($format3,$XD1[0],$XD1[1]);
printf OUT ($format3,$XD2[0],$XD2[1]);
printf OUT ($format2,$Damping);
printf OUT ($format2,$ALPH);
printf OUT ($format2,$BETA);
printf OUT ($format2,$gamma);
printf OUT ($format2,$nu);
print OUT "$seisfile\n";
printf OUT ("%4d\n",$Lines);
printf OUT ("%10.5f\n",$dtsec);
printf OUT ("%10.5f\n",$calib);
for ($loop=1;$loop<=20;$loop++) {
  printf OUT ("%s%02d.txt\n",$siteali,$loop);
}
printf OUT ("%s.txt\n",$w.$siteali);
close(OUT);
