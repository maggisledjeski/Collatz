with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure collatz is
    I : Integer;
begin
    Ada.Text_IO.Put("Enter an integer: ");
    Ada.Integer_Text_IO.Get(I);
    Ada.Text_IO.Put_Line(Integer'Image(I));

    if (I mod 2) = 0 then
        Ada.Text_IO.Put("input is even");
    else
        Ada.Text_IO.Put("input is odd.");
    end if;

end collatz;
