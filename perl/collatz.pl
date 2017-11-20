#! /usr/bin/perl
use warnings;
use strict;

print "Enter your input:\n";
my $input = <STDIN>;
chomp $input;
print "You typed: $input\n";

while($input != 1)
{
    if($input % 2 == 0)
    {
        $input = $input/2;
        print "$input\n";
        #print "$input is even.\n";
    }
    else
    {
        $input = ($input*3)+1;
        print "$input\n";
        #print "$input is odd.\n";
    }
}
