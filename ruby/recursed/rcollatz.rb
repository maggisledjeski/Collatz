#!/usr/bin/ruby
#./rcollatz.rb

numArray = Array.new(10,0)  #array that holds the sequence numbers, that is filled with 0's
stepArray = Array.new(10,0) #array that holds the step count for each sequence number, that is filled with 0's

def stepCount(num)  #recursive method to get the number of steps of a sequence for a number num
    if num == 1 #if num = 1 exit the method and return 0
        return 0
    end
    if num%2 == 0   #tests if num is even
        num = 1 + stepCount(num/2)  #stores the recursive call of n/2 then adds 1 to num
    else    #num is odd
        num = 1 + stepCount(num*3 + 1)  #stores the recursive call of 3*n+1 then adds 1 to num
    end
end


max = 10000 #***max is the starting sequence number*** it also controls when the all of the sequence numbers have been tested
num = max   #current sequence number

#uses max to stop the while loop until every sequence number starting from in is tested
while max != 1 do
    num = max   #sets num to max (current sequence number), to make sure the current sequence number is being tested
    steps = stepCount(num)  #finds and returns the step count for the current sequence number
    dup = 0 #duplicate flag
    dupIndex = 0    #index of a number with a duplicate step count
    smallIndex = 0  #index with the smallest number of steps
    small = stepArray.at(0) #number with the smallest step count
    
    #goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
    for i in 0..9
        if stepArray.at(i) < small  #checks to see which element has the smallest step count
            small = stepArray.at(i) #reassigns the number with the smallest number of steps
            smallIndex = i  #saves the index with the smallest number of steps
        end
        if stepArray.at(i) == steps #checks to see if there is a number in the array with the same step count as the current sequence number
            dup = 1     #sets the duplicate flag to true
            dupIndex = i    #saves the index where the duplicate step count occurs
        end
    end

    #if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
    #a duplicate replace the information at the smallest index to match the current sequence number
    if steps > stepArray.at(smallIndex) and dup == 0
        stepArray[smallIndex] = steps
        numArray[smallIndex] = num
    end

    #if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
    #at the duplicate index to the current sequence number
    if num < numArray.at(dupIndex) and dup == 1
        numArray[dupIndex] = num
    end
    max = max - 1   #decrements the sequence number
end

#sorts the numbers based on step count
puts("Sorted by step count size:")
size = 9
size.times do |j|
    for i in 0...size
        if stepArray.at(i) < stepArray.at(i+1)
            stepArray[i], stepArray[i+1] = stepArray[i+1], stepArray[i]
            numArray[i], numArray[i+1] = numArray[i+1], numArray[i]
        end
    end
end

#prints the numbers array to show the sequence number and the step count for that sequence number
for i in 0..9
puts("#{numArray.at(i)}      #{stepArray.at(i)}")
end

#sorted the numbers based on the size of the sequence number
puts("Sorted by sequence number size:")
size = 9
size.times do |j|
    for i in 0...size
        if numArray.at(i) < numArray.at(i+1)
            numArray[i], numArray[i+1] = numArray[i+1], numArray[i]
            stepArray[i], stepArray[i+1] = stepArray[i+1], stepArray[i]
        end
    end
end

#prints the numbers array to show the sequence number and the step count for that sequence number
for i in 0..9
    puts("#{numArray.at(i)}      #{stepArray.at(i)}")
end
