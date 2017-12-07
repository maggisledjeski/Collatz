import java.io.*;
import java.util.Scanner;
import java.util.Arrays;
public class collatz {//implements Comparable<collatz>{
    long num;
    long steps;
    public void setSteps(long s)
    {
        steps = s;
    }
    public void setNum(long n)
    {
        num = n;
    }
    public long getSteps()
    {
        return steps;
    }
    public long getNum()
    {
        return num;
    }


    public static void main(String[] args)  
    {
        //Scanner reader = new Scanner(System.in);  //will read the user input
        //System.out.println("Enter a number: ");
        //int in = reader.nextInt(); //will scan the next token of the input as an int.once finished
        //reader.close();     //closer the scanner

        //System.out.println(in);  //prints the user input
        long in = 10000;
        long control = in;
        collatz [] numbers = new collatz[10];

        for(int i = 0; i < 10; i++)
        {
            numbers[i] = new collatz();
            numbers[i].setSteps(0);
            numbers[i].setNum(0);
        }
        
        while(control != 0)
        {
            in = control;
            long count = 0;
            while(in != 1)
            {
                boolean bool = false;
                if(in % 2 == 0)
                {
                    bool = true;
                }
                in = bool ? in >> 1 : 3*in + 1;
                count += 1;
            }
            /*while(in > 1)
            {
                if(in%2 == 0)    //uses mod to determin if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
                {
                    in = in/2;
                }
                else
                {
                    in = in*3 + 1;
                }
                count++;
            }*/
            in = control;
            boolean dup = false;
            int dupIndex = 0;
            int smallestIndex = 0;
            long smallest = numbers[0].getSteps();
            for(int i=0; i < 10; i++)
            {
                if(numbers[i].getSteps() <= smallest)
                {
                    smallest = numbers[i].getSteps();
                    smallestIndex = i;
                }
                if(numbers[i].getSteps() == count)
                {
                    dup = true;
                    dupIndex = i;
                }
            }
            int index = smallestIndex;
            if(count > numbers[index].getSteps() && dup == false)    
            {
                numbers[index].setSteps(count);
                numbers[index].setNum(in);
            }
            if(in < numbers[dupIndex].getNum() && dup == true)
            {
                numbers[dupIndex].setNum(in);
            }
            control--;
        }
           
        for(int i = 0; i < 10; i++)
        {
            System.out.println(numbers[i].getNum() + "    " + numbers[i].getSteps());
        }

    }
}
