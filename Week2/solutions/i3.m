% Problem 1, Attempt 3
% time = 0.066136 seconds.

tic;

a = (1 : 1000)';

matrix = a * a';

numsEndingIn7 = find(mod(matrix, 10) == 7);
length(numsEndingIn7)

toc
