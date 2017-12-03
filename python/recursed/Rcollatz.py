#!/usr/bin/python

class Number:
    def __init__(self, num, steps):
        self.num = num
        self.steps = steps

    def setSteps(self, steps):
        self.steps = steps
    
    def setNum(self, num):
        self.num = num

    def getSteps(self):    
        return self.steps  

    def getNum(self):    
        return self.num

def seq_length(n):
    count = 0 
    if n == 1:
        return count
    if n%2 == 0:
        count = (seq_length(int(n/2)) +1)
    elif n%2 != 0:
        count = (seq_length(int(3*n+1)) + 1)
    return count

uinput = int(raw_input("Enter a number: "))
print "you entered", uinput
numbers = []

for i in range(0,10):
    numbers.append(Number(0,0))

control = uinput

while control != 0:
    uinput = control
    count = seq_length(uinput)  #recursive call to determine sequence length
    dup = 0
    dupIndex = 0
    smallIndex = 0
    small = numbers[0].getSteps()
    for i in range(0,10):
        if numbers[i].getSteps() <= small:
            small = numbers[i].getSteps()
            smallIndex = i
        if numbers[i].getSteps() == count:
            dup = 1
            dupIndex = i
    if count > numbers[smallIndex].getSteps() and dup == 0:
        numbers[smallIndex].setNum(uinput)
        numbers[smallIndex].setSteps(count)
    if uinput < numbers[dupIndex].getNum() and dup == 1:
        numbers[dupIndex].setNum(uinput)
    control = control - 1

for i in range(0,10):
    print numbers[i].getNum(),"    ",numbers[i].getSteps()

