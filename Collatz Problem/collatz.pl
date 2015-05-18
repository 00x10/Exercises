#!/usr/bin/perl

#USAGE perl collatz.pl

my $number = 1000000;
my $chainLength = 0;
my $startingNumber = 0;
my $sequence = -1;
my @store;

$store[$number] = -1;			#store results that have been calculated
$store[1] = 1;
#$store_length = $#store;

for ($j = 2; $j <= $number; $j++) {
    $sequence = $j;
    my $k = 0;
    while ($sequence != 1 && $sequence >= $j) {
        $k++;
        if (($sequence % 2) == 0) {
            $sequence = $sequence / 2;
        } else {
            $sequence = $sequence * 3 + 1;
        }
    }
    $store[$j] = $k + $store[$sequence];
 
    if ($store[$j] > $chainLength) {
        $chainLength = $store[$j];
        $startingNumber = $j;
    }
}

print "The StartingNumber is $startingNumber which has the ChainLength is $chainLength \n";

