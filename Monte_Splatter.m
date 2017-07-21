clear all
clc
N =  1000;
count = 0;
total = 0;
for j = 1:N;
    %find the radius or distance with the pythagorean therum
    x = 2*(rand-0.5);
    y = 2*(rand-0.5);
    py = x^2 + y^2;
    if sqrt(py) <= 1
        plot(x,y,'*')
        hold on
        count = count + 1;
    end
end
 format long
 Pie = (count / N)*4
 
 
%More MonteCarlo stuff. Finding the area of irregular splatter
% 
% N = 100000;
% count = 0;

% for j = 1:N
%     x = 3*(rand-0.5);
%     y = 3*(rand-0.5);
%     r = sqrt(x^2 + y^2);
%     theta = atan2(y,x);
%     R = 1 + 0.5*sin(sin(4*theta) + 2*cos(7*theta));
%     if r < R
%         plot(x,y,'s');
%         xlim([-1.5 1.5]);
%         ylim([-1.5 1.5]);
%         hold on
%         %pause(.000000001)
%         count = count + 1;
%         
%     end
%   
%     
%     
% end
% 
% Z = (count/N)*9