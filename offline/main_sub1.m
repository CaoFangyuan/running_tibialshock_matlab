function sub=main_sub1(SubNumber)
SubName = ['sub' num2str(SubNumber) '.mat'];
load(SubName);
eval(['Sub=Sub' num2str(SubNumber)]);
load('offset0202.mat')
FORCE_SAMPLE=1000;
ACC_SAMPLE=1000;
FORCE_FILTER=50;
ACC_FILTER=75;
MARKER_SAMPLE=100;
MARKER_FILTER=8;
FORCE_THRESHOLD=20;
ORDER=4;
weight=600;
%% filter NORMAL force and cop with 4order, 50HZ Butterworth, lowpass filter
sub.normal.force(:,1)=-Sub.rawData.Vicon.Force.NORMAL(:,14);
[b,a] = butter(ORDER,FORCE_FILTER/(FORCE_SAMPLE/2));
sub.normal.force = filter(b,a,sub.normal.force);
sub.normal.cop=Sub.rawData.Vicon.Force.NORMAL(:,6:8);
sub.normal.cop = filter(b,a,sub.normal.cop);
sub.normal.leftcop=Sub.rawData.Vicon.Force.NORMAL(:,3:5);
sub.normal.leftcop = filter(b,a,sub.normal.leftcop);
%% filter NORMAL acc with 4order, 75HZ Butterworth, lowpass filter
sub.normal.accini(:,1)=-Sub.rawData.Xsens.NORMAL.Acc_X(:,1);
[b1,a1] = butter(4,ACC_FILTER/(ACC_SAMPLE/2));
sub.normal.accini = filter(b1,a1,sub.normal.accini);
%calulate PPA(g) of NN trial
L_nnacc=length(sub.normal.accini);
for i=1:L_nnacc
    sub.normal.acc(i,1) = (sub.normal.accini(i,1))/9.8;
end

%% filter NORMAL marker with 4order, 8HZ Butterworth, lowpass filter
sub.normal.c7=Sub.rawData.Vicon.Position.NORMAL(:,3:5);
sub.normal.lpsi=Sub.rawData.Vicon.Position.NORMAL(:,21:23);
sub.normal.rpsi=Sub.rawData.Vicon.Position.NORMAL(:,18:20);
sub.normal.right_cal=Sub.rawData.Vicon.Position.NORMAL(:,69:71);
sub.normal.right_toe=Sub.rawData.Vicon.Position.NORMAL(:,72:74);
sub.normal.right_toec=Sub.rawData.Vicon.Position.NORMAL(:,75:77);
[b2,a2] = butter(4,MARKER_FILTER/(MARKER_SAMPLE/2));
sub.normal.c7=filter(b2,a2,sub.normal.c7);
sub.normal.lpsi=filter(b2,a2,sub.normal.lpsi);
sub.normal.rpsi=filter(b2,a2,sub.normal.rpsi);
sub.normal.right_cal=filter(b2,a2,sub.normal.right_cal);
sub.normal.right_toe=filter(b2,a2,sub.normal.right_toe);
sub.normal.right_toec=filter(b2,a2,sub.normal.right_toec);

%% filter TOE IN force and cop with 4order, 50HZ Butterworth, lowpass filter
sub.in.force(:,1)=-Sub.rawData.Vicon.Force.NI(:,14);
[b,a] = butter(4,FORCE_FILTER/(FORCE_SAMPLE/2));
sub.in.force = filter(b,a,sub.in.force);
sub.in.cop=Sub.rawData.Vicon.Force.NI(:,6:8);
sub.in.cop = filter(b,a,sub.in.cop);
sub.in.leftcop=Sub.rawData.Vicon.Force.NI(:,3:5);
sub.in.leftcop = filter(b,a,sub.in.leftcop);
%% filter IN acc with 4order, 75HZ Butterworth, lowpass filter
sub.in.accini=-Sub.rawData.Xsens.NI.Acc_X(:,1);
[b1,a1] = butter(4,ACC_FILTER/(ACC_SAMPLE/2));
sub.in.accini = filter(b1,a1,sub.in.accini);
%calulate PPA(g) of NN trial
L_niacc=length(sub.in.accini);
for i=1:L_niacc
    sub.in.acc(i,1) = (sub.in.accini(i,1))/9.8;
end

