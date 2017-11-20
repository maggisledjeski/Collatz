#!/usr/bin/python

uinput = int(raw_input("Enter a number: "))
print "you entered", uinput

while uinput != 1:
    if uinput%2 == 0:
        uinput = uinput/2
        print uinput
        #print uinput, "is even."
    else:
        uinput = (uinput*3)+1
        print uinput
        #print uinput, "is odd."
    

