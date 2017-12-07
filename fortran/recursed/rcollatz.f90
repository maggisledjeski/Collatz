program rcollatz
  implicit none
 
    integer(kind=16), dimension(10) :: numArray
    integer(kind=16), dimension(10) :: stepArray
    integer(kind=16) :: i,val,input,control,small,steps
    integer :: dup,smallIndex,dupIndex
    integer(kind=16) :: seq_length
    external seq_length
    !read*,input
    input = 10000
    control = input
    do i=1,10
        numArray(i) = 0
        stepArray(i) = 0
    end do
    
    do while(control .gt. 1)
        input = control
        i = input
        steps = seq_length(i)
        dup = 0
        dupIndex = 1
        smallIndex = 1
        small = stepArray(1)
        do i=1,10
            if(stepArray(i) .le. small) then
                small = stepArray(i)
                smallIndex = i
            end if
            if(stepArray(i) .eq. steps) then
                dup = 1
                dupIndex = i
            end if
        end do
        if(steps > stepArray(smallIndex) .and. dup .eq. 0) then
            stepArray(smallIndex) = steps
            numArray(smallIndex) = input
        end if
        if(input < numArray(dupIndex) .and. dup .eq. 1) then
            numArray(dupIndex) = input
        end if
        control = control - 1
    end do
    
    do i=1,10
        print*,numArray(i),"    ",stepArray(i)
    end do     
end program rcollatz

recursive integer(kind=16) function seq_length(i) result(val)
    integer(kind=16) :: i
    if(i == 1) then
        val = 0
        return
    else if(mod(i,2) == 0) then
        val = seq_length(i / 2) + 1
    else 
        val = seq_length(i * 3 + 1) + 1
    end if
end function seq_length