%% filter IN marker with 4order, 8HZ Butterworth, lowpass filter
sub.in.c7=Sub.rawData.Vicon.Position.NI(:,3:5);
sub.in.lpsi=Sub.rawData.Vicon.Position.NI(:,21:23);
sub.in.rpsi=Sub.rawData.Vicon.Position.NI(:,18:20);
sub.in.right_cal=Sub.rawData.Vicon.Position.NI(:,69:71);
sub.in.right_toe=Sub.rawData.Vicon.Position.NI(:,72:74);
sub.in.right_toec=Sub.rawData.Vicon.Position.NI(:,75:77);
[b2,a2] = butter(4,MARKER_FILTER/(MARKER_SAMPLE/2));
sub.in.c7=filter(b2,a2,sub.in.c7);
sub.in.lpsi=filter(b2,a2,sub.in.lpsi);
sub.in.rpsi=filter(b2,a2,sub.in.rpsi);
sub.in.right_cal=filter(b2,a2,sub.in.right_cal);
sub.in.right_toe=filter(b2,a2,sub.in.right_toe);
sub.in.right_toec=filter(b2,a2,sub.in.right_toec);

%% filter OUT force and cop with 4order, 50HZ Butterworth, lowpass filter
sub.out.force(:,1)=-Sub.rawData.Vicon.Force.NO(:,14);
[b,a] = butter(4,FORCE_FILTER/(FORCE_SAMPLE/2));
sub.out.force = filter(b,a,sub.out.force);
sub.out.cop=Sub.rawData.Vicon.Force.NO(:,6:8);
sub.out.cop = filter(b,a,sub.out.cop);
sub.out.leftcop=Sub.rawData.Vicon.Force.NO(:,3:5);
sub.out.leftcop = filter(b,a,sub.out.leftcop);
%% filter OUT acc with 4order, 75HZ Butterworth, lowpass filter
sub.out.accini=-Sub.rawData.Xsens.NO.Acc_X(:,1);
[b1,a1] = butter(4,ACC_FILTER/(ACC_SAMPLE/2));
sub.out.accini = filter(b1,a1,sub.out.accini);
%calulate PPA(g) of NN trial
L_noacc=length(sub.out.accini);
for i=1:L_noacc
    sub.out.acc(i,1) = (sub.out.accini(i,1))/9.8;
end

%% filter OUT marker with 4order, 8HZ Butterworth, lowpass filter
sub.out.c7=Sub.rawData.Vicon.Position.NO(:,3:5);
sub.out.lpsi=Sub.rawData.Vicon.Position.NO(:,21:23);
sub.out.rpsi=Sub.rawData.Vicon.Position.NO(:,18:20);
sub.out.right_cal=Sub.rawData.Vicon.Position.NO(:,69:71);
sub.out.right_toe=Sub.rawData.Vicon.Position.NO(:,72:74);
sub.out.right_toec=Sub.rawData.Vicon.Position.NO(:,75:77);
[b2,a2] = butter(4,MARKER_FILTER/(MARKER_SAMPLE/2));
sub.out.c7=filter(b2,a2,sub.out.c7);
sub.out.lpsi=filter(b2,a2,sub.out.lpsi);
sub.out.rpsi=filter(b2,a2,sub.out.rpsi);
sub.out.right_cal=filter(b2,a2,sub.out.right_cal);
sub.out.right_toe=filter(b2,a2,sub.out.right_toe);
sub.out.right_toec=filter(b2,a2,sub.out.right_toec);

%% calculate mean force and cop
sub.normal.meanforce=meanForcePlate(sub.normal.force);
sub.in.meanforce=meanForcePlate(sub.in.force);
sub.out.meanforce=meanForcePlate(sub.out.force);
sub.normal.cop=sub.normal.cop-offset.plate2.mean;
sub.in.cop=sub.in.cop-offset.plate2.mean;
sub.out.cop=sub.out.cop-offset.plate2.mean;
sub.normal.leftcop=sub.normal.leftcop-[-29.08,-28.28,-30.56];
sub.in.leftcop=sub.in.leftcop-[-29.08,-28.28,-30.56];
sub.out.leftcop=sub.out.leftcop-[-29.08,-28.28,-30.56];

sub.normal.meancop=meanCop(sub.normal.cop);
sub.in.meancop=meanCop(sub.in.cop);
sub.out.meancop=meanCop(sub.out.cop);
sub.normal.leftmeancop=meanCop(sub.normal.leftcop);
sub.in.leftmeancop=meanCop(sub.in.leftcop);
sub.out.leftmeancop=meanCop(sub.out.leftcop);
%% calculate NORMAL gait parameters
% calculate frame FPA for NN
len=length(sub.normal.right_cal);
for i=1:len
    sub.normal.frameFPA(i,1)=Calculate_Frame_FPA(sub.normal.right_toe(i,:),sub.normal.right_cal(i,:));
end
%calculate frame SW for NN
for i=1:length(sub.normal.cop)
    sub.normal.frameSW(i,1)=Calculate_Frame_SW(sub.normal.leftcop(i,:),sub.normal.cop(i,:));
