SUBROUTINE GenerateObservationCoordOfRadiantSphere
    USE GlobalVariable
    IMPLICIT NONE
    
    REAL(KIND=8) :: radiumOfRadiantSphere
    REAL(KIND=8) :: xCoord, yCoord, zCoord
    REAL(KIND=8) :: phi, theta ! phi�Ƿ�λ�ǣ�theta�Ǹ�����
    INTEGER(KIND=8) :: partOfPhiDirection, partOfThetaDirection
    INTEGER(KIND=8) :: thetaIter, phiIter  
    INTEGER(KIND=8) :: errFlag
    
    !�����ڵ�����ϵ�����������й۲�����ϵ��ԭ���ڽ�����ģ�Yָ���Xָ����Z�������ַ���ָ����
    WRITE(*,*) "Please Input The Radium Of Radiant Sphere��"
    READ(*,*) radiumOfRadiantSphere
    partOfThetaDirection = 9
    partOfPhiDirection = 36
    
    OPEN(UNIT = 95300, FILE = "./[OUT]Observation Coordinate At Radiant Sphere.DAT", IOSTAT = errFlag)
    IF(errFlag /= 0) WRITE(*,*) "Can not open file: Observation Coordinate At Radiant Sphere.DAT"
    
    WRITE(95300,*) "ZONE I = ", partOfPhiDirection + 1, ", J = ", partOfThetaDirection + 1, ", K = 1"
    !WRITE(*,*) 90/partOfThetaDirection, 360/partOfPhiDirection
    
    DO thetaIter = 0, 90, 90/partOfThetaDirection
        DO phiIter = 0, 360, 360/partOfPhiDirection
            theta = thetaIter * DTR
            phi = phiIter * DTR
            xCoord = radiumOfRadiantSphere * cos(theta) * sin(phi)
            yCoord = radiumOfRadiantSphere * cos(theta) * cos(phi)
            zCoord = -radiumOfRadiantSphere * sin(theta)
            
            WRITE(95300,*) xCoord, yCoord, zCoord
        END DO
    END DO
    CLOSE(95300)
    
END SUBROUTINE GenerateObservationCoordOfRadiantSphere