C     CALCULATION OF NATURAL PERIOD, DAMPING  
C
C
      SUBROUTINE DAMP(M,K,DC,H,T1,T2)
C
      REAL M(2),K(2),DC(2)
      REAL OMEGA(2)
      REAL H,CFREQ1,CFREQ2
C
      DOUBLE PRECISION PI
C     
      PI = 4.0D0*ATAN(1.0D0)
C
      AA = M(1)*M(2)
      BB = K(2) * M(1) + ( K(1) + K(2) ) * M(2)
      BB = BB * (-1.0)
      CC = K(1) * K(2)
C
      DO 100 I=1,2
         IF(I.EQ.1) THEN
            OMEGA(I) = ((-1.0)*BB + SQRT(BB**2 - 4.0*AA*CC))/(2.0*AA)
         ELSE
            OMEGA(I) = ((-1.0)*BB - SQRT(BB**2 - 4.0*AA*CC))/(2.0*AA)
         ENDIF
C         WRITE(10,*) 2.0*PI/SQRT(OMEGA(I))
 100  CONTINUE
C
      CFREQ1 = SQRT(AMIN1(OMEGA(1),OMEGA(2)))
      CFREQ2 = SQRT(AMAX1(OMEGA(1),OMEGA(2)))
      T1     = 2.0*PI/CFREQ1
      T2     = 2.0*PI/CFREQ2
      DO 200 I=1,2
         DC(I)=2.0*H*K(I)/CFREQ1
C         WRITE(10,*) DC(I)
 200  CONTINUE
C
      RETURN
      END
