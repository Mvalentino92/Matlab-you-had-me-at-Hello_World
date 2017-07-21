%Trying to find the coefficients of sin and cosine functions. 

clear all
x = 0:pi/100:2*pi;
f = 4*cos(5*x) + sin(2*x) + 18*sin(14*x) + 23*cos(4*x) + 7*sin(9*x) + 2*cos(2*x)+ 15*cos(7*x) + 6*sin(13*x);
fp = gradient(f,diff(x(1:2)));
count = 0;
for j = 2:length(x) -1
    if fp(j-1) > 0 && fp(j+1) < 0 && fp(j) >= 0
        count = count + 1;
    end
end
sc = 1;
cc = 1;
k = 0:.1:count;
for j = 1:length(k)
    num = trapz(x,f.*exp(1i*x*k(j)));
    sv = (imag(num))/pi;
    if  sv > 0 && abs(round(sv) - sv) < 1e-12
        SINE(sc) = imag(num)/pi;
        sc = sc + 1;
    if real(num) >= pi && abs(round(real(num)/pi) - real(num)/pi) < 1e-12 
        COS(cc) = real(num)/pi;
        cc = cc +1;
    
    end
    end
   
end
