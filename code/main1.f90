program ABGame
    implicit none
    integer :: answer(3)
    integer :: guess(3)
    integer :: i, j, A, B
    character(len=4) :: input
    logical :: valid_input

    do
        valid_input = .true.
        print *, 'Welcome to the 1A2B game! Enter the 3-digit number as answer (digits are unique).'
        read *, input

        if (len_trim(input) /= 3) then
            print *, 'Invalid input! Please enter a 3-digit number.'
            valid_input = .false.
        else
            do i = 1, 3
                answer(i) = ichar(input(i:i)) - ichar('0')
            end do

            if (answer(1) == answer(2) .or. answer(1) == answer(3) .or. answer(2) == answer(3)) then
                print *, 'digits must be unique'
                valid_input = .false.
            end if
        end if

        if (valid_input) exit
    end do

    print *, 'Welcome to the 1A2B game! Guess the 3-digit number (digits are unique).'

    ! The GOTO number is 42
42  print *, 'Enter your 3-digit guess (e.g., 123):'
    A = 0
    B = 0

    ! print *, 'Enter your 3-digit guess (e.g., 123):'
    read *, input

    if (len_trim(input) /= 3) then
        print *, 'Invalid input! Please enter a 3-digit number.'
    endif

    do i = 1, 3
        guess(i) = ichar(input(i:i)) - ichar('0')
    end do

    do i = 1, 3
        if (guess(i) == answer(i)) then
            A = A + 1
        endif
    end do

    do i = 1, 3
        do j = 1, 3
            if (guess(i) == answer(j)) then
                B = B + 1
                exit
            endif
        end do
    end do

    B = B - A

    print *, 'Result: ', A, 'A', B, 'B'

    if (A == 3) then
        print *, 'Congratulations! You guessed the correct number!'
    else 
        goto 42
    endif

end program ABGame