#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {
    int num;
    int steps;
} s[10];

int numOfSteps(int n);
int main ()
{
    int input;
    cout << "Enter a positive range number: " << endl;
    cin >> input;

    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    while(input != 0)
    {
        int stepnum = numOfSteps(input);
        bool dup = false;
        int dupIndex = 0;
        int smallestIndex = 0;
        int smallest = s[0].steps;
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

int numOfSteps(int n)
{
    if(n == 1)
    {
        return 0;
    }
    else 
    {
        if(n%2 != 0)
        {
            return 1 + numOfSteps(3*n+1);
        }
        else
        {
            return 1 + numOfSteps(n/2);
        }
    }

}