end
%calculate  frame Trunk for NN
for i=1:length(sub.normal.c7)
    sub.normal.frameTS(i,1)=Calculate_Frame_TS(sub.normal.c7(i,:),sub.normal.lpsi(i,:),sub.normal.rpsi(i,:));
end
%calculate  frame height for NN
for i=1:length(sub.normal.c7)
    sub.normal.frameHeight(i,1)=Calculate_Frame_Height(sub.normal.lpsi(i,:),sub.normal.rpsi(i,:));
end
%calculate  frame foot height for NN
for i=1:length(sub.normal.c7)
    sub.normal.frameFootHeight(i,1)=Calculate_Frame_Height(sub.normal.right_toe(i,:),sub.normal.right_cal(i,:));
end
sub.normal.stepnumber=0;
sub.normal.runstart=658;
sub.normal.runstop=8985;
sub.normal.accstart=12840;
sub.normal.accstop=97290;
sub.normal.runacc=sub.normal.acc(sub.normal.accstart:sub.normal.accstop);
sub.normal.forcestart=5982;
% sub.normal.forcestop=94420;
sub.normal.forcestop=89870;
sub.normal.runforce=sub.normal.force(sub.normal.forcestart:sub.normal.forcestop);
step=0;
for i=1:length(sub.normal.runforce)-1
    if (sub.normal.runforce(i)>=FORCE_THRESHOLD && sub.normal.runforce(i+1)<=FORCE_THRESHOLD)
        step=step+1;
        sub.normal.toeoff_start(step,1)=i;
    end
end
for i=1:length(sub.normal.toeoff_start)-1
    sub.normal.maxacc(i,1)=max(sub.normal.runacc(sub.normal.toeoff_start(i):sub.normal.toeoff_start(i+1)));
end
for i=sub.normal.runstart:sub.normal.runstop
    if (sub.normal.meanforce(i)<=FORCE_THRESHOLD && sub.normal.meanforce(i+1)>=FORCE_THRESHOLD)
        sub.normal.stepnumber=sub.normal.stepnumber+1;
        sub.normal.StepStart( sub.normal.stepnumber,1)=i+1;
        sub.normal.StrikeIndex(sub.normal.stepnumber,1)=StrikeIndex(sub.normal.meancop(i+1,:),sub.normal.right_cal(i+1,:),sub.normal.right_toec(i+1,:));
    end
    
    if sub.normal.stepnumber>0
        if (sub.normal.meanforce(i)>=FORCE_THRESHOLD && sub.normal.meanforce(i+1)<=FORCE_THRESHOLD) && i>sub.normal.StepStart( sub.normal.stepnumber,1)
            sub.normal.StepEnd( sub.normal.stepnumber,1)=i;
            sub.normal.stepFPA(sub.normal.stepnumber,1)=mean(sub.normal.frameFPA(sub.normal.StepStart( sub.normal.stepnumber,1):sub.normal.StepEnd( sub.normal.stepnumber,1)));
            sub.normal.stepTS(sub.normal.stepnumber,1)=mean(sub.normal.frameTS(sub.normal.StepStart( sub.normal.stepnumber,1):sub.normal.StepEnd( sub.normal.stepnumber,1)));
          if sub.normal.stepnumber>=2
               
                sub.normal.stepHeight(sub.normal.stepnumber,1)=max(sub.normal.frameHeight(sub.normal.StepEnd(sub.normal.stepnumber-1,1):sub.normal.StepStart( sub.normal.stepnumber,1)));
                sub.normal.stepFootHeight(sub.normal.stepnumber,1)=max(sub.normal.frameFootHeight(sub.normal.StepEnd(sub.normal.stepnumber-1,1):sub.normal.StepStart( sub.normal.stepnumber,1)));
            end
            for j=10* sub.normal.StepStart( sub.normal.stepnumber,1):10* (sub.normal.StepStart( sub.normal.stepnumber,1)+8)
                sub.normal.swpeaktime(sub.normal.stepnumber,1)=round(10*(sub.normal.StepStart( sub.normal.stepnumber,1)+0.5*( sub.normal.StepEnd( sub.normal.stepnumber,1)-sub.normal.StepStart( sub.normal.stepnumber,1))));
                sub.normal.stepSW(sub.normal.stepnumber,1)=sub.normal.frameSW(sub.normal.swpeaktime(sub.normal.stepnumber,1));
                if (sub.normal.force(j+1)<sub.normal.force(j) && sub.normal.force(j+2)<sub.normal.force(j+1) && sub.normal.force(j-1)<sub.normal.force(j))
                    sub.normal.peaktime(sub.normal.stepnumber,1)=j;
                    sub.normal.peak(sub.normal.stepnumber,1)=sub.normal.force(j);
                    total=sub.normal.peaktime(sub.normal.stepnumber,1)-10* sub.normal.StepStart( sub.normal.stepnumber,1);
                    sub.normal.VALR(sub.normal.stepnumber,1)=(sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.8*total))-sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total)))/(round(10* sub.normal.StepStart(sub.normal.stepnumber,1)+0.8*total)-round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total));
                    force_linear=sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total):round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.8*total));
                    sub.normal.slope=movingslope(force_linear);
                    sub.normal.VILR(sub.normal.stepnumber,1)=max(sub.normal.slope);
                    break;
                else
                    sub.normal.peaktime(sub.normal.stepnumber,1)=round(10*(sub.normal.StepStart( sub.normal.stepnumber,1)+0.13*( sub.normal.StepEnd( sub.normal.stepnumber,1)-sub.normal.StepStart( sub.normal.stepnumber,1))));
                    sub.normal.peak(sub.normal.stepnumber,1)=sub.normal.force(sub.normal.peaktime(sub.normal.stepnumber,1));
                    total=sub.normal.peaktime(sub.normal.stepnumber,1)-10* sub.normal.StepStart( sub.normal.stepnumber,1);
                    sub.normal.VALR(sub.normal.stepnumber,1)=(sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.8*total))-sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total)))/(round(10* sub.normal.StepStart(sub.normal.stepnumber,1)+0.8*total)-round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total));
                    force_linear=sub.normal.force(round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.2*total):round(10* sub.normal.StepStart( sub.normal.stepnumber,1)+0.8*total));
                    sub.normal.slope=movingslope(force_linear);
                    sub.normal.VILR(sub.normal.stepnumber,1)=max(sub.normal.slope);
                end
                
            end
        end  
    end
