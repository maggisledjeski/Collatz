#include <iostream>
using namespace std;


int main(int argc, char* argv[])
{
    int input;      //user input number
    cin >> input;   //gets the input from the user
    cout << input << endl;  //prints the user input

    if(input%2 == 0)    //uses mod to determin if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
    {
        cout << input << " is even." << endl;
    }
    else
    {
        cout << input << " is odd." << endl;
    }

}
