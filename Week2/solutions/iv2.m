% Problem 4, Attempt 2
% time = 1.610613 seconds.

tic;

results = rand(1000000, 4);
numInOrder = 0;

for i = 1 : 1000000
    if(issorted(results(i, :)))
       numInOrder = numInOrder + 1; 
    end
end

probability = numInOrder / 1000000
toc