#include <iostream>
#include <algorithm>
using namespace std;

struct numbers {
    int num;
    int steps;
} s[10];

int smallestIndex(struct numbers (& array)[10]);    //returns the index of the number with the smallest amount of steps
int numOfSteps(int in); //returns the number of steps per sequence for a number
int main ()
{
    int input;      //user input number range number
    cout << "Enter a positive range number: " << endl;
    cin >> input;
    
    //fills array s
    for(int i = 0; i < 10; i++)
    {
        s[i].steps = 0;
        s[i].num = 0;
    }

    //calculates the numbers with the largest amount of steps and stores them in array s
    while(input != 0)
    {
        int stepnum = numOfSteps(input);
        //int index = smallestIndex(s);
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

int numOfSteps(int in)
{
    int count = 0;
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
