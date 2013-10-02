%-------

%Matlab Question 1, AxB
%Shaun Smith, 2012

%-------


tic

a = [1:1000];
b = [1:1000];

A = mod(a' * b,10);

B=find(A==7);

numel(B)

toc