sArray = Array{UInt128}(10) #array to hold the 10 highest step counts
nArray = Array{UInt128}(10) #array that holds the numbers to match the step counts in sArray

i = UInt128(0)  #used to test the current sequence number
j = UInt128(10000)  #***j is the starting/highest sequence number*** it is also used to control when every sequence number has been tested

#uses j to stop the while loop until every sequence number starting from j to 2 is tested
while j > 1
    i = j   #sets i to j (current sequence number), to make sure the current sequence number is being tested
    
    ic = UInt128(0) #sets the step count to 0
    #computes the sequence count until i = 1
    while i != 1
        i = i % 2 == 0 ? i >> 1 : 3i + 1    #bitwise function that if i is even i/2 (bit shift) else i = 3*i +1
        ic += 1 #increment the step count
    end
    i = j   #resets i to be equal to the current sequence number
    dupF = Int8(0)  #duplicate flag
    dIndex = Int8(1)    #index of a number with a duplicate step count
    sIndex = Int8(1)    #index with the smallest number of steps
    small = UInt128(sArray[1])  #number with the smallest step count
    
    #goes through sArray to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
    for k in 1:10
        if(sArray[k] < small)   #checks to see which element has the smallest step count
            small = sArray[k]   #reassigns the number with the smallest number of steps
            sIndex = k  #saves the index with the smallest number of steps
        end
        if(sArray[k] == ic) #checks to see if there is a number in the array with the same step count as the current sequence number
            dupF = 1    #sets the duplicate to true
            dIndex = k  #saves the index where the duplicate step count occurs
        end
    end

    #if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
    #a duplicate replace the information at the smallest index to match the current sequence number
    if(ic > sArray[sIndex] && dupF == 0)
        sArray[sIndex] = ic
        nArray[sIndex] = i
    end

    #if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
    #at the duplicate index to the current sequence number
    if(i < nArray[dIndex] && dupF == 1)
        nArray[dIndex] = i
    end
    j -= 1  #decrements the sequence number
end

#sorted by step count
println("sorted by step count size:")
for i in 2:length(sArray)
    for j in 1:length(sArray)-1
        if sArray[j] < sArray[j+1]
            #swaps the 2 elements in sArray and nArray
            tmp = sArray[j]
            sArray[j] = sArray[j+1]
            sArray[j+1] = tmp
            tep2 = nArray[j]
            nArray[j] = nArray[j+1]
            nArray[j+1] = tep2  
        end
    end
end
#prints the sorted arrays
for x in 1:10
    println(nArray[x],"     ",sArray[x])
end

#sorted by sequence number
println("sorted by sequence number:")
for i in 2:length(nArray)
    for j in 1:length(nArray)-1
        if nArray[j] < nArray[j+1]
            #swaps the 2 elements in sArray and nArray
            tmp = nArray[j]
            nArray[j] = nArray[j+1]
            nArray[j+1] = tmp
            tmp2 = sArray[j]
            sArray[j] = sArray[j+1]
            sArray[j+1] = tmp2
        end
    end
end
#prints the sorted arrays
for x in 1:10
    println(nArray[x],"     ",sArray[x])
end

exit(0)

