function [X,y] = generate_data(N, d, xsep, ysep)

rand('seed',0)
m = fix(N/2);
n = N - m;
X = [2*rand(d,n)+[xsep,ysep]'.*ones(1,n) 2*rand(d,m)];
X = [X; ones(1,N)];
y = [-ones(1,m) ones(1,n)];
