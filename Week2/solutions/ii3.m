% Problem 2, Attempt 3
% time = 0.020921 seconds.

tic;
randNums = rand(1000000,1);
diffs = abs(diff(randNums));

smallestDiff = min(diffs)
largestDiff = max(diffs)
toc