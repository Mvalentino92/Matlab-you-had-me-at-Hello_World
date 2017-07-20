%Some power series stuff.
clear all
N = 4;
partial = 0;
syms x;
p = 6
eq = 1/x^p;
format long

for j = 1:N;
    partial = partial + 1/j^p;
end

integral = int(eq);
partial;
Remainder = double(((-1)*subs(integral,x,(N+1)) + (-1)*subs(integral,x,N))/2);
Summation = double(Remainder + partial);
True = zeta(p);


Difference = abs(True - Summation)

other while loop
syms x;
p = 6;
eq = 1/x^p;
format long
counter = 1;
Remainder = 1;
integral = int(eq);
tic
while Remainder > 1e-4;
    Remainder = double(((-1)*subs(integral,x,(counter+1)) + (-1)*subs(integral,x,counter))/2)
    counter = counter + 1;
    
   
end
 toc
Remainder
counter
