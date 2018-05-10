%%process:Read data of Vicon(csv) and Xsens(txt)
%% Normal_sw_Normal_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\Sub5_NORMAL');
Sub5.rawData.Xsens.NORMAL = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_normal_force.CSV');
Sub5.rawData.Vicon.Force.NORMAL=csvread(filename1,5,0);
filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_normal_position.CSV');
Sub5.rawData.Vicon.Position.NORMAL=csvread(filename2,5,0);

%% Normal_sw_In_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\Sub5_IN');
Sub5.rawData.Xsens.NI = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_in_force.CSV');
Sub5.rawData.Vicon.Force.NI=csvread(filename1,5,0);
filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_in_position.CSV');
Sub5.rawData.Vicon.Position.NI=csvread(filename2,5,0);

%% Normal_sw_Out_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\Sub5_OUT');
Sub5.rawData.Xsens.NO = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_out_force.CSV');
Sub5.rawData.Vicon.Force.NO=csvread(filename1,5,0);
filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180202and03\XHS\sub5_out_position.CSV');
Sub5.rawData.Vicon.Position.NO=csvread(filename2,5,0);