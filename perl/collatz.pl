#! /usr/bin/perl
use warnings;
use strict;

print "Enter your input:\n";
my $input = <STDIN>;
chomp $input;
print "You typed: $input\n";

if($input % 2 == 0)
{
    print "$input is even.\n";
}
else
{
    print "$input is odd.\n";
}
