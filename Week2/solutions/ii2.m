% Problem 2, Attempt 2
% time = 0.020921 seconds.

tic;
randNums = rand(1, 1000000);
diffs = abs(diff(randNums));

smallestDiff = min(diffs)
largestDiff = max(diffs)
toc