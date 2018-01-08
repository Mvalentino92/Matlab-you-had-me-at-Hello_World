clear all
clc
%First I'm setting how many disks I want to slice the object into
N = 100000;
%Then I'm generating the all the x coordinates beteen the boundaries
x = linspace(0,1,N);
%Now I'm generating all the y coordinates off of the equation I'm using.
y = x.^2;

%I've broken down the rest into two variations of the same thing. One to
%calculate vertical rotation (the first), and the second to calculate
%horizontal rotation.

%So I'm calculating the volume of each individual slice, and saving it in
%an array called disk. Pi is just pi, the radius is going to x(j) squared,
%and the height is going to bounded by y(j), and the next y directly
%"above".



for j = 1:(length(x) - 1);
    diskY(j) = pi*(x(j)^2)*(y(j+1) - y(j));
end

%Then i just add up all the slices saved in disk, and add the final slice.
%Since if i tried to add it in the loop, the matrix would exceed the dimensions or
%whatever it always says.

VolY = sum(diskY) + pi*(x(end)^2)*(y(end) - y(end -1))

%Here's the inverse if you rotated around the x axis instead.

for j = 1:(length(y) - 1);
    diskX(j) = pi*(y(j)^2)*(x(j+1) - x(j));
end

VolX = sum(diskX) + pi*(y(end)^2)*(x(end) - x(end-1))

