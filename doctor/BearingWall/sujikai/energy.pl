#!/usr/local/bin/perl

while (<>) {
  @line = split(/,/);
  printf ("%s \& %7.2f \& %s \& %7.2f \\\\\\hline\n",
	  $line[0], $line[1], $line[2], $line[3]);
}
