    PROGRAM ADAMS_MOULTON
    REAL(4) X(100),Y(100),N
    WRITE(*,*)' SOLUCION DE EDO POR EL METODO ADAMS-MOULTON '
    WRITE(*,*)''
    WRITE(*,*)' INGRESE LAS CONDICIONES INICIALES'
    WRITE(*,*)' INGRESA X(0),Y(0),XF,N'
    READ(*,*) X(0),Y(0),TI,N

    H=(TI-X(0))/N

    WRITE(*,*)'VALOR DE H:', H

    do i=0,N
        X(i+1)=X(i)+H
    end do

    WRITE(*,*)'RESULTADOS'
    WRITE(*,*)' X Y '
    WRITE(*,10) X(0),Y(0)
    !euler
    do J=0,1
        Y(J+1)=Y(J)+H*F(X(J),Y(J))
        WRITE(*,10) X(J+1),Y(J+1)

    end do
    !bashforth
    A=Y(2)
    do K=2,N-1
        Y(K+1)=Y(K)+(H/24)*(9*F(X(K+1),A)+19*F(X(K),Y(K))-5*F(X(K-1),Y(K-1))+F(X(K-2),Y(K-2)))
        WRITE(*,10)X(K+1),Y(K+1)
    END DO

    DO I=1,M
        ER=ABS(XP(K2,I)-XP(K2+1,I))
        IF (ER.GT.TOL)THEN
            K2=K2+1
            GOTO 10
        ELSE
        END IF
    END DO

10  FORMAT (2(F9.4),2X)
END

FUNCTION F(X,Y)
F=-12*X*Y+Y*Y
return
END
