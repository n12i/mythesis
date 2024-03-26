#!/usr/bin/perl
$|=1;
@a=@ARGV;

@csv=<csv/*.csv>;

while (<>) {
  @header=split(/,/);
  if (/^\#/) {
      $j=0;
      for ($i=0; $i <= $#header; $i++) {
	if ($header[$i] =~ /fs$/) {
	  $header[$i] =~ s/ //;
	  $out[$j] = $i;
	  $j++;
	}
      }
    }
    
  print "$header[0]\t";
  for ($j=0;$j<=$#out;$j++) {
    print "$header[$out[$j]]\t"
  }
  print "\n";
}
