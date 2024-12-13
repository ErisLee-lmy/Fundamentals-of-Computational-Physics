program Point24
implicit none
real,dimension(4) :: nums
real::a,b,c,d

real,dimension(24,4) :: OrderedNumsSquence
integer :: SequenceNum
integer :: i,j,k,l

character(len=1) :: OperatorSymbols(4)=['+','-','*','/']
character(len=10) :: ParenthesisPosition(5) = ['((AB)C)D','(A(BC))D','(AB)(CD)','A((BC)D)','A(B(CD))']
integer,dimension(3) :: OperatorNum

integer, dimension(5) :: results

logical:: existance=.false.
character(len=20) :: answer

!假设输入的四个数字为4623
a=4 
b=6 
c=2
d=3
nums = (/a,b,c,d/)

OrderedNumsSquence = GetOder(nums)
!得到了一个24*4的张量，其中（i，j）上的数字表示第i种情况下的第j个数字
do SequenceNum = 1,24
    nums = OrderedNumsSquence(SequenceNum,:)
    do i =1,4
        do j=1,4
            do k=1,4
            OperatorNum = (/i,j,k/)
            !计算不同括号选取的结果
            results(1) = Operator(OperatorNum(3),Operator(OperatorNum(2),Operator(OperatorNum(1),nums(1),nums(2)),nums(3)),nums(4))
            results(2) = Operator(OperatorNum(3),Operator(OperatorNum(1),nums(1),Operator(OperatorNum(2),nums(2),nums(3))),nums(4))
            results(3) = Operator(OperatorNum(3),Operator(OperatorNum(1),nums(1),nums(2)),Operator(OperatorNum(3),nums(3),nums(4)))
            results(4) = Operator(OperatorNum(1),nums(1),Operator(OperatorNum(3),Operator(OperatorNum(2),nums(2),nums(3)),nums(4)))
            results(5) = Operator(OperatorNum(1),nums(1),Operator(OperatorNum(2),nums(2),Operator(OperatorNum(3),nums(3),nums(4))))
            
                do l = 1,5
                    if (results(l) == 24) then
                        existance = .true.

                        !这里要将括号弄进去太麻烦了，从效果上来看可以达到解题效果了
                        print'(A,A)',"The parenthesis position is",ParenthesisPosition(l)
                        print'(A,I2,A,I2,A,I2,A,I2,A)',"The selection of numbers and operation symbols is",int(nums(1)),&
                        &OperatorSymbols(i),int(nums(2)),OperatorSymbols(j),int(nums(3)),OperatorSymbols(k),int(nums(4)),"=24"




                    end if
                end do
            end do
        end do
    end do
end do

if .not. existance then
print*, "The answer doesn't exist."

contains
    function GetOder(nums) result(OrderedNumsSquence)!用于得到4的阶乘即24种排列顺序
        real,dimension(4), intent(in) :: nums
        real, dimension(24,4) :: OrderedNumsSquence
        
        integer :: count=1 
        integer:: i,j,k,l

        do i = 1, 4
            do j = 1, 4
                if (j /= i) then
                    do k = 1, 4
                        if (k /= i .and. k /= j) then
                            do l = 1, 4
                                if (l /= i .and. l /= j .and. l /= k) then
                                    OrderedNumsSquence(count,:) = (/nums(i), nums(j), nums(k), nums(l)/)
                                    count = count + 1
                                end if
                            end do
                        end if
                    end do
                end if
            end do
        end do




    end function GetOder


    function Operator(OperatorNum,a,b) result(output)
        integer,intent(in)::OperatorNum
        real,intent(in)::a,b
        real::output

        if (OperatorNum == 1)then
            output = a+b
        end if

        if (OperatorNum == 2)then
            output = a-b
        end if

        if (OperatorNum == 3)then
            output = a*b
        end if

        if (OperatorNum == 4)then
            output = a/b
        end if
    end function Operator
end program Point24