end
% % calculate frequency
sub.normal.final.stepfrequency=100*sub.normal.stepnumber/(sub.normal.runstop-sub.normal.runstart);

% calculate mean gait parameter
sub.normal.final.MEANFPA=mean(sub.normal.stepFPA);
sub.normal.final.STDFPA=std(sub.normal.stepFPA);
sub.normal.final.MEANTS=mean(sub.normal.stepTS);
sub.normal.final.STDTS=std(sub.normal.stepTS);
sub.normal.peak=sub.normal.peak/weight;
sub.normal.final.MEANpeak=mean(sub.normal.peak);
sub.normal.final.STDpeak=std(sub.normal.peak);
sub.normal.final.MEANstrideindix=mean(sub.normal.StrikeIndex);
sub.normal.final.STDstrideindix=std(sub.normal.StrikeIndex);
sub.normal.final.MEANacc=mean(sub.normal.maxacc);
sub.normal.final.STDacc=std(sub.normal.maxacc);
sub.normal.VALR=1000*sub.normal.VALR/weight;
sub.normal.final.MEANVALR=mean(sub.normal.VALR);
sub.normal.final.STDVALR=std(sub.normal.VALR);
sub.normal.VILR=1000*sub.normal.VILR/weight;
sub.normal.final.MEANVILR=mean(sub.normal.VILR);
sub.normal.final.STDVILR=std(sub.normal.VILR);
sub.normal.final.MEANSW=mean(sub.normal.stepSW);
sub.normal.final.STDSW=std(sub.normal.stepSW);
sub.normal.final.MEANHEIGHT=mean(sub.normal.stepHeight);
sub.normal.final.STDHEIGHT=std(sub.normal.stepHeight);
sub.normal.final.MEANFOOTHEIGHT=mean(sub.normal.stepFootHeight);
sub.normal.final.STDFOOTHEIGHT=std(sub.normal.stepFootHeight);
%% calculate TOE IN gait parameters
% calculate frame FPA for in
len=length(sub.in.right_cal);
for i=1:len
    sub.in.frameFPA(i,1)=Calculate_Frame_FPA(sub.in.right_toe(i,:),sub.in.right_cal(i,:));
end
%calculate frame SW for NN
for i=1:length(sub.in.cop)
    sub.in.frameSW(i,1)=Calculate_Frame_SW(sub.in.leftcop(i,:),sub.in.cop(i,:));
end
%calculate  frame Trunk for in
for i=1:length(sub.in.c7)
    sub.in.frameTS(i,1)=Calculate_Frame_TS(sub.in.c7(i,:),sub.in.lpsi(i,:),sub.in.rpsi(i,:));
end
%calculate  frame height for NN
for i=1:length(sub.in.c7)
    sub.in.frameHeight(i,1)=Calculate_Frame_Height(sub.in.lpsi(i,:),sub.in.rpsi(i,:));
