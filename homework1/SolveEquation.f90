program SolveEquation
    implicit none


    integer(kind=8)  :: A,B,C,D,E
    integer(kind=8), dimension(0:201) :: result
    integer(kind=8) :: i,exponent=5

    
    
    do i = 0,200
        result(i) = i**exponent
    end do

    do e = 1,200
        do a = 1,E
            do b = 1,A
                if (result(a)+result(b)<result(e)) then
                    do c = 1,B
                        if (result(a)+result(b)+result(c)<result(e))  then
                            do d = 1,C
                                if (result(a)+result(b)+result(c)+result(d) == result(e) ) then
                                    print'(I5,I5,I5,I5,I5)',a,b,c,d,e
                                end if
                            end do
                        else
                            exit
                        
                        end if
                    end do
                else
                    exit
                    
                end if
            end do
        end do
    end do

end program SolveEquation