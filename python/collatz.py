#!/usr/bin/python

uinput = int(raw_input("Enter a number: "))
print "you entered", uinput

count = 0

while uinput != 1:
    if uinput%2 == 0:
        uinput = uinput/2
        print uinput
        count = count + 1
        #print uinput, "is even."
    else:
        uinput = (uinput*3)+1
        print uinput
        count = count + 1
        #print uinput, "is odd."
    
print "Count of numbers in the sequence: ", count