end
%calculate  frame foot height for NN
for i=1:length(sub.in.c7)
    sub.in.frameFootHeight(i,1)=Calculate_Frame_Height(sub.in.right_toe(i,:),sub.in.right_cal(i,:));
end
sub.in.stepnumber=0;
sub.in.runstart=520;
sub.in.runstop=8977;
sub.in.accstart=9508;
sub.in.accstop=94400;
sub.in.runacc=sub.in.acc(sub.in.accstart:sub.in.accstop);
sub.in.forcestart=5244;
%sub.in.forcestop=97110;
sub.in.forcestop=89890;
sub.in.runforce=sub.in.force(sub.in.forcestart:sub.in.forcestop);
step=0;

for i=1:length(sub.in.runforce)-1
    if (sub.in.runforce(i)>=FORCE_THRESHOLD && sub.in.runforce(i+1)<=FORCE_THRESHOLD)
        step=step+1;
        sub.in.toeoff_start(step,1)=i;
    end
end
for i=1:length(sub.in.toeoff_start)-1
    sub.in.maxacc(i,1)=max(sub.in.runacc(sub.in.toeoff_start(i):sub.in.toeoff_start(i+1)));
end

for i=sub.in.runstart:sub.in.runstop
    if (sub.in.meanforce(i)<=FORCE_THRESHOLD && sub.in.meanforce(i+1)>=FORCE_THRESHOLD)
        sub.in.stepnumber=sub.in.stepnumber+1;
        sub.in.StepStart( sub.in.stepnumber,1)=i+1;
        sub.in.StrikeIndex(sub.in.stepnumber,1)=StrikeIndex(sub.in.meancop(i+1,:),sub.in.right_cal(i+1,:),sub.in.right_toec(i+1,:));
    end
    
    if sub.in.stepnumber>0
        if (sub.in.meanforce(i)>=FORCE_THRESHOLD && sub.in.meanforce(i+1)<=FORCE_THRESHOLD) && i>sub.in.StepStart( sub.in.stepnumber,1)
            sub.in.StepEnd( sub.in.stepnumber,1)=i;
            sub.in.stepFPA(sub.in.stepnumber,1)=mean(sub.in.frameFPA(sub.in.StepStart( sub.in.stepnumber,1):sub.in.StepEnd( sub.in.stepnumber,1)));
            sub.in.stepTS(sub.in.stepnumber,1)=mean(sub.in.frameTS(sub.in.StepStart( sub.in.stepnumber,1):sub.in.StepEnd( sub.in.stepnumber,1)));
          if sub.in.stepnumber>=2
               
                sub.in.stepHeight(sub.in.stepnumber,1)=max(sub.in.frameHeight(sub.in.StepEnd(sub.in.stepnumber-1,1):sub.in.StepStart( sub.in.stepnumber,1)));
                sub.in.stepFootHeight(sub.in.stepnumber,1)=max(sub.in.frameFootHeight(sub.in.StepEnd(sub.in.stepnumber-1,1):sub.in.StepStart( sub.in.stepnumber,1)));
            end
            for j=10* sub.in.StepStart( sub.in.stepnumber,1):10* (sub.in.StepStart( sub.in.stepnumber,1)+8)
                  sub.in.swpeaktime(sub.in.stepnumber,1)=round(10*(sub.in.StepStart( sub.in.stepnumber,1)+0.5*( sub.in.StepEnd( sub.in.stepnumber,1)-sub.in.StepStart( sub.in.stepnumber,1))));
                sub.in.stepSW(sub.in.stepnumber,1)=sub.in.frameSW(sub.in.swpeaktime(sub.in.stepnumber,1));
                if (sub.in.force(j+1)<sub.in.force(j) && sub.in.force(j+2)<sub.in.force(j+1) && sub.in.force(j-1)<sub.in.force(j))
                    sub.in.peaktime(sub.in.stepnumber,1)=j;
                    sub.in.peak(sub.in.stepnumber,1)=sub.in.force(j);
                    total=sub.in.peaktime(sub.in.stepnumber,1)-10* sub.in.StepStart( sub.in.stepnumber,1);
                    sub.in.VALR(sub.in.stepnumber,1)=(sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.8*total))-sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total)))/(round(10* sub.in.StepStart(sub.in.stepnumber,1)+0.8*total)-round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total));
                    force_linear=sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total):round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.8*total));
                    sub.in.slope=movingslope(force_linear);
                    sub.in.VILR(sub.in.stepnumber,1)=max(sub.in.slope);
                    break;
                else
                    sub.in.peaktime(sub.in.stepnumber,1)=round(10*(sub.in.StepStart( sub.in.stepnumber,1)+0.13*( sub.in.StepEnd( sub.in.stepnumber,1)-sub.in.StepStart( sub.in.stepnumber,1))));
                    sub.in.peak(sub.in.stepnumber,1)=sub.in.force(sub.in.peaktime(sub.in.stepnumber,1));
                    total=sub.in.peaktime(sub.in.stepnumber,1)-10* sub.in.StepStart( sub.in.stepnumber,1);
                    sub.in.VALR(sub.in.stepnumber,1)=(sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.8*total))-sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total)))/(round(10* sub.in.StepStart(sub.in.stepnumber,1)+0.8*total)-round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total));
                    force_linear=sub.in.force(round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.2*total):round(10* sub.in.StepStart( sub.in.stepnumber,1)+0.8*total));
                    sub.in.slope=movingslope(force_linear);
                    sub.in.VILR(sub.in.stepnumber,1)=max(sub.in.slope);
                end
                
            end
        end  
    end
