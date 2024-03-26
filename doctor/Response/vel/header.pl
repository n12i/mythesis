#!/usr/bin/perl

# @vels=(50,75,100,125);
# @w=('H','M','L');
# @sites=("ElCentro", "Hachinohe", "JMA-Kobe", "JR-Nisiakasi",
# 	"JR-Takarazuka", "JR-Takatori", "O_GAS_Fukiai");
# @key = ("elcn", "hach", "kob", "nsak", "tkrz", "tktr", "ogas");

# for ($i = 0; $i <= $#sites; $i++) {
#   $site{$sites[$i]} = $key[$i];
# }

# foreach $vel (@vels) {
#   for ($i = 0 ; $i <= $#sites; $i++) {
#     chdir("$vel/" . "$sites[$i]");
    
#   }
# }

$file = $ARGV[$#ARGV-1];
$add = $ARGV[$#ARGV];

open(FILE, "<$file");

while (<FILE>) {
  if (/^\#/) {
    @header = split;
    print $header[0];
    for ($i = 1; $i <=$#header; $i++) {
      $header[$i] = "$header[$i]" . "$add";
      print " $header[$i]";
    }
    print "\n";
  } else {
    print;
  }  
}
