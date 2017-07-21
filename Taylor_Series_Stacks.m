%Obtains a plots a vector of Taylor Series appoximations obtained at
%various points.
%Also calls my Numerical_Tay function in order to do so
clear all;
x = 0:pi/40:2*pi;
y = sin(x).*cos(x);
poly = 0;
j = 1;
k = 1;
while length(poly) < length(x)-2;
    y2 = Numerical_Tay(x,y,x(j),5);
    i = 1;
    h = 1e-2;
    while h <= 1e-2;
        h = abs(y(j)-y2);
        j = j + 1;
        i = i +1;
    end
    poly(k:k+i) = y2(k:k+i);
    k = j;
end
plot(x,y,x(1:length(poly)),poly)
    
