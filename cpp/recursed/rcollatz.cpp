#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {    //a struct that holds both a number that will go into the collatz sequence and the step count to finish that sequence
    long long num;  //number that goes into the collatz sequence (sequence number)
    long long steps;    //number of steps that takes for a sequence number to finish the collatz sequence (step count)
} s[10];    //an array of numbers that stores 10 numbers 

long long numOfSteps(long long n);  //recursive method to get the number of steps of a sequence for a number n
int main ()
{
    long long input = 10000;    //***input is the starting/highest sequence number***

    //fills the array of records to 0's
    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    //uses to control when to stop the while loop until every sequence number starting from input is tested
    while(input != 0)
    {
        long long stepnum = numOfSteps(input);  //finds and returns the step count for the current sequence number
        bool dup = false;   //duplicate flag
        int dupIndex = 0;   //index of a number with a duplicate step count
        int smallestIndex = 0;  //index with the smallest number of steps
        long long smallest = s[0].steps;    //number with the smallest step count
        
        //goes through the array s to see which numbers has the smallest step count and if there are duplicate sequence numbers with the same step count
        for(int i=0; i < 10; i++)
        {
            if(s[i].steps <= smallest)  //checks to see which numbers has the smallest step count
            {
                smallest = s[i].steps;  //reassigns the numbers with the smallest number of steps
                smallestIndex = i;      //saves the index with the smallest number of steps
            }
            if(s[i].steps == stepnum)   //checks to see if there is a number in the array with the same step count as the current sequence number
            {
                dup = true; //sets the duplicate flag to true
                dupIndex = i;   //saves the index where the duplicate step count occurs
            }
        }
        
        //if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
        //a duplicate replace the information at the smallest index to match the current sequence number 
        if(stepnum > s[smallestIndex].steps && dup == false)    
        {
            s[smallestIndex].steps = stepnum;
            s[smallestIndex].num = input;
        }

        //if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
        //at the duplicate index to the current sequence number
        if(input < s[dupIndex].steps && dup == true)
        {
            s[dupIndex].num = input;
        }
        input--;    //decrement the sequence number
    }

    //sorted by step count
    cout << "Sorted based on step count size: " << endl;
    sort(s,s+10, [](numbers a, numbers b) { return a.steps > b.steps;});
    //prints the sorted array of numbers
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }
    //sorted by sequence number
    cout << "Sorted based on sequence number: " << endl;
    sort(s,s+10, [](numbers a, numbers b) { return a.num > b.num;});
    //prints the sorted array of numbers
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }

}

long long numOfSteps(long long n)   //recursive method to get the number of steps of a sequence for a number n
{
    if(n == 1)  //if n = 1 exit the method and return 0
    {
        return 0;
    }
    else 
    {
        if(n%2 != 0)    //tests if n is even
        {
            return 1 + numOfSteps(3*n+1);   //the recursive call of n/2 then adds 1
        }
        else    //n is odd
        {
            return 1 + numOfSteps(n/2);     //the recursive call of 3*n +1 then adds 1
        }
    }

}

