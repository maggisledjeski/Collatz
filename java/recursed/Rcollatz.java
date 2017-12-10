import java.io.*;
import java.util.Arrays;

public class Rcollatz {     //a class that holds both a number that will go into the collatz sequence and the step count to finish that sequence
    long num;       //number that goes into the collatz sequence
    long steps;     //step count to finish sequence
    public void setSteps(long s) //method to set the number of steps
    {
        steps = s;
    }
    public void setNum(long n)  //method to set the sequence number
    {
        num = n;
    }
    public long getSteps()      //method to get the number of steps
    {
        return steps;
    }
    public long getNum()        //method to get the sequence number
    {
        return num;
    }

    public static long seq_length(long n)   //recursive method to get the number of steps of a sequence for a number n
    {
        long count = 0; //sets the count to 0
        if (n == 1)     //if n = 1 exit the method and return the final count number
        {
            return count;
        }
        else if (n % 2 == 0)    //tests if n is even
        {
            count = seq_length(n / 2) + 1;      //stores the recursive call of n/2 then adds 1 to count
        }
        else    //n is odd 
        {
            count = seq_length(3*n + 1) + 1;    //stores the recursive call of 3*n+1 then adds 1 to count
        } 
        return count;   //returns count if none of the previous if statements are true
    }

    public static void main(String[] args)  //main method of program
    {
        long in = 10000;    //***in is the starting sequence number***
        long control = in;  //variable that controls when the all of the sequence numbers have been tested
        Rcollatz [] numbers = new Rcollatz[10]; //an array of Rcollatz objects to store the top 10 highest sequence numbers with the highest step counts

        //fills the array with Rcollatz objects and sets the sequence number and step count to 0
        for(int i = 0; i < 10; i++)
        {
            numbers[i] = new Rcollatz();
            numbers[i].setSteps(0);
            numbers[i].setNum(0);
        }
        //uses the control variable to stop the while loop until every sequence number starting from in is tested
        while(control != 0)
        {
            in = control;   //sets in to the control (current sequence number), to make sure the current sequence number is being tested
            long count = seq_length(in);    //finds and returns the step count for the current sequence number
            boolean dup = false;    //duplicate flag
            int dupIndex = 0;   //index of a number with a duplicate step count
            int smallIndex = 0; //index with the smallest number of steps
            long small = numbers[0].getSteps(); //number with the smallest step count
            
            //goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers 
            //with the same step count
            for(int i=0; i < 10; i++)
            {
                if(numbers[i].getSteps() <= small)  //which element has the smallest step count
                {
                    small = numbers[i].getSteps();  //reassigns the number with the smallest number of steps
                    smallIndex = i;                 //saves the index with the smallest number of steps
                }
                if(numbers[i].getSteps() == count)  //checks to see if there is a number in the array with the same step count as the current sequence number
                {
                    dup = true;     //sets the duplicate flag to true
                    dupIndex = i;   //saves the index where the duplicate step count occurs
                }
            }
            
            //if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
            //a duplicate replace the information at the smallest index to match the current sequence number
            if(count > numbers[smallIndex].getSteps() && dup == false)    
            {
                numbers[smallIndex].setSteps(count);
                numbers[smallIndex].setNum(in);
            }

            //if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
            //at the duplicate index to the current sequence number
            if(in < numbers[dupIndex].getNum() && dup == true)
            {
                numbers[dupIndex].setNum(in);
            }
            control--;  //decrement the sequence number
        }
        
        //sorts the numbers based on step count
        System.out.println("Sorted based on sequence length:");
        int n = numbers.length;
        for (int i = 0; i < n-1; i++)
        {
            for (int j = 0; j < n-i-1; j++)
            {
                if (numbers[j].getSteps() < numbers[j+1].getSteps())
                {
                    long temp = numbers[j].getSteps();
                    long temp2 = numbers[j].getNum();
                    numbers[j].setSteps(numbers[j+1].getSteps());
                    numbers[j].setNum(numbers[j+1].getNum());
                    numbers[j+1].setSteps(temp);
                    numbers[j+1].setNum(temp2);
                }
            }
        }

        //prints the numbers array to show the sequence number and the step count for that sequence number
        for(int i = 0; i < 10; i++)
        {
            System.out.println(numbers[i].getNum() + "    " + numbers[i].getSteps());
        }

        //sorted the numbers based on the size of the sequence number
        System.out.println("Sorted based on sequence number:");
        n = numbers.length;
        for (int i = 0; i < n-1; i++)
        {
            for (int j = 0; j < n-i-1; j++)
            {
                if (numbers[j].getNum() < numbers[j+1].getNum())
                {
                    long temp = numbers[j].getNum();
                    long temp2 = numbers[j].getSteps();
                    numbers[j].setNum(numbers[j+1].getNum());
                    numbers[j].setSteps(numbers[j+1].getSteps());
                    numbers[j+1].setNum(temp);
                    numbers[j+1].setSteps(temp2);
                }
            }
        }
        
        //prints the numbers array to show the sequence number and the step count for that sequence number   
        for(int i = 0; i < 10; i++)
        {
            System.out.println(numbers[i].getNum() + "    " + numbers[i].getSteps());
        }

    }
}

