print("Enter a positive integer: ")
input = readline()
try
    input = parse(Int, input)
    println("Input entered: \"", input, "\"\n")
catch
    println("Sorry, but \"", input, "\" does not compute as an integer.")
end

num = 0
while input != 1
    if input%2 == 0
        input = input / 2
        println(input)
    else
        input = (input * 3) + 1
        println(input)
    end
    num = num + 1
end
println("Count of numbers in the sequence: \"", num, "\"\n")
exit(0)
