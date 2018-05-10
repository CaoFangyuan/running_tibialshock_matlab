
test=c3dserver();
needFilter = 0;
plate = 1;

%% Trial04
filename=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\2.3cop\2.3104force.csv');
rawData.Trial01_Force = csvread(filename,5,0);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\2.3cop\2.3104position.csv');
rawData.Trial01_Components = csvread(filename1,5,0);

 
D = (rawData.Trial01_Components(:,12:14) + rawData.Trial01_Components(:,15:17))/2;
P = rawData.Trial01_Components(:,12:14) - rawData.Trial01_Components(:,9:11);
Cop_Vicon = P+D;
if plate == 1
    Cop_Force = rawData.Trial01_Force(:,3:5);% forceplate1
    Filtered_Force=meanCop(Cop_Force);
elseif plate == 2
    Cop_Force = rawData.Trial01_Force(:,6:8);% forceplate2
    Filtered_Force=meanCop(Cop_Force);
end
    
if needFilter==1
    [b,a]=butter(2,20/(1000/2));
    Cop_Force = filter(b,a,Cop_Force);
end


Different = Filtered_Force - Cop_Vicon;
Offset.mean = mean(Different(100:end,:));
Offset.std = std(Different(100:end,:));

if plate == 1
    offset.plate1 = Offset;
elseif plate == 2
    offset.plate2 = Offset;
end

save offset offset



