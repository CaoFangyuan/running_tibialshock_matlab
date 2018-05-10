clear all;
%% Set up the figure 
figureHandle = figure('NumberTitle','off',...
    'Name','Ground Reaction Force',...
    'units','normalized','outerposition',[0 0 1 1],'Color',[0 0 0],'Visible','off');
set(figureHandle, 'menubar', 'none');
set(figureHandle,'name','','numbertitle','off');

% Set axes
axesHandle = axes('Parent',figureHandle,...
    'YGrid','on',...
    'YColor',[0.9725 0.9725 0.9725],...
    'XGrid','on',...
    'XColor',[0.9725 0.9725 0.9725],...
    'Color',[0 0 0]);

hold on;

howManyFrames = 200;

time = 1 : 1 : howManyFrames;

GRFs = zeros(1, howManyFrames);

count = 0;

plotHandle = plot(axesHandle,time,GRFs,'Marker','.','LineWidth',1,'Color',[0 1 0]);

% xlim(axesHandle,[min(time) max(time+0.001)]);

% Create xlabel
xlabel('Time','FontWeight','bold','FontSize',14,'Color',[1 1 0]);

% Create ylabel
ylabel('Ground Reaction Force (BW)','FontWeight','bold','FontSize',14,'Color',[1 1 0]);

% Create title
title('Real Time Ground Reaction Force','FontSize',15,'Color',[1 1 0]);

whichLeg = 'RT';
BaselineValue = 5;
PercentChange = 10;
Limit = 1;

TargetValue = BaselineValue * (1 + PercentChange/100);
fontSize = 38;

x1 = [1, howManyFrames, howManyFrames, 1, 1];
y1 = [TargetValue - Limit, TargetValue - Limit, TargetValue + Limit, TargetValue + Limit, TargetValue - Limit];
fill(x1,y1,[0.94, 1, 1],'LineStyle','none','LineWidth',3, 'facealpha', 0.7);
plot([1 howManyFrames], [TargetValue TargetValue],':r', 'LineWidth',3);
text(-10, TargetValue,'\fontsize{18}Target','horiz','center','vert','middle', 'Color', [1 1 0]);


set(gca,'Ytick',[-3:1:17],'YLim',[-3 17]);
set(gca, 'XLim',[1 howManyFrames]);
y=ylabel('\bfGround Reaction Force (BW)');
h_ylabel = get(gca,'YLabel');
set(h_ylabel,'FontSize',fontSize-20);
%set(y, 'Units', 'Normalized', 'Position', [-0.01, 0.5, 0]);
box off;
grid off;

set(figureHandle,'Visible','on');

while (ishandle(figureHandle))
    if count < howManyFrames
        count = count +1;
        GRFs(count) = round( ( 11-12*rand(1,1) ) );
    else
        GRFs(1 : end - 1) = GRFs(end - howManyFrames + 2 : end);
        GRFs(end) = round( ( 11-12*rand(1,1) ) );
    end
    %updataVisualGRFFeedback(figureHandle, plotHandle, whichLeg, time, GRFs, howManyFrames, BaselineValue, PercentChange, Limit);
    updataVisualGRFFeedbackFaster(figureHandle, plotHandle, time, GRFs);
end