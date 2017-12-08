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

println("sorted by step count")
 for i in 2:length(sArray)
    for j in 1:length(sArray)-1
      if sArray[j] < sArray[j+1]
          tmp = sArray[j]
          sArray[j] = sArray[j+1]
          sArray[j+1] = tmp
          tep2 = nArray[j]
          nArray[j] = nArray[j+1]
          nArray[j+1] = tep2
      end
    end
  end
for x in 1:10
    println(nArray[x],"     ",sArray[x])
end
println("sorted by number")
for i in 2:length(nArray)
    for j in 1:length(nArray)-1
      if nArray[j] < nArray[j+1]
          tmp = nArray[j]
          nArray[j] = nArray[j+1]
          nArray[j+1] = tmp
          tmp2 = sArray[j]
          sArray[j] = sArray[j+1]
          sArray[j+1] = tmp2
      end
    end
  end


for x in 1:10
    println(nArray[x],"     ",sArray[x])
end
exit(0)


