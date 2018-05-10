function RawData = readXsensDataC(Dataname)

Filename = [Dataname '.txt'];
Data = importdata(Filename);
Data_length = length(Data.data);


    RawData.Acc_X =  Data.data(1:Data_length,3);
    
    RawData.Acc_Y =  Data.data(1:Data_length,4);
    
    RawData.Acc_Z =  Data.data(1:Data_length,5);
    


