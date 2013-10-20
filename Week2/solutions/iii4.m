% Problem 3, Attempt 4
% time = 0.019028 seconds.

tic;

nums = (1:1000)' * (1./(1:1000));

diffs = abs(nums - (pi / 4));

[a,b] = find(diffs==min(min(diffs)))

toc