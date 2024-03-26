#!/usr/local/bin/perl

@origin=(0.0,0.0);
@first=(1./960., 0.5);
@second=(1./120., 1.0);
@third=(1./30., 1.5);
@fourth=(1./25., 1.5);

$k1 = $first[1]/$first[0];
$k2 = ($second[1] - $first[1])/($second[0] - $first[0]);
$k3 = ($third[1] - $second[1])/($third[0] - $second[0]);
$k4 = ($fourth[1] - $third[1])/($fourth[0] - $third[0]);

@fifth=($fourth[0] - $first[0] * 2, $fourth[1] - $k1 * $first[0] * 2);
@sixth=($fifth[0] - ($second[0] - $first[0]) * 2, 
	$fifth[1] - $k2 * ($second[0] - $first[0]) * 2);
@seventh=($sixth[0] - ($third[0] - $second[0]) * 1.5,
	  $sixth[1] - $k3 * ($third[0] - $second[0]) * 1.5);
@eighth=($seventh[0] - ($fourth[0] - $third[0]) * 0.,
	 $seventh[1] - $k4 * ($fourth[0] - $third[0]) * 2);
@ninth=($eighth[0] + ($first[0] - $origin[0]) * 2,
	$eighth[1] + $k1 * ($first[0] - $origin[0]) * 2);
@tenth=($ninth[0] + ($second[0] - $first[0]) * 2,
	$ninth[1] + $k2 * ($second[0] - $first[0]) * 2);
@eleventh=($tenth[0] + ($third[0] - $second[0]) * 1.2,
	   $tenth[1] + $k3 * ($third[0] - $second[0]) * 1.2);

open(QL2, ">ql2.dat");

print QL2 "0.0\t0.0\n";
print QL2 "$first[0]\t$first[1]\n";
print QL2 "$second[0]\t$second[1]\n";
print QL2 "$third[0]\t$third[1]\n";
print QL2 "$fourth[0]\t$fourth[1]\n";
print QL2 "$fifth[0]\t$fifth[1]\n";
print QL2 "$sixth[0]\t$sixth[1]\n";
print QL2 "$seventh[0]\t$seventh[1]\n";
print QL2 "$eighth[0]\t$eighth[1]\n";
print QL2 "$ninth[0]\t$ninth[1]\n";
print QL2 "$tenth[0]\t$tenth[1]\n";
print QL2 "$eleventh[0]\t$eleventh[1]\n";

close(QL2);

open(GPFILE, ">ql.arrow");
$setarrow = "set arrow from %f,%f to %f,%f\n";
printf GPFILE ($setarrow, $origin[0],$origin[1],$first[0],$first[1]);
printf GPFILE ($setarrow, $first[0],$first[1],$second[0],$second[1]);
printf GPFILE ($setarrow, $second[0],$second[1],$third[0],$third[1]);
printf GPFILE ($setarrow, $third[0],$third[1],$fourth[0],$fourth[1]);
printf GPFILE ($setarrow, $fourth[0],$fourth[1],$fifth[0],$fifth[1]);
printf GPFILE ($setarrow, $fifth[0],$fifth[1],$sixth[0],$sixth[1]);
printf GPFILE ($setarrow, $sixth[0],$sixth[1],$seventh[0],$seventh[1]);
printf GPFILE ($setarrow, $seventh[0],$seventh[1],$eighth[0],$eighth[1]);
printf GPFILE ($setarrow, $eighth[0],$eighth[1],$ninth[0],$ninth[1]);
printf GPFILE ($setarrow, $ninth[0],$ninth[1],$tenth[0],$tenth[1]);
printf GPFILE ($setarrow, $tenth[0],$tenth[1],$eleventh[0],$eleventh[1]);

close(GPFILE);
