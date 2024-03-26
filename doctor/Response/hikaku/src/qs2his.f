      PROGRAM QS2HIS
*********************************************************
*     <  QS2HIS   >      VER. 1.2         MAR/31/97     *
*                        BY YOSHIYUKI SUZUKI            *
*                                                       *
*    SAMPLE HISTORIES OF 2DOF Qadra-linear+SLIP SYSTEMS *
*    UNDER SEISMIC EXCITATIONS                          *
*                                                       *
*    X : DISPLACEMENT          AC  : SEISMIC EXCITATION *
*    Y : VELOCITY                                       *
*    Z : HYSTERETIC COMPONENT                           *
*                                                       *
*    CALLING    QS2FHIS,RKF20,DAMP                      *
*                                                       *
*    DATA FILE IS NEEDED.  EXSAMPLE  C2HIS.DAT          *
*                                                       *
*    NEND   : NUMBER OF STEPS                           *
*    JPRINT : INTERVAL STEPS FOR PRINT OUT              *
*    JPLOT  : INTERVAL STEPS FOR OUTPUT ON FILE         *
*    NOPLOT : IF = 0, DOES NOT OUTPUT ON FILE           *
*    DBT    : TIME INTERVAL NORMALIZED BY THE T1        *
*    WM     : MASS                                      *
*    WK     : RIGIDITY                                  *
*    XD     : YIELD DEFORMATION                         *
*    R      : RATIO OF RIGIDITY                         *
*    DC     : DAMPING COEF.                             *
*                                                       *
*    ***************************************            *
*    SD_FILE: FILE NAME OF SEISMIC DATA                 *
*    NUMBER : NUMBER OF SEISMIC DATA                    *
*    CALIB  :                                           *
*    NFILE  : FILE NAME OF OUTPUT X,Y,Z                 *
*                                                       *
* $Id: qs2his.f,v 1.1 1999/03/08 08:49:41 nakaji Exp nakaji $
*********************************************************
      EXTERNAL      QS2FHIS
      DIMENSION X(2,10000),G(2,10000),Y(2,10000),RF(2,10000),
     $     CHE(2,10000),
     $     RFTRI(2,10000),RFSLIP(2,10000),
     $     AC(10000),
     $     XX(2),YY(2),U(20)
      REAL P(2),K1(2),K2(2),K3(2),K4(2),ALPHA(2),A(2),W(2),
     $     AREA(2),RWALL(2),WK(2),mu,nu
      COMMON/RKFC2/ WM(2),DC(2),CB(2),
     $     WKT1(2),R1BAR(2),R2BAR(2),R3BAR(2),R1(2),R2(2),R3(2),RS(2),
     $     WKS1(2),HEIGHT(2),XD1(2),XD2(2),XD3(2),
     $     XDS(2),BETA,
     $     AINP1,AINP2,DDT,
     $     RTRI(2),RSLIP(2)
      CHARACTER*30  NFILE(20),DATA_N,SD_FILE,DATA_XLS
      CHARACTER*1   YES
      CHARACTER*2   CLOOP(20)
*     
      PARAMETER ( NDIM = 10000, ND = 2)
      PARAMETER ( EPSA = 1.0E-4, EPSR = 1.0E-4)
*     
      DOUBLE PRECISION PI
*     
      CHARACTER TIM*8
*
      DATA CLOOP/"01","02","03","04","05","06","07","08","09","10",
     $           "11","12","13","14","15","16","17","18","19","20"/
*
      PI = 4.0D0*ATAN(1.0D0)
      NOD    = 2
      NSEQ   = 9*NOD
      IOPEN1 = 0
      IOPEN2 = 0
      IOPEN3 = 0
      IOPEN4 = 0
      CEMAX1 = 0.
      CEMAX2 = 0.
      XMAX1  = 0.
      XMAX2  = 0.
      YMAX1  = 0.
      YMAX2  = 0.
      hemax1 = 0.
      hemax2 = 0.
      nerr=0
*     --------------------------------------------------
*     ***  READ PARAMETERS  (OPEN DATA FILE) ***
*     --------------------------------------------------
      M=IARGC()
 1000 ID_RD = 1
