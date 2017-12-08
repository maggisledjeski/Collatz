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
  

uinput = int(raw_input("Enter a number: "))
print "you entered", uinput
numbers = []

for i in range(0,10):
    numbers.append(Number(0,0))

control = uinput

while control != 0:
    uinput = control
    count = 0
    while uinput != 1:
        if uinput%2 == 0:
            uinput = uinput/2
        else:
            uinput = (uinput*3)+1
        count = count + 1    
    uinput = control
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
print "sorted by step count"
n = len(numbers)
for i in range(n):
    for j in range(0, n-i-1):
        if numbers[j].getSteps() < numbers[j+1].getSteps():
            temp = numbers[j].getSteps()
            x = numbers[j+1].getSteps()
            numbers[j].setSteps(x)
            numbers[j+1].setSteps(temp)
            temp2 = numbers[j].getNum()
            y = numbers[j+1].getNum()
            numbers[j].setNum(y)
            numbers[j+1].setNum(temp2)

for i in range(0,10):
    print numbers[i].getNum(),"    ",numbers[i].getSteps()

print "sorted by number"
n = len(numbers)
for i in range(n):
    for j in range(0, n-i-1):
        if numbers[j].getNum() < numbers[j+1].getNum():
            temp = numbers[j].getNum()
            x = numbers[j+1].getNum()
            numbers[j].setNum(x)
            numbers[j+1].setNum(temp)
            temp2 = numbers[j].getSteps()
            y = numbers[j+1].getSteps()
            numbers[j].setSteps(y)
            numbers[j+1].setSteps(temp2)

for i in range(0,10):
    print numbers[i].getNum(),"    ",numbers[i].getSteps()
