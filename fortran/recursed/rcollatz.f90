program rcollatz
  implicit none
 
    integer, dimension(10) :: numArray
    integer, dimension(10) :: stepArray
    integer :: i,val,input,control,steps,dup,smallIndex,small,dupIndex,seq_length
!    external seq_length
    read*,input
    print*,input
    control = input
    print*,control

    do i=1,10
        numArray(i) = 0
        stepArray(i) = 0
    end do
    
    do while(control .gt. 1)
        input = control
        i = input
!        steps = 0
!        do while(input .gt. 1)
!            if(mod(input,2) == 0) then
!                input = input / 2
!            else
!                input = input * 3 + 1
!            end if
!            steps = steps + 1
!        end do
!        input = control
        print*,i
        steps = seq_length(i)
        print*,"help"
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
        print*,i,"    ",numArray(i),"    ",stepArray(i)
    end do 
    print*, "input=",control,"  steps=",steps
    
end program rcollatz

recursive subroutine seq_length(i,val)
integer :: i,val
if(mod(i,2) == 0) then
    val = seq_length(i / 2)
else if(mod(i,2) == 1) then
    val = seq_length(i * 3 + 1)
else 
    val = 1
    return
end if

end subroutine seq_length

