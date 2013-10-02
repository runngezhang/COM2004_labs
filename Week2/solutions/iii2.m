% Problem 3, Attempt 2
% time = 0.019028 seconds.

tic;

nums = zeros(1000);
for i = 1 : 1000
    nums(i, :) = i ./ (1 : 1000);
end

diffs = abs(nums - (pi / 4));

[smallestDiff, index] = min(diffs(:));
a = ceil(index / 1000)
b = mod(index, 1000)
toc