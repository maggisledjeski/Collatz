with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Rcollatz is

    type Number is  --a record that holds both a number that will go into the collatz sequence and the step count to finish that sequence
        record
            num : Long_Long_Integer;    --number that goes into the collatz sequence (sequence number)
            steps : Long_Long_Integer;  --number of steps it takes for num to finish the collatz sequence (step count)
        end record;

    Numbers : array(1..10) of Number;   --an array that holds a Number and stores 10 sequence numbers with the 10 highest step counts
    
    function seq_length(Val : Long_Long_INTEGER) return Long_Long_INTEGER;  --recursive method to get the number of steps of a sequence for a number Val
    n : Long_Long_Integer;
    function seq_Length(Val : Long_Long_INTEGER) return Long_Long_INTEGER is
    begin
        n := 0; --sets the step count to 0
        if Val <= 1 then    --if Val = 1 exit the method and return n
            return n;
        end if;
        if (Val mod 2) = 0 then --tests if Val is even
            n := (seq_length(Val/2) + 1);   --stores the recursive call of Val/2 then adds 1 to n
        elsif (Val mod 2) /= 0 then --Val is odd
            n := (seq_length(3*Val+1) + 1); --stores the recursive call of 3*Val+1 then adds 1 to n
        end if;
        return n;   --return n if none of the previous statements ar true
    end seq_length;
    temp,temp2,I,count,control,small : Long_Long_Integer;
    size,j,x,dup,dupIndex,smallIndex : Integer;
begin  
    I := 10000; --***I is the starting/highest sequence number***
    
    --fills the array of records with 0's
    for Index in 1..10 loop
        Numbers(Index).num := 0;
        Numbers(Index).steps := 0;        
    end loop;
    control := I;   --variable that controls when the all of the sequence numbers have been tested
    
    --uses the control variable to stop the while loop until every sequence number starting from I is tested
    while control /= 1 loop
        I := control;   --sets I to the control (current sequence number), to make sure the current sequence number is being tested
        count := seq_length(I); --finds and returns the step count for the current sequence number
        dup := 0;   --duplicate flag
        dupIndex := 1;  --index of a number with a duplicate step count
        smallIndex := 1;    --index with the smallest number of steps
        small := Numbers(1).steps;  --number with the smallest step count
        
        --goes through the array Numbers to see which record has the smallest step count and if there are duplicate sequence numbers with the same step count
        for i in Numbers'RANGE loop
            if(Numbers(i).steps <= small) then  --checks to see which record has the smallest step count
                small := Numbers(i).steps;  --reassigns the number with the smallest number of steps
                smallIndex := i;    --saves the index with the smallest step count
            end if;
            if(Numbers(i).steps = count) then   --checks to see if there is a Number in the array with the same step count as the current sequence number
                dup := 1;   --duplicate flag is set to true
                dupIndex := i;  --saves the index where the duplicate step count occurs
            end if;
        end loop;
        
        --if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
        --a duplicate replace the information at the smallest index to match the current sequence number
        if(count > Numbers(smallIndex).steps and dup = 0) then
            Numbers(smallIndex).steps := count;
            Numbers(smallIndex).num := I;
        end if;
        
        --if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
        --at the duplicate index to the current sequence number
        if(I < Numbers(dupIndex).num and dup = 1) then
            Numbers(dupIndex).num := I;
        end if;
        control := control - 1; --decrements the sequence number
    end loop;

    size := 10; --size of the array
    x:=1;   --counter
    j:=1;   --counter
    
    --sorted by step count
    Ada.Text_IO.Put_Line("Sorted by step count size:");
    for x in 1..size loop
        for j in 1..size-x loop
            if Numbers(j).steps < Numbers(j+1).steps then
                --swaps the 2 records steps and num by using 2 temporary variables to store the information
                temp := Numbers(j).steps;
                temp2 := Numbers(j).num;
                Numbers(j).steps := Numbers(j+1).steps;
                Numbers(j).num := Numbers(j+1).num;
                Numbers(j+1).steps := temp;
                Numbers(j+1).num := temp2;
            end if;
        end loop;
    end loop;
    
    --prints the sorted array of records
    for i in Numbers'RANGE loop
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).num));
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).steps));
        New_Line;
    end loop;

    --sorted by sequence number
    Ada.Text_IO.Put_Line("Sorted by sequence number size:");
    for x in 1..size loop
        for j in 1..size-x loop
            if Numbers(j).num < Numbers(j+1).num then
                --swaps the 2 records steps and num by using 2 temporary variables to store the information
                temp := Numbers(j).num;
                temp2 := Numbers(j).steps;
                Numbers(j).num := Numbers(j+1).num;
                Numbers(j).steps := Numbers(j+1).steps;
                Numbers(j+1).num := temp;
                Numbers(j+1).steps := temp2;
            end if;
        end loop;
    end loop;
    
    --prints the sorted array of records
    for i in Numbers'RANGE loop
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).num));
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).steps));
        New_Line;
    end loop;

end Rcollatz;