end
% % calculate frequency
sub.in.final.stepfrequency=100*sub.in.stepnumber/(sub.in.runstop-sub.in.runstart);
% calculate mean gait parameter
sub.in.final.MEANFPA=mean(sub.in.stepFPA);
sub.in.final.STDFPA=std(sub.in.stepFPA);
sub.in.final.MEANTS=mean(sub.in.stepTS);
sub.in.final.STDTS=std(sub.in.stepTS);
sub.in.peak=sub.in.peak/weight;
sub.in.final.MEANpeak=mean(sub.in.peak);
sub.in.final.MEANpeak=mean(sub.in.peak);
sub.in.final.STDpeak=std(sub.in.peak);
sub.in.final.MEANstrideindix=mean(sub.in.StrikeIndex);
sub.in.final.STDstrideindix=std(sub.in.StrikeIndex);
sub.in.final.MEANacc=mean(sub.in.maxacc);
sub.in.final.STDacc=std(sub.in.maxacc);
sub.in.VALR=1000*sub.in.VALR/weight;
sub.in.final.MEANVALR=mean(sub.in.VALR);
sub.in.final.STDVALR=std(sub.in.VALR);
sub.in.VILR=1000*sub.in.VILR/weight;
sub.in.final.MEANVILR=mean(sub.in.VILR);
sub.in.final.STDVILR=std(sub.in.VILR);
sub.in.final.MEANSW=mean(sub.in.stepSW);
sub.in.final.STDSW=std(sub.in.stepSW);
sub.in.final.MEANHEIGHT=mean(sub.in.stepHeight);
sub.in.final.STDHEIGHT=std(sub.in.stepHeight);
sub.in.final.MEANFOOTHEIGHT=mean(sub.in.stepFootHeight);
sub.in.final.STDFOOTHEIGHT=std(sub.in.stepFootHeight);
%% calculate TOE OUT gait parameters
% calculate frame FPA for out
len=length(sub.out.right_cal);
for i=1:len
    sub.out.frameFPA(i,1)=Calculate_Frame_FPA(sub.out.right_toe(i,:),sub.out.right_cal(i,:));
end
%calculate frame SW for NN
for i=1:length(sub.out.cop)
    sub.out.frameSW(i,1)=Calculate_Frame_SW(sub.out.leftcop(i,:),sub.out.cop(i,:));
end
%calculate  frame Trunk for out
for i=1:length(sub.out.c7)
    sub.out.frameTS(i,1)=Calculate_Frame_TS(sub.out.c7(i,:),sub.out.lpsi(i,:),sub.out.rpsi(i,:));
end
%calculate  frame height for NN
for i=1:length(sub.out.c7)
    sub.out.frameHeight(i,1)=Calculate_Frame_Height(sub.out.lpsi(i,:),sub.out.rpsi(i,:));
end
%calculate  frame foot height for NN
for i=1:length(sub.out.c7)
    sub.out.frameFootHeight(i,1)=Calculate_Frame_Height(sub.out.right_toe(i,:),sub.out.right_cal(i,:));
end
sub.out.stepnumber=0;
sub.out.runstart=522;
sub.out.runstop=9199;
sub.out.accstart=9471;
sub.out.accstop=97560;
sub.out.runacc=sub.out.acc(sub.out.accstart:sub.out.accstop);
sub.out.forcestart=4955;
%sub.out.forcestop=93180;
sub.out.forcestop=92170;
sub.out.runforce=sub.out.force(sub.out.forcestart:sub.out.forcestop);
step=0;

for i=1:length(sub.out.runforce)-1
    if (sub.out.runforce(i)>=FORCE_THRESHOLD && sub.out.runforce(i+1)<=FORCE_THRESHOLD)
        step=step+1;
        sub.out.toeoff_start(step,1)=i;
    end
