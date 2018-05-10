function M = create_RotMat_ViconToAnatomical(LabName)
%input:
%   LabName(string)
%output:
%  M(matrix)
%function:
%Get rotation matrix for specific lab
switch LabName
    case 'SJTU_BBL'
        M = [1 0 0; 0 1 0; 0 0 1];
    case 'SJTU_BBL_Left'
        M = [0 1 0; -1 0 0; 0 0 1];
    case '6th_Hosptial'
        M = [0 -1 0; 1 0 0; 0 0 1];
end