C
      IF(M.EQ.1) THEN
         CALL GETARG(1, DATA_N)
      ELSE
         PRINT*,'  READ PARAMETERS FROM FILE. '
         PRINT*,'    FILE NAME  ? '
         READ(*,'(A)') DATA_N
      ENDIF
      IF(IOPEN1.NE.0) CLOSE(1)
      OPEN(1,FILE=DATA_N,IOSTAT=ICON,ERR=98,STATUS='OLD',
     $     FORM='FORMATTED')
      GOTO 99
 98   PRINT*, '+++  ERROR!  FILE OPEN  ICON = ',ICON
      GOTO 1000
 99   PRINT*, DATA_N,'IS OPENED.  ICON = ',ICON
      IOPEN1 = 1
C
C     READ PARAMETERS
C
      READ(1,11,END=9000) NEND,JPRINT,JPLOT,NOPLOT,NCYCLE
c
C Read W1 only. w2 is determined by multiplier `mu'
c w(1): weight of 1st story (unit: tonf)
c mu varies: 0.4,0.6,0.8,1.0
c
      READ(1,12) w(1),mu
      w(2)=w(1)*mu
C AREA(I) (M^2) to get wall ratio
      READ(1,12) (AREA(I),I=1,NOD)
C C0
      READ(1,13) C0,DC0
C H1, H2 (M)
      READ(1,12) (HEIGHT(I),I=1,NOD)
C XD1, XD2 (CM)
      READ(1,13) (XD1(I),I=1,NOD)
      READ(1,13) (XD2(I),I=1,NOD)
C H
      READ(1,14) H
C ALPH = P(DELTA1)/P(DELTA2) = 0.5
      READ(1,14) ALPH
C TRILINEAR-SLIP RATIO -- BETA --
      READ(1,14) BETA
C gamma3 -- ratio between pmax of quadrilinear and p(1/120)
      read(1,14) gamma3
c nu : shear force coeff. of 2nd story, a(2) varies by `nu'.
c      nu varies: 0.5,0.75,1.0,1.25,1.50
      read(1,14) nu
C
 11   FORMAT(5I5)
 12   FORMAT(2F10.3)
 13   FORMAT(2F10.5) 
 14   FORMAT(F10.5)
C
c sd_file: contains seismic data
c number: number of seismic data
c dtsec: sampling period of seismic data
c calib: calibration factor
      READ(1,'(A)') SD_FILE
      READ(1,'(I4)')  NUMBER
      READ(1,'(F10.5)') DTSEC
      READ(1,'(F10.5)') CALIB
C
c nfile(20): records response for each c0
      IF(ID_RD.EQ.1) THEN
         READ(1,'(A18)') (NFILE(I),I=1,20)
      ELSE 
         PRINT*,' OUTPUT FILENAME FOR RESPONSE ? '
         READ(*,'(A18)') (NFILE(I),I=1,20)
      ENDIF
c data_xls: records maxmum value of disp. etc.
      IF(ID_RD.EQ.1) THEN
         READ(1,'(A18)') DATA_XLS
      ELSE 
         PRINT*,' OUTPUT FILENAME FOR EXCEL ? '
         READ(*,'(A18)') DATA_XLS
      ENDIF
C use all waves
      NEND=NUMBER
C
C initial c0 is 0.05
C      C0=0.4
c loop of c0 starts
      LOOP=1
 30   continue
C
      NOPLOT=1
C
C IF C0 IS LESS THAN 0.2, DC0 == 0.05, OTHERWISE DC0 == 0.1
C      IF(C0.LT.0.2) THEN
C         DC0=0.05
C      ELSE
C         DC0=0.05
C      ENDIF
C      NOPLOT = 1
C 
c measures time for each loop
      CALL TIME( TIM )
      WRITE(0,*) LOOP,' ',NFILE(LOOP),C0,NOPLOT,' ',CLOOP(LOOP),' ',TIM
C
c get natural period
      T0=0.3
 100  ALPHA(1)=1.0
      ALPHA(2)=mu/(1.0+mu)
      DO 3 I=1,NOD
         A(I)=1.0+(1.0/SQRT(ALPHA(I))-ALPHA(I))*2.0*T0/(1.+3.*T0)
 3    CONTINUE
C
      CB(1)=C0*A(1)
      CB(2)=C0*NU*A(2)
