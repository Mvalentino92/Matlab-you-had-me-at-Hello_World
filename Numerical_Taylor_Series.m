%Numerical Taylor series integration of data points.

%Tired of working with data points that you know belong to some crazy
%function you cant identify? Me too! 

%This estimates a taylor series approximation of your function as a point
%of expansion that you specify

%Ok so first of all, you can set the output of your function to save to two
%varibles, thats what [y_tay,coef] right below means.
function [y_tay,coef] = Numerical_Tay(x,y,point,order)

%This function takes your x points, the evaluated y points, your point of
%expansion and the order you wish to go out to.

%What I'm doing here is calculating the spacing of the x values. As they
%have to be even for this to work.
dt = diff(x(1:2));

%Afterwards, the mod function is checking if the spacing (dt) and the point
%of expansion divide nicely into eachother. Leaving a remainder of zero. It
%would lose accuracy if you wanted to expand at 1, and your spacing was
%like .23432432453255325252 or something. However for instance .01, and 1 is perfect.
if rem(point,dt) ~= 0;
    %If this condition isnt satisfied, then it print an error message for
    %you which says the following.
    error('Your point of expansion must be cleanly divisible by your spacing');
else;
    %And the else statement of "If were good and the spacing and point of
    %expansion are fine, then let's do the actual function now"
    
    %So below is the reason it had to divide nicely. The find function
    %finds the index which holds the value of the number you specify.
    %If we had x = [1 3 4 45 76 8] then find(x==45) would give you 4.
    %So if you recall, the taylor series evaluates every derivative at the
    %point of expansion. So I want to know the index in which x holds the
    %point of expansion at. Like if we were expanding at 45 from before, I would want
    %to know its at x(4)
    exp = find(x==point);
    %Heres where stuff starts happening lol.
    %So the first coefficient is simply the function evaluated at the point
    %of expansion (and divided by factorial 0, but it is just one).
    %Easy, just use the index we obtained before, and check y at that index
    coef(1) = y(exp);
    %Okay, so there is quick numerical differention available in matlab.
    %Which is just the line below.
    y_prime = gradient(y)./dt;
    %Now that we have the first derivative, we do the same thing as before.
    %And again, factorial(1) is still just one, so I'm excluding that
    %redundant division.
    coef(2) = y_prime(exp);
    %Okay now is the real work. We want to go out from 2 (since we just
    %computed the first coef of an x term), to the order that was specified.
    for j = 2:order;
        %So each new y_prime (y', y'', y''' etc) is going to be obtained
        %the exact same way was before.
        y_prime = gradient(y_prime)./dt;
        %And each new coefficient will be obtained the same way as well.
        %Except now, the division by the factorial actually matters
        %because were starting at factorial(2)
        coef(j+1) = y_prime(exp)/factorial(j);
    end
    %And that is it. Except, we just need to flip the order of the variable
    %coef, which is a list of the coefficients. 
    %If we had the vector [1 3 6 7]
    %Matlab see's that as x^3 + 3x^2 + 6x + 7
    %So right now in our list of coefficients we have the number which is
    %really the constant (like the 7), in the first spot. That's not right,
    %and the opposite of what we want so..... "flip"lr function. self
    %explanatory
    coef = fliplr(coef);
    %Now we can evaulate this new polynomial we have using the polyval
    %function. It takes the polynomial (in the form of a vector called
    %coef), and the x coordinates we have. But remember from class, if were
    %not evaulating at 0, we have to have x MINUS our point of expansion.
    %Hence the code below. 
    y_tay = polyval(coef,(x-point));
end
end
    %And that's it lol.