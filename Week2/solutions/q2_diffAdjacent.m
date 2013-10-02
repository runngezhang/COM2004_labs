%-------

%Matlab Question 2, Adjacency
%Shaun Smith, 2012

%-------

tic

r = rand(1,1000000);

d = abs(diff(r));

min(d)
max(d)


toc