SUBROUTINE TransformToTailNoiseObservationCoord
    !����β������ʱ����β���������������㣬��Ҫת��һ����ʵ�۲�������
    !Ϊ����������е����ݣ�β��������ֻCFD����ϵ��X������ƫ�ã���Y��Z������ƫ��
    !����ǰ����Ĳ���������Ҫ������CFD�����Խ�������̺ϲ���CFDPost��������ΪToolbox of CFD and Noise
    USE GlobalVariable
    IMPLICIT NONE
    
    REAL(KIND=8) :: actualMainToTaildistanceX  
    INTEGER(KIND=8) :: errFlag
    
    actualChordOfMainRotor = reynoldsNumber * 1.78 / (tipMaOfMainRotor * 34.0 * 1.225)
    actualMainToTaildistanceX = mainToTaildistanceX * actualChordOfMainRotor
    WRITE(*,*) "��ʵ����Noise", actualMainToTaildistanceX
    
    !��β���������������㣬���Ƚ��������ƽ�ơ�
    
    !����������ϵ��-Y����ת90��
    
    
END SUBROUTINE TransformToTailNoiseObservationCoord