#! /usr/bin/perl
#compile: collatz.pl Number.pm
use warnings;
use strict;
use Number;

print "Enter your input:\n";
my $input = <STDIN>;
chomp $input;
print "Input entered: $input\n";

my @numbers;

for(my $i = 0; $i < 10; $i = $i + 1)
{
    my $number = Number->new();
    $number->set_num(0);
    $number->set_steps(0);
    $numbers[$i] = $number;    
}

my $control = $input;

while($control != 1)
{
    $input = $control;
    my $count = 0;
    while($input != 1)
    {
        if($input % 2 == 0)
        {
            $input = $input/2;
        }
        else
        {
            $input = ($input*3)+1;
        }
        $count = $count + 1;
    }
    
    $input = $control;
    my $dup = 0;
    my $dupIndex = 0;
    my $smallIndex = 0;
    my $small = $numbers[0]->get_steps();
    for(my $i = 0; $i < 10; $i = $i + 1)
    {
        if($numbers[$i]->get_steps() <= $small)
        {
            $small = $numbers[$i]->get_steps();
            $smallIndex = $i;
        }
        if($numbers[$i]->get_steps() == $count)
        {
            $dup = 1;
            $dupIndex = $i;
        }
    }
    if($count > $numbers[$smallIndex]->get_steps() && $dup == 0)    
    {
        $numbers[$smallIndex]->set_steps($count);
        $numbers[$smallIndex]->set_num($input);
    }
    if($input < $numbers[$dupIndex]->get_num() && $dup == 1)
    {
        $numbers[$dupIndex]->set_num($input);
    }
    $control = $control - 1;
}

for(my $a = 0; $a < 10; $a = $a + 1)
{
    print STDOUT $numbers[$a]->get_num(), "    ",$numbers[$a]->get_steps(), "\n";
}


