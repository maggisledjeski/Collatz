with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Rcollatz is

    type Number is
        record
            num : Long_Long_Integer;
            steps : Long_Long_Integer;
        end record;

    Numbers : array(1..10) of Number;
    
    function seq_length(Val : Long_Long_INTEGER) return Long_Long_INTEGER;
    n : Long_Long_Integer;
    function seq_Length(Val : Long_Long_INTEGER) return Long_Long_INTEGER is
    begin
        n := 0; 
        if Val <= 1 then
            return n;
        end if;
        if (Val mod 2) = 0 then
            n := (seq_length(Val/2) + 1);
        elsif (Val mod 2) /= 0 then
            n := (seq_length(3*Val+1) + 1);
        end if;
        return n; 
    end seq_length;
    temp,temp2,I,count,control,small : Long_Long_Integer;
    size,j,x,dup,dupIndex,smallIndex : Integer;
begin
    --Ada.Text_IO.Put("Enter an integer: ");
    --Ada.Integer_Text_IO.Get(I);
    --Ada.Text_IO.Put_Line(Integer'Image(I));
    
    I := 10000;
    
    for Index in 1..10 loop
        Numbers(Index).num := 0;
        Numbers(Index).steps := 0;        
    end loop;
    control := I;
    while control /= 1 loop
        I := control;
        count := seq_length(I);
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

    size := 10;
    x:=1;
    j:=1;

    Ada.Text_IO.Put_Line("Sorted by step count size:");
    for x in 1..size loop
        for j in 1..size-x loop
            if Numbers(j).steps < Numbers(j+1).steps then
                temp := Numbers(j).steps;
                temp2 := Numbers(j).num;
                Numbers(j).steps := Numbers(j+1).steps;
                Numbers(j).num := Numbers(j+1).num;
                Numbers(j+1).steps := temp;
                Numbers(j+1).num := temp2;
            end if;
        end loop;
    end loop;

    for i in Numbers'RANGE loop
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).num));
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).steps));
        New_Line;
    end loop;

    Ada.Text_IO.Put_Line("Sorted by sequence number size:");
    for x in 1..size loop
        for j in 1..size-x loop
            if Numbers(j).num < Numbers(j+1).num then
                temp := Numbers(j).num;
                temp2 := Numbers(j).steps;
                Numbers(j).num := Numbers(j+1).num;
                Numbers(j).steps := Numbers(j+1).steps;
                Numbers(j+1).num := temp;
                Numbers(j+1).steps := temp2;
            end if;
        end loop;
    end loop;
    
    for i in Numbers'RANGE loop
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).num));
        Ada.Text_IO.Put(Long_Long_Integer'Image(Numbers(i).steps));
        New_Line;
    end loop;

end Rcollatz;
