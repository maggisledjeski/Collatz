sArray = Array{UInt128}(10)
nArray = Array{UInt128}(10)
#println(sArray)
i = UInt128(10000)
j = UInt128(10000)
#println(j)
while j > 1
    i = j
    #println(i)
    ic = UInt128(0)
    while i != 1
        i = i % 2 == 0 ? i >> 1 : 3i + 1
        ic += 1
    end
    i = j
    dupF = Int8(0)
    dIndex = Int8(1)
    sIndex = Int8(1)
    small = UInt128(sArray[1])
    for k in 1:10
        if(sArray[k] < small)
            small = sArray[k]
            sIndex = k
        end
        if(sArray[k] == ic)
            dupF = 1
            dIndex = k
        end
    end
    if(ic > sArray[sIndex] && dupF == 0)
        sArray[sIndex] = ic
        nArray[sIndex] = i
    end
    if(i < nArray[dIndex] && dupF == 1)
        nArray[dIndex] = i
    end
    j -= 1
end

for x in 1:10
    println(nArray[x],"     ",sArray[x])
end
exit(0)

