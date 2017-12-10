using System;
using System.Diagnostics;
using System.Linq;

public struct number    //a struct that holds both a number that will go into the collatz sequence and the step count to finish that sequence
{
    public ulong num;   //number that goes into the collatz sequence (sequence number)
    public ulong steps; //step count to finish sequence (step count)
}

public class Rcollatz
{
    static public void Main()
    {
        number [] numbers = new number[10]; //an array that holds a number and to store the top 10 highest sequence numbers with the highest step counts
        ulong input = 10000;    //***input is the starting sequence number***

        //fills the array with a sequence number and step count to 0 for each number
        for(int i = 0; i < 10; i++)
        {
            numbers[i].num = 0;
            numbers[i].steps = 0;
        }
        
        ulong control = input;  //variable that controls when the all of the sequence numbers have been tested

        //uses the control variable to stop the while loop until every sequence number starting from in is tested
        while(control != 0)
        {               
            input = control;    //sets input to the control (current sequence number), to make sure the current sequence number is being tested
            ulong count = seq_length(input);    //finds and returns the step count for the current sequence number
            bool dup = false;   //duplicate flag
            int dupIndex = 0;   //index of a number with a duplicate step count
            int smallestIndex = 0;  //index with the smallest number of steps
            ulong smallest = numbers[0].steps;  //number with the smallest step count
            
            //goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same 
            //step count
            for(int i=0; i < 10; i++)
            {
                if(numbers[i].steps <= smallest)    //checks to see which element has the smallest step count
                {
                    smallest = numbers[i].steps;    //reassigns the number with the smallest number of steps
                    smallestIndex = i;  //saves the index with the smallest step count
                }
                if(numbers[i].steps == count)   //checks to see if there is a number in the array with the same step count as the current sequence number
                {
                    dup = true;     //sets the duplicate flag to true
                    dupIndex = i;   //saves the index where the duplicate step count occurs
                }
            }
            
            //if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
            //a duplicate replace the information at the smallest index to match the current sequence number 
            if(count > numbers[smallestIndex].steps && dup == false)    
            {
                numbers[smallestIndex].steps = count;
                numbers[smallestIndex].num = input;
            }

            //if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
            //at the duplicate index to the current sequence number
            if(input < numbers[dupIndex].num && dup == true)
            {
                numbers[dupIndex].num = input;
            }
            control--;  //decrement the sequence number
        }

        //sorts the numbers based on step count
        Console.WriteLine("Sorted based on step count size: ");
        Array.Sort(numbers, (x, y) => y.steps.CompareTo(x.steps));
        
        //prints the numbers array to show the sequence number and the step count for that sequence number
        for(int i = 0; i < 10; i++)
        {
            Console.WriteLine(numbers[i].num + "        " + numbers[i].steps);
        }

        //sorted the numbers based on the size of the sequence number
        Console.WriteLine("Sorted based on sequence number size: ");
        Array.Sort(numbers, (x, y) => y.num.CompareTo(x.num));
        
        //prints the numbers array to show the sequence number and the step count for that sequence number
        for(int i = 0; i < 10; i++)
        {
            Console.WriteLine(numbers[i].num + "        " + numbers[i].steps);
        }
    } 

    public static ulong seq_length(ulong input) //recursive method to get the number of steps of a sequence for a number input
    {
        ulong count = 0;    //sets the step count to 0
        if (input == 1) //if input = 1 exit the method and return the final count number
        {
            return count;
        }
        else if (input % 2 == 0)    //tests if input is even
        {
            count = seq_length(input / 2) + 1;  //stores the recursive call of input/2 then adds 1 to count
        }
        else    //input is odd
        {
            count = seq_length(3*input + 1) + 1;    //stores the recursive call of 3*input+1 then adds 1 to count
        }
        return count;   //returns count if none of the previous if statements are true
    }
}

