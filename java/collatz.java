import java.io.*;
import java.util.Scanner;
public class collatz {

    public static void main(String[] args)
    {
        Scanner reader = new Scanner(System.in);  //will read the user input
        System.out.println("Enter a number: ");
        int n = reader.nextInt(); //will scan the next token of the input as an int.once finished
        reader.close();     //closer the scanner

        System.out.println(n);  //prints the user input

        if(n%2 == 0)    //uses mod to determin if the remainder is 0 or 1 if 0 the input is even, 1 if the input is odd.
        {
            System.out.println(n + " is even.");
        }
        else
        {
            System.out.println(n + " is odd.");
        }
    }
}
