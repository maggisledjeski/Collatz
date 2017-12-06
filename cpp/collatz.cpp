#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {
    long long num;
    long long steps;
} s[10];

int main ()
{
//    int input;      //user input number range number
//    cout << "Enter a positive range number: " << endl;
//    cin >> input;
    long long input = 10000;
    //fills array s
    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    //calculates the numbers with the largest amount of steps and stores them in array s
    while(input != 0)
    {
        long long n = input;
        long long count = 0;
        while(n > 1)
        {
            if(n%2 == 0)    //uses mod to determine if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
            {
                n = n/2;
            }
            else
            {
                n = n*3 + 1;
            }
            count = count + 1;
        }
        long long stepnum = count;
        bool dup = false;
        int dupIndex = 0;
        int smallestIndex = 0;
        long long smallest = s[0].steps;
        for(int i=0; i < 10; i++)
        {
            if(s[i].steps <= smallest)
            {
                smallest = s[i].steps;
                smallestIndex = i;
            }
            if(s[i].steps == stepnum)
            {
                dup = true;
                dupIndex = i;
            }
        }
        int index = smallestIndex; 
        if(stepnum > s[index].steps && dup == false)    
        {
            s[index].steps = stepnum;
            s[index].num = input;
        }
        if(input < s[dupIndex].steps && dup == true)
        {
            s[dupIndex].num = input;
        }
        input--;
    }

    cout << "Sorted based on sequence length: " << endl;
    sort(s,s+10, [](numbers a, numbers b) { return a.steps > b.steps;});
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }
    cout << "Sorted based on integer size: " << endl;
    sort(s,s+10, [](numbers a, numbers b) { return a.num > b.num;});
    for(int i = 0; i < 10; i++)
    {
        cout << s[i].num << "        " << s[i].steps << endl;
    }

}

long long numOfSteps(long long in)
{
    long long count = 0;
    while(in > 1)
    {
        if(in%2 == 0)    //uses mod to determine if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
        {
            in = in/2;
        }
        else
        {
            in = in*3 + 1;
        }
        count = count + 1;
    }
    
    return count;
}
