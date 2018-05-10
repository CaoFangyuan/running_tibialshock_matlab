test=c3dserver();
Filter = 0;

%% Trial03
openc3d(test,1,'F:\Study\Data Driven Algorithm\20170113Right_Leg\matlab\Testing raw data\Trial02.c3d');
rawData.Trial03_Components = get3dtargets(test,0);
rawData.Trial03_Force = csvread('F:\Study\Data Driven Algorithm\20170113Right_Leg\matlab\Testing raw data\Trial02.CSV',5,0);