using System;
using System.Diagnostics;

public class Diffusion
{
    static public void Main()
    {
        int input;  //user input
        Console.WriteLine("Enter a positive integer: ");
        input = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine("The input is: " + input);

        int count = 0;

        while(input != 1)
        {
            if(input%2 == 0)
            {
                input = input/2;
                Console.WriteLine(input);
                //Console.WriteLine(input + " is even.");
            }
            else 
            {
                input = (input*3)+1;
                Console.WriteLine(input);
                //Console.WriteLine(input + " is odd.");
            }
            count = count + 1;
        } 
        Console.WriteLine("Count of numbers in the sequence: " + count);   
    }    
}

