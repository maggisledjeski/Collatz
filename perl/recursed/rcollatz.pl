#! /usr/bin/perl

use warnings;
use strict;

print "Enter your input:\n";    #prompts user input
my $input = <STDIN>;    #gets user input
chomp $input;

my @numbers;    #array that holds the sequence numbers that match the 10 highest step counts
my @steps;      #array that holds the 10 highest step counts

#fills both arrays with 0's
for(my $i = 0; $i < 10; $i = $i + 1)
{
    $numbers[$i] = 0;
    $steps[$i] = 0;    
}

my $control = $input;   #variable that controls when all of the sequence numbers have been tested

#recursive method to get the number of steps of a sequence for a number n
sub stepCount
{
    my $n = shift;  #n is a parameter
    if($n == 1) #if n = 1 exit the method and return 0
    {
        return 0;
    }
    else
    {
        if($n % 2 == 0) #tests if n is even
        {
            return 1 + stepCount($n/2); #stores the recursive call of n/2 then adds 1
        }
        else    #n is odd
        {
            return 1 + stepCount($n*3+1);   #stores the recursive call of 3*n+1 then adds 1
        }
    }   
}

#uses the control variable to stop the while loop until every sequence number starting from input is tested
while($control != 1)
{
    $input = $control;  #sets input to the control (current sequence number), to make sure the current sequence number is being tested
    my $count = stepCount($input);  #finds and returns the step count for the current sequence number
    my $dup = 0;    #duplicate flag
    my $dupIndex = 0;   #index of a number with a duplicate step count
    my $smallIndex = 0; #index with the smallest number of steps
    my $small = $steps[0];  #number with the smallest step count

    #goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
    for(my $i = 0; $i < 10; $i = $i + 1)
    {
        if($steps[$i] <= $small)    #checks to see which element has the smallest step count
        {
            $small = $steps[$i];    #reassigns the number with the smallest number of steps
            $smallIndex = $i;   #saves the index with the smallest number of steps
        }
        if($steps[$i] == $count)    #checks to see if there is a number in the array with the same step count as the current sequence number
        {
            $dup = 1;   #sets the duplicate flag to true
            $dupIndex = $i; #saves the index where the duplicate step count occurs
        }
    }
    
    #if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
    #a duplicate replace the information at the smallest index to match the current sequence number
    if($count > $steps[$smallIndex] && $dup == 0)    
    {
        $steps[$smallIndex] = $count;
        $numbers[$smallIndex] = $input;
    }
    
    #if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
    #at the duplicate index to the current sequence number
    if($input < $numbers[$dupIndex] && $dup == 1)
    {
        $numbers[$dupIndex] = $input;
    }
    $control = $control - 1;    #decrements the sequence number
}

#sorted by step count
print "Sorted by step count size:\n";
#goes through the steps array and compares the elements with the spaceship operator and stores steps with the comp in array index
my @index = sort { $steps[$b] <=> $steps[$a] } 0 .. $#steps;

@steps = @steps[@index];    #places sorted step counts back into step array
@numbers = @numbers[@index];    #places sorted sequence numbers into numbers array

#prints the sorted arrays
for(my $a = 0; $a < 10; $a = $a + 1)
{
    print $numbers[$a], "    ",$steps[$a], "\n";
}

#sorted by sequence number
print "Sorted by sequence number size:\n";
#goes through the numbers array and compares the elements with the spaceship operator and stores numbers with the comp in array index2
my @index2 = sort { $numbers[$b] <=> $numbers[$a] } 0 .. $#numbers;

@steps = @steps[@index2];   #places sorted step counts back into step array
@numbers = @numbers[@index2];   #places sorted sequence numbers into numbers array

#prints the sorted arrays
for($a = 0; $a < 10; $a = $a + 1)
{
    print $numbers[$a], "    ",$steps[$a], "\n";
}

