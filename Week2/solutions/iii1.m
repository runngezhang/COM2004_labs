% Problem 3, Attempt 1
% time = 5.090718 seconds.

tic;

smallestDiff = inf;

for i = 1 : 1000
    for j = 1 : 1000
        diff = abs((i / j) - (pi / 4));
        
        if(diff < smallestDiff)
            smallestDiff = diff;
            a = i;
            b = j;
        end
    end
end

a
b
toc