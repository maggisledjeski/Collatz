program collatz
    implicit none
    integer(kind=16), dimension(10) :: numArray
    integer(kind=16), dimension(10) :: stepArray
    integer(kind=16) :: i,input,control,steps,small
    integer :: dup,smallIndex,dupIndex,j,temp,temp2
    
    input = 20  !***input is the starting sequence number***
    control = input !variable that controls when all of the sequence numbers have been tested

    !fills both of the arraya with 0's 
    do i=1,10
        numArray(i) = 0
        stepArray(i) = 0
    end do
    
    !uses the control variable to stop the while loop until every sequence number starting from input is tested
    do while(control .gt. 1)
        input = control !sets input to the control (current sequence number), to make sure the current sequence number is being tested
        steps = 0   !sets the step count to 0
        
        !computes the sequence count until input = 1
        do while(input .gt. 1)
            if(mod(input,2) == 0) then  !tests if input is even
                input = input / 2
            else    !input is odd
                input = input * 3 + 1
            end if
            steps = steps + 1   !increments the step count
        end do
        input = control !resets input to be equal to the current sequence number
        dup = 0 !duplicate flag
        dupIndex = 1    !index of a number with a duplicate step count
        smallIndex = 1  !index with the smallest number of steps
        small = stepArray(1)    !number with the smallest step count
        
        !goes through the array numbers to see which element has the smallest step count and if there are duplicate sequence numbers with the same step count
        do i=1,10
            if(stepArray(i) .le. small) then    !checks to see which element has the smallest step count
                small = stepArray(i)    !reassigns the number with the smallest number of steps
                smallIndex = i  !saves the index with the smallest number of steps
            end if
            if(stepArray(i) .eq. steps) then    !checks to see if there is a number in the array with the same step count as the current sequence number
                dup = 1 !duplicate flag set to true
                dupIndex = i    !saves the index where the duplicate step count occurs
            end if
        end do
        
        !if the current sequence number being tested has a higher step count than the smallest step count in the array and the step count is not 
        !a duplicate replace the information at the smallest index to match the current sequence number
        if(steps > stepArray(smallIndex) .and. dup .eq. 0) then
            stepArray(smallIndex) = steps
            numArray(smallIndex) = input
        end if
        
        !if the current sequence number being tested is < the sequence number at the duplicate index and the duplicate flag is true, set the number 
        !at the duplicate index to the current sequence number
        if(input < numArray(dupIndex) .and. dup .eq. 1) then
            numArray(dupIndex) = input
        end if
        control = control - 1   !decrement the sequence number
    end do 
    
    !sorts the numbers based on step count
    print*,"Sorted by step count size:"
    do i = size(stepArray)-1, 1, -1
        do j = 1, i
            if (stepArray(j) < stepArray(j+1)) then
                temp = stepArray(j)
                temp2 = numArray(j)
                stepArray(j) = stepArray(j+1)
                numArray(j) = numArray(j+1)
                stepArray(j+1) = temp
                numArray(j+1) = temp2
            end if
        end do
    end do
        
    !prints the numbers array to show the sequence number and the step count for that sequence number
    do i=1,10
        print*,numArray(i),"    ",stepArray(i)
    end do  

    !sorted the numbers based on the size of the sequence number
    print*,"Sorted by sequence number size:"
    do i = size(stepArray)-1, 1, -1
        do j = 1, i
            if (numArray(j) < numArray(j+1)) then
                temp = numArray(j)
                temp2 = stepArray(j)
                numArray(j) = numArray(j+1)
                stepArray(j) = stepArray(j+1)
                numArray(j+1) = temp
                stepArray(j+1) = temp2
            end if
        end do
    end do

    !prints the numbers array to show the sequence number and the step count for that sequence number
    do i=1,10
        print*,numArray(i),"    ",stepArray(i)
    end do

end program
