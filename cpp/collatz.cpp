#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {
    unsigned long long num;
    unsigned long long steps;
} s[10];

int main ()
{
    unsigned long long input = 10000;

    //fills array s with each num and steps to 0
    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    //calculates the numbers with the largest amount of steps and stores them in array s
    while(input != 0)
    {
        unsigned long long n = input;
        unsigned long long count = 0;
        while(n > 1)
        {
            bool b = false;
            if(n%2 == 0)
            {
                b = true;
            }
            n = b ? n >> 1 : 3*n + 1;
            count += 1;
        }
        unsigned long long stepnum = count;
        bool dup = false;
        int dupIndex = 0;
        int smallestIndex = 0;
        unsigned long long smallest = s[0].steps;
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

