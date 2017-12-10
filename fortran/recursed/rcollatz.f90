program rcollatz
    implicit none
    integer(kind=16), dimension(10) :: numArray
    integer(kind=16), dimension(10) :: stepArray
    integer(kind=16) :: i,val,input,control,small,steps
    integer :: dup,smallIndex,dupIndex,j,temp,temp2
    integer(kind=16) :: seq_length
    external seq_length
    
    input = 10000   !***input is the starting sequence number***
    control = input !variable that controls when the all of the sequence numbers have been tested
    
    !fills both arrays with 0's
    do i=1,10
        numArray(i) = 0
        stepArray(i) = 0
    end do
    
    !uses the control variable to stop the while loop until every sequence number starting from input is tested
    do while(control .gt. 1)
        input = control !sets input to the control (current sequence number), to make sure the current sequence number is being tested
        i = input
        steps = seq_length(i)   !finds and returns the step count for the current sequence number
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
                dup = 1     !sets the duplicate flag to true
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
end program rcollatz

recursive integer(kind=16) function seq_length(i) result(val)   !recursive method to get the number of steps of a sequence for a number i and returns val
    integer(kind=16) :: i
    if(i == 1) then !if i = 1 exit the method and return val
        val = 0
        return
    else if(mod(i,2) == 0) then !tests if i is even
        val = seq_length(i / 2) + 1 !stores the recursive call of i/2 then adds 1 to val
    else    !i is odd
        val = seq_length(i * 3 + 1) + 1 !stores the recursive call of 3*i+1 then adds 1 to val
    end if
end function seq_length

