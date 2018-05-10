function rawData = readData()
test=c3dserver();

openc3d(test,1,'F:\Study\Data Driven Algorithm\test\Matlab\Trial01.c3d');
rawData.Trial01_Components = get3dtargets(test,0);

rawData.Trial01_Force = csvread('Trial01_Force.CSV');

end