end
for i=1:length(sub.out.toeoff_start)-1
    sub.out.maxacc(i,1)=max(sub.out.runacc(sub.out.toeoff_start(i):sub.out.toeoff_start(i+1)));
end

for i=sub.out.runstart:sub.out.runstop
    if (sub.out.meanforce(i)<=FORCE_THRESHOLD && sub.out.meanforce(i+1)>=FORCE_THRESHOLD)
        sub.out.stepnumber=sub.out.stepnumber+1;
        sub.out.StepStart( sub.out.stepnumber,1)=i+1;
        sub.out.StrikeIndex(sub.out.stepnumber,1)=StrikeIndex(sub.out.meancop(i+1,:),sub.out.right_cal(i+1,:),sub.out.right_toec(i+1,:));
    end
    
    if sub.out.stepnumber>0
        if (sub.out.meanforce(i)>=FORCE_THRESHOLD && sub.out.meanforce(i+1)<=FORCE_THRESHOLD) && i>sub.out.StepStart( sub.out.stepnumber,1)
            sub.out.StepEnd( sub.out.stepnumber,1)=i;
            sub.out.stepFPA(sub.out.stepnumber,1)=mean(sub.out.frameFPA(sub.out.StepStart( sub.out.stepnumber,1):sub.out.StepEnd( sub.out.stepnumber,1)));
            sub.out.stepTS(sub.out.stepnumber,1)=mean(sub.out.frameTS(sub.out.StepStart( sub.out.stepnumber,1):sub.out.StepEnd( sub.out.stepnumber,1)));
         if sub.out.stepnumber>=2
               
                sub.out.stepHeight(sub.out.stepnumber,1)=max(sub.out.frameHeight(sub.out.StepEnd(sub.out.stepnumber-1,1):sub.out.StepStart( sub.out.stepnumber,1)));
                sub.out.stepFootHeight(sub.out.stepnumber,1)=max(sub.out.frameFootHeight(sub.out.StepEnd(sub.out.stepnumber-1,1):sub.out.StepStart( sub.out.stepnumber,1)));
            end
            for j=10* sub.out.StepStart( sub.out.stepnumber,1):10* (sub.out.StepStart( sub.out.stepnumber,1)+8)
                   sub.out.swpeaktime(sub.out.stepnumber,1)=round(10*(sub.out.StepStart( sub.out.stepnumber,1)+0.5*( sub.out.StepEnd( sub.out.stepnumber,1)-sub.out.StepStart( sub.out.stepnumber,1))));
                sub.out.stepSW(sub.out.stepnumber,1)=sub.out.frameSW(sub.out.swpeaktime(sub.out.stepnumber,1));
                if (sub.out.force(j+1)<sub.out.force(j) && sub.out.force(j+2)<sub.out.force(j+1) && sub.out.force(j-1)<sub.out.force(j))
                    sub.out.peaktime(sub.out.stepnumber,1)=j;
                    sub.out.peak(sub.out.stepnumber,1)=sub.out.force(j);
                    total=sub.out.peaktime(sub.out.stepnumber,1)-10* sub.out.StepStart( sub.out.stepnumber,1);
                    sub.out.VALR(sub.out.stepnumber,1)=(sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.8*total))-sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total)))/(round(10* sub.out.StepStart(sub.out.stepnumber,1)+0.8*total)-round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total));
                    force_linear=sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total):round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.8*total));
                    sub.out.slope=movingslope(force_linear);
                    sub.out.VILR(sub.out.stepnumber,1)=max(sub.out.slope);
                    break;
                else
                    sub.out.peaktime(sub.out.stepnumber,1)=round(10*(sub.out.StepStart( sub.out.stepnumber,1)+0.13*( sub.out.StepEnd( sub.out.stepnumber,1)-sub.out.StepStart( sub.out.stepnumber,1))));
                    sub.out.peak(sub.out.stepnumber,1)=sub.out.force(sub.out.peaktime(sub.out.stepnumber,1));
                    total=sub.out.peaktime(sub.out.stepnumber,1)-10* sub.out.StepStart( sub.out.stepnumber,1);
                    sub.out.VALR(sub.out.stepnumber,1)=(sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.8*total))-sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total)))/(round(10* sub.out.StepStart(sub.out.stepnumber,1)+0.8*total)-round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total));
                    force_linear=sub.out.force(round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.2*total):round(10* sub.out.StepStart( sub.out.stepnumber,1)+0.8*total));
                    sub.out.slope=movingslope(force_linear);
                    sub.out.VILR(sub.out.stepnumber,1)=max(sub.out.slope);
                end
                
            end
        end  
    end
