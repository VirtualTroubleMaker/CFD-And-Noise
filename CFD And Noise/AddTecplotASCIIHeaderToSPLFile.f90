SUBROUTINE AddTecplotASCIIHeaderToSPLFile
    !��������������SPL_FWH.DAT�ļ���ÿһ�лᰴ������ĸ�ʽ�洢��
    !�۲��X����     �۲��Y����      �۲��Z����      ���������ѹ��        �غ�������ѹ��        ��������ѹ��
    !���룺����۲���������SPL_FWH.DAT������
    !�������SPL_FWH.DAT�ļ��Ŀ�ͷ����һ��Tecplot��Header�����ΪFWHSPLTecplot.DAT��ʹ����ֱ�ӱ�Tecplot��
    IMPLICIT NONE
    
    !REAL(KIND=8) :: actualMainToTaildistanceX  
    REAL(KIND=8), ALLOCATABLE :: FWHSPLFile(:,:)
    INTEGER(KIND=8) :: errFlag
    INTEGER(KIND=8) :: i
    INTEGER(KIND=8) :: numberOfObservationPoints
    
    !Read File
    OPEN(UNIT = 95311, FILE = "./SPL_FWH.DAT", IOSTAT = errFlag)
    IF(errFlag /= 0) WRITE(*,*) "Can not open file: SPL_FWH.DAT"
    
    WRITE(*,*) "Please Input The Number Of Observation Points(Default - 370):"
    READ(*,*) numberOfObservationPoints
    IF(numberOfObservationPoints /= 370) WRITE(*,*) "Please Modify The Source Code!"
    
    ALLOCATE(FWHSPLFile(numberOfObservationPoints,6))
    
    DO i = 1, numberOfObservationPoints
        READ(95311,*) FWHSPLFile(i,1), FWHSPLFile(i,2), FWHSPLFile(i,3), FWHSPLFile(i,4), FWHSPLFile(i,5), FWHSPLFile(i,6)
    END DO
    !WRITE(*,*) FWHSPLFile(1,1), FWHSPLFile(1,2), FWHSPLFile(1,3), FWHSPLFile(1,4), FWHSPLFile(1,5), FWHSPLFile(1,6)
    !WRITE(*,*) FWHSPLFile(numberOfObservationPoints,1), FWHSPLFile(numberOfObservationPoints,2), FWHSPLFile(numberOfObservationPoints,3), FWHSPLFile(numberOfObservationPoints,4), FWHSPLFile(numberOfObservationPoints,5), FWHSPLFile(numberOfObservationPoints,6)
    
    CLOSE(95311)
    
    !Write File
    OPEN(UNIT = 95310, FILE = "./FWHSPLTecplot.DAT", IOSTAT = errFlag)
    IF(errFlag /= 0) WRITE(*,*) "Can not open file: FWHSPLTecplot.DAT"
    WRITE(95310,*) 'VARIABLES = "X", "Y", "Z", "Thickness Noise", "Load Noise", "Total Noise"'
    WRITE(95310,*) 'ZONE  I= 37, J= 10, K= 1, DATAPACKING=POINT, VARLOCATION=([4,5,6]=NODAL)'
    DO i = 1, numberOfObservationPoints
        WRITE(95310,"(6F15.8)") FWHSPLFile(i,1), FWHSPLFile(i,2), FWHSPLFile(i,3), FWHSPLFile(i,4), FWHSPLFile(i,5), FWHSPLFile(i,6)!���ø�ʽ��������Ա�֤һ��WRITE������ռһ��
    END DO
    CLOSE(95310)
    
    DEALLOCATE(FWHSPLFile)
    
    
END SUBROUTINE AddTecplotASCIIHeaderToSPLFile