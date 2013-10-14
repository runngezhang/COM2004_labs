% Problem 3, Attempt 3
% time = 0.019028 seconds.

tic;

nums = (1:1000)' * (1./(1:1000));

diffs = abs(nums - (pi / 4));

[smallestDiff, index] = min(diffs(:));
a = mod(index, 1000)
b = ceil(index / 1000)
toc