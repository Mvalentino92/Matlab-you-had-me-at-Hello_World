%This script will find the integral of a set of data points.
%It only works for polynomials.
%I'm exploiting the condition that the area under the curve of a polynomial, will always be equal
%to that polynomials intergral evaluated at that point.

%I use the knowledge of that first term (technically last term) to estimate all the additional
%points of the integral. (See the tripz.m script)

%*******Can be used in tandem with the langrange2 function (UPDATE: DOESNT
%WORK WELL. I HAVE A WORKING VERSION IN JULIA), to get more points first.

%Just going to provide that though for now.
clear all

%Getting the secret derivative function were going to integrate.
f = input('Give me a polynomial using x as the variable. Be sure to use . for operations: ','s');
    
f = ['@(x)',f];
f_prime = str2func(f)

%For the end when we see how close the estimated integral is to the actual
%integral, we'll need the actual integral.

answer = 'n';
while answer == 'n';
    F = input('Please input the integral for the function you entered before, same rules: ','s');
    F = ['@(x)',F];
    F = str2func(F)
    answer = input('Is it correct? Just making sure, easy errors [y/n]: ','s');
end

%Now were getting all the points of the derivative that were going to get
%the integral from
x = 0:0.125:10;
y_prime = f_prime(x);
%And getting values of the true integral
y_true = F(x);

%Now were calling the function tripz (Idk I named it after trapz..)
y = tripz2(x,y_prime);

%Now to plot it agains the true integral
plot(x,y_true,x,y);legend('True values','Estimated Values');
title('Integral Estimation')
