import java.io.*;
import java.util.Scanner;
import java.util.Arrays;
public class Rcollatz {
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

    public static long seq_length(long n) 
    {
        long count = 0;
        if (n == 1) 
        {
            return count;
        }
        else if (n % 2 == 0)
        {
            count = seq_length(n / 2) + 1;
        }
        else 
        {
            count = seq_length(3*n + 1) + 1;
        }
        return count;
    }

    public static void main(String[] args)  
    {
        //Scanner reader = new Scanner(System.in);
        //System.out.println("Enter a number: ");
        //int in = reader.nextInt();
        //reader.close();
        long in = 10000;
        long control = in;
        Rcollatz [] numbers = new Rcollatz[10];

        for(int i = 0; i < 10; i++)
        {
            numbers[i] = new Rcollatz();
            numbers[i].setSteps(0);
            numbers[i].setNum(0);
        }
        
        while(control != 0)
        {
            in = control;
            long count = seq_length(in);
            boolean dup = false;
            int dupIndex = 0;
            int smallIndex = 0;
            long small = numbers[0].getSteps();
            for(int i=0; i < 10; i++)
            {
                if(numbers[i].getSteps() <= small)
                {
                    small = numbers[i].getSteps();
                    smallIndex = i;
                }
                if(numbers[i].getSteps() == count)
                {
                    dup = true;
                    dupIndex = i;
                }
            }
            if(count > numbers[smallIndex].getSteps() && dup == false)    
            {
                numbers[smallIndex].setSteps(count);
                numbers[smallIndex].setNum(in);
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

