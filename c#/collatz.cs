using System;
using System.Diagnostics;

public class Diffusion
{
    static public void Main()
    {
        int input;  //user input for Msize
        Console.WriteLine("Enter test number: ");
        input = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine("The input is: " + input);

        if(input%2 == 0)
        {
            Console.WriteLine(input + " is even.");
        }
        else 
        {
            Console.WriteLine(input + " is odd.");
        }
    
    }
    
}

