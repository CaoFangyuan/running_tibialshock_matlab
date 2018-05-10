function Update_Force(force)
%input:
%   Rest_Step(number)
%output:
% 
%function:
% Display the left step number on exploration stage

persistent x;
persistent h0;
persistent h1;

if isempty(x)
    x=0;
    h1=plot(force);
end

switch x
    case 0
        delete(h1);
        h0=plot(force);
        x = 1;
    case 1
        delete(h0);
        h1=plot(force);
        x = 0;
        
end
drawnow;