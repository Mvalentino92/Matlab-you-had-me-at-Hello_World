%[Binomial vector, vector of values for graph]
%Gives the equation of the tangent line in vector form (Binomial)

function [eq_tan,graph] = taneq(x,y,point);
t = find(x==point);
slope = (((y(t+1) - y(t))/(x(t+1)-x(t))) + ((y(t) - y(t-1))/(x(t) - x(t-1))))/2;
eq_tan = [slope,(slope*-x(t))+y(t)];
graph = polyval(eq_tan,x);
end