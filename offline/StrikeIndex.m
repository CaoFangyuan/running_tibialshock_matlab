function result = StrikeIndex( cop,cal,toec )
x1 =toec(1);
y1 =toec(2);
x2 = cal(1);
y2 = cal(2);
x3 = cop(1);
y3 = cop(2);

if abs(x1-x2)>0&&abs(y1-y2)>0
yk = ((x3-x2)*(x1-x2)*(y1-y2) + y3*(y1-y2)^2 + y2*(x1-x2)^2) / (norm([x1-x2,y1-y2])^2);
xk = ((x1-x2)*x2*(y1-y2) + (x1-x2)*(x1-x2)*(yk-y2)) / ((x1-x2)*(y1-y2));
end

if x1 == x2
    xk = x1;
end

if y1 == y2
    xk = x3;
end
footlen=sqrt((x1-x2)^2+(y1-y2)^2);
distance=sqrt((xk-x2)^2+(yk-y2)^2);
result=distance/footlen;
% if result<1/3
%     result=0;
% elseif result<2/3&&result >1/3
%         result=1;
% elseif result>2/3
%         result=2;
% end

