using System;
using System.Diagnostics;
using System.Linq;

public struct number 
{
    public int num;
    public int steps;
}

public class Rcollatz
{
    static public void Main()
    {
        number [] numbers = new number[10];
        int input;  //user input
        Console.WriteLine("Enter a positive integer: ");
        input = Convert.ToInt32(Console.ReadLine());
 
        for(int i = 0; i < 10; i++)
        {
            numbers[i].num = 0;
            numbers[i].steps = 0;
        }
        
        int control = input;

        while(control != 0)
        {               
            input = control;
            int count = seq_length(input);
            bool dup = false;
            int dupIndex = 0;
            int smallestIndex = 0;
            int smallest = numbers[0].steps;
            for(int i=0; i < 10; i++)
            {
                if(numbers[i].steps <= smallest)
                {
                    smallest = numbers[i].steps;
                    smallestIndex = i;
                }
                if(numbers[i].steps == count)
                {
                    dup = true;
                    dupIndex = i;
                }
            }
            int index = smallestIndex; 
            if(count > numbers[index].steps && dup == false)    
            {
                numbers[index].steps = count;
                numbers[index].num = input;
            }
            if(input < numbers[dupIndex].num && dup == true)
            {
                numbers[dupIndex].num = input;
            }
            control--;
        }
        Console.WriteLine("Sorted based on sequence length: ");
        Array.Sort(numbers, (x, y) => y.steps.CompareTo(x.steps));
        for(int i = 0; i < 10; i++)
        {
            Console.WriteLine(numbers[i].num + "        " + numbers[i].steps);
        }
        Console.WriteLine("Sorted based on integer size: ");
        Array.Sort(numbers, (x, y) => y.num.CompareTo(x.num));
        for(int i = 0; i < 10; i++)
        {
            Console.WriteLine(numbers[i].num + "        " + numbers[i].steps);
        }
    } 

    public static int seq_length(int input)
    {
    int count = 0;
    if (input == 1)
    {
        return count;
    }
    else if (input % 2 == 0)
    {
        count = seq_length(input / 2) + 1;
    }
    else
    {
        count = seq_length(3*input + 1) + 1;
    }
    return count;
    }
}

