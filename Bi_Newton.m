%Newton method
%First uses the bisection method to get within a certain tolerance
%Then uses the newton method to quickly converge on the answer
%If you dont input tol, the default is 1e-5
function root = binewt(f,a,b,tol);
switch nargin
    case 2
        error('You at least need the function, and the two guesses bro. tol is optional')
    case 4
        x(1) = 0.5*(a+b);
        if f(x)*f(a) < 0
            b = x;
        else
            a = x;
        end
        x(2) = 0.5*(a+b);
        if f(x(2))*f(a) < 0;
            b = x(2);
        else
            a = x(2);
        end
        count = 3;
        while abs(x(count-1) - x(count-2)) > tol;
            x(count) = 0.5*(a+b);
            if f(x(count))*f(a) < 0
                b = x(count);
            else
                a = x(count);
            end
            count = count + 1;
        end
        x0 = x(end); 
        delta = 0.000000001;
        der = @(x) ( (f(x+delta) - f(x-delta))./(delta)*2);
            root = x0;
            for j = 1:25;
                root = root - f(root)/der(root);
            end
    otherwise;
        x(1) = 0.5*(a+b);
        if f(x)*f(a) < 0
            b = x;
        else
            a = x;
        end
        x(2) = 0.5*(a+b);
        if f(x(2))*f(a) < 0;
            b = x(2);
        else
            a = x(2);
        end
        count = 3;
        while abs(x(count-1) - x(count-2)) > 1e-5;
            x(count) = 0.5*(a+b);
            if f(x(count))*f(a) < 0
                b = x(count);
            else
                a = x(count);
            end
            count = count + 1;
        end
        x0 = x(end); 
        delta = 0.000000001;
        der = @(x) ( (f(x+delta) - f(x-delta))./(delta)*2);
            root = x0;
            for j = 1:25;
                root = root - f(root)/der(root);
            end
        
end
