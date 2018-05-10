function result=Calculate_Frame_FPA(mt2,ca1)
%input:
%mt2,ca1(number)
%output:
%FPA(number)
%function: 
%calculate FPA of each frame
mt2_Thisframe=mt2;
ca1_Thisframe=ca1;
footVec=mt2_Thisframe-ca1_Thisframe;
FPA_ThisFrame=atand(footVec(2)/footVec(1));
result=FPA_ThisFrame;