C
      P(1)=CB(1)*(1.0+mu)*w(1)
      P(2)=CB(2)*mu*w(1)
C
      GAMMA=BETA*GAMMA3+(1.0-BETA)
C
      DO 2 I=1,NOD
C poly-LINEAR
         XD3(I)=HEIGHT(I)/30.0
         WKT1(I)=ALPH*P(I)/XD1(I)
         K1(I)=WKT1(I)
         K2(I)=(1.-ALPH)*P(I)/(XD2(I)-XD1(I))
         K3(I)=(gamma3-1.0)*P(I)/(XD3(I)-XD2(I))
         K4(I)=0.
         R1(I)=K2(I)/K1(I)
         R2(I)=K3(I)/K1(I)
         R3(I)=K4(I)/K1(I)
         R1BAR(I)= 1.0
         R2BAR(I)=(R1(I)-R3(I))/(1.-R3(I))
         R3BAR(I)=(R2(I)-R3(I))/(1.-R3(I))
C SLIP
         XDS(I)=XD2(I)
         WKS1(I)=1.0*P(I)/XDS(I)
         RS(I)=K4(I)/WKS1(I)
C WEIGHT -> MASS
         WM(I)=W(I)/980.0
C RATIO OF WALL
         RWALL(I)=P(I)*100./(0.2*AREA(I))
C INITIAL RIGIDITY
         WK(I)=BETA*WKT1(I)+(1.-BETA)*WKS1(I)
 2    CONTINUE
C
      CALL DAMP(WM,WK,DC,H,T1,T2)     
C
      TEPS=(T1-T0)/T1
      IF(ABS(TEPS).GT.1.0E-02) THEN
         T0=T1
         GOTO 100
      ENDIF
*     --------------------------------------------------
*     ***  SET INITIAL VALUES  ***
*     --------------------------------------------------
      DO 200 M=1,NDIM
         AC(M) = 0
         DO 210 I=1,NOD
            X(I,M) = 0.
            G(I,M) = 0.
            Y(I,M) = 0.
            RF(I,M) = 0.
            RFTRI(I,M)=0.
            RFSLIP(I,M)=0.
            CHE(I,M)=0.
 210     CONTINUE
 200  CONTINUE
*     
*     ---- READ DATA OF SEISMIC EXCITATION  ---------
      PRINT*,'  READ SEISMIC DATA FROM FILE ',sd_file
 300  IF(IOPEN2.NE.0) CLOSE(2)
      OPEN(2,FILE=SD_FILE,IOSTAT=ICON,ERR=310,STATUS='OLD')
      GOTO 320
 310  PRINT*, '+++  ERROR!  FILE OPEN  ICON = ',ICON
      PRINT*,'  READ FROM FILE ?  YES[Y OR RETURN], STOP[0] '
      YES = ' '
      READ(*,'(A)') YES
      IF(YES.EQ.'0') STOP
      GOTO 300
******************************************************
 320  PRINT*, SD_FILE,'IS OPENED.  ICON = ',ICON
      IOPEN2 = 1
      DO 1 I=1,NUMBER
         READ(2,*,END=340) DUM1,AC(I)
 1    CONTINUE
 20   FORMAT(F6.2,3(1X,F7.3))
******************************************************
 340  CLOSE(2,ERR=9000)
*     
      DBT = DTSEC
      DT  = DBT
      AMP = CALIB
      DO 350 I = 1,NUMBER
         AC(I) = AMP*AC(I)
 350  CONTINUE
*     -------------------------------------------
*     RESPONSE ANALYSIS
*     -------------------------------------------
 1100 JT = 0
      NT = 0
      NP = 0
      DDT = DT/FLOAT(NCYCLE)
      AC1 = 0
      DO 1200 I=1,NSEQ
         U(I) = 0.0
 1200 CONTINUE
*     
      DO 2000 N = 1,NEND
         JT = JT+1
         T  = DT*FLOAT(JT)
         TT = DBT*FLOAT(JT)
         XX(1) = 0.
         XX(2) = 0.
         YY(1) = 0.
         YY(2) = 0.
