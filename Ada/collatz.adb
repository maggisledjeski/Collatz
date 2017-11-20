with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure collatz is
    I : Integer;
begin
    Ada.Text_IO.Put("Enter an integer: ");
    Ada.Integer_Text_IO.Get(I);
    Ada.Text_IO.Put_Line(Integer'Image(I));

    while I /= 1 loop
        if (I mod 2) = 0 then
            I := I/2;
            Ada.Text_IO.Put_Line(Integer'Image(I));
            --Ada.Text_IO.Put("input is even");
        else
            I := (I*3)+1;
            Ada.Text_IO.Put_line(Integer'Image(I));
            --Ada.Text_IO.Put("input is odd.");
        end if;
    end loop;

end collatz;
