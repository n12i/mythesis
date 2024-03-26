      SUBROUTINE QS2FHIS(T,U,F)
C***********************************************************************
C     << QS2HIS >>    FOR QS2HIS  VER 1.1 MAR/31/1997
C     STATE SPACE EQUATIONS FOR 2-DOF QUADRILINEAR+SLIP MODELSYSTEM 
C     UNDER SEISMIC EXCITATION
C***********************************************************************
C
      DIMENSION U(20),F(20),
     $          X(2),Y(2),Z1(2),Z2(2),Z3(2),ZS(2),
     $          Q(2),UP(2),UM(2),QS(2),
     $          IZ1(2),IZ2(2),IZ3(2),IS(2)
C
      COMMON/RKFC2/ WM(2),DC(2),CB(2),
     $     WKT1(2),R1BAR(2),R2BAR(2),R3BAR(2),R1(2),R2(2),R3(2),RS(2),
     $     WKS1(2),HEIGHT(2),XD1(2),XD2(2),XD3(2),
     $     XDS(2),BETA,
     $     AINP1,AINP2,DDT,
     $     RTRI(2),RSLIP(2)
C
      NOD=2
      AINP=AINP1+(AINP2-AINP1)*T/DDT
      DO 100 I = 1,NOD
        X(I)  = U(I)
        Y(I)  = U(I+NOD)
        Z1(I) = U(I+2*NOD)
        Z2(I) = U(I+3*NOD)
        Z3(I) = U(I+4*NOD)
        ZS(I) = U(I+5*NOD)
        UP(I) = U(I+6*NOD)
        UM(I) = U(I+7*NOD)
C
        IZ1(I)=0
        IZ2(I)=0
        IZ3(I)=0
C
        IF(Z1(I).GT.XD1(I)-1.0E-05.AND.Y(I).GT.0.0) THEN
           IZ1(I)=1
           Z1(I)=XD1(I)
        ENDIF
        IF(Z1(I).LE.1.0E-05-XD1(I).AND.Y(I).LT.0.0) THEN
           IZ1(I)=-1
           Z1(I)=-XD1(I)
        ENDIF
        IF(Z2(I).GT.XD2(I)-1.0E-05.AND.Y(I).GT.0.0) THEN
           IZ2(I)=1
           Z2(I)=XD2(I)
        ENDIF
        IF(Z2(I).LE.1.0E-05-XD2(I).AND.Y(I).LT.0.0) THEN
           IZ2(I)=-1
           Z2(I)=-XD2(I)
        ENDIF
        IF(Z3(I).GT.XD3(I)-1.0E-05.AND.Y(I).GT.0.0) THEN
           IZ3(I)=1
           Z3(I)=XD3(I)
        ENDIF
        IF(Z3(I).LE.1.0E-05-XD3(I).AND.Y(I).LT.0.0) THEN
           IZ3(I)=-1
           Z3(I)=-XD3(I)
        ENDIF
C
        IS(I)=0
C
        IF(X(I).GT.UP(I)-1.0E-06.AND.Y(I).GT.0.0) THEN
           IF(ZS(I).GE.0.0.AND.ZS(I).LT.XDS(I)) THEN
              IS(I)=1
           ELSE IF(ZS(I).GE.XDS(I)-1.0E-06) THEN
              IS(I)=2
              ZS(I)=XDS(I)
           ENDIF
        ENDIF
C
        IF(X(I).GT.0.0.AND.Y(I).LE.0.0.AND.ZS(I).GT.0.0) THEN
           IS(I)=1
        ENDIF
C
        IF(X(I).LT.1.0E-06-UM(I).AND.Y(I).LT.0.0) THEN
           IF(ZS(I).LE.0.0.AND.ZS(I).GT.-XDS(I)) THEN
              IS(I)=-1
           ELSE IF(ZS(I).LE.1.0E-06-XDS(I)) THEN
              IS(I)=-2
              ZS(I)=-XDS(I)
           ENDIF
        ENDIF
C
        IF(X(I).LT.0.0.AND.Y(I).GE.0.0.AND.ZS(I).LT.0.0) THEN
           IS(I)=-1
        ENDIF
C
        IF(IS(I).EQ.0) ZS(I)=0.0
 100  CONTINUE
C
C     RESTORING FORCE QUADRILINEAR+SLIP
C
        DO 110 I=1,NOD
           ZT =(R1BAR(I)-R2BAR(I))*Z1(I) + (R2BAR(I)-R3BAR(I))*Z2(I)
     $          + R3BAR(I)*Z3(I)
           PTRI=R3(I)*X(I)+(1.0-R3(I))*ZT
           RTRI(I)=WKT1(I)*PTRI
           PSLIP=RS(I)*X(I)+(1.0-RS(I))*ZS(I)
           RSLIP(I)=WKS1(I)*PSLIP
           QS(I)=BETA*RTRI(I)+(1.0-BETA)*RSLIP(I)-WM(I)*980.0
     $          *X(I)/HEIGHT(I)
           Q(I)=DC(I)*Y(I)+QS(I)
 110    CONTINUE
C
C     STATE EQUATIONS
C
        DO 200 I=1,NOD
           F(I)=Y(I)
 200    CONTINUE
C
        M=NOD+1
        F(M)=(-Q(1)+Q(2))/WM(1)-AINP
        M=NOD+2
        F(M)=Q(1)/WM(1)-(1.0+WM(2)/WM(1))*Q(2)/WM(2)
C
        DO 300 I=1,NOD
           M1=NOD*2+I
           M2=NOD*3+I
           M3=NOD*4+I
           F(M1)=Y(I)
           F(M2)=Y(I)
           F(M3)=Y(I)
           IF(IZ1(I).NE.0) F(M1)=0.0
           IF(IZ2(I).NE.0) F(M2)=0.0
           IF(IZ3(I).NE.0) F(M3)=0.0
C
           M=NOD*5+I
           MP=NOD*6+I
           MM=NOD*7+I
           F(M)=0.0
           F(MP)=0.0
           F(MM)=0.0
           IF(IABS(IS(I)).EQ.1) F(M)=Y(I)
           IF(IS(I).EQ.2) F(MP)=Y(I)
           IF(IS(I).EQ.-2) F(MM)=-Y(I)
           M=NOD*8+I
           F(M)=QS(I)*Y(I)
 300    CONTINUE
C
        RETURN
        END
