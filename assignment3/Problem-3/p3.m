clear;clc;
N = 10000000;
r = 4;

theta = 2*pi*rand(N,1);
data = r*[cos(theta),sin(theta)];

mu = mean(data);
v=(data-[ mu(1)*ones(size(data,1),1), mu(2)*ones(size(data,1),1)]);
C = (v' * v)/N;

disp('Taking r=4');
disp('Experimental Mean = ');
disp(mu);
disp('Covariance Matrix =');
disp(C);
