clc;
clear;
test=c3dserver();
Filter = 0;
%%process:Read data of Vicon(csv) and Xsens(txt)
%% Normal_sw_Normal_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_normal');
Sub8.rawData.Xsens.NORMAL = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_normal_force.CSV');
Sub8.rawData.Vicon.Force.NORMAL=csvread(filename1,5,0);
openc3d(test,1,'E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_normal.c3d');
Sub8.rawData.Vicon.Position.NORMAL= get3dtargets(test,0);
% filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\junkai_normal_position.CSV');
% Sub9.rawData.Vicon.Position.NORMAL=csvread(filename2,5,0);

%% Normal_sw_In_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_in');
Sub8.rawData.Xsens.NI = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_in_force.CSV');
Sub8.rawData.Vicon.Force.NI=csvread(filename1,5,0);
openc3d(test,1,'E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_in.c3d');
Sub8.rawData.Vicon.Position.NI= get3dtargets(test,0);
% filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\junkai_in_position.CSV');
% Sub9.rawData.Vicon.Position.NI=csvread(filename2,5,0);

%% Normal_sw_Out_fpa
filename = ('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_out');
Sub8.rawData.Xsens.NO = readXsensDataC(filename);
filename1=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_out_force.CSV');
Sub8.rawData.Vicon.Force.NO=csvread(filename1,5,0);
openc3d(test,1,'E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\fangyuan_out.c3d');
Sub8.rawData.Vicon.Position.NO= get3dtargets(test,0);
% filename2=('E:\Junkai_Fangyuan\Run_Research\Experiment\20180306_Fangyuan\junkai_out_position.CSV');
% Sub9.rawData.Vicon.Position.NO=csvread(filename2,5,0);