% Problem 1, Attempt 2
% time = 0.066136 seconds.

tic;
a = zeros(1000);
a(:, 1) = 1 : 1000;
b = zeros(1000);
b(1, :) = 1 : 1000;

matrix = a * b;

numsEndingIn7 = mod(matrix, 10) == 7;
sum(sum(numsEndingIn7))

toc