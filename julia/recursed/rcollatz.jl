function stepCount(i::UInt128)
    i == 1 && return 0 
    return i = i&1 == 0 ? 1 + stepCount(i >> 1) : 1 + stepCount(3*i + 1) 
end


sArray = Array{UInt128}(10)
nArray = Array{UInt128}(10)

i = UInt128(10000)
j = UInt128(10000)

while j > 1
    i = j
    ic = UInt128(0)
    ic = stepCount(i)
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


