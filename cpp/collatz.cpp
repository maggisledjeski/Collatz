#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {    //a struct that holds both a number that will go into the collatz sequence and the step count to finish that sequence
    unsigned long long num;     //number that goes into the collatz sequence (sequence number)
    unsigned long long steps;   //number of steps a num takes to finish the collatz sequence (step count)
} s[10];    //array of 10 numbers

int main ()
{
    unsigned long long input = 10000;   //***input is the starting/highest sequence number***

    //fills array s with each num and steps to 0
    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    //uses the control variable to stop the while loop until every sequence number starting from input is tested
    while(input != 0)
    {
        unsigned long long n = input;   //sets n to input (current sequence number), to make sure the current sequence number is being tested
        unsigned long long count = 0;   //step count is set to 0
        
        //computes the collatz sequence until n = 1
        while(n > 1)
        {
            bool b = false; //boolean to use bitwise
            if(n%2 == 0)    //tests if n is even
            {
                b = true;
            }
            n = b ? n >> 1 : 3*n + 1;   //if n is even set n = n/2 else set n = 3*n+1
            count += 1; //increment step count
        }
        
        unsigned long long stepnum = count; //stores the number of steps
        bool dup = false;   //duplicate flag
        int dupIndex = 0;   //index of a number with a duplicate step count
        int smallestIndex = 0;  //index with the smallest number of steps
        unsigned long long smallest = s[0].steps;   //number with the smallest step count

        //goes through the array s to see which number has the smallest step count and if there are duplicate sequence numbers with the same step count
        for(int i=0; i < 10; i++)
        {
            if(s[i].steps <= smallest)  //checks to see which element has the smallest step count
            {
                smallest = s[i].steps;  //reassigns the number with the smallest number of steps
                smallestIndex = i;  //saves the index with the smallest number of steps
            }
            if(s[i].steps == stepnum)   //checks to see if there is a number in the array with the same step count as the current sequence number
            {
                dup = true;     //sets the duplicate flag to true
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
    //prints the sorted array
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }
        
    //sorted by sequence number
    cout << "Sorted based on sequence number size: " << endl;
    sort(s,s+10, [](numbers a, numbers b) { return a.num > b.num;});
    //prints the sorted array
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }

}

