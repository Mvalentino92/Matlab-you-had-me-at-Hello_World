clear all
clc
syms x;
%a1 = diff(sin(x^2))
%b1 = diff(exp(x^2+7))
%c1 = diff(sqrt(x^2+3))
%d1 = diff(log(x^4+1))
%e1 = diff(exp(sin(x)))

%a2 = int(a1);

%Plot the numerical derivative
format long
a = 0;
b = sqrt(pi);
x = linspace(a,b,1001);
F = my_func(x);
h = .05;

F_prime = (my_func(x+h) - my_func(x-h))/(2*h);
f_true = 2.*x.*cos(x.^2);
F_Err = abs(F_prime - f_true);

Max_Err = max(F_Err)
T = trapz(x,F_prime)
I_Analytical = my_func(b) - my_func(a)
N_Vs_A_Error = abs(T - I_Analytical)

subplot(2,1,1) ; plot(x,F_prime,x,f_true);
title(['sin(x^2)' 10 'Numerical Derivative of F(x) vs f(x)']); legend('N.Deriv of F(x)','f(x)')
subplot(2,1,2) ; plot(x,F_Err);
title('Error between N.Deriv of F(x) and f(x)');
legend(['Max Error = ' num2str(Max_Err) 10 'Error Num-An = ' num2str(N_Vs_A_Error)]);

