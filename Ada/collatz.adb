with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure collatz is

    type Number is
        record
            num : Integer;--INTEGER range 1..10000;
            steps : Integer;--INTEGER range 1..10000;
        end record;

    Numbers : array(1..10) of Number;


    I,control,count,dup,dupIndex,smallIndex,small : Integer;
begin
    Ada.Text_IO.Put("Enter an integer: ");
    Ada.Integer_Text_IO.Get(I);
    Ada.Text_IO.Put_Line(Integer'Image(I));
    for Index in 1..10 loop
        Numbers(Index).num := 0;
        Numbers(Index).steps := 0;        
    end loop;
    control := I;
    while control /= 1 loop
        I := control;
        count := 0;
        while I /= 1 loop
            if (I mod 2) = 0 then
                I := I/2;
            else
                I := (I*3)+1;
            end if;
            count := count + 1;
        end loop;
        I := control;
        dup := 0;
        dupIndex := 1;
        smallIndex := 1;
        small := Numbers(1).steps;
        for i in Numbers'RANGE loop
            if(Numbers(i).steps <= small) then
                small := Numbers(i).steps;
                smallIndex := i;
            end if;
            if(Numbers(i).steps = count) then
                dup := 1;
                dupIndex := i;
            end if;
        end loop;
        if(count > Numbers(smallIndex).steps and dup = 0) then
            Numbers(smallIndex).steps := count;
            Numbers(smallIndex).num := I;
        end if;
        if(I < Numbers(dupIndex).num and dup = 1) then
            Numbers(dupIndex).num := I;
        end if;
        control := control - 1;
    end loop;
    
    for i in Numbers'RANGE loop
        Put(Numbers(i).num);
        Put(Numbers(i).steps);
        New_Line;
    end loop;



    --Ada.Text_IO.Put("Count of Numbers in the sequence: ");
    --Ada.Text_IO.Put_Line(Integer'Image(count));

end collatz;
