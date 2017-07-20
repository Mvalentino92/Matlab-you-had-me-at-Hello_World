N = 1e+5
count = 0;
total = 0;
for j = 1:N;
    %find the radius or distance with the pythagorean theorum
    total = total + 1;
    x =2*rand(1) -1;       %generating random points between -1 and 1
    y = 2*rand(1) -1;
    py = x^2 + y^2;
    if sqrt(py) <= 1        %using pythagorean theorum to see if points
        count = count + 1;  %lies within circle
    end
end

 Pi = (count / total)*4      %using knowledge of the area of the square housing the circle
                               %to appoximate the area of the circle