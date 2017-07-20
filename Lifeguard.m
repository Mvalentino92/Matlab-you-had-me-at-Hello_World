%An optimization script which calculates the total distance traveled by
%a lifeguard saving someone out to sea.
%Also provides a nice graphical image of the route taken, and points of
%interest via a triangle


clear all
syms x
tower_dist = 70;
out_to_sea = 40;
run_speed = 7;
swim_speed = 3;
t = (tower_dist - x)/run_speed + (x^2 + out_to_sea^2)^(1/2)/swim_speed;
prime = diff(t);
x = solve(prime == 0,x);
run_time = double((tower_dist - x)/run_speed);
swim_time = double((x^2 + out_to_sea^2)^(1/2)/swim_speed);
run_dist = double(tower_dist - x);
swim_dist = double((x^2 + out_to_sea^2)^(1/2));
total_time = double(run_time + swim_time)
total_dist = double(run_dist + swim_dist)
format short

tri = [0 0 out_to_sea 0 ; 0 tower_dist tower_dist 0];
tri2 = [0 out_to_sea ; (tower_dist-x) tower_dist];
plot(tri(1,:),tri(2,:),tri2(1,:),tri2(2,:),'linewidth', 1)
axis([0 (out_to_sea + 10) ,0 (tower_dist + 10)])

    
    

    
    
