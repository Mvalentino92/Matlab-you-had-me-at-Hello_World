%First attempt at the stacked Taylor Series Approximation
clear all;
x = 0:pi/40:2*pi;
y = (cos(x).*sin(x)).^4;
poly = 0;
j = 1;
k = 1;
polys = 0;
where = 1;
while length(poly) < length(x)-2;
    y2 = Numerical_Taylor_Series(x,y,x(j),5);
    i = 1;
    h = 1e-2;
    while h <= 1e-2;
        if j == length(x);
            poly(k:j) = y2(k:j);
            break
        else
            h = abs(y(j)-y2(j));
            j = j + 1;
            i = i +1;
        end
    end
    if length(poly) == length(x);
        break
    else
    poly(k:k+i) = y2(k:k+i);
    k = j;
    polys = polys + 1;
    where(polys) = j;
    end
end
plot(x,y,x(1:length(poly)),poly)