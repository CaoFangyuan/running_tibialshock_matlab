%  plot(subject3.normal.force);
% hold on;
% % plot(subject3.normal.accini,'r');

accstart=13610;
accstop=102400;
runacc=subject3.out.acc(accstart:accstop);
forcestart=5799;
forcestop=93180;
runforce=subject3.out.force(forcestart:forcestop);
plot(runforce);
hold on;
plot(runacc,'r');