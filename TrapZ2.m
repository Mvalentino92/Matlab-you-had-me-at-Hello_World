function integral = tripz2(x,y)
%For improved accuracy, have the first x value be 0. Not neccessary though.
if x(1) == x(1);
    %Get the spacing (has to be equal spacing first. Use lagrange2 first if
    %needed)
    yend_true = trapz(x,y);
    dt = diff(x(1:2));
    integral(1) = yend_true;
    yflip = fliplr(y);
    %In the loop I'm trying to get the like "revearse gradient" of the current two terms so I can
    %add it to the last term of the integral to get the next value. Then I
    %use that value to get the gradient for the next iteration and so on.
    for j = 1:length(x)-1;
        integral(j+1) = integral(j) - ((yflip(j+1)*dt + yflip(j)*dt)/2);
    end
    integral = fliplr(integral);
end
end
