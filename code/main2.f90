program test
    implicit none

    real :: x, y, z, w
    character(len=2) :: e

    e = ", "


    Open(1, file = '../1999.lis', status = 'old')
    Open(2, file = '../1999_output.csv', status = 'unknown')

42  read(1, '(18X, F2.0, F5.2, F3.0, F5.2)', end = 99) x, y, z, w

    ! write(2, '(A2, A5)') line, x
    x = (x + y / 60)
    z = (z + w / 60)
    write(2, '(F8.5, A2, F10.5)') x, e, z
    ! print *, y
    ! print *, z
    ! print *, w
    goto 42



99  close(1)
    close(2)
    
end program test
