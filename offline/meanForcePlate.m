function Right_force=meanForcePlate(force_Plate)
%input:
%the raw date of forceplate(matrix[N,14])
%output:
%the force of z axis for both legs(array)
%fouction:
%to avarage the force 0f ten  rows to match each frame of vicon data
L=length(force_Plate);
L_forceZ=L/10;
Right_force=zeros(L_forceZ,1);
for i=1:L_forceZ
    Right_force(i) = mean(force_Plate(10*i-9:10*i));
end