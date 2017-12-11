#! /usr/bin/perl

use warnings;
use strict;

print "Enter your input:\n";
my $input = <STDIN>;
chomp $input;

my @numbers;
my @steps;

for(my $i = 0; $i < 10; $i = $i + 1)
{
    $numbers[$i] = 0;
    $steps[$i] = 0;    
}

my $control = $input;

sub stepCount
{
    my $n = shift;
    if($n == 1)
    {
        return 0;
    }
    else
    {
        if($n % 2 == 0)
        {
            return 1 + stepCount($n/2);
        }
        else
        {
            return 1 + stepCount($n*3+1);
        }
    }   
}
while($control != 1)
{
    $input = $control;
    my $count = stepCount($input);
    my $dup = 0;
    my $dupIndex = 0;
    my $smallIndex = 0;
    my $small = $steps[0];
    for(my $i = 0; $i < 10; $i = $i + 1)
    {
        if($steps[$i] <= $small)
        {
            $small = $steps[$i];
            $smallIndex = $i;
        }
        if($steps[$i] == $count)
        {
            $dup = 1;
            $dupIndex = $i;
        }
    }
    if($count > $steps[$smallIndex] && $dup == 0)    
    {
        $steps[$smallIndex] = $count;
        $numbers[$smallIndex] = $input;
    }
    if($input < $numbers[$dupIndex] && $dup == 1)
    {
        $numbers[$dupIndex] = $input;
    }
    $control = $control - 1;
}

print "Sorted by step count size:\n";
my @index = sort { $steps[$b] <=> $steps[$a] } 0 .. $#steps;

@steps = @steps[@index];
@numbers = @numbers[@index];

for(my $a = 0; $a < 10; $a = $a + 1)
{
    print $numbers[$a], "    ",$steps[$a], "\n";
}

print "Sorted by sequence number size:\n";
my @index2 = sort { $numbers[$b] <=> $numbers[$a] } 0 .. $#numbers;

@steps = @steps[@index2];
@numbers = @numbers[@index2];

for($a = 0; $a < 10; $a = $a + 1)
{
    print $numbers[$a], "    ",$steps[$a], "\n";
}

