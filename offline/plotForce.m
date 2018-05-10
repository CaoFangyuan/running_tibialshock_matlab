force_normal=subject5.normal.force(33670:33960)/700;
force_in=subject5.in.force(33900:34170)/700;
force_out=subject5.out.force(34100:34360)/700;
plot(force_normal);
hold on;
plot(force_in);
hold on;
plot(force_out);