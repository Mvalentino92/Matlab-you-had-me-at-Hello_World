%Comparative error of trapz vs polyfit
clear all
clc
n = 2.^[1:15];
format long
a = 0;
b = 1;
true = 1/3;
order = 2;
for j = 1:length(n);
    dx(j) = (b-a)/n(j);
    x = linspace(a,b,n(j)+1);
    f = x.^2;
    T(j) = trapz(x,f);
    TE(j) = abs(true - T(j));
end
T(15)
C = polyfit(dx,TE,order)
loglog(dx,TE,dx,dx.^order)
title('sin(x), func for error = 0.085*dx^2')
legend('Error from Trapz','Error from polyfit equation')

%disp 'Error = ans*dx^2'
%C(1)

%Equation_For_Error = 'C*dx^2'


