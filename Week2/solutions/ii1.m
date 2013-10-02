% Problem 2, Attempt 1
% time = 2.655187 seconds.

tic;
randNums = rand(1, 1000000);
smallestDiff = 1;
largestDiff = 0;

for i = 2 : 1000000
    diff = abs(randNums(:, i) - randNums(:, i - 1));
    if(diff < smallestDiff)
       smallestDiff = diff;
    end
    if(diff > largestDiff)
       largestDiff = diff; 
    end
end

smallestDiff
largestDiff
toc