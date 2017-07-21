%The user inputs the two equations they wish to find the intersecting area
%of.

clear all
clc
syms x;

f = input('What is your first equation?: ');
g = input('What is your second equation?: ');

inter = solve(f-g,x);
interPOS = inter(inter>=0);

mid = sum(interPOS)/2;

if subs(f,mid) > subs(g,mid);
    top_eq = f
    bottom_eq = g
else
    top_eq = g
    bottom_eq = f
end

left = double(min(interPOS));
right = double(max(interPOS));

N = 100000;
dx = 1/N;
x = [left:dx:right];

top = input('Type in your top function again, but be sure to use . when necessary: ');
bottom = input('Type in your bottom fuction again, but be sure to use . when necessary: ');

Top = (dx/2)*top(1) + dx*sum(top(2:end-1)) + (dx/2)*top(end);

Bottom = (dx/2)*bottom(1) + dx*sum(bottom(2:end-1)) + (dx/2)*bottom(end);
Solution = Top - Bottom;
plot(x,top,x,bottom); legend(char(top_eq),char(bottom_eq)); title(['Intersecting Area is = ',num2str(Solution)]);