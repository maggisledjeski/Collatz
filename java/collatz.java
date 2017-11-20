import java.io.*;
import java.util.Scanner;
public class collatz {

    public static void main(String[] args)
    {
        Scanner reader = new Scanner(System.in);  //will read the user input
        System.out.println("Enter a positive integer: ");
        int n = reader.nextInt(); //will scan the next token of the input as an int.once finished
        reader.close();     //closer the scanner

        System.out.println(n);  //prints the user input
    
        int count = 0;
        
        while(n != 1)
        {
            if(n%2 == 0)    //uses mod to determine if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
            {
                n = n/2;
                System.out.println(n);
                //System.out.println(n + " is even.");
            }
            else
            {
                n = (n*3)+1;
                System.out.println(n);
                //System.out.println(n + " is odd.");
            }
            count = count + 1;
        }
        System.out.println("Count of numbers in the sequence: " + count);
    }
}
