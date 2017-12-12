#!/usr/bin/python

class Number:   #a class that holds both a number that will go into the collatz sequence and the step count to finish that sequence
    def __init__(self, num, steps): #initializer method
        self.num = num
        self.steps = steps

    def setSteps(self, steps):  #setter method of steps
        self.steps = steps
    
    def setNum(self, num):  #setter method of num
        self.num = num

    def getSteps(self):    #getter method for steps
        return self.steps  

    def getNum(self):    #getter method for num
        return self.num

def seq_length(n):  #recursive method to get the number of steps of a sequence for a number n
    count = 0   #set step count to 0
    if n == 1:  #if n = 1 return the step count
        return count
    if n%2 == 0:    #tests if n is even
        count = (seq_length(long(n/2)) +1)  #stores the recursive call of n/2 then adds 1 to count
    elif n%2 != 0:  #n is odd
        count = (seq_length(long(3*n+1)) + 1)   #stores the recursive call of 3*n+1 then adds 1 to count
    return count

#gets the user input and stores it in uinput
uinput = long(raw_input("Enter a number: "))
numbers = []    #array that holds the 10 sequence numbers with the highest step counts

#adds a Number to every element in the array and sets the steps and the num to 0
for i in range(0,10):
    numbers.append(Number(0,0))

control = uinput    #variable that controls when the all of the sequence numbers have been tested

#uses the control variable to stop the while loop until every sequence number starting from uinput is tested
while control != 0:
    uinput = control    #sets uinput to control (current sequence number), to make sure the current sequence number is being tested
    count = seq_length(uinput)  #recursive call to determine the step length for uinput
    dup = 0     #duplicate flag
    dupIndex = 0    #index of a number with a duplicate step count
    smallIndex = 0  #index with the smallest number of steps
    small = numbers[0].getSteps()   #number with the smallest step count
    
    #goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
    for i in range(0,10):
        if numbers[i].getSteps() <= small:  #checks to see which element has the smallest step count
            small = numbers[i].getSteps()   #reassigns the number with the smallest number of steps
            smallIndex = i  #saves the index with the smallest number of steps
        if numbers[i].getSteps() == count:  #checks to see if there is a number in the array with the same step count as the current sequence number
            dup = 1 #duplicate flag set to true
            dupIndex = i    #saves the index where the duplicate step count occurs
    
    #if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
    #a duplicate replace the information at the smallest index to match the current sequence number
    if count > numbers[smallIndex].getSteps() and dup == 0:
        numbers[smallIndex].setNum(uinput)
        numbers[smallIndex].setSteps(count)
    
    #if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
    #at the duplicate index to the current sequence number
    if uinput < numbers[dupIndex].getNum() and dup == 1:
        numbers[dupIndex].setNum(uinput)
    control = control - 1   #decrements the sequence number

#sorted by step count
print "sorted by step count size:"
n = len(numbers)    #length of the array
for i in range(n):
    for j in range(0, n-i-1):
        if numbers[j].getSteps() < numbers[j+1].getSteps():
            #swaps the 2 elements steps and num by using 2 temporary variables to store the information
            temp = numbers[j].getSteps()
            x = numbers[j+1].getSteps()
            numbers[j].setSteps(x)
            numbers[j+1].setSteps(temp)
            temp2 = numbers[j].getNum()
            y = numbers[j+1].getNum()
            numbers[j].setNum(y)
            numbers[j+1].setNum(temp2)
#prints sorted array
for i in range(0,10):
    print numbers[i].getNum(),"    ",numbers[i].getSteps()

#sorted by sequence number
print "sorted by sequence number:"
n = len(numbers)    #length of the array
for i in range(n):
    for j in range(0, n-i-1):
        if numbers[j].getNum() < numbers[j+1].getNum():
            #swaps the 2 elements steps and num by using 2 temporary variables to store the information
            temp = numbers[j].getNum()
            x = numbers[j+1].getNum()
            numbers[j].setNum(x)
            numbers[j+1].setNum(temp)
            temp2 = numbers[j].getSteps()
            y = numbers[j+1].getSteps()
            numbers[j].setSteps(y)
            numbers[j+1].setSteps(temp2)
#prints the sorted array
for i in range(0,10):
    print numbers[i].getNum(),"    ",numbers[i].getSteps()

