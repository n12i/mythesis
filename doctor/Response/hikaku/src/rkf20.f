C     ******************************************************
C     *    <  RKF20  >     VER. 1.2             1/18/96    *
C     *                                                    *
C     *   INPUT                                            *
C     *    NDIMEN: DIMENSION IN CALLING PROGRAM            *
C     *    N     : NUMBER OF SIMALTANEOUS EQUATIONS        *
C     *    T     : INITIAL VALUE OF VARIABLE T0            *
C     *    Y     : INITIAL VALUE OF VARIABLES Y0           *
C     *    EPSA  : MAXIMIM ABSOLUTE ERROR                  *
C     *    EPSR  : MAXIMIM RELATIVE ERROR                  *
C     *   OUTPUT                                           *
C     *    T     : = T0 + H                                *
C     *    Y     : = Y(T0+H)                               *
C     *                                                    *
C     *    ATTENTION : EXTERNAL FUNC  IN CALLING PROGRAM   *
C     ******************************************************
      SUBROUTINE RKF20(NDIMEN,N,T,Y,H,FUNC,EPSA,EPSR,ICON)
      IMPLICIT  REAL*8(A,D)
      DIMENSION Y(NDIMEN)
      DIMENSION Y0(20),F(20),A1(100),A2(100),A3(100)
     *         ,A4(100),A5(100),A6(100)
C     ----------------------------------------------
      PARAMETER (D31 = 0.09375D0,     D32 = 0.28125D0)
      PARAMETER (D41 = 0.879380974D0, D42 =-3.277196177D0,
     *           D43 = 3.320892126D0)
      PARAMETER (D51 = 2.032407407D0, D52 =-8.0D0,
     *           D53 = 7.173489279D0, D54 =-0.205896686D0)
      PARAMETER (D61 =-0.296296296D0, D62 = 2.0D0,
     *           D63 =-1.381676413D0, D64 = 0.452972709D0,
     *           D65 =-0.275D0)
      PARAMETER (DY1 = 0.11574074D0,  DY2 = 0.0D0,
     *           DY3 = 0.548927875D0, DY4 = 0.535331384D0,
     *           DY5 =-0.2D0)
      PARAMETER (DE1 = 0.002777777D0, DE2 = 0.0D0,
     *           DE3 =-0.02994152D0,  DE4 =-0.029199893D0,
     *           DE5 = 0.02D0,        DE6 = 0.036363636D0)
      PARAMETER (DT1 = 1.0D0,         DT2 = 0.25D0,
     *           DT3 = 0.375D0,       DT4 = 0.923076923D0,
     *           DT5 = 1.0D0,         DT6 = 0.5D0)
C     ----------------------------------------------------
      IF(N.GT.NDIMEN.OR.N.GT.90) THEN
         ICON = 10000
         RETURN
      ENDIF
C     ----------------------------------------------
      ICON = 0
      T0 = T
      DO 100 I = 1,N
      Y0(I) = Y(I)
  100 CONTINUE
      CALL FUNC(T,Y,F)
      DO 101 I = 1,N
        A1(I) = H*F(I)
  101 CONTINUE
C     ----------------------------------------------
      T = T0 + DT2*H
      DO 200 I = 1,N
      Y(I) = Y0(I) + 0.25*A1(I)
  200 CONTINUE
      CALL FUNC(T,Y,F)
      DO 201 I = 1,N
        A2(I) = H*F(I)
  201 CONTINUE
C     ----------------------------------------------
      T = T0 + DT3*H
      DO 300 I = 1,N
      Y(I) = Y0(I) + D31*A1(I) + D32*A2(I)
  300 CONTINUE
      CALL FUNC(T,Y,F)
      DO 301 I = 1,N
        A3(I) = H*F(I)
  301 CONTINUE
C     ----------------------------------------------
      T = T0 + DT4*H
      DO 400 I = 1,N
      Y(I) = Y0(I) + D41*A1(I) + D42*A2(I) + D43*A3(I)
  400 CONTINUE
      CALL FUNC(T,Y,F)
      DO 401 I = 1,N
        A4(I) = H*F(I)
  401 CONTINUE
C     ----------------------------------------------
      T = T0 + H
      DO 500 I = 1,N
      Y(I) = Y0(I) + D51*A1(I) + D52*A2(I) + D53*A3(I) + D54*A4(I)
  500 CONTINUE
      CALL FUNC(T,Y,F)
      DO 501 I = 1,N
        A5(I) = H*F(I)
  501 CONTINUE
C     ----------------------------------------------
      T = T0 + DT6*H
      DO 600 I = 1,N
      Y(I) = Y0(I) + D61*A1(I) + D62*A2(I) + D63*A3(I)
     *             + D64*A4(I) + D65*A5(I)
  600 CONTINUE
      CALL FUNC(T,Y,F)
      DO 601 I = 1,N
        A6(I) = H*F(I)
  601 CONTINUE
C     ----------------------------------------------
      ERRMAX = 0.
      T = T0 + H
      DO 1000 I = 1,N
      Y(I) = Y0(I) + DY1*A1(I) + DY3*A3(I) + DY4*A4(I) + DY5*A5(I)
      EERR = DE1*A1(I) + DE3*A3(I) + DE4*A4(I) + DE5*A5(I)
     *                 + DE6*A6(I)
      TERR = EPSA + EPSR*ABS(Y(I))
      IF(EERR.GT.ERRMAX) ERRMAX = EERR
      IF(EERR.GT.TERR  ) ICON   = ICON + 1
 1000 CONTINUE
      RETURN
      END