*
         AC2 = AC(N)
         DAC = (AC2 - AC1)/FLOAT(NCYCLE)
         DAINP = (AC2 - AC1)/DT
         DO 1210 ICYCLE = 1,NCYCLE
            TTT = 0.
            AINP1 = AC1 + DAC*(ICYCLE-1)
            AINP2 = AC1 + DAC*ICYCLE
            CALL RKF20(NSEQ,NSEQ,TTT,U,DDT,QS2FHIS,EPSA,EPSR,ICON)
            IF(ICON.NE.0) THEN
               WRITE(6,1201) ICON,TT
 1201          FORMAT(3X,'RKF  ICON=',I6,' T/T1=',F8.4/)
            ENDIF
            IF(ABS(U(1)).GT.XMAX1) then
               XMAX1 = ABS(U(1))
               gmax1 = xmax1/height(1)
            endif
            IF(ABS(U(2)).GT.XMAX2) then
               XMAX2 = ABS(U(2))
               gmax2 = xmax2/height(2)
            endif
            IF(ABS(U(3)).GT.YMAX1) YMAX1 = ABS(U(3))
            IF(ABS(U(4)).GT.YMAX2) YMAX2 = ABS(U(4))
            if(u(17).gt.hemax1) hemax1=u(17)
            if(u(18).gt.hemax2) hemax2=u(18)
C --- 応答がでかければやんぴ ---
            if(xmax1.gt.200.0.or.xmax2.gt.200.0) then
               open(10,file="tmperr",access='append')
               write(10,*) xmax1,xmax2,jt
               nerr=1
               np=jt
               write(10,*) np
               che(1,np)=hemax1
               che(2,np)=hemax2
               goto 2001
            endif
 1210    CONTINUE
         AC1 = AC2
         IF(MOD(JT,JPLOT).EQ.0) THEN
            NP = NP + 1
            DO 1300 I=1,NOD
               X(I,NP) = U(I)
               G(i,np) = x(i,np)/height(i)
               Y(I,NP) = U(I+NOD)
               RF(I,NP)=BETA*RTRI(I)+(1.0-BETA)*RSLIP(I)-WM(I)*980.0
     $              *U(I)/HEIGHT(I)
               RFTRI(I,NP) = RTRI(I)
               RFSLIP(I,NP)=RSLIP(I)
 1300       CONTINUE
            che(1,np)=hemax1
            che(2,np)=hemax2
         ENDIF
*     -----------------------------------------------
*     ***   PRINT OUTPUT   ***
*     -----------------------------------------------
         IF(MOD(JT,JPRINT).EQ.0) THEN
            DO 1400 I=1,NOD
               XX(I) = U(I)
               YY(I) = U(I+NOD)
 1400       CONTINUE
            WRITE(6,40) JT,TT
            WRITE(6,41) XX(1),YY(1)
            WRITE(6,42) XX(2),YY(2)
 40         FORMAT(1H ,I6, '  T =', F9.3)
 41         FORMAT(1H ,'   X1',1PE12.4,'  Y1',E12.4)
 42         FORMAT(1H ,'   X2',1PE12.4,'  Y2',E12.4)
         ENDIF
         IF(ABS(XX(1)).GE.200.0.OR.ABS(XX(2)).GE.200.0) then
            open(11,file="tmperr2",access='append')
            write(11,*) xmax1,xmax2
            nerr=1
            goto 2001
         endif
 2000 CONTINUE
 2001 CEMAX1=CHE(1,NP)
      CEMAX2=CHE(2,NP)
*     
*     -------------------------------------------
*     OUTPUT FOR PLOT  
*     -------------------------------------------
      IF(NOPLOT.NE.0) THEN
         NDATA = NP
         NDAP = NP
         JPLOT = 1
         PDBT = DBT*JPLOT
c --- 時刻歴は20秒分だけ ---
         ndap=min(int(20.0/pdbt),ndap)-1
*     
 3000    IF(IOPEN3.NE.0) CLOSE(3)
         OPEN(3,FILE=NFILE(LOOP),IOSTAT=ICON,ERR=3001,FORM='FORMATTED')
         IOPEN3 = 1
         GO TO 3002
 3001    PRINT*,'+++ ERROR FILE OPEN FOR RESPONSE ICON=',ICON
         PRINT*,' FILE NAME FOR RESPONSE ? '
         READ(*,'(A18)') NFILE(LOOP)
         GOTO 3000
