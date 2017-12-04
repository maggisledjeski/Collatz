#!/usr/bin/ruby
#./collatz.rb

numArray = Array.new(10,0) 
stepArray = Array.new(10,0)

max = 20
num = max
while max != 1 do
    num = max
    steps = 0
    while num != 1 do
        if num%2 == 0
            num = num/2
        else
            num = num*3 + 1
        end
        steps = steps + 1
    end
    num = max
    dup = 0
    dupIndex = 0
    smallIndex = 0
    small = stepArray.at(0)
    for i in 0..9
        if stepArray.at(i) < small
            small = stepArray.at(i)
            smallIndex = i
        end
        if stepArray.at(i) == steps
            dup = 1
            dupIndex = i
        end
    end
    if steps > stepArray.at(smallIndex) and dup == 0
        stepArray[smallIndex] = steps
        numArray[smallIndex] = num
    end
    if num < numArray.at(dupIndex) and dup == 1
        numArray[dupIndex] = num
    end
    max = max - 1
end

for i in 0..9
    puts("#{numArray.at(i)}      #{stepArray.at(i)}")
end
