% Problem 2, Attempt 2
% time = 0.020921 seconds.

tic;
randNums = rand(1000000,1);
diffs = abs(randNums(2:end)-randNums(1:end-1));

smallestDiff = min(diffs)
largestDiff = max(diffs)
toc