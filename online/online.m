clear;
clc;
Left_COP_Offset = [0.3416,-9.7751,11.6250];
Right_COP_Offset = [-12.3939,-4.4905,12.7848];
RotMat_ViconToAnatomical = create_RotMat_ViconToAnatomical('6th_Hosptial');
Leg='RIGHT';
%% Read data
path(path,'E:\Program Files\Vicon\DataStream SDK\Win32\MATLAB');
% Load the SDK
Client.LoadViconDataStreamSDK();
% Connect as a client to the Vicon server
MyClient = Client();
MyClient.Connect('localhost:801');
pause(0.1);
if ~MyClient.IsConnected().Connected
    fprint('Connection failed!\n')
    Client.UnloadViconDataStreamSDK();
    return
end
% Enable various data types for the data stream
MyClient.EnableMarkerData();
MyClient.EnableDeviceData();
% Get the Vicon Subjectject's Name
MyClient.GetFrame();
ViconSubjectName = MyClient.GetSubjectName(1).SubjectName;

%%
Right_state = STATE_STANCE;
flag_State_RightLeg_Stance_Entry = NO;
flag_State_RightLeg_Swing_Entry = NO;
ThisStep_FrameNumber=0;
THRESHOLD=50;
step_number=0;
while (true)
    MyClient.GetFrame();
    FrameNum = MyClient.GetFrameNumber().FrameNumber;
    if (FrameNum == Last_FrameNum), pause(0.005); continue; end % Keep trying until a new frame is read in
    Last_FrameNum = FrameNum;
    %
    ThisFrame_Force_Left =  RotMat_ViconToAnatomical*-MyClient.GetGlobalForceVector(2).ForceVector;
    ThisFrame_Force_Right =  RotMat_ViconToAnatomical*-MyClient.GetGlobalForceVector(1).ForceVector;
    %%
    if flag_State_RightLeg_Stance_Entry==YES
     ThisStep_FrameNumber=ThisStep_FrameNumber+1;
     Force(ThisStep_FrameNumber,1)=ThisFrame_Force_Right(3);
     flag_State_RightLeg_Stance_Entry=NO;
    end
    if flag_State_RightLeg_Swing_Entry==YES
        step_number= step_number+1;
        for i=2:9
            if Force(i-1)<Force(i)&&Force(i+1)<Force(i)&&Force(i+2)<Force(i)
                peaktime=i;
                peak=Force(peaktime);
                sub.VALR( step_number,1)=Force(round(1+0.8*peaktime))-Force(round(1+0.2*peaktime))/round(1+0.8*peaktime)-round(1+0.2*peaktime);
            else
                peaktime=round(1+0.13*length(Force));
                 peak=Force(peaktime);
                sub.VALR(step_number,1)=Force(round(1+0.8*peaktime))-Force(round(1+0.2*peaktime))/round(1+0.8*peaktime)-round(1+0.2*peaktime);
            end
        end
        Update_Force(Force);
        Update_Force(sub.VALR(step_number,1));
        
        ThisStep_FrameNumber=0;
        Force=[];
        flag_State_RightLeg_Swing_Entry=NO;
    end
    if Right_state==STATE_SWING
        if ThisFrame_Force_Right(3)>THRESHOLD
            flag_State_RightLeg_Stance_Entry = YES;
            Right_state = STATE_STANCE;
        end
    end
    if Right_state==STATE_STANCE
        if ThisFrame_Force_Right(3)<THRESHOLD
            flag_State_RightLeg_Swing_Entry = YES;
            Right_state = STATE_SWING;
        end
    end
    
    
  
   
end