*     
*     -----  OUTPUT NFILE  ---------
*     
 3002    write(3,'(a)') '# CTIME DISP1 GAMMA1 VEL1 '//
     $    'FORCE1 FORCETRI1 FORCESLIP1 ENERGY1 '//
     $    'DISP2 GAMMA2 VEL2 FORCE2 FORCETRI2 FORCESLIP2 ENERGY2'
         WRITE(3,81) (PDBT*J,(X(I,J),g(i,j),Y(I,J),RF(I,J),RFTRI(I,J),
     $        RFSLIP(I,J),CHE(I,J),I=1,NOD),J=1,NDAP)
c         write(3,*) ''
         WRITE(3,70) (WM(I),I=1,NOD),(WKT1(I),I=1,NOD),(WKS1(I),I=1,NOD)
     $        ,(WK(I),I=1,NOD),(DC(I),I=1,NOD),H
         WRITE(3,71) (XD1(I),I=1,NOD),(XD2(I),I=1,NOD),T1,T2,SD_FILE
         WRITE(3,73) (CB(I),I=1,NOD)
         WRITE(3,72) XMAX1,XMAX2,YMAX1,YMAX2,CEMAX1,CEMAX2
         WRITE(3,80) PDBT,NDATA,NFILE(LOOP)
         write(3,82) GAMMA,gamma3
         PRINT*,' WRITE DATA ON FILE ',NFILE(LOOP),' ** ',NDAP
      ENDIF
*     
 80   FORMAT('#   DT=', F7.4,1X,I4,2X,'F7.3, 14E14.5',1X,A10)
 81   FORMAT(F7.3,14E14.5)
 82   format('# GAMMA=',F7.4,' GAMMA3=',f7.4)
 70   FORMAT('# MASS =',2F8.5,' KTRI =',2F8.5,' KSLIP =',2F8.5,
     $          ' K =',2F8.5,' DC =',2F8.5,'  H =',F6.4)
 71   FORMAT('# XD1 =',2F8.5,' XD2 =',2F8.5,
     $          ' T  =',2F8.5,2X,A10)
 72   FORMAT('# XMAX =',2F8.5,' YMAX =',2F9.5,' CEMAX =',2F10.3)
 73   FORMAT('# CB =',2F8.5)
*
*     -------------------------------------------
*     OUTPUT FOR EXCEL
*     -------------------------------------------
 4000 IF(IOPEN4.NE.0) CLOSE(4)
      OPEN(4,FILE=DATA_XLS,IOSTAT=ICON,ERR=4001,FORM='FORMATTED'
     $     ,ACCESS='APPEND')
      IOPEN4 = 1
      GO TO 4002
 4001 PRINT*,'+++ ERROR FILE OPEN FOR RESPONSE ICON=',ICON
      PRINT*,' FILE NAME FOR RESPONSE ? '
      READ(*,'(A18)') DATA_XLS
      GOTO 4000
C
 4002 CONTINUE
      IF(LOOP.EQ.1) WRITE(4,'(A)') '## NFILE T1 T2 CB1 CB2 P1 P2 '//
     $     'RWALL1 RWALL2 '//
     $     'XMAX1 XMAX2 GMAX1 GMAX2 YMAX1 YMAX2 CEMAX1 CEMAX2'
      WRITE(4,61) LOOP,T1,T2,(CB(I),I=1,NOD),(P(i),i=1,nod),
     $     (RWALL(I),I=1,NOD),
     $     XMAX1,XMAX2,GMAX1,GMAX2,YMAX1,YMAX2,CEMAX1,CEMAX2
C 61   FORMAT(A10,16(1X,E14.5))
 61   format(i02,16(1X,E14.5))
C
      C0=C0+dc0
      LOOP=LOOP+1
      IOPEN1 = 0
      IOPEN2 = 0
      IOPEN3 = 0
      IOPEN4 = 0
      CEMAX1 = 0.
      CEMAX2 = 0.
      XMAX1  = 0.
      XMAX2  = 0.
      gmax1  = 0.
      gmax2  = 0.
      YMAX1  = 0.
      YMAX2  = 0.
      hemax1 = 0.
      hemax2 = 0.
      IF(C0.GT.1.05.OR.LOOP.GT.20) GOTO 9000
      GOTO 30
C
 9000 STOP
      END
