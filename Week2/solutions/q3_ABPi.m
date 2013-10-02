%-------

%Matlab Question 3, Pi/4
%Shaun Smith, 2012

%-------

tic

a = [1:1000];
b = [1:1000];

A = a' * (b.^-1);

%Difference between A/B and Pi/4
B = abs(A - (pi/4));

%Minimum Value in Entire Matrix
%Variable overwrite doesn't matter
[a,b] = find(B==min(min(B)))

toc