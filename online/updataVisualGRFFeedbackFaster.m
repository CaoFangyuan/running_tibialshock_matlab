function updataVisualGRFFeedbackFaster(figureHandle, plotHandle, time, GRFs)

set(0, 'currentfigure', figureHandle);
hold on;
set(plotHandle,'YData',GRFs,'XData',time);

set(get(handle(gcf),'JavaFrame'),'Maximized',1);

clear;

drawnow

