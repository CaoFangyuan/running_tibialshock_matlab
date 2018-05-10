function result=Calculate_Frame_TS(c7,lpsi,rpsi)
%input:
%mt2,ca1(number)
%output:
%FPA(number)
%function: 
%calculate FPA of each frame
c7_thisframe=c7;
mpsi_thisframe=(lpsi+rpsi)/2;
upperVec=c7_thisframe-mpsi_thisframe;
TS_thisframe=atand(upperVec(1)/upperVec(3));
result=TS_thisframe;
