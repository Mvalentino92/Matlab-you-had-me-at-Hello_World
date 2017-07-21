%Must've wanted to do something, to solve something. This is why I comment
%my scripts from now on....
function [sol,co] = piarea(x,xend);
m = 4;
xendtry = xend/pi*4;
total = 1;
sum = pi/4;
while sum <= xend;
    coefs(total) = (total*m) + 1;
    sum = coefs(total)*pi/m;
    total = total + 1;
end
for k = 1:length(coefs);
    if xendtry - coefs(k) <= 4;
        newxend = coefs(k);
        break
    end
end
t = pi/4:1e-3:5*pi/4;
sol = (trapz(t,sin(t)) - trapz(t,cos(t)))*(newxend/4 -.25);

