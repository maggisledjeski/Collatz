#print("Enter a positive integer: ")
#input = readline()
#try
#    input = parse(Int, input)
#    println("Input entered: \"", input, "\"\n")
#catch
#    println("Sorry, but \"", input, "\" does not compute as an integer.")
#end

sArray = Array{Int64}(10)
nArray = Array{Int64}(10)
println(sArray)
i = Int128(10000)
j = Int128(10000)
println(j)
while j > 1
    i = j
    println(i)
    ic = Int128(0)
    while i != 1
        i = i % 2 == 0 ? i >> 1 : 3i + 1
        ic += 1
    end
    println(ic)
    dupF = Int8(0)
    dIndex = Int8(1)
    sIndex = Int8(1)
    small = Int64(sArray[1])
    for k 1:10
        if(sArray[k] < small)
            small = sArray[k]
            sIndex = k
        end
        if(sArray[k] == ic)
            dupF = 1
            dIndex = k
        end
    end
    if(ic > sArray[sIndex] && dupF = 0)
        sArray[sIndex] = ic
        nArray[sIndex] = i
    end
    if(i < nArray[dIndex] && dupF = 1)
        nArray[dIndex] = i
    end
    j -= 1
end

#=for x 1:10
    println(nArray[x],"     ",sArray[x])
end=#
exit(0)





;num = 0
;while input != 1
;    if input%2 == 0
;        input = input / 2
;        println(input)
;    else
;        input = (input * 3) + 1
;        println(input)
;    end
;    num = num + 1
;end
;println("Count of numbers in the sequence: \"", num, "\"\n")
;exit(0)