end
% % calculate frequency
sub.out.final.stepfrequency=100*sub.out.stepnumber/(sub.out.runstop-sub.out.runstart);
% calculate mean gait parameter
sub.out.final.MEANFPA=mean(sub.out.stepFPA);
sub.out.final.STDFPA=std(sub.out.stepFPA);
sub.out.final.MEANTS=mean(sub.out.stepTS);
sub.out.final.STDTS=std(sub.out.stepTS);
sub.out.peak=sub.out.peak/weight;
sub.out.final.MEANpeak=mean(sub.out.peak);
sub.out.final.STDpeak=std(sub.out.peak);
sub.out.final.MEANstrideindix=mean(sub.out.StrikeIndex);
sub.out.final.STDstrideindix=std(sub.out.StrikeIndex);
sub.out.final.MEANacc=mean(sub.out.maxacc);
sub.out.final.STDacc=std(sub.out.maxacc);
sub.out.VALR=1000*sub.out.VALR/weight;
sub.out.final.MEANVALR=mean(sub.out.VALR);
sub.out.final.STDVALR=std(sub.out.VALR);
sub.out.VILR=1000*sub.out.VILR/weight;
sub.out.final.MEANVILR=mean(sub.out.VILR);
sub.out.final.STDVILR=std(sub.out.VILR);
sub.out.final.MEANSW=mean(sub.out.stepSW);
sub.out.final.STDSW=std(sub.out.stepSW);
sub.out.final.MEANHEIGHT=mean(sub.out.stepHeight);
sub.out.final.STDHEIGHT=std(sub.out.stepHeight);
sub.out.final.MEANFOOTHEIGHT=mean(sub.out.stepFootHeight);
sub.out.final.STDFOOTHEIGHT=std(sub.out.stepFootHeight);
%% plot bar
% ForcePeak
sub.forcepeak(1,1)=sub.normal.final.MEANpeak;
sub.forcepeak(2,1)=sub.in.final.MEANpeak;
sub.forcepeak(3,1)=sub.out.final.MEANpeak;
sub.errorpeak(1,1)=sub.normal.final.STDpeak;
sub.errorpeak(2,1)=sub.in.final.STDpeak;
sub.errorpeak(3,1)=sub.out.final.STDpeak;
figure(1);
bar(sub.forcepeak);
hold on;
errorbar(sub.forcepeak,sub.errorpeak,'ok','LineStyle','none','LineWidth',2,'marKerSize',10);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'Baseline','Toe in','Toe out'});
title('ForcePeak');

% Acc
sub.acc(1,1)=sub.normal.final.MEANacc;
sub.acc(2,1)=sub.in.final.MEANacc;
sub.acc(3,1)=sub.out.final.MEANacc;
sub.erroracc(1,1)=sub.normal.final.STDacc;
sub.erroracc(2,1)=sub.in.final.STDacc;
sub.erroracc(3,1)=sub.out.final.STDacc;
figure(2);
bar(sub.acc,1);
hold on;
errorbar(sub.acc,sub.erroracc,'ok','LineStyle','none','LineWidth',2,'marKerSize',10);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'Baseline','Toe in','Toe out'});
title('Acc');

%VALR
sub.VALR(1,1)=sub.normal.final.MEANVALR;
sub.VALR(2,1)=sub.in.final.MEANVALR;
sub.VALR(3,1)=sub.out.final.MEANVALR;
sub.errorVALR(1,1)=sub.normal.final.STDVALR;
sub.errorVALR(2,1)=sub.in.final.STDVALR;
sub.errorVALR(3,1)=sub.out.final.STDVALR;
figure(3);
bar(sub.VALR);
hold on;
errorbar(sub.VALR,sub.errorVALR,'ok','LineStyle','none','LineWidth',2,'marKerSize',10);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'Baseline','Toe in','Toe out'});
title('VALR');

%VILR
sub.VILR(1,1)=sub.normal.final.MEANVILR;
sub.VILR(2,1)=sub.in.final.MEANVILR;
sub.VILR(3,1)=sub.out.final.MEANVILR;
sub.errorVILR(1,1)=sub.normal.final.STDVILR;
sub.errorVILR(2,1)=sub.in.final.STDVILR;
sub.errorVILR(3,1)=sub.out.final.STDVILR;
figure(4);
bar(sub.VILR);
hold on;
errorbar(sub.VILR,sub.errorVILR,'ok','LineStyle','none','LineWidth',2,'marKerSize',10);
set(gca,'XTick',[1 2 3]);
set(gca,'XTickLabel',{'Baseline','Toe in','Toe out'});
title('VILR');
