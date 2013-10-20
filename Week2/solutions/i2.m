% Problem 1, Attempt 2

tic;

a = (1 : 1000)';

matrix = a * a';

numsEndingIn7 = mod(matrix, 10) == 7;
sum(sum(numsEndingIn7))

toc