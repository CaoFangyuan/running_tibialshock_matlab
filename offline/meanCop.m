function meancop=meanCop(cop)
%input:
%the raw date of forceplate(matrix[N,14])
%output:
%the force of z axis for both legs(array)
%fouction:
%to avarage the force 0f ten  rows to match each frame of vicon data
[L,m]=size(cop);
L_forceZ=L/10;
meancop=zeros(L_forceZ,3);
for i=1:L_forceZ
    meancop(i,:) = mean(cop(10*i-9:10*i,:));
    